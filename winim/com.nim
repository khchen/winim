#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#            Windows COM Object and COM Event Support
#
#====================================================================

## This module adds Windows COM support for Winim.
## It allows Nim to interact with COM objects like a scripting language.
## For example:
##
## .. code-block:: Nim
##    comScript:
##      var dict = CreateObject("Scripting.Dictionary")
##      dict.add("a", "the")
##      dict.add("b", item:="quick")
##      dict.add(item:="fox", key:="c")
##      dict.item(key:="c") = "dog"
##      for key in dict:
##        echo key, " => ", dict.item(key)
##
## This module introduces two new types for dealing with COM objects: "com" and "variant".
## In summary, CreateObject() and GetObject() return a "com" value,
## and any input/output of a COM method should be a "variant" value.
##
## Most Nim data types and Winim string types can be converted to/from "variant" values.
## The conversion is usually automatic. However, explicit conversion is also supported.
##
## .. code-block:: Nim
##    proc toVariant[T](x: T): variant
##    proc fromVariant[T](x: variant): T
##
##      # Supported type:
##      #   char|string|cstring|mstring|wstring|BSTR
##      #   bool|enum|SomeInteger|SomeReal
##      #   com|variant|VARIANT|ptr IUnknown|ptr IDispatch|pointer
##      #   SYSTEMTIME|FILETIME
##      #   1D~3D array|seq|COMBinary
##
## The COMBinary type can help deal with binary data.
## For example:
##
## .. code-block:: Nim
##    var input = "binary\0string\0test\0"
##    var v = toVariant(COMBinary input)
##    var output = string fromVariant[COMBinary](v)
##    assert input == output

{.experimental.} # experimental for dot operators

import std/[strutils, macros]
import inc/winimbase, utils, winstr, core, shell, ole
export winimbase, utils, winstr, core, shell, ole

when defined(notrace) or defined(gcDestructors):
  const hasTraceTable = false
else:
  const hasTraceTable = true

type
  COMError* = object of CatchableError ## Base error for COM.
    hresult*: HRESULT
  COMException* = object of COMError ## COM dispatch exception.
  VariantConversionError* = object of ValueError ## Raised when a `VARIANT` conversion fails.
  SomeFloat = float | float32 | float64 # SomeReal is deprecated in devel

template notNil[T](x: T): bool =
  when T is BSTR: not cast[pointer](x).isNil
  else: not x.isNil

proc free(x: pointer) =
  if not x.isNil:
    system.dealloc(x)

converter voidpp_converter(x: ptr ptr object): ptr pointer = cast[ptr pointer](x)
converter vartype_converter(x: VARENUM): VARTYPE = VARTYPE x

# Store these constants in global scope to avoid repeated initialization in every proc.
discard &IID_NULL
discard &IID_IEnumVARIANT
discard &IID_IClassFactory
discard &IID_IDispatch
discard &IID_ITypeInfo

type
  com* = ref object ## `IDispatch` wrapper.
    disp: ptr IDispatch
    when hasTraceTable:
      traceId: uint64

  variant* = ref object ## `VARIANT` wrapper.
    raw: VARIANT
    when hasTraceTable:
      traceId: uint64

  COMArray* = seq[variant] ## Generic one-dimensional Automation array.
  COMArray1D* = seq[variant] ## One-dimensional Automation array.
  COMArray2D* = seq[seq[variant]] ## Two-dimensional Automation array.
  COMArray3D* = seq[seq[seq[variant]]] ## Three-dimensional Automation array.
  COMBinary* = distinct string ## Binary bytes transported as `VT_ARRAY|VT_UI1`.

proc `len`*(x: COMBinary): int {.borrow.}
proc high*(s: COMBinary): int {.borrow.}
proc low*(s: COMBinary): int {.borrow.}
proc cmp*(x, y: COMBinary): int {.borrow.}
proc `==`*(x, y: COMBinary): bool {.borrow.}
proc `<=` *(x, y: COMBinary): bool {.borrow.}
proc `<` *(x, y: COMBinary): bool {.borrow.}
proc substr*(s: COMBinary, first, last: int): COMBinary {.borrow.}
proc substr*(s: COMBinary, first = 0): COMBinary {.borrow.}

when hasTraceTable:
  import tables

  var
    comTrace {.threadvar.}: TableRef[pointer, uint64]
    varTrace {.threadvar.}: TableRef[pointer, uint64]
    traceSequence {.threadvar.}: uint64

var hresult {.threadvar.}: HRESULT
var variantCStringBuffer {.threadvar.}: string
var comAutoInitialized {.threadvar.}: bool

template ERR(x: HRESULT): bool =
  hresult = x
  hresult.FAILED

template OK(x: HRESULT): bool =
  hresult = x
  not hresult.FAILED

template validOut(x: untyped): bool =
  if x.isNil:
    hresult = E_UNEXPECTED
    false
  else:
    true

proc newCOMError(msg: string, hr: HRESULT = hresult): ref COMError =
  result = newException(COMError, msg)
  result.hresult = hr

proc ensureCOMInitialized() =
  if comAutoInitialized:
    return
  let hr = CoInitializeEx(nil, COINIT_APARTMENTTHREADED)
  case hr
  of S_OK, S_FALSE:
    comAutoInitialized = true
  of RPC_E_CHANGED_MODE:
    # A caller-owned MTA or neutral apartment is still usable; do not balance it.
    comAutoInitialized = true
  else:
    raise newCOMError("unable to initialize COM", hr)

proc newCOMException(msg: string, hr: HRESULT = hresult): ref COMException =
  result = newException(COMException, msg)
  result.hresult = hr

proc getCurrentCOMError*(): ref COMError {.inline.} =
  ## Returns the current exception cast to `COMError`.
  result = (ref COMError)(getCurrentException())

proc desc*(e: ref COMError): string =
  ## Returns the Windows message for `e.hresult`.
  var buffer: LPWSTR
  let length = FormatMessageW(
    FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_IGNORE_INSERTS or FORMAT_MESSAGE_ALLOCATE_BUFFER,
    nil,
    DWORD e.hresult,
    0,
    cast[LPWSTR](&buffer),
    0,
    nil)

  if length != 0 and buffer.notNil:
    defer: discard LocalFree(cast[HLOCAL](buffer))
    result = $buffer
    result.removeSuffix("\r\n")
  else:
    result = "HRESULT 0x" & toHex(cast[uint32](e.hresult), 8)

const arcLike = defined(gcArc) or defined(gcAtomicArc) or defined(gcOrc)
when defined(nimAllowNonVarDestructor) and arcLike:
  proc `=destroy`(x: type(com()[])) {.raises: [Exception].} =
    if not x.disp.isNil:
      x.disp.Release()

  proc `=destroy`(x: type(variant()[])) =
    VariantClear(&x.raw)

else:
  proc `=destroy`(x: var type(com()[])) {.raises: [Exception].} =
    if not x.disp.isNil:
      x.disp.Release()
      x.disp = nil

  proc `=destroy`(x: var type(variant()[])) =
    VariantClear(&x.raw)

when not defined(gcDestructors):
  proc del*(x: com) =
    when hasTraceTable:
      let key = cast[pointer](x)
      if not comTrace.isNil and comTrace.hasKey(key) and
          comTrace[key] == x.traceId:
        comTrace.del(key)

    `=destroy`(x[])

  proc del*(x: variant) =
    when hasTraceTable:
      let key = cast[pointer](x)
      if not varTrace.isNil and varTrace.hasKey(key) and
          varTrace[key] == x.traceId:
        varTrace.del(key)

    `=destroy`(x[])

template init(x): untyped =
  when not defined(gcDestructors):
    new(x, del)
  else:
    new(x)

  when hasTraceTable:
    if comTrace.isNil: comTrace = newTable[pointer, uint64]()
    if varTrace.isNil: varTrace = newTable[pointer, uint64]()

    when x.type is variant:
      traceSequence.inc
      x.traceId = traceSequence
      varTrace[cast[pointer](x)] = x.traceId

    elif x.type is com:
      traceSequence.inc
      x.traceId = traceSequence
      comTrace[cast[pointer](x)] = x.traceId

proc COM_FullRelease*() =
  ## Releases all COM wrappers tracked on the current thread.
  ##
  ## Normally the memory manager releases wrappers. Some COM servers, such as
  ## `Excel.Application`, can keep a process alive when cycles or outstanding
  ## references survive `GC_fullCollect`; this procedure provides deterministic
  ## cleanup for that case.
  ##
  ## The hidden per-thread COM initialization remains active until the thread
  ## exits, avoiding delayed-destructor use-after-uninitialize hazards.
  ## Use `-d:notrace` to disable wrapper tracking.
  when hasTraceTable:
    var variants, objects: seq[pointer]
    if varTrace.notNil:
      for k in varTrace.keys: variants.add k
      varTrace.clear
    if comTrace.notNil:
      for k in comTrace.keys: objects.add k
      comTrace.clear

    # Clear the tables before Release can re-enter Nim and create new wrappers.
    # Re-entrant objects remain tracked instead of being erased after traversal.
    for k in variants: `=destroy`(cast[variant](k)[])
    for k in objects:
      let wrapper = cast[com](k)
      if not wrapper.isNil and not wrapper.disp.isNil:
        let dispatch = wrapper.disp
        wrapper.disp = nil
        dispatch.Release()


proc typeDesc(vt: VARTYPE, d: UINT = 0): string =
  proc typeStr(vt: VARTYPE): string =
    case vt
    of 0: "VT_EMPTY"
    of 1: "VT_NULL"
    of 2: "VT_I2"
    of 3: "VT_I4"
    of 4: "VT_R4"
    of 5: "VT_R8"
    of 6: "VT_CY"
    of 7: "VT_DATE"
    of 8: "VT_BSTR"
    of 9: "VT_DISPATCH"
    of 10: "VT_ERROR"
    of 11: "VT_BOOL"
    of 12: "VT_VARIANT"
    of 13: "VT_UNKNOWN"
    of 14: "VT_DECIMAL"
    of 16: "VT_I1"
    of 17: "VT_UI1"
    of 18: "VT_UI2"
    of 19: "VT_UI4"
    of 20: "VT_I8"
    of 21: "VT_UI8"
    of 22: "VT_INT"
    of 23: "VT_UINT"
    of 24: "VT_VOID"
    of 25: "VT_HRESULT"
    of 26: "VT_PTR"
    of 27: "VT_SAFEARRAY"
    of 28: "VT_CARRAY"
    of 29: "VT_USERDEFINED"
    of 30: "VT_LPSTR"
    of 31: "VT_LPWSTR"
    of 36: "VT_RECORD"
    of 37: "VT_INT_PTR"
    of 38: "VT_UINT_PTR"
    of 64: "VT_FILETIME"
    of 65: "VT_BLOB"
    of 66: "VT_STREAM"
    of 67: "VT_STORAGE"
    of 68: "VT_STREAMED_OBJECT"
    of 69: "VT_STORED_OBJECT"
    of 70: "VT_BLOB_OBJECT"
    of 71: "VT_CF"
    of 72: "VT_CLSID"
    of 0xfff: "VT_BSTR_BLOB"
    else: "VT_ILLEGAL"

  if vt == VT_ILLEGAL:
    result = "VT_ILLEGAL"
  else:
    result = ""

    if (vt and VT_VECTOR) != 0: result &= "VT_VECTOR|"
    if (vt and VT_BYREF) != 0: result &= "VT_BYREF|"
    if (vt and VT_RESERVED) != 0: result &= "VT_RESERVED|"
    if (vt and VT_ARRAY) != 0:
      if d != 0: result &= "VT_ARRAY(" & $d & "D)|"
      else: result &= "VT_ARRAY|"

    result &= typeStr(vt and 0xfff)

proc vcErrorMsg(f: string, t: string = ""): string =
  "convert from " & f & " to " & (if t.len == 0: f else: t)

proc rawType*(x: variant): VARTYPE {.inline.} =
  ## Returns the raw `VARTYPE`.
  result = if x.isNil: VARTYPE(VT_EMPTY) else: x.raw.vt

proc rawTypeDesc*(x: variant): string =
  ## Returns a readable raw `VARTYPE` description.
  if x.isNil:
    return VARTYPE(VT_EMPTY).typeDesc

  var dimensions: UINT = 0
  if (x.raw.vt and VT_ARRAY) != 0 and x.raw.parray.notNil:
    dimensions = SafeArrayGetDim(x.raw.parray)

  result = x.raw.vt.typeDesc(dimensions)

proc newCom*(x: ptr IDispatch): com =
  ## Copies a borrowed `IDispatch` pointer and calls `AddRef` on it.
  if x.notNil:
    ensureCOMInitialized()
    result.init()
    x.AddRef()
    result.disp = x

proc adoptCom*(x: var ptr IDispatch): com =
  ## Takes ownership of one `IDispatch` reference and clears `x`.
  if x.notNil:
    ensureCOMInitialized()
    result.init()
    result.disp = x
    x = nil

proc copy*(x: com): com {.inline.} =
  ## Copies a COM wrapper by adding one `IDispatch` reference.
  if x.notNil:
    result = newCom(x.disp)

proc wrap*(x: ptr IDispatch): com {.inline, deprecated: "use `newCom` for a borrowed pointer or `adoptCom` for an owned pointer".} =
  ## Deprecated compatibility wrapper for `newCom`.
  result = newCom(x)

proc wrap*(x: VARIANT): variant {.inline, deprecated: "use `newVariant` to copy or `adoptVariant` to transfer ownership".} =
  ## Deprecated compatibility wrapper; retains the historical raw ownership behavior.
  result.init()
  result.raw = x

proc unwrap*(x: com): ptr IDispatch {.inline.} =
  ## Returns a borrowed `IDispatch` pointer without transferring ownership.
  result = if x.isNil: nil else: x.disp

proc unwrap*(x: variant): VARIANT {.inline.} =
  ## Returns a borrowed raw `VARIANT` view without transferring ownership.
  if x.notNil: result = x.raw

proc requireDispatch(self: com): ptr IDispatch {.inline.} =
  ensureCOMInitialized()
  if self.isNil or self.disp.isNil:
    raise newCOMError("COM object is nil", E_POINTER)
  self.disp

proc isNull*(x: variant): bool {.inline.} =
  ## Returns whether the wrapper represents nil, `VT_EMPTY`, `VT_NULL`, or a nil interface.
  result = x.isNil or x.raw.vt == VT_EMPTY or x.raw.vt == VT_NULL or
    (x.raw.vt in {VT_DISPATCH, VT_UNKNOWN} and x.raw.byref.isNil)

proc newVariant*(x: VARIANT): variant =
  ## Copies a raw `VARIANT`.
  ensureCOMInitialized()
  result.init()
  if VariantCopy(&result.raw, x.unsafeaddr).FAILED:
    raise newException(VariantConversionError, vcErrorMsg(x.vt.typeDesc))

proc adoptVariant*(x: var VARIANT): variant =
  ## Takes ownership of a raw `VARIANT` and resets `x` to `VT_EMPTY`.
  ensureCOMInitialized()
  result.init()
  result.raw = x
  x = default(VARIANT)

proc copy*(x: variant): variant =
  ## Copies a variant.
  if x.notNil:
    result.init()
    if VariantCopy(&result.raw, x.raw.unsafeaddr).FAILED:
      raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc))

proc toVariant*(x: string|cstring|mstring): variant =
  result.init()
  result.raw.vt = VT_BSTR
  var ws = +$x
  when x is cstring:
    result.raw.bstrVal = SysAllocString(&ws)
  else:
    result.raw.bstrVal = SysAllocStringLen(&ws, UINT ws.len)
  if ws.len != 0 and result.raw.bstrVal.isNil:
    raise newException(VariantConversionError, vcErrorMsg("string", "VT_BSTR"))

proc toVariant*(x: wstring): variant =
  result.init()
  result.raw.vt = VT_BSTR
  result.raw.bstrVal = SysAllocStringLen(&x, UINT x.len)
  if x.len != 0 and result.raw.bstrVal.isNil:
    raise newException(VariantConversionError, vcErrorMsg("wstring", "VT_BSTR"))

proc toVariant*(x: BSTR): variant =
  result.init()
  result.raw.vt = VT_BSTR
  if x.notNil:
    result.raw.bstrVal = SysAllocStringLen(x, SysStringLen(x))
    if SysStringLen(x) != 0 and result.raw.bstrVal.isNil:
      raise newException(VariantConversionError, vcErrorMsg("BSTR", "VT_BSTR"))

proc toVariant*(x: bool): variant =
  result.init()
  result.raw.vt = VT_BOOL
  result.raw.boolVal = if x: VARIANT_TRUE else: VARIANT_FALSE

proc toVariant*(x: SomeInteger|enum): variant =
  result.init()
  when x.type is SomeSignedInt:
    when sizeof(x) == 1:
      result.raw.vt = VT_I1
      result.raw.bVal = cast[uint8](x)
    elif sizeof(x) == 2:
      result.raw.vt = VT_I2
      result.raw.iVal = x.int16
    elif sizeof(x) == 4:
      result.raw.vt = VT_I4
      result.raw.lVal = x.int32
    else:
      result.raw.vt = VT_I8
      result.raw.llVal = x.int64
  else:
    when sizeof(x) == 1:
      result.raw.vt = VT_UI1
      result.raw.bVal = x.uint8
    elif sizeof(x) == 2:
      result.raw.vt = VT_UI2
      result.raw.uiVal = x.uint16
    elif sizeof(x) == 4:
      result.raw.vt = VT_UI4
      result.raw.ulVal = cast[int32](x) # ULONG is declared as int32 for compatibility
    else:
      result.raw.vt = VT_UI8
      result.raw.ullVal = cast[int64](x) # ULONG64 is declared as int64 for compatibility

proc toVariant*(x: SomeFloat): variant =
  result.init()
  when sizeof(x) == 4:
    result.raw.vt = VT_R4
    result.raw.fltVal = x.float32
  else:
    result.raw.vt = VT_R8
    result.raw.dblVal = x.float64

proc toVariant*(x: char): variant =
  result.init()
  result.raw.vt = VT_UI1
  result.raw.bVal = x.byte

proc toVariant*(x: pointer): variant =
  result.init()
  result.raw.vt = VT_PTR
  result.raw.byref = x

proc toVariant*(x: ptr IDispatch): variant =
  result.init()
  result.raw.vt = VT_DISPATCH
  if x.notNil:
    x.AddRef()
    result.raw.pdispVal = x

proc toVariant*(x: com): variant =
  result.init()
  result.raw.vt = VT_DISPATCH
  if x.notNil and x.disp.notNil:
    x.disp.AddRef()
    result.raw.pdispVal = x.disp

proc toVariant*(x: ptr IUnknown): variant =
  result.init()
  result.raw.vt = VT_UNKNOWN
  if x.notNil:
    x.AddRef()
    result.raw.punkVal = x

proc toVariant*(x: SYSTEMTIME): variant =
  # SystemTimeToVariantTime and VariantTimeToSystemTime ignore milliseconds.
  # https://www.codeproject.com/Articles/17576/SystemTime-to-VariantTime-with-Milliseconds

  const ONETHOUSANDMILLISECONDS = 0.0000115740740740'f64
  var x = x
  result.init()
  result.raw.vt = VT_DATE

  let wMilliSeconds = float x.wMilliseconds
  x.wMilliseconds = 0

  var date: float64
  if SystemTimeToVariantTime(&x, &date) == FALSE:
    raise newException(VariantConversionError, vcErrorMsg("SYSTEMTIME", "VT_DATE"))

  let milliseconds = ONETHOUSANDMILLISECONDS / 1000 * wMilliSeconds
  result.raw.date = if date < 0: date - milliseconds else: date + milliseconds

proc toVariant*(x: FILETIME): variant =
  var st: SYSTEMTIME
  if FileTimeToSystemTime(x.unsafeaddr, &st) == FALSE:
    raise newException(VariantConversionError, vcErrorMsg("FILETIME", "VT_DATE"))
  result = toVariant(st)

proc toVariant*(x: ptr SomeInteger|ptr SomeFloat|ptr char|ptr bool|ptr BSTR): variant =
  if x.isNil:
    raise newException(VariantConversionError, vcErrorMsg("nil pointer", "VT_BYREF"))
  result = toVariant(x[])
  result.raw.byref = cast[pointer](x)
  result.raw.vt = result.raw.vt or VT_BYREF

proc toVariant*(x: VARIANT): variant =
  result.init()
  if VariantCopy(&result.raw, x.unsafeaddr).FAILED:
    raise newException(VariantConversionError, vcErrorMsg(x.vt.typeDesc))

proc toVariant*(x: variant): variant =
  result.init()
  if x.isNil: # nil.variant for missing optional parameters
    result.raw.vt = VT_ERROR
    result.raw.scode = DISP_E_PARAMNOTFOUND
  else:
    result = x.copy

proc safeArrayCount(n: int): ULONG =
  if n < 0 or uint64(n) > uint64(uint32.high):
    raise newException(VariantConversionError, vcErrorMsg("openarray", "SAFEARRAY"))
  result = cast[ULONG](uint32(n))

proc safeArrayLength(lower, upper: LONG, source: string): int =
  let length = int64(upper) - int64(lower) + 1
  if length < 0 or length > int64(int.high):
    raise newException(VariantConversionError, vcErrorMsg(source, "array length"))
  result = int(length)

proc validateArraySize(lengths: openarray[int], source: string) =
  var total = 1
  for length in lengths:
    if length != 0 and total > int.high div length:
      raise newException(VariantConversionError, vcErrorMsg(source, "array size"))
    total *= length

proc toVariant*(x: COMBinary): variant =
  result.init()
  result.raw.vt = VARTYPE(VT_ARRAY or VT_UI1)
  result.raw.parray = SafeArrayCreateVector(VT_UI1, 0, safeArrayCount(len(string x)))

  block okay:
    var pBuffer: pointer
    if result.raw.parray == nil: break okay
    if SafeArrayAccessData(result.raw.parray, &pBuffer) != S_OK: break okay
    defer: SafeArrayUnaccessData(result.raw.parray)

    copyMem(pBuffer, &(string x), x.len)
    return

  raise newException(VariantConversionError, vcErrorMsg("COMBinary", VARTYPE(VT_ARRAY or VT_UI1).typeDesc(1)))

proc safeArrayPutElement(parray: ptr SAFEARRAY, indices: ptr LONG, v: variant,
    vt: VARENUM): HRESULT =
  if vt == VT_VARIANT:
    return SafeArrayPutElement(parray, indices, &v.raw)

  var converted: VARIANT
  let source =
    if v.raw.vt == VARTYPE vt:
      v.raw.unsafeaddr
    else:
      let hr = VariantChangeType(&converted, v.raw.unsafeaddr, 16, VARTYPE vt)
      if hr.FAILED:
        return hr
      converted.unsafeaddr

  defer:
    if source == converted.unsafeaddr:
      discard VariantClear(&converted)

  if vt == VT_DISPATCH or vt == VT_UNKNOWN or vt == VT_BSTR:
    result = SafeArrayPutElement(parray, indices, source[].union1.struct1.union1.byref)
  else:
    result = SafeArrayPutElement(parray, indices, &source[].union1.struct1.union1.intVal)

template toVariant1D(x: typed, vt: VARENUM) =
  var sab: array[1, SAFEARRAYBOUND]
  sab[0].cElements = safeArrayCount(x.len)
  result.raw.parray = SafeArrayCreate(VARTYPE vt, 1, &sab[0])
  if result.raw.parray == nil:
    raise newException(VariantConversionError, vcErrorMsg("openarray", VARTYPE(vt or VT_ARRAY).typeDesc(1)))

  for i in 0..<x.len:
    var
      v = toVariant(x[i])
      indices = i.LONG

    if safeArrayPutElement(result.raw.parray, &indices, v, vt).FAILED:
      raise newException(VariantConversionError, vcErrorMsg("openarray", VARTYPE(vt or VT_ARRAY).typeDesc(1)))

template toVariant2D(x: typed, vt: VARENUM) =
  var sab: array[2, SAFEARRAYBOUND]
  sab[0].cElements = safeArrayCount(x.len)

  for i in 0..<x.len:
    let count = safeArrayCount(x[i].len)
    if cast[uint32](count) > cast[uint32](sab[1].cElements): sab[1].cElements = count

  result.raw.parray = SafeArrayCreate(VARTYPE vt, 2, &sab[0])
  if result.raw.parray == nil:
    raise newException(VariantConversionError, vcErrorMsg("openarray", VARTYPE(vt or VT_ARRAY).typeDesc(2)))

  for i in 0..<x.len:
    for j in 0..<x[i].len:
      var
        v = toVariant(x[i][j])
        indices = [i.LONG, j.LONG]

      if safeArrayPutElement(result.raw.parray, &indices[0], v, vt).FAILED:
        raise newException(VariantConversionError, vcErrorMsg("openarray", VARTYPE(vt or VT_ARRAY).typeDesc(2)))

template toVariant3D(x: typed, vt: VARENUM) =
  var sab: array[3, SAFEARRAYBOUND]
  sab[0].cElements = safeArrayCount(x.len)

  for i in 0..<x.len:
    let yCount = safeArrayCount(x[i].len)
    if cast[uint32](yCount) > cast[uint32](sab[1].cElements): sab[1].cElements = yCount
    for j in 0..<x[i].len:
      let zCount = safeArrayCount(x[i][j].len)
      if cast[uint32](zCount) > cast[uint32](sab[2].cElements): sab[2].cElements = zCount

  result.raw.parray = SafeArrayCreate(VARTYPE vt, 3, &sab[0])
  if result.raw.parray == nil:
    raise newException(VariantConversionError, vcErrorMsg("openarray", VARTYPE(vt or VT_ARRAY).typeDesc(3)))

  for i in 0..<x.len:
    for j in 0..<x[i].len:
      for k in 0..<x[i][j].len:
        var
          v = toVariant(x[i][j][k])
          indices = [i.LONG, j.LONG, k.LONG]

        if safeArrayPutElement(result.raw.parray, &indices[0], v, vt).FAILED:
          raise newException(VariantConversionError, vcErrorMsg("openarray", VARTYPE(vt or VT_ARRAY).typeDesc(3)))

proc toVariant*[T](x: openarray[T], vt: VARENUM = VT_VARIANT): variant =
  result.init()
  result.raw.vt = VARTYPE(VT_ARRAY or vt)

  when x[0].type is array|seq:
    when x[0][0].type is array|seq:
      when x[0][0][0].type is array|seq:
        raise newException(VariantConversionError, vcErrorMsg("openarray", VARTYPE(vt or VT_ARRAY).typeDesc(4)))
      else:
        toVariant3D(x, vt)
    else:
      toVariant2D(x, vt)
  else:
    toVariant1D(x, vt)

template fromVariant1D(x, dimensions: typed) =
  var
    vt: VARTYPE
    xUbound, xLbound: LONG

  if SafeArrayGetVartype(x.raw.parray, &vt) == S_OK and dimensions == 1 and
    SafeArrayGetLBound(x.raw.parray, 1, &xLbound) == S_OK and
    SafeArrayGetUBound(x.raw.parray, 1, &xUbound) == S_OK:

    let xLen = safeArrayLength(xLbound, xUbound, x.raw.vt.typeDesc(dimensions))
    newSeq(result, xLen)
    for i in 0..<xLen:
      var indices = i.LONG + xLbound
      result[i].init()
      if vt == VT_VARIANT:
        if SafeArrayGetElement(x.raw.parray, &indices, &result[i].raw).FAILED:
          raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), "COMArray1D"))
      else:
        result[i].raw.vt = vt
        if SafeArrayGetElement(x.raw.parray, &indices, &result[i].raw.union1.struct1.union1.intVal).FAILED:
          raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), "COMArray1D"))

  else:
    raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), "COMArray1D"))

template fromVariant2D(x, dimensions: typed) =
  var
    vt: VARTYPE
    xUbound, xLbound: LONG
    yUbound, yLbound: LONG

  if SafeArrayGetVartype(x.raw.parray, &vt) == S_OK and dimensions == 2 and
    SafeArrayGetLBound(x.raw.parray, 1, &xLbound) == S_OK and
    SafeArrayGetUBound(x.raw.parray, 1, &xUbound) == S_OK and
    SafeArrayGetLBound(x.raw.parray, 2, &yLbound) == S_OK and
    SafeArrayGetUBound(x.raw.parray, 2, &yUbound) == S_OK:

    var
      xLen = safeArrayLength(xLbound, xUbound, x.raw.vt.typeDesc(dimensions))
      yLen = safeArrayLength(yLbound, yUbound, x.raw.vt.typeDesc(dimensions))

    validateArraySize([xLen, yLen], x.raw.vt.typeDesc(dimensions))

    newSeq(result, xLen)
    for i in 0..<xLen:
      newSeq(result[i], yLen)
      for j in 0..<yLen:
        var indices = [i.LONG + xLbound, j.LONG + yLbound]
        result[i][j].init()
        if vt == VT_VARIANT:
          if SafeArrayGetElement(x.raw.parray, &indices[0], &result[i][j].raw).FAILED:
            raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), "COMArray2D"))
        else:
          result[i][j].raw.vt = vt
          if SafeArrayGetElement(x.raw.parray, &indices[0], &result[i][j].raw.union1.struct1.union1.intVal).FAILED:
            raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), "COMArray2D"))

  else:
    raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), "COMArray2D"))

template fromVariant3D(x, dimensions: typed) =
  var
    vt: VARTYPE
    xUbound, xLbound: LONG
    yUbound, yLbound: LONG
    zUbound, zLbound: LONG

  if SafeArrayGetVartype(x.raw.parray, &vt) == S_OK and dimensions == 3 and
    SafeArrayGetLBound(x.raw.parray, 1, &xLbound) == S_OK and
    SafeArrayGetUBound(x.raw.parray, 1, &xUbound) == S_OK and
    SafeArrayGetLBound(x.raw.parray, 2, &yLbound) == S_OK and
    SafeArrayGetUBound(x.raw.parray, 2, &yUbound) == S_OK and
    SafeArrayGetLBound(x.raw.parray, 3, &zLbound) == S_OK and
    SafeArrayGetUBound(x.raw.parray, 3, &zUbound) == S_OK:

    var
      xLen = safeArrayLength(xLbound, xUbound, x.raw.vt.typeDesc(dimensions))
      yLen = safeArrayLength(yLbound, yUbound, x.raw.vt.typeDesc(dimensions))
      zLen = safeArrayLength(zLbound, zUbound, x.raw.vt.typeDesc(dimensions))

    validateArraySize([xLen, yLen, zLen], x.raw.vt.typeDesc(dimensions))

    newSeq(result, xLen)
    for i in 0..<xLen:
      newSeq(result[i], yLen)
      for j in 0..<yLen:
        newSeq(result[i][j], zLen)
        for k in 0..<zLen:
          var indices = [i.LONG + xLbound, j.LONG + yLbound, k.LONG + zLbound]
          result[i][j][k].init()
          if vt == VT_VARIANT:
            if SafeArrayGetElement(x.raw.parray, &indices[0], &result[i][j][k].raw).FAILED:
              raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), "COMArray3D"))
          else:
            result[i][j][k].raw.vt = vt
            if SafeArrayGetElement(x.raw.parray, &indices[0], &result[i][j][k].raw.union1.struct1.union1.intVal).FAILED:
              raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), "COMArray3D"))

  else:
    raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), "COMArray3D"))

template fromVariantBinary(x: typed) =
  var
    vt: VARTYPE
    xUbound, xLbound: LONG
    pBuffer: pointer
    ok = false

  block okay:
    if dimensions != 1: break okay
    if SafeArrayGetVartype(x.raw.parray, &vt) != S_OK or vt notin {VT_UI1, VT_I1}: break okay
    if SafeArrayGetLBound(x.raw.parray, 1, &xLbound) != S_OK: break okay
    if SafeArrayGetUBound(x.raw.parray, 1, &xUbound) != S_OK: break okay
    if SafeArrayAccessData(x.raw.parray, &pBuffer) != S_OK: break okay
    defer: SafeArrayUnaccessData(x.raw.parray)

    let xLen = safeArrayLength(xLbound, xUbound, x.raw.vt.typeDesc(dimensions))
    result = COMBinary newString(xLen)
    copyMem(&(string result), pBuffer, xLen)
    ok = true

  if not ok:
    raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), "COMBinary"))

proc fromVariant*[T](x: variant): T =
  if x.isNil: return

  when T is VARIANT:
    if VariantCopy(&result, x.raw.unsafeaddr).FAILED:
      raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc, "VARIANT"))

  else:
    const VT_BYREF_VARIANT = VT_BYREF or VT_VARIANT
    if (x.raw.vt and VT_BYREF_VARIANT) == VT_BYREF_VARIANT:
      if x.raw.pvarVal.isNil:
        raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc, "VARIANT"))
      var v: VARIANT = x.raw.pvarVal[]
      return fromVariant[T](newVariant(v))

    var dimensions: UINT = 0
    if (x.raw.vt and VT_ARRAY) != 0:
      if x.raw.parray.isNil:
        raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc, "SAFEARRAY"))
      dimensions = SafeArrayGetDim(x.raw.parray)

    when T is COMArray1D: fromVariant1D(x, dimensions)
    elif T is COMArray2D: fromVariant2D(x, dimensions)
    elif T is COMArray3D: fromVariant3D(x, dimensions)
    elif T is COMBinary: fromVariantBinary(x)
    elif T is ptr and not (T is ptr IDispatch) and not (T is ptr IUnknown):
      if (x.raw.vt and VT_BYREF) != 0:
        result = cast[T](x.raw.byref)

      else:
        raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc, "unsupported type"))

    else:
      var
        ret: VARIANT
        targetVt: VARTYPE
        targetName: string

      when T is string:         targetVt = VT_BSTR;     targetName = "string"
      elif T is cstring:        targetVt = VT_BSTR;     targetName = "cstring"
      elif T is mstring:        targetVt = VT_BSTR;     targetName = "mstring"
      elif T is wstring:        targetVt = VT_BSTR;     targetName = "wstring"
      elif T is BSTR:           targetVt = VT_BSTR;     targetName = "BSTR"
      elif T is char:           targetVt = VT_UI1;      targetName = "char"
      elif T is enum:           targetVt = VT_I8;       targetName = "enum"
      elif T is SomeInteger:
        targetName = "integer"
        when T is SomeSignedInt:
          when sizeof(T) == 1: targetVt = VT_I1
          elif sizeof(T) == 2: targetVt = VT_I2
          elif sizeof(T) == 4: targetVt = VT_I4
          else: targetVt = VT_I8
        else:
          when sizeof(T) == 1: targetVt = VT_UI1
          elif sizeof(T) == 2: targetVt = VT_UI2
          elif sizeof(T) == 4: targetVt = VT_UI4
          else: targetVt = VT_UI8
      elif T is SomeFloat:      targetVt = VT_R8;       targetName = "float"
      elif T is bool:           targetVt = VT_BOOL;     targetName = "bool"
      elif T is com:            targetVt = VT_DISPATCH; targetName = "com object"
      elif T is ptr IDispatch:  targetVt = VT_DISPATCH; targetName = "ptr IDispatch"
      elif T is ptr IUnknown:   targetVt = VT_UNKNOWN;  targetName = "ptr IUnknown"
      elif T is pointer:        targetVt = VT_PTR;      targetName = "pointer"
      elif T is FILETIME:       targetVt = VT_DATE;     targetName = "FILETIME"
      elif T is SYSTEMTIME:     targetVt = VT_DATE;     targetName = "SYSTEMTIME"
      else: {.fatal: "trying to do unsupported type conversion.".}

      var
        hr: HRESULT
        needClear: bool

      if x.raw.vt == targetVt:
        hr = S_OK
        needClear = false
        ret = x.raw
      elif x.raw.vt == VT_NULL and targetVt == VT_BSTR:
        # Convert VT_NULL to an empty string.
        hr = S_OK
        needClear = true
        ret.vt = VT_BSTR
        ret.bstrVal = SysAllocString("")
      else:
        hr = VariantChangeType(&ret, x.raw.unsafeaddr, 16, targetVt)
        needClear = true

      defer:
        if needClear: discard VariantClear(&ret)

      if hr.FAILED:
        raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), targetName))

      when T is string:
        result = $ret.bstrVal

      elif T is cstring:
        variantCStringBuffer = $ret.bstrVal
        result = variantCStringBuffer.cstring

      elif T is mstring:
        result = -$ret.bstrVal

      elif T is wstring:
        result = +$ret.bstrVal

      elif T is BSTR:
        result = SysAllocStringLen(ret.bstrVal, SysStringLen(ret.bstrVal))
        if ret.bstrVal.notNil and result.isNil:
          raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), targetName))

      elif T is SYSTEMTIME:
        # SystemTimeToVariantTime and VariantTimeToSystemTime ignore milliseconds.
        # https://www.codeproject.com/Articles/17576/SystemTime-to-VariantTime-with-Milliseconds

        const ONETHOUSANDMILLISECONDS = 0.0000115740740740'F64
        let halfSecond = ONETHOUSANDMILLISECONDS / 2.0
        let adjustedDate = if ret.date < 0: ret.date + halfSecond else: ret.date - halfSecond
        if VariantTimeToSystemTime(adjustedDate, &result) == FALSE:
          raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), targetName))

        let fraction = abs(ret.date - ret.date.int.float64)
        let millisecondsOfDay = int(fraction * 86_400_000.0 + 0.5)
        result.wMilliseconds = WORD(millisecondsOfDay mod 1000)

      elif T is FILETIME:
        let st = fromVariant[SYSTEMTIME](x)
        if SystemTimeToFileTime(st.unsafeaddr, &result) == FALSE:
          raise newException(VariantConversionError, vcErrorMsg(x.raw.vt.typeDesc(dimensions), targetName))

      elif T is com:
        result = newCom(ret.pdispVal)

      elif T is ptr IDispatch:
        if ret.pdispVal.notNil: ret.pdispVal.AddRef()
        result = ret.pdispVal

      elif T is ptr IUnknown:
        if ret.punkVal.notNil: ret.punkVal.AddRef()
        result = ret.punkVal

      elif T is pointer:
        result = ret.byref

      elif T is enum:
        result = cast[T](ret.llVal)

      elif T is SomeInteger:
        when T is SomeSignedInt:
          when sizeof(T) == 1: result = cast[T](ret.cVal)
          elif sizeof(T) == 2: result = cast[T](ret.iVal)
          elif sizeof(T) == 4: result = cast[T](ret.lVal)
          else: result = cast[T](ret.llVal)
        else:
          when sizeof(T) == 1: result = cast[T](ret.bVal)
          elif sizeof(T) == 2: result = cast[T](ret.uiVal)
          elif sizeof(T) == 4: result = cast[T](ret.ulVal)
          else: result = cast[T](ret.ullVal)
      elif T is SomeFloat:    result = T(ret.dblVal)
      elif T is char:         result = char(ret.bVal)
      elif T is bool:         result = if ret.boolVal != 0: true else: false

proc `$`*(x: variant): string {.inline.} = fromVariant[string](x)
converter variantConverterToString*(x: variant): string = fromVariant[string](x)
converter variantConverterToCString*(x: variant): cstring = fromVariant[cstring](x)
converter variantConverterToMString*(x: variant): mstring = fromVariant[mstring](x)
converter variantConverterToWString*(x: variant): wstring = fromVariant[wstring](x)
converter variantConverterToChar*(x: variant): char = fromVariant[char](x)
converter variantConverterToBool*(x: variant): bool = fromVariant[bool](x)
converter variantConverterToCom*(x: variant): com = fromVariant[com](x)
converter variantConverterToIDispatch*(x: variant): ptr IDispatch = fromVariant[ptr IDispatch](x)
converter variantConverterToIUnknown*(x: variant): ptr IUnknown = fromVariant[ptr IUnknown](x)
converter variantConverterToPointer*(x: variant): pointer = fromVariant[pointer](x)
converter variantConverterToInt*(x: variant): int = fromVariant[int](x)
converter variantConverterToUInt*(x: variant): uint = fromVariant[uint](x)
converter variantConverterToInt8*(x: variant): int8 = fromVariant[int8](x)
converter variantConverterToUInt8*(x: variant): uint8 = fromVariant[uint8](x)
converter variantConverterToInt16*(x: variant): int16 = fromVariant[int16](x)
converter variantConverterToUInt16*(x: variant): uint16 = fromVariant[uint16](x)
converter variantConverterToInt32*(x: variant): int32 = fromVariant[int32](x)
converter variantConverterToUInt32*(x: variant): uint32 = fromVariant[uint32](x)
converter variantConverterToInt64*(x: variant): int64 = fromVariant[int64](x)
converter variantConverterToUInt64*(x: variant): uint64 = fromVariant[uint64](x)
converter variantConverterToFloat32*(x: variant): float32 = fromVariant[float32](x)
converter variantConverterToFloat64*(x: variant): float64 = fromVariant[float64](x)
converter variantConverterToFILETIME*(x: variant): FILETIME = fromVariant[FILETIME](x)
converter variantConverterToSYSTEMTIME*(x: variant): SYSTEMTIME = fromVariant[SYSTEMTIME](x)
converter variantConverterToVARIANT*(x: variant): VARIANT = fromVariant[VARIANT](x)
converter variantConverterToCOMArray1D*(x: variant): COMArray1D = fromVariant[COMArray1D](x)
converter variantConverterToCOMArray2D*(x: variant): COMArray2D = fromVariant[COMArray2D](x)
converter variantConverterToCOMArray3D*(x: variant): COMArray3D = fromVariant[COMArray3D](x)
converter variantConverterToCOMBinary*(x: variant): COMBinary = fromVariant[COMBinary](x)

proc getEnumeration(self: com, name: string): variant =
  let dispatch = self.requireDispatch()
  var
    tinfo: ptr ITypeInfo
    tlib: ptr ITypeLib
    index: UINT
    kind: TYPEKIND
    bname: BSTR

  if dispatch.GetTypeInfo(0, 0, &tinfo).ERR or not validOut(tinfo): return
  defer: tinfo.Release()

  if tinfo.GetContainingTypeLib(&tlib, &index).ERR or not validOut(tlib): return
  defer: tlib.Release()

  for i in 0..<tlib.GetTypeInfoCount():
    if tlib.GetTypeInfoType(UINT i, &kind).ERR: continue
    if kind != TKIND_ENUM: continue
    if tlib.GetDocumentation(UINT i, &bname, nil, nil, nil).ERR: continue
    defer: SysFreeString(bname)

    if name.cmpIgnoreCase($bname) == 0:
      var tinfoEnum: ptr ITypeInfo
      if tlib.GetTypeInfo(UINT i, &tinfoEnum).OK and validOut(tinfoEnum):
        defer: tinfoEnum.Release()

        # save ITypeInfo into variant as IUnknown
        return toVariant((ptr IUnknown)(tinfoEnum))

proc getVariantTypeInfo(x: variant): ptr ITypeInfo =
  if x.notNil and x.raw.vt == VT_UNKNOWN and x.raw.punkVal.notNil and
      x.raw.punkVal.QueryInterface(&IID_ITypeInfo, &result).OK and validOut(result):
    return result
  else:
    return nil

iterator items(tinfo: ptr ITypeInfo, keyOnly=true): tuple[key: string, value: variant] =
  var
    attr: ptr TYPEATTR
    desc: ptr VARDESC
    name: BSTR
    nameCount: UINT

  if tinfo.GetTypeAttr(&attr).OK and validOut(attr):
    defer: tinfo.ReleaseTypeAttr(attr)

    for i in 0..<int attr.cVars:
      if tinfo.GetVarDesc(UINT i, &desc).OK and validOut(desc):
        defer: tinfo.ReleaseVarDesc(desc)

        if desc.varkind == VAR_CONST:
          if desc[].lpvarValue.notNil and
              tinfo.GetNames(desc.memid, &name, 1, &nameCount).OK and
              nameCount != 0 and name.notNil:
            defer: SysFreeString(name)
            if keyOnly:
              yield ($name, nil)
            else:
              yield ($name, toVariant(desc[].lpvarValue[]))

proc getValue(tinfo: ptr ITypeInfo, name: string): variant =
  for tup in tinfo.items(keyOnly=false):
    if tup.key == name:
      return tup.value

  raise newCOMError("constant not found: " & name)

proc desc*(self: com, name: string): string =
  ## Gets the description (including the name and arguments) for the specified method.
  let dispatch = self.requireDispatch()
  var
    dispid: DISPID
    wstr = +$name
    pwstr = &wstr
    tinfo: ptr ITypeInfo
    count: UINT
    names: array[128, BSTR]

  if dispatch.GetIDsOfNames(&IID_NULL, &pwstr, 1, LOCALE_USER_DEFAULT, &dispid).ERR:
    raise newCOMError("unsupported method: " & name)

  if dispatch.GetTypeInfo(0, 0, &tinfo).ERR or not validOut(tinfo):
    raise newCOMError("named arguments not allowed")
  defer: tinfo.Release()

  if tinfo.GetNames(dispid, &names[0], 128, &count).ERR or count == 0 or names[0].isNil:
    raise newCOMError("named arguments not allowed")
  defer:
    for i in 0..<count:
      SysFreeString(names[i])

  result = $names[0] & "("
  for i in 1..<count:
    result.add $names[i]
    result.add ", "
  result.removeSuffix ", "
  result.add ")"

proc invoke(self: com, name: string, invokeType: WORD, vargs: varargs[variant, toVariant],
    kwargs: openarray[(string, variant)] = []): variant =

  let dispatch = self.requireDispatch()
  var
    isSet = (invokeType and (DISPATCH_PROPERTYPUT or DISPATCH_PROPERTYPUTREF)) != 0
    dispid: DISPID
    wstr = +$name
    pwstr = &wstr
    args: seq[VARIANT]

  if dispatch.GetIDsOfNames(&IID_NULL, &pwstr, 1, LOCALE_USER_DEFAULT, &dispid).ERR:
    # if the method name is not recognized, maybe it is an enum name
    let memberHresult = hresult
    result = getEnumeration(self, name)
    if not result.isNil: return

    raise newCOMError("unsupported method: " & name, memberHresult)

  if kwargs.len != 0:
    var
      tinfo: ptr ITypeInfo
      count: UINT
      names: array[128, BSTR]

    if dispatch.GetTypeInfo(0, 0, &tinfo).ERR or not validOut(tinfo):
      raise newCOMError("named arguments not allowed")
    defer: tinfo.Release()

    if tinfo.GetNames(dispid, &names[0], 128, &count).ERR or count == 0 or names[0].isNil:
      raise newCOMError("named arguments not allowed")
    defer:
      for i in 0..<count:
        SysFreeString(names[i])

    # names[0] is method name, names[1] is first argument's name, ...
    args.setLen(count - (if isSet: 0 else: 1))

    for _, tup in kwargs:
      var found = false
      for i in 1..<count:
        if tup[0].cmpIgnoreCase($names[i]) == 0:
          args[args.high - (i - 1)] = tup[1].raw # reverse order
          found = true
          break

      if not found:
        raise newCOMError($names[0] & "() got an unexpected argument: " & tup[0])

  if args.len == 0:
    args.setLen(vargs.len)

  var index = 0
  for i in countdown(args.high, 0): # reverse order
    if index >= vargs.len: break
    if args[i].vt == VT_EMPTY:
      args[i] = vargs[index].raw
      index.inc

  var
    dp: DISPPARAMS
    dispidNamed: DISPID = DISPID_PROPERTYPUT
    ret: VARIANT
    excep: EXCEPINFO
    skipArgs = 0

  defer: discard VariantClear(&ret)

  if args.len != 0:
    for i in 0..args.high:
      if args[i].vt == VT_EMPTY: skipArgs.inc
      else: break

    dp.rgvarg = &args[skipArgs]
    dp.cArgs = DWORD(args.len - skipArgs)

    if isSet:
      dp.rgdispidNamedArgs = &dispidNamed
      dp.cNamedArgs = 1

  if dispatch.Invoke(dispid, &IID_NULL, LOCALE_USER_DEFAULT, invokeType, &dp, &ret, &excep, nil).ERR:
    {.gcsafe.}:
      if cast[pointer](excep.pfnDeferredFillIn).notNil:
        discard excep.pfnDeferredFillIn(&excep)

    defer:
      if excep.bstrSource.notNil: SysFreeString(excep.bstrSource)
      if excep.bstrDescription.notNil: SysFreeString(excep.bstrDescription)
      if excep.bstrHelpFile.notNil: SysFreeString(excep.bstrHelpFile)

    if excep.bstrSource.notNil:
      var err = $toVariant(excep.bstrSource)
      if excep.bstrDescription.notNil: err &= ": " & $toVariant(excep.bstrDescription)
      raise newCOMException(err)

    raise newCOMError("invoke method failed: " & name)

  result = newVariant(ret)

proc call*(self: com, name: string, vargs: varargs[variant, toVariant],
    kwargs: openarray[(string, variant)]): variant {.discardable, inline.} =
  result = invoke(self, name, DISPATCH_METHOD, vargs, kwargs=kwargs)

proc call*(self: com, name: string, vargs: varargs[variant, toVariant]): variant {.discardable, inline.} =
  result = invoke(self, name, DISPATCH_METHOD, vargs, kwargs=[])

proc set*(self: com, name: string, vargs: varargs[variant, toVariant],
    kwargs: openarray[(string, variant)]): variant {.discardable, inline.} =
  result = invoke(self, name, DISPATCH_PROPERTYPUT, vargs, kwargs=kwargs)

proc set*(self: com, name: string, vargs: varargs[variant, toVariant]): variant {.discardable, inline.} =
  result = invoke(self, name, DISPATCH_PROPERTYPUT, vargs, kwargs=[])

proc setRef*(self: com, name: string, vargs: varargs[variant, toVariant],
    kwargs: openarray[(string, variant)]): variant {.discardable, inline.} =
  result = invoke(self, name, DISPATCH_PROPERTYPUTREF, vargs, kwargs=kwargs)

proc setRef*(self: com, name: string, vargs: varargs[variant, toVariant]): variant {.discardable, inline.} =
  result = invoke(self, name, DISPATCH_PROPERTYPUTREF, vargs, kwargs=[])

proc get*(self: com, name: string, vargs: varargs[variant, toVariant],
    kwargs: openarray[(string, variant)]): variant {.discardable, inline.} =
  result = invoke(self, name, DISPATCH_METHOD or DISPATCH_PROPERTYGET, vargs, kwargs=kwargs)

proc get*(self: com, name: string, vargs: varargs[variant, toVariant]): variant {.discardable, inline.} =
  result = invoke(self, name, DISPATCH_METHOD or DISPATCH_PROPERTYGET, vargs, kwargs=[])

proc `[]`*(self: variant, name: string): variant =
  var tinfo = self.getVariantTypeInfo()
  if tinfo.notNil:
    defer: tinfo.Release()
    return tinfo.getValue(name)

  else:
    return invoke(self, name, DISPATCH_METHOD or DISPATCH_PROPERTYGET)

template `[]`*(self: com, name: string): variant =
  discardable invoke(self, name, DISPATCH_METHOD or DISPATCH_PROPERTYGET)

template `[]=`*(self: com, name: string, v: untyped) =
  discardable invoke(self, name, DISPATCH_PROPERTYPUT, toVariant(v))

template `.`*(self: variant, name: untyped): variant =
  discardable `[]`(self, astToStr(name))

iterator items*(x: com): variant =
  let dispatch = x.requireDispatch()
  var
    ret, item: VARIANT
    dp: DISPPARAMS
    enumvar: ptr IEnumVARIANT

  if dispatch.Invoke(DISPID_NEWENUM, &IID_NULL, LOCALE_USER_DEFAULT, DISPATCH_METHOD or DISPATCH_PROPERTYGET, &dp, &ret, nil, nil).ERR:
    raise newCOMError("object is not iterable")
  defer: discard VariantClear(&ret)

  if ret.vt notin {VT_UNKNOWN, VT_DISPATCH} or ret.byref.isNil or
      ret.punkVal.QueryInterface(&IID_IEnumVARIANT, &enumvar).ERR or not validOut(enumvar):
    raise newCOMError("object is not iterable")
  defer: enumvar.Release()

  while true:
    let hr = enumvar.Next(1, &item, nil)
    if hr == S_FALSE: break
    if hr.FAILED: raise newCOMError("unable to enumerate object", hr)
    if hr != S_OK: raise newCOMError("invalid enumerator result", hr)

    let value = newVariant(item)
    discard VariantClear(&item)
    yield value

iterator items*(x: variant): variant =
  if not x.isNil:
    var tinfo = x.getVariantTypeInfo()
    if tinfo.notNil:
      defer: tinfo.Release()
      for tup in tinfo.items(keyOnly=true):
        yield toVariant(tup.key)

    else:
      var obj = x.com
      for v in obj:
        yield v

proc standardizeKwargs(n: var NimNode) =
  # if last argument is table constructor, name it as kwargs
  if n[^1].kind == nnkTableConstr:
    n[^1] = newTree(nnkExprEqExpr, ident("kwargs"), n[^1])

  # if last argument is already named kwargs, just do nothing
  elif n[^1].kind == nnkExprEqExpr and n[^1][0].eqIdent("kwargs") and
      n[^1][1].kind == nnkTableConstr:
    return

  # otherwise, add empty array as kwargs
  else:
    n.add newTree(nnkExprEqExpr, ident("kwargs"), newNimNode(nnkBracket))

macro `.`*(self: com, name: untyped, vargs: varargs[untyped]): untyped =
  result = newCall("get", self, newStrLitNode($name))
  for i in vargs: result.add i
  result.standardizeKwargs()

macro `.=`*(self: com, name: untyped, vargs: varargs[untyped]): untyped =
  result = newCall("set", self, newStrLitNode($name))
  for i in vargs: result.add i
  result.standardizeKwargs()

proc GetCLSID(progId: string, clsid: var GUID): HRESULT =
  if progId.len == 0:
    result = E_INVALIDARG
  elif progId[0] == '{':
    result = CLSIDFromString(progId, &clsid)
  else:
    result = CLSIDFromProgID(progId, &clsid)

proc CreateObject*(progId: string): com =
  ## Creates a COM object in the current thread's automatically initialized
  ## apartment. Raises `COMError` for invalid class identifiers or activation
  ## failures.

  ensureCOMInitialized()
  result.init()
  var
    clsid: GUID
    pCf: ptr IClassFactory

  if GetCLSID(progId, clsid).OK:
    # better than CoCreateInstance:
    # Some IClassFactory.CreateInstance implementations return SUCCEEDED with a nil pointer,
    # which crashes CoCreateInstance.
    # for example: {D5F7E36B-5B38-445D-A50F-439B8FCBB87A}
    if CoGetClassObject(&clsid, CLSCTX_LOCAL_SERVER or CLSCTX_INPROC_SERVER, nil, &IID_IClassFactory, &pCf).OK and validOut(pCf):
      defer: pCf.Release()

      if pCf.CreateInstance(nil, &IID_IDispatch, &(result.disp)).OK and validOut(result.disp):
        return result

  raise newCOMError("unable to create object from " & progId)

proc GetObject*(file: string, progId: string = ""): com =
  ## Retrieves a COM object from an active object, file, or moniker.
  ## The current thread is initialized automatically. Failures raise `COMError`.

  ensureCOMInitialized()
  result.init()
  var
    clsid: GUID
    pUk: ptr IUnknown
    pPf: ptr IPersistFile

  if progId.len != 0:
    if GetCLSID(progId, clsid).OK:
      if file.len != 0:
        if CoCreateInstance(&clsid, nil, CLSCTX_LOCAL_SERVER or CLSCTX_INPROC_SERVER, &IID_IPersistFile, &pPf).OK and validOut(pPf):
          defer: pPf.Release()

          if pPf.Load(file, 0).OK and pPf.QueryInterface(&IID_IDispatch, &(result.disp)).OK and validOut(result.disp):
            return result
      else:
        if GetActiveObject(&clsid, nil, &pUk).OK and validOut(pUk):
          defer: pUk.Release()

          if pUk.QueryInterface(&IID_IDispatch, &(result.disp)).OK and validOut(result.disp):
            return result

  elif file.len != 0:
    if CoGetObject(file, nil, &IID_IDispatch, &(result.disp)).OK and validOut(result.disp):
      return result

  raise newCOMError("unable to get object")

proc newCom*(progId: string): com {.inline.} =
  ## Alias for `CreateObject`.
  result = CreateObject(progId)

proc newCom*(file, progId: string): com {.inline.} =
  ## Alias for `GetObject(file, progId)`.
  result = GetObject(file, progId)

type
  comEventHandler* = proc(self: com, name: string, params: varargs[variant]): variant
  SinkContext = ref object
    handler: comEventHandler
    parent: com
  SinkObj {.pure.} = object
    lpVtbl: ptr IDispatchVtbl
    typeInfo: ptr ITypeInfo
    iid: GUID
    refCount: LONG
    context: pointer
  Sink {.pure.} = ptr SinkObj

proc Sink_QueryInterface(self: ptr IUnknown, riid: ptr IID, pvObject: ptr pointer): HRESULT {.stdcall.} =
  if pvObject.isNil or riid.isNil:
    return E_POINTER

  pvObject[] = nil
  var this = cast[Sink](self)
  if IsEqualGUID(riid, &IID_IUnknown) or IsEqualGUID(riid, &IID_IDispatch) or IsEqualGUID(riid, &this.iid):
    pvObject[] = self
    self.AddRef()
    result = S_OK
  else:
    result = E_NOINTERFACE

proc Sink_AddRef(self: ptr IUnknown): ULONG {.stdcall.} =
  var this = cast[Sink](self)
  result = ULONG InterlockedIncrement(&this.refCount)

proc Sink_Release(self: ptr IUnknown): ULONG {.stdcall.} =
  var this = cast[Sink](self)
  let count = InterlockedDecrement(&this.refCount)
  if count == 0:
    this.typeInfo.Release()
    let context = cast[SinkContext](this.context)
    this.context = nil
    GC_unref(context)
    free(self)
    result = 0
  else:
    result = ULONG count

proc Sink_GetTypeInfoCount(self: ptr IDispatch, pctinfo: ptr UINT): HRESULT {.stdcall.} =
  if pctinfo.isNil:
    return E_POINTER

  pctinfo[] = 1
  result = S_OK

proc Sink_GetTypeInfo(self: ptr IDispatch, iTInfo: UINT, lcid: LCID, ppTInfo: ptr LPTYPEINFO): HRESULT {.stdcall.} =
  if ppTInfo.isNil:
    return E_POINTER

  ppTInfo[] = nil
  if iTInfo != 0:
    return DISP_E_BADINDEX

  var this = cast[Sink](self)
  ppTInfo[] = this.typeInfo
  this.typeInfo.AddRef()
  result = S_OK

proc Sink_GetIDsOfNames(self: ptr IDispatch, riid: REFIID, rgszNames: ptr LPOLESTR, cNames: UINT, lcid: LCID, rgDispId: ptr DISPID): HRESULT {.stdcall.} =
  if riid.isNil:
    return E_POINTER
  if IsEqualGUID(riid, &IID_NULL) == 0:
    return DISP_E_UNKNOWNINTERFACE

  var this = cast[Sink](self)
  result = DispGetIDsOfNames(this.typeInfo, rgszNames, cNames, rgDispId)

proc Sink_Invoke(self: ptr IDispatch, dispid: DISPID, riid: REFIID, lcid: LCID, wFlags: WORD, params: ptr DISPPARAMS, ret: ptr VARIANT, pExcepInfo: ptr EXCEPINFO, puArgErr: ptr UINT): HRESULT {.stdcall, thread.} =
  if riid.isNil:
    return E_POINTER
  if IsEqualGUID(riid, &IID_NULL) == 0:
    return DISP_E_UNKNOWNINTERFACE
  if params.isNil:
    return E_POINTER
  if (params.cArgs != 0 and params.rgvarg.isNil) or
      (params.cNamedArgs != 0 and params.rgdispidNamedArgs.isNil):
    return E_POINTER
  if params.cNamedArgs > params.cArgs:
    return DISP_E_BADPARAMCOUNT

  var this = cast[Sink](self)
  let context = cast[SinkContext](this.context)
  var
    bname: BSTR
    nameCount: UINT
    vret: variant
    name: string
    args = cast[ptr UncheckedArray[VARIANT]](params.rgvarg)
    sargs = newSeq[variant]()
    total = params.cArgs

  result = this.typeInfo.GetNames(dispid, &bname, 1, &nameCount)

  if result == S_OK:
    if nameCount == 0 or bname.isNil:
      if bname.notNil: SysFreeString(bname)
      return DISP_E_MEMBERNOTFOUND
    name = $bname
    SysFreeString(bname)

    for i in 1..total:
      sargs.add(newVariant(args[total-i]))

    try:
      {.gcsafe.}: vret = context.handler(context.parent, name, sargs)
    except Exception:
      let e = getCurrentException()
      if pExcepInfo.notNil:
        pExcepInfo[] = default(EXCEPINFO)
        pExcepInfo.bstrSource = SysAllocString("winim/com")
        pExcepInfo.bstrDescription = SysAllocString($e.name & ": " & e.msg)
        pExcepInfo.scode = E_FAIL
      return DISP_E_EXCEPTION

    if vret.notNil and ret.notNil:
      result = VariantCopy(ret, &vret.raw)
    else:
      result = S_OK

let
  SinkVtbl: IDispatchVtbl = IDispatchVtbl(
    QueryInterface: Sink_QueryInterface,
    AddRef: Sink_AddRef,
    Release: Sink_Release,
    GetTypeInfoCount: Sink_GetTypeInfoCount,
    GetTypeInfo: Sink_GetTypeInfo,
    GetIDsOfNames: Sink_GetIDsOfNames,
    Invoke: Sink_Invoke
  )

proc newSink(parent: com, iid: GUID, typeInfo: ptr ITypeInfo, handler: comEventHandler): Sink =
  result = cast[Sink.type](alloc0(sizeof(SinkObj)))
  let context = SinkContext(handler: handler, parent: parent)
  GC_ref(context)
  result.lpVtbl = SinkVtbl.unsafeaddr
  result.refCount = 1
  result.iid = iid
  result.typeInfo = typeInfo
  result.context = cast[pointer](context)
  typeInfo.AddRef()

proc connectRaw(self: com, riid: REFIID = nil, cookie: DWORD, handler: comEventHandler = nil): DWORD =
  let dispatch = self.requireDispatch()
  var
    iid: IID
    count, index: UINT
    typeInfo, dispTypeInfo: ptr ITypeInfo
    connection: ptr IConnectionPoint
    typeLib: ptr ITypeLib
    container: ptr IConnectionPointContainer
    enu: ptr IEnumConnectionPoints
    sink: Sink

  defer:
    if typeInfo.notNil: typeInfo.Release()
    if dispTypeInfo.notNil: dispTypeInfo.Release()
    if connection.notNil: connection.Release()
    if typeLib.notNil: typeLib.Release()
    if container.notNil: container.Release()
    if enu.notNil: enu.Release()

  block okay:
    if dispatch.GetTypeInfoCount(&count).ERR or count != 1: break okay
    if dispatch.GetTypeInfo(0, 0, &dispTypeInfo).ERR or not validOut(dispTypeInfo): break okay
    if dispTypeInfo.GetContainingTypeLib(&typeLib, &index).ERR or not validOut(typeLib): break okay
    if dispatch.QueryInterface(&IID_IConnectionPointContainer, &container).ERR or not validOut(container): break okay

    if riid.isNil:
      if container.EnumConnectionPoints(&enu).ERR or not validOut(enu): break okay
      if enu.isNil or enu.Reset().ERR: break okay
      while true:
        let hr = enu.Next(1, &connection, nil)
        if hr == S_FALSE: break
        if hr.FAILED: break okay
        if hr != S_OK or not validOut(connection): break okay

        if connection.GetConnectionInterface(&iid).OK and
          typeLib.GetTypeInfoOfGuid(&iid, &typeInfo).OK and validOut(typeInfo):
            break

        connection.Release()
        connection = nil

    else:
      if container.FindConnectionPoint(riid, &connection).ERR or not validOut(connection): break okay
      if connection.GetConnectionInterface(&iid).ERR: break okay
      if typeLib.GetTypeInfoOfGuid(riid, &typeInfo).ERR or not validOut(typeInfo): break okay

    if handler.notNil:
      sink = newSink(self, iid, typeInfo, handler)
      let hr = connection.Advise(cast[ptr IUnknown](sink), &result)
      discard cast[ptr IUnknown](sink).Release()
      sink = nil
      if hr.OK: return result

    elif cookie != 0:
      let hr = connection.Unadvise(cookie)
      if hr == S_OK: return 1
      if hr == CONNECT_E_NOCONNECTION: return 0

  raise newCOMError("unable to connect/disconnect event")

proc connect*(self: com, handler: comEventHandler, riid: REFIID = nil): DWORD {.discardable.} =
  ## Connects a COM event handler and returns its connection cookie.
  ## The handler is a user-defined proc to receive the COM event.
  ## comEventHandler is defined as:
  ##
  ## .. code-block:: Nim
  ##    type comEventHandler = proc(self: com, name: string, params: varargs[variant]): variant

  if handler.notNil:
    result = connectRaw(self, riid, 0, handler)

proc disconnect*(self: com, cookie: DWORD, riid: REFIID = nil): bool {.discardable.} =
  ## Disconnects an event cookie.

  if cookie != 0 and connectRaw(self, riid, cookie, nil) != 0:
    result = true

proc reformatAsgn(n: NimNode): NimNode =
  # reformat code:
  #   a.b(c, ...) = d -> a.b.set("c", ..., d)
  expectKind(n, nnkAsgn)

  var
    params = n[0]
    dots = n[0][0]

  params.insert(1, dots.last.toStrLit)
  params.add(n.last)
  dots.del(dots.len-1)
  dots.add(newIdentNode("set"))
  result = n[0]

proc reformatCall(n: NimNode): NimNode =
  # reformat code:
  #   a(b, c:=d, e:=f, g, h) -> a(b, g, h, kwargs={"c": toVariant(d), "e": toVariant(f)})
  expectKind(n, nnkCall)

  result = newNimNode(nnkCall)
  var table = newNimNode(nnkTableConstr)

  for i in 0..<n.len:
    if n[i].kind == nnkInfix and n[i][0].eqIdent(":="):
      table.add newTree(nnkExprColonExpr,
          newStrLitNode($n[i][1]),
          newCall(ident("toVariant"), (n[i][2])))

    else:
      result.add n[i]

  if table.len != 0:
    result.add newTree(nnkExprEqExpr, ident("kwargs"), table)

proc comReformat(n: NimNode): NimNode =
  result = n

  proc hasInfixChildren(n: NimNode, infix: string): bool =
    for i in n.children:
      if i.kind == nnkInfix and i[0].eqIdent(infix):
        return true

  if n.kind == nnkAsgn and n[0].kind == nnkCall and n[0][0].kind == nnkDotExpr:
    # deal with a.b(c) = d
    result = comReformat(reformatAsgn(n))

  elif n.kind == nnkCall and n.hasInfixChildren(":="):
    # deal with a(b:=c)
    result = comReformat(reformatCall(n))

  elif n.len != 0:
    for i in 0..<n.len:
      n[i] = comReformat(n[i])

macro comScript*(x: untyped): untyped =
  ## Nim's dot operators `.=` only allow "a.b = c". With this macro, "a.b(c, d) = e"
  ## is allowed. Some assignments require this macro to work. Moreover, this macro
  ## also translates named arguments to table constructor syntax which
  ## functions related to methods and properties can accept (here we use **:=** as
  ## assignment to avoid syntax conflict). For example:
  ##
  ## .. code-block:: Nim
  ##    comScript:
  ##      dict.item("c") = "dog"
  ##      dict.add(item:="fox", key:="c")
  ##      excel.activeSheet.cells(1, 1) = "text"
  ##      excel.activeSheet.range(cell1:="A1") = "text"
  result = comReformat(x)

when isMainModule:
  comScript:
    var dict = CreateObject("Scripting.Dictionary")
    dict.add("a", "the")
    dict.add("b", item:="quick")
    dict.add(item:="fox", key:="c")
    dict.item(key:="c") = "dog"
    for key in dict:
      echo key, " => ", dict.item(key)
