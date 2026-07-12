#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#           Windows Common Language Runtime (CLR) Support
#
#====================================================================

## This module adds Windows Common Language Runtime (CLR) support for Winim.
## It allows Nim to interact with the Windows .NET Framework.
##
## This module depends heavily on the `winim/com` module. Please also
## read its documentation to understand how to use it.
## Note: `int` is converted to `int32` before being passed to the CLR, even in a
## 64-bit environment.

runnableExamples:
  proc example1() =
    ## Creates a CLR object (also known as a C# instance) and calls the method.
    var mscor = load("mscorlib")
    var rand = mscor.new("System.Random")
    echo rand.Next()

  proc example2() =
    ## Creates a type object and calls a static method.
    var mscor = load("mscorlib")
    var Int32 = mscor.GetType("System.Int32")
    echo @Int32.Parse("12345")

  proc example3() =
    ## Compiles some code and runs it.
    var code = """

    using System;
    public class Test {
      public void Hello() {
        Console.WriteLine("Hello, world");
      }
    }
    """
    var res = compile(code)
    var o = res.CompiledAssembly.new("Test")
    o.Hello()

{.experimental.} # experimental for dot operators

import ole, com
import std/[strutils, macros, os, base64]
import std/strformat except `&`
export com

const
  VBCodeProvider* = "Microsoft.VisualBasic.VBCodeProvider"
  CSharpCodeProvider* = "Microsoft.CSharp.CSharpCodeProvider"
  SystemAssemblyIdentity = "System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
  CLRRuntimeHelperAssemblyBase64 = """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bHBlci5kbGwAUnVudGltZUhlbHBlcgBtc2NvcmxpYgBTeXN0ZW0AT2JqZWN0AHdyYXBJbnRQdHIAd3JhcEFueQBDYXN0AFQAVHlwZQAuY3RvcgB2YWx1ZQB0YXJnZXRUeXBlAFN5c3RlbS5SdW50aW1lLkNvbXBpbGVyU2VydmljZXMAQ29tcGlsYXRpb25SZWxheGF0aW9uc0F0dHJpYnV0ZQBSdW50aW1lQ29tcGF0aWJpbGl0eUF0dHJpYnV0ZQBXaW5pbS5DbHJSdW50aW1lSGVscGVyAEludFB0cgBvcF9FeHBsaWNpdABTeXN0ZW0uUnVudGltZS5JbnRlcm9wU2VydmljZXMATWFyc2hhbABHZXRJVW5rbm93bkZvck9iamVjdABvcF9FcXVhbGl0eQBBcmd1bWVudE51bGxFeGNlcHRpb24AR2V0VHlwZQBnZXRfSXNFbnVtAEVudW0AVG9PYmplY3QAZ2V0X0Z1bGxOYW1lAFN0cmluZwBTdHJpbmdDb21wYXJpc29uAEVxdWFscwBJbnQzMgBSdW50aW1lVHlwZUhhbmRsZQBHZXRUeXBlRnJvbUhhbmRsZQBDb252ZXJ0AENoYW5nZVR5cGUAU3lzdGVtLlJlZmxlY3Rpb24ATWV0aG9kSW5mbwBCaW5kaW5nRmxhZ3MAQmluZGVyAFBhcmFtZXRlck1vZGlmaWVyAEdldE1ldGhvZABNZXRob2RCYXNlAEludm9rZQBNYWtlR2VuZXJpY01ldGhvZABJbnZhbGlkQ2FzdEV4Y2VwdGlvbgBBc3NlbWJseQBMb2FkAAAVdABhAHIAZwBlAHQAVAB5AHAAZQAAKVMAeQBzAHQAZQBtAC4ARAByAGEAdwBpAG4AZwAuAEMAbwBsAG8AcgAAEUYAcgBvAG0AQQByAGcAYgAACUMAYQBzAHQAAICjUwB5AHMAdABlAG0ALgBEAHIAYQB3AGkAbgBnACwAIABWAGUAcgBzAGkAbwBuAD0ANAAuADAALgAwAC4AMAAsACAAQwB1AGwAdAB1AHIAZQA9AG4AZQB1AHQAcgBhAGwALAAgAFAAdQBiAGwAaQBjAEsAZQB5AFQAbwBrAGUAbgA9AGIAMAAzAGYANQBmADcAZgAxADEAZAA1ADAAYQAzAGEAAAAAmLh76ByLbE6zN5airRxpdAAIt3pcVhk04IkEAAEYCgQAARgIBAABGBwGEAEBHgAcBgACGBwSCQUAAhgcDgMgAAEEIAEBCAIeAAcAAgISCRIJBCABAQ4EIAASCQMgAAIGAAIcEgkcAyAADgcAAwIODhEpBgABEgkRMQYAAhwcEgkPIAUSOQ4RPRJBHRIJHRFFBiACHBwdHAcgAhI5DhE9ByABEjkdEgkQBwccCBI5HRIJHRwdEgkdHAUAARJRDgcgAxIJDgICBwADEgkOAgIEBwESUQgBAAgAAAAAAB4BAAEAVAIWV3JhcE5vbkV4Y2VwdGlvblRocm93cwEAmCkAAAAAAAAAAAAArikAAAAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKApAAAAAAAAAABfQ29yRGxsTWFpbgBtc2NvcmVlLmRsbAAAAAAA/yUAIAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABABAAAAAYAACAAAAAAAAAAAAAAAAAAAABAAEAAAAwAACAAAAAAAAAAAAAAAAAAAABAAAAAABIAAAAWEAAAIQCAAAAAAAAAAAAAIQCNAAAAFYAUwBfAFYARQBSAFMASQBPAE4AXwBJAE4ARgBPAAAAAAC9BO/+AAABAAAAAAAAAAAAAAAAAAAAAAA/AAAAAAAAAAQAAAACAAAAAAAAAAAAAAAAAAAARAAAAAEAVgBhAHIARgBpAGwAZQBJAG4AZgBvAAAAAAAkAAQAAABUAHIAYQBuAHMAbABhAHQAaQBvAG4AAAAAAAAAsATkAQAAAQBTAHQAcgBpAG4AZwBGAGkAbABlAEkAbgBmAG8AAADAAQAAAQAwADAAMAAwADAANABiADAAAAAsAAIAAQBGAGkAbABlAEQAZQBzAGMAcgBpAHAAdABpAG8AbgAAAAAAIAAAADAACAABAEYAaQBsAGUAVgBlAHIAcwBpAG8AbgAAAAAAMAAuADAALgAwAC4AMAAAAFgAGwABAEkAbgB0AGUAcgBuAGEAbABOAGEAbQBlAAAAVwBpAG4AaQBtAC4AQwBsAHIAUgB1AG4AdABpAG0AZQBIAGUAbABwAGUAcgAuAGQAbABsAAAAAAAoAAIAAQBMAGUAZwBhAGwAQwBvAHAAeQByAGkAZwBoAHQAAAAgAAAAYAAbAAEATwByAGkAZwBpAG4AYQBsAEYAaQBsAGUAbgBhAG0AZQAAAFcAaQBuAGkAbQAuAEMAbAByAFIAdQBuAHQAaQBtAGUASABlAGwAcABlAHIALgBkAGwAbAAAAAAANAAIAAEAUAByAG8AZAB1AGMAdABWAGUAcgBzAGkAbwBuAAAAMAAuADAALgAwAC4AMAAAADgACAABAEEAcwBzAGUAbQBiAGwAeQAgAFYAZQByAHMAaQBvAG4AAAAwAC4AMAAuADAALgAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAMAAAAwDkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"""

type
  CLRError* = object of CatchableError
    ## Raised when a CLR error occurs.
    hresult*: HRESULT

  CLRVariant* = distinct variant
    ## A `distinct variant` representing a CLR object or value.

  CLRType* = distinct variant
    ## A `distinct variant` representing a CLR type object.

  CLRInterface* = object
    ## Represents a CLR object with a specified interface.
    ## Use `{}` to create an interface object.
    obj*: CLRVariant
    intf*: CLRVariant

# Forward declarations

proc toObject*[T](x: T): CLRVariant

let Null = CLRVariant newVariant(VARIANT())
var
  hresult {.threadvar.}: HRESULT
  CurrentAssembly {.threadvar.}: CLRVariant
  CLRActivator {.threadvar.}: CLRVariant
  CLRGarbageCollector {.threadvar.}: CLRVariant
  CLRRuntimeHelp {.threadvar.}: CLRVariant
  CLRArrayType {.threadvar.}: CLRVariant

converter voidpp_converter(x: ptr ptr object): ptr pointer {.used.} = cast[ptr pointer](x)

proc isNil*(x: CLRVariant): bool {.borrow.}
  ## Checks whether a `CLRVariant` is nil.

proc isNil*(x: CLRType): bool {.borrow.}
  ## Checks whether `CLRType` is nil.

proc isNull*(x: CLRVariant): bool {.borrow.}
  ## Checks whether a `CLRVariant` is C# `null` or VB `Nothing`.

proc unwrap*(x: CLRVariant): VARIANT {.borrow.}
  ## Unwraps a `CLRVariant` to a `VARIANT` object.

proc `==`*(x, y: CLRVariant): bool {.borrow.}
  ## Checks for equality between two `CLRVariant` values.

proc toVariant*(x: CLRVariant): variant {.inline.} =
  ## Converts a `CLRVariant` to a `variant`.
  result = variant x

proc toCLRVariant*[T](x: T): CLRVariant {.inline.} =
  ## Converts any supported type to a `CLRVariant`.
  when T is int:
    result = CLRVariant toVariant(int32 x)
  else:
    result = CLRVariant toVariant(x)

proc toCLRVariant*[T](x: openArray[T], vt: VARENUM = VT_VARIANT): CLRVariant {.inline.} =
  ## Converts any supported openArray type to a `CLRVariant`.
  result = CLRVariant toVariant(x, vt)

proc toCLRVariant*(x: typeof(nil)): CLRVariant {.inline.} =
  ## Converts nil to a `CLRVariant`.
  {.gcsafe.}:
    result = Null

proc fromCLRVariant*[T](x: CLRVariant): T {.inline.} =
  ## Converts a `CLRVariant` to any supported type.
  result = fromVariant[T](variant x)

converter clrVariantToVariant*(x: CLRVariant): variant = variant x
  ## Automatically converts a `CLRVariant` to a `variant`.

converter clrVariantToString*(x: CLRVariant): string = fromCLRVariant[string](x)
  ## Automatically converts a `CLRVariant` to a `string`.

converter clrVariantToCString*(x: CLRVariant): cstring = fromCLRVariant[cstring](x)
  ## Automatically converts a `CLRVariant` to a `cstring`.

converter clrVariantToMString*(x: CLRVariant): mstring = fromCLRVariant[mstring](x)
  ## Automatically converts a `CLRVariant` to an `mstring`.

converter clrVariantToWString*(x: CLRVariant): wstring = fromCLRVariant[wstring](x)
  ## Automatically converts a `CLRVariant` to a `wstring`.

converter clrVariantToChar*(x: CLRVariant): char = fromCLRVariant[char](x)
  ## Automatically converts a `CLRVariant` to a `char`.

converter clrVariantToBool*(x: CLRVariant): bool = fromCLRVariant[bool](x)
  ## Automatically converts a `CLRVariant` to a `bool`.

converter clrVariantToPtrIDispatch*(x: CLRVariant): ptr IDispatch = fromCLRVariant[ptr IDispatch](x)
  ## Automatically converts a `CLRVariant` to `ptr IDispatch`.

converter clrVariantToPtrIUnknown*(x: CLRVariant): ptr IUnknown = fromCLRVariant[ptr IUnknown](x)
  ## Automatically converts a `CLRVariant` to `ptr IUnknown`.

converter clrVariantToPointer*(x: CLRVariant): pointer = fromCLRVariant[pointer](x)
  ## Automatically converts a `CLRVariant` to a pointer.

converter clrVariantToInt*(x: CLRVariant): int = fromCLRVariant[int](x)
  ## Automatically converts a `CLRVariant` to an `int`.

converter clrVariantToUint*(x: CLRVariant): uint = fromCLRVariant[uint](x)
  ## Automatically converts a `CLRVariant` to a `uint`.

converter clrVariantToInt8*(x: CLRVariant): int8 = fromCLRVariant[int8](x)
  ## Automatically converts a `CLRVariant` to an `int8`.

converter clrVariantToUint8*(x: CLRVariant): uint8 = fromCLRVariant[uint8](x)
  ## Automatically converts a `CLRVariant` to a `uint8`.

converter clrVariantToInt16*(x: CLRVariant): int16 = fromCLRVariant[int16](x)
  ## Automatically converts a `CLRVariant` to an `int16`.

converter clrVariantToUInt16*(x: CLRVariant): uint16 = fromCLRVariant[uint16](x)
  ## Automatically converts a `CLRVariant` to a `uint16`.

converter clrVariantToInt32*(x: CLRVariant): int32 = fromCLRVariant[int32](x)
  ## Automatically converts a `CLRVariant` to an `int32`.

converter clrVariantToUInt32*(x: CLRVariant): uint32 = fromCLRVariant[uint32](x)
  ## Automatically converts a `CLRVariant` to a `uint32`.

converter clrVariantToInt64*(x: CLRVariant): int64 = fromCLRVariant[int64](x)
  ## Automatically converts a `CLRVariant` to an `int64`.

converter clrVariantToUInt64*(x: CLRVariant): uint64 = fromCLRVariant[uint64](x)
  ## Automatically converts a `CLRVariant` to a `uint64`.

converter clrVariantToFloat32*(x: CLRVariant): float32 = fromCLRVariant[float32](x)
  ## Automatically converts a `CLRVariant` to a `float32`.

converter clrVariantToFloat64*(x: CLRVariant): float64 = fromCLRVariant[float64](x)
  ## Automatically converts a `CLRVariant` to a `float64`.

converter clrVariantToVARIANTRaw*(x: CLRVariant): VARIANT = fromCLRVariant[VARIANT](x)
  ## Automatically converts a `CLRVariant` to a `VARIANT`.

converter clrVariantToCOMArray1D*(x: CLRVariant): COMArray1D = fromCLRVariant[COMArray1D](x)
  ## Automatically converts a `CLRVariant` to a `COMArray1D`.

converter clrVariantToCOMArray2D*(x: CLRVariant): COMArray2D = fromCLRVariant[COMArray2D](x)
  ## Automatically converts a `CLRVariant` to a `COMArray2D`.

converter clrVariantToCOMArray3D*(x: CLRVariant): COMArray3D = fromCLRVariant[COMArray3D](x)
  ## Automatically converts a `CLRVariant` to a `COMArray3D`.

converter clrVariantToCOMBinary*(x: CLRVariant): COMBinary = fromCLRVariant[COMBinary](x)
  ## Automatically converts a `CLRVariant` to a `COMBinary`.

template ERR(x: HRESULT): bool =
  # CLR calls using ERR require exact S_OK. APIs with additional documented
  # states (such as IEnumUnknown.Next) handle them at their call sites.
  hresult = x
  hresult != S_OK

template validOut(x: untyped): bool =
  if x.isNil:
    hresult = E_UNEXPECTED
    false
  else:
    true

proc clrError(msg: string, hr: HRESULT = 0) =
  var hr = hr
  if hr == 0: hr = hresult
  if hr == 0: hr = E_FAIL

  var
    errorInfo: ptr IErrorInfo
    description: BSTR
    detail = ""
  if GetErrorInfo(0, &errorInfo) == S_OK and not errorInfo.isNil:
    defer: errorInfo.Release()
    if errorInfo.GetDescription(&description) == S_OK and not description.isNil:
      defer: SysFreeString(description)
      detail = $description

  let message = if detail.len == 0: msg else: msg & ": " & detail
  var e = newException(CLRError, fmt"{message} (0x{hr.tohex})")
  e.hresult = hr
  raise e

template to(v: CLRVariant, T: typedesc): untyped =
  var ret: ptr T
  let raw = v.unwrap
  if raw.vt == VT_UNKNOWN:
    if raw.punkVal.isNil:
      hresult = E_POINTER
    else:
      hresult = raw.punkVal.QueryInterface(&(`IID T`), &ret)

  elif raw.vt == VT_DISPATCH:
    if raw.pdispVal.isNil:
      hresult = E_POINTER
    else:
      hresult = raw.pdispVal.QueryInterface(&(`IID T`), &ret)

  else:
    hresult = E_NOINTERFACE

  if hresult == S_OK and ret.isNil:
    hresult = E_UNEXPECTED

  ret

proc isObject*(v: CLRVariant): bool =
  ## Checks whether a `CLRVariant` is a CLR object.
  var obj = v.to(IObject)
  if not obj.isNil:
    result = true
    obj.Release()

proc isType*(v: CLRVariant): bool =
  ## Checks whether a `CLRVariant` is a CLR type object.
  var obj = v.to(IType)
  if not obj.isNil:
    result = true
    obj.Release()

proc isStruct*(v: CLRVariant): bool {.inline.} =
  ## Checks whether a `CLRVariant` is a CLR struct type returned as a VT_RECORD variant.
  result = v.unwrap.vt == VT_RECORD

proc recordVariant(v: CLRVariant): VARIANT =
  result = v.unwrap
  if result.vt != VT_RECORD:
    clrError("variant is not a record", E_NOINTERFACE)
  if result.pRecInfo.isNil or result.pvRecord.isNil:
    clrError("invalid record", E_POINTER)

proc recordFieldNames(v: VARIANT): seq[BSTR] =
  var count: ULONG
  if v.pRecInfo.GetFieldNames(&count, nil).ERR:
    clrError("unable to get field names of record")

  let capacity = uint64(cast[uint32](count))
  if capacity > uint64(int.high):
    clrError("invalid record field count", E_INVALIDARG)

  result = newSeq[BSTR](int capacity)
  var keep = false
  defer:
    if not keep:
      for bstr in result:
        SysFreeString(bstr)

  if result.len != 0:
    if v.pRecInfo.GetFieldNames(&count, &result[0]).ERR:
      clrError("unable to get field names of record")

    let returned = uint64(cast[uint32](count))
    if returned > capacity:
      clrError("invalid record field count", E_INVALIDARG)

    for i in 0 ..< int(returned):
      if result[i].isNil:
        clrError("invalid record field name", E_UNEXPECTED)

    for i in int(returned) ..< result.len:
      SysFreeString(result[i])
    result.setLen(int returned)

  keep = true

proc `@`*(v: CLRVariant): CLRType =
  ## Converts a `CLRVariant` to `CLRType` so static members can be invoked.
  if not v.isType():
    clrError("variant is not a type object")

  result = CLRType v

proc `@`*(v: CLRType): CLRType {.inline.} =
  ## Leaves a `CLRType` unchanged so type conversion is idempotent.
  result = v

proc com*(v: CLRVariant): com =
  ## Converts a `CLRVariant` to Winim's `com` object, a COM callable wrapper (CCW).
  if not v.isObject():
    clrError("variant is not an object")

  let raw = v.unwrap
  if raw.vt == VT_DISPATCH:
    result = newCom(raw.pdispVal)

  elif raw.vt == VT_UNKNOWN:
    var disp: ptr IDispatch
    if raw.punkVal.QueryInterface(&IID_IDispatch, &disp).ERR or disp.isNil:
      if hresult == S_OK:
        hresult = E_NOINTERFACE
      clrError("variant does not support IDispatch")

    defer: disp.Release()
    result = newCom(disp)

  else:
    clrError("variant is not an object")

proc invoke(typ: ptr IType, self: VARIANT, name: string, flags: int,
    vargs: varargs[CLRVariant, toCLRVariant]): CLRVariant {.discardable.} =

  var
    bstr = SysAllocString(name)
    retVal: VARIANT

  defer:
    SysFreeString(bstr)

  if name.len != 0 and bstr.isNil:
    clrError("unable to allocate member name", E_OUTOFMEMORY)

  let hr =
    if vargs.len == 0:
      typ.InvokeMember_3(bstr, int32 flags, nil, self, nil, &retVal)
    else:
      let arr = toCLRVariant(vargs)
      typ.InvokeMember_3(bstr, int32 flags, nil, self, arr.unwrap.parray, &retVal)

  if hr.ERR:
    clrError("unable to invoke specified member: " & name)

  result = CLRVariant adoptVariant(retVal)

proc invoke*(v: CLRVariant, name: string, flags: int,
    vargs: varargs[CLRVariant, toCLRVariant]): CLRVariant {.discardable.} =
  ## Low-level `invoke` for `CLRVariant`, equivalent to `CLRVariant.GetType().InvokeMember(...)`.
  if v.isNil:
    clrError("variant is nil", E_POINTER)

  var
    obj: ptr IObject
    typ: ptr IType
    self: VARIANT

  defer:
    if not obj.isNil: obj.Release()
    if not typ.isNil: typ.Release()

  obj = v.to(IObject)
  if obj.isNil:
    obj = toObject(v).to(IObject)
    if obj.isNil:
      clrError("variant is not an object")

  if obj.GetType(&typ).ERR or not validOut(typ):
    clrError("unable to get type of object")

  self.vt = VT_UNKNOWN
  self.punkVal = obj

  result = invoke(typ, self, name, flags, vargs)

proc invoke*(v: CLRType, name: string, flags: int,
    vargs: varargs[CLRVariant, toCLRVariant]): CLRVariant {.discardable.} =
  ## Low-level `invoke` for `CLRType`, equivalent to `CLRType.InvokeMember(...)`.
  let v = CLRVariant v
  if v.isNil:
    clrError("variant is nil", E_POINTER)

  var
    typ: ptr IType
    self: VARIANT

  defer:
    if not typ.isNil: typ.Release()

  typ = v.to(IType)
  if typ.isNil:
    clrError("variant is not a type")

  result = invoke(typ, self, name, flags, vargs)

proc getType*(assembly: CLRVariant, name: string): CLRType =
  ## Gets a type from this assembly as a typed `CLRType` proxy.
  ##
  ## The capitalized `GetType` spelling remains the dynamic CLR member call and
  ## continues to return `CLRVariant` for backwards compatibility.
  let value = invoke(assembly, name = "GetType",
    flags = BindingFlags_InvokeMethod or BindingFlags_GetProperty or
      BindingFlags_GetField or BindingFlags_OptionalParamBinding, name)
  result = @value

proc invoke*(v: CLRInterface, name: string, flags: int,
    vargs: varargs[CLRVariant, toCLRVariant]): CLRVariant {.discardable.} =
  ## Low-level `invoke` for `CLRInterface`.
  if v.obj.isNil or v.intf.isNil:
    clrError("invalid interface", E_POINTER)

  var
    obj: ptr IObject
    typ: ptr IType
    self: VARIANT

  defer:
    if not obj.isNil: obj.Release()
    if not typ.isNil: typ.Release()

  obj = v.obj.to(IObject)
  if obj.isNil:
    obj = toObject(v.obj).to(IObject)
    if obj.isNil:
      clrError("CLRInterface.obj is not an object")

  typ = v.intf.to(IType)
  if typ.isNil:
    clrError("CLRInterface.intf is not a type")

  self.vt = VT_UNKNOWN
  self.punkVal = obj

  result = invoke(typ, self, name, flags, vargs)

template setMemberFlags(v: CLRVariant|CLRInterface): int =
  BindingFlags_SetProperty or BindingFlags_SetField

template setMemberFlags(v: CLRType): int =
  BindingFlags_SetProperty or BindingFlags_SetField or BindingFlags_FlattenHierarchy or
    BindingFlags_Static or BindingFlags_Public or BindingFlags_NonPublic

macro `.`*(v: CLRVariant, name: untyped, vargs: varargs[untyped]): untyped =
  ## Dot operator for `CLRVariant`: invokes methods and gets properties or fields.
  result = newCall("invoke", v, newStrLitNode($name),
    newIntLitNode(BindingFlags_InvokeMethod or BindingFlags_GetProperty or
      BindingFlags_GetField or BindingFlags_OptionalParamBinding))

  for i in vargs: result.add i

macro `.=`*(v: CLRVariant, name: untyped, vargs: varargs[untyped]): untyped =
  ## Dot-assignment operator for `CLRVariant`: sets a property or field.
  result = newCall("invoke", v, newStrLitNode($name),
    newIntLitNode(BindingFlags_SetProperty or BindingFlags_SetField))

  for i in vargs: result.add i

macro `.`*(v: CLRType, name: untyped, vargs: varargs[untyped]): untyped =
  ## Dot operator for `CLRType`: invokes static methods and gets static properties or fields.
  result = newCall("invoke", v, newStrLitNode($name),
    newIntLitNode(BindingFlags_InvokeMethod or BindingFlags_GetProperty or
      BindingFlags_GetField or BindingFlags_FlattenHierarchy or BindingFlags_Static or
      BindingFlags_Public or BindingFlags_NonPublic or BindingFlags_OptionalParamBinding))

  for i in vargs: result.add i

macro `.=`*(v: CLRType, name: untyped, vargs: varargs[untyped]): untyped =
  ## Dot-assignment operator for `CLRType`: sets a static property or field.
  result = newCall("invoke", v, newStrLitNode($name),
    newIntLitNode(BindingFlags_SetProperty or BindingFlags_SetField or
      BindingFlags_FlattenHierarchy or BindingFlags_Static or BindingFlags_Public or
      BindingFlags_NonPublic))

  for i in vargs: result.add i

macro `.`*(v: CLRInterface, name: untyped, vargs: varargs[untyped]): untyped =
  ## Dot operator for `CLRInterface`.
  result = newCall("invoke", v, newStrLitNode($name),
    newIntLitNode(BindingFlags_InvokeMethod or BindingFlags_GetProperty or
      BindingFlags_GetField or BindingFlags_OptionalParamBinding))

  for i in vargs: result.add i

macro `.=`*(v: CLRInterface, name: untyped, vargs: varargs[untyped]): untyped =
  ## Dot-assignment operator for `CLRInterface`.
  result = newCall("invoke", v, newStrLitNode($name),
    newIntLitNode(BindingFlags_SetProperty or BindingFlags_SetField))

  for i in vargs: result.add i

proc reformatAsgn(n: NimNode): NimNode =
  # Reformat code:
  #   a.b(c, ...) = d -> a.b.invoke("c", ..., d)
  expectKind(n, nnkAsgn)

  var
    params = n[0]
    dots = n[0][0]

  let receiver = dots[0].copyNimTree
  params.insert(1, newCall(bindSym("setMemberFlags"), receiver))
  params.insert(1, dots.last.toStrLit)
  params.add(n.last)
  dots.del(dots.len-1)
  dots.add(newIdentNode("invoke"))
  result = n[0]

proc clrReformat(n: NimNode): NimNode =
  result = n

  if n.kind == nnkAsgn and n[0].kind == nnkCall and n[0][0].kind == nnkDotExpr:
    # Handle a.b(c) = d.
    result = clrReformat(reformatAsgn(n))

  elif n.len != 0:
    for i in 0..<n.len:
      n[i] = clrReformat(n[i])

macro clrScript*(x: untyped): untyped =
  ## Extends `.=` to allow assignments such as
  ## `a.b(c, d) = e`.
  result = clrReformat(x)

iterator fields*(v: CLRVariant): string =
  ## Iterates over all fields of a CLR struct type.
  let raw = recordVariant(v)
  var names = recordFieldNames(raw)
  defer:
    for bstr in names:
      SysFreeString(bstr)

  for bstr in names:
    yield $bstr

iterator fieldPairs*(v: CLRVariant): tuple[name: string, value: CLRVariant] =
  ## Iterates over all fields of a CLR struct type, returning each name and value.
  let raw = recordVariant(v)
  var names = recordFieldNames(raw)
  defer:
    for bstr in names:
      SysFreeString(bstr)

  for bstr in names:
    var name = $bstr
    var value: VARIANT
    defer: discard VariantClear(&value)
    if raw.pRecInfo.GetField(raw.pvRecord, bstr, &value).ERR:
      clrError("unable to get specified field: " & name)

    yield (name, toCLRVariant(value))

proc `[]`*(v: CLRVariant, name: string): CLRVariant =
  ## Returns the specified field as a `CLRVariant` from a CLR struct type.
  let raw = recordVariant(v)

  var value: VARIANT
  defer: discard VariantClear(&value)
  if raw.pRecInfo.GetField(raw.pvRecord, name, &value).ERR:
    clrError("unable to get specified field: " & name)

  result = toCLRVariant(value)

proc `$`*(v: CLRVariant): string =
  ## `$` operator for `CLRVariant`.
  try:
    result = string v

  except VariantConversionError:
    if v.isObject:
      result = $v.ToString()

    elif v.isStruct:
      var parts = newSeq[string]()
      for key, val in v.fieldPairs:
        parts.add key & ": " & $val

      result = '(' & parts.join(", ") & ')'

    else:
      result = v.rawTypeDesc

proc repr*(v: CLRVariant): string =
  ## `repr` operator for `CLRVariant`.
  try:
    result = string v

  except VariantConversionError:
    if v.isObject:
      result = $v.ToString()

    elif v.isStruct:
      var parts = newSeq[string]()
      for key, val in v.fieldPairs:
        parts.add key & ": " & $val

      result = '(' & parts.join(", ") & ')'

    else:
      result = repr v.unwrap

proc `$`*(v: CLRType): string =
  ## `$` operator for `CLRType`.
  let value = CLRVariant v
  result = $value

proc repr*(v: CLRType): string =
  ## `repr` operator for `CLRType`.
  let value = CLRVariant v
  result = repr(value)

iterator clrVersions*(): string =
  ## Iterates over all installed .NET Framework CLR versions.
  ## Enumeration order is unspecified; `clrStart()` compares numeric fields
  ## when selecting the highest version.
  var
    metahost: ptr ICLRMetaHost
    enumUnknown: ptr IEnumUnknown
    enumRuntime: ptr IUnknown
    runtimeInfo: ptr ICLRRuntimeInfo

  defer:
    if not metahost.isNil: metahost.Release()
    if not enumUnknown.isNil: enumUnknown.Release()

  if CLRCreateInstance(&CLSID_CLRMetaHost, &IID_ICLRMetaHost, &metahost).ERR or
      not validOut(metahost):
    clrError("unable to create metahost instance")

  if metaHost.EnumerateInstalledRuntimes(&enumUnknown).ERR or not validOut(enumUnknown):
    clrError("unable to enumerate installed runtimes")

  while true:
    enumRuntime = nil
    let hr = enumUnknown.Next(1, &enumRuntime, nil)
    if hr == S_FALSE:
      break
    if hr != S_OK:
      clrError("unable to enumerate installed runtimes", hr)
    if not validOut(enumRuntime):
      clrError("unable to enumerate installed runtimes")

    defer: enumRuntime.Release()
    runtimeInfo = nil
    if enumRuntime.QueryInterface(&IID_ICLRRuntimeInfo, &runtimeInfo) == S_OK:
      if not validOut(runtimeInfo):
        clrError("unable to get runtime information")
      defer: runtimeInfo.Release()
      var size: DWORD
      let hr = runtimeInfo.GetVersionString(nil, &size)
      if hr != S_OK and hr != HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER):
        clrError("unable to get runtime version", hr)
      if size == 0:
        clrError("invalid runtime version length", E_UNEXPECTED)

      var buffer = newWString(size)
      if runtimeInfo.GetVersionString(&buffer, &size).ERR:
        clrError("unable to get runtime version")
      yield $buffer.nullTerminated

proc compareClrVersions(left, right: string): int =
  proc parts(version: string): seq[int] =
    let normalized = if version.len != 0 and version[0] in {'v', 'V'}:
        version[1 .. ^1]
      else:
        version
    for part in normalized.split('.'):
      var digits = ""
      for ch in part:
        if ch notin {'0'..'9'}:
          break
        digits.add ch
      result.add(if digits.len == 0: 0 else: parseInt(digits))

  let
    leftParts = parts(left)
    rightParts = parts(right)
    count = max(leftParts.len, rightParts.len)
  for index in 0 ..< count:
    let
      leftValue = if index < leftParts.len: leftParts[index] else: 0
      rightValue = if index < rightParts.len: rightParts[index] else: 0
    if leftValue < rightValue: return -1
    if leftValue > rightValue: return 1

proc clrStart*(version = ""): CLRVariant {.discardable.} =
  ## Starts the specified CLR and returns its `AppDomain`.
  ## If omitted, `version` is selected as the numerically highest installed CLR.
  ## The current thread is initialized automatically by the COM bridge.
  var version = version
  if version == "":
    for v in clrVersions():
      if version.len == 0 or compareClrVersions(v, version) > 0:
        version = v

    if version == "":
      clrError("unable to find an installed CLR")

  var
    metahost: ptr ICLRMetaHost
    runtimeInfo: ptr ICLRRuntimeInfo
    clrRuntimeHost: ptr ICLRRuntimeHost
    corRuntimeHost: ptr ICorRuntimeHost
    retVal: VARIANT
    loadable: BOOL

  defer:
    if not metahost.isNil: metahost.Release()
    if not runtimeInfo.isNil: runtimeInfo.Release()
    if not clrRuntimeHost.isNil: clrRuntimeHost.Release()
    if not corRuntimeHost.isNil: corRuntimeHost.Release()

  if CLRCreateInstance(&CLSID_CLRMetaHost, &IID_ICLRMetaHost, &metahost).ERR or
      not validOut(metahost):
    clrError("unable to create metahost instance")

  if metahost.GetRuntime(version, &IID_ICLRRuntimeInfo, &runtimeInfo).ERR or
      not validOut(runtimeInfo):
    clrError("unable to get runtime of " & version)

  if runtimeInfo.IsLoadable(&loadable).ERR or not bool(loadable):
    clrError("specified runtime is not loadable")

  if runtimeInfo.GetInterface(&CLSID_CLRRuntimeHost, &IID_ICLRRuntimeHost, &clrRuntimeHost).ERR or
      not validOut(clrRuntimeHost):
    clrError("unable to get interface of CLRRuntimeHost")

  if runtimeInfo.GetInterface(&CLSID_CorRuntimeHost, &IID_ICorRuntimeHost, &corRuntimeHost).ERR or
      not validOut(corRuntimeHost) or corRuntimeHost.GetDefaultDomain(&retVal.punkVal).ERR or
      not validOut(retVal.punkVal):

    if not corRuntimeHost.isNil:
      corRuntimeHost.Release()
      corRuntimeHost = nil

    if clrRuntimeHost.Start().ERR:
      clrError("unable to start CLRRuntimeHost")

    if runtimeInfo.GetInterface(&CLSID_CorRuntimeHost, &IID_ICorRuntimeHost, &corRuntimeHost).ERR or
        not validOut(corRuntimeHost):
      clrError("unable to get interface of CorRuntimeHost")

    if corRuntimeHost.Start().ERR:
      clrError("unable to start CorRuntimeHost")

    if corRuntimeHost.GetDefaultDomain(&retVal.punkVal).ERR or not validOut(retVal.punkVal):
      clrError("unable to get default domain")

  retVal.vt = VT_UNKNOWN
  result = CLRVariant adoptVariant(retVal)
  CurrentAssembly = result.GetType().Assembly.GetType()

proc load*(name: string): CLRVariant {.discardable.} =
  ## Loads an assembly from a file or the global assembly cache using a partial name.
  if CurrentAssembly.isNil:
    clrStart()

  try:
    result = @CurrentAssembly.LoadFrom(name)
  except CLRError:
    if fileExists(name) or isAbsolute(name) or name.contains('\\') or name.contains('/'):
      raise
    result = @CurrentAssembly.LoadWithPartialName(name)

proc load*(data: COMBinary): CLRVariant {.discardable.} =
  ## Loads an assembly from a Common Object File Format (COFF)-based image.
  if CurrentAssembly.isNil:
    clrStart()

  result = @CurrentAssembly.Load(data)

proc load*(data: openArray[byte]): CLRVariant {.discardable.} =
  ## Loads an assembly from a Common Object File Format (COFF)-based image.
  if CurrentAssembly.isNil:
    clrStart()

  result = @CurrentAssembly.Load(toCLRVariant(data, VT_UI1))

proc new*(assembly: CLRVariant, name: string, vargs: varargs[CLRVariant, toCLRVariant]): CLRVariant {.discardable.} =
  ## Creates an instance of a type in this assembly by name (case-sensitive).
  if assembly.isNil:
    clrError("variant is nil", E_POINTER)

  if vargs.len == 0:
    result = assembly.CreateInstance(name, false, nil, nil, nil, nil, nil)
  else:
    let arr = toCLRVariant(vargs)
    result = assembly.CreateInstance(name, false, nil, nil, arr, nil, nil)

proc new*(typ: CLRType, vargs: varargs[CLRVariant, toCLRVariant]): CLRVariant {.discardable.} =
  ## Creates an instance of this type.
  if typ.isNil:
    clrError("variant is nil", E_POINTER)

  if CLRActivator.isNil:
    CLRActivator = load("mscorlib").GetType("System.Activator")

  let arr = toCLRVariant(vargs)
  result = @CLRActivator.CreateInstance(CLRVariant typ, arr)

proc compile*(code: string, references: openArray[string] = ["System.dll"], filename = "",
    compilerOptions = "", provider = CSharpCodeProvider, debug = false): CLRVariant {.discardable.} =
  ## Compiles the specified code and returns the `CompilerResults` object.
  var
    sys = load(SystemAssemblyIdentity)
    codeProvider = sys.new(provider)
    assemblyNames = toCLRVariant(references, VT_BSTR)
    prms = sys.new("System.CodeDom.Compiler.CompilerParameters", assemblyNames)

  prms.OutputAssembly = filename
  prms.GenerateInMemory = filename == ""
  prms.GenerateExecutable = filename.toLowerAscii.endsWith ".exe"
  prms.CompilerOptions = compilerOptions
  prms.IncludeDebugInformation = debug

  result = codeProvider.CompileAssemblyFromSource(prms, code)

proc reclaim*() =
  ## Forces an immediate garbage collection.
  if CLRGarbageCollector.isNil:
    CLRGarbageCollector = load("mscorlib").GetType("System.GC")

  @CLRGarbageCollector.Collect()
  @CLRGarbageCollector.GetTotalMemory(true)

proc clrClose*() =
  ## Releases the CLR COM proxies cached by the current thread.
  ## The automatic COM apartment remains available until the thread exits.
  CLRArrayType = default(CLRVariant)
  CLRRuntimeHelp = default(CLRVariant)
  CLRGarbageCollector = default(CLRVariant)
  CLRActivator = default(CLRVariant)
  CurrentAssembly = default(CLRVariant)
  COM_FullRelease()

proc getRuntimeHelp(): CLRVariant =
  if CurrentAssembly.isNil:
    clrStart()

  if CLRRuntimeHelp.isNil:
    let assembly = load(COMBinary CLRRuntimeHelperAssemblyBase64.decode)
    if assembly.isNil or assembly.isNull:
      clrError("unable to load CLR runtime helper", E_UNEXPECTED)

    CLRRuntimeHelp = assembly.GetType("RuntimeHelper")
    if CLRRuntimeHelp.isNil or CLRRuntimeHelp.isNull:
      clrError("CLR runtime helper type was not found", E_UNEXPECTED)

  result = CLRRuntimeHelp

proc toObjectRaw(iunknown: CLRVariant): CLRVariant =
  var v: VARIANT
  v.vt = VT_UNKNOWN
  v.punkVal = iunknown.unwrap.punkVal
  if v.punkVal.isNil:
    clrError("unable to convert to object", E_NOTIMPL)

  # Decrements the reference count returned by Marshal.GetIUnknownForObject().
  defer: v.punkVal.Release()
  result = toCLRVariant(v)

proc toObject*(x: pointer|proc): CLRVariant =
  ## Converts a `pointer` or `proc` to a `System.IntPtr` object.
  var RuntimeHelp = getRuntimeHelp()
  toObjectRaw(@RuntimeHelp.wrapIntPtr(cast[int64](x)))

proc toObject*[T](x: T): CLRVariant =
  ## Tries to convert any value type or struct type to a CLR object.
  var RuntimeHelp = getRuntimeHelp()
  toObjectRaw(@RuntimeHelp.wrapAny(x))

proc toObject*[T](x: T, typ: string): CLRVariant =
  ## Tries to convert any value or struct to an object of the named CLR type.
  ## Type lookup and conversion failures retain the original CLR diagnostics.
  let RuntimeHelp = getRuntimeHelp()
  toObjectRaw(@RuntimeHelp.wrapAny(x, typ))

proc toObject*[T](x: T, typ: CLRVariant): CLRVariant =
  ## Tries to convert any value or struct to an object of the specified CLR type.
  ## Conversion failures retain the original CLR diagnostics.
  if typ.isNil or typ.isNull:
    clrError("target CLR type is nil", E_POINTER)

  let RuntimeHelp = getRuntimeHelp()
  toObjectRaw(@RuntimeHelp.wrapAny(x, typ))

proc toObject*[T](x: T, typ: CLRType): CLRVariant {.inline.} =
  ## Converts a value to an object of the specified `CLRType`.
  toObject(x, CLRVariant typ)

proc `[]`*[T: variant|SomeNumber|string|proc|array|seq](x: T): CLRVariant =
  ## Syntactic sugar for `x.toObject()`.
  toObject(x)

proc `[]`*[T](x: T, typ: CLRVariant): CLRVariant {.inline.} =
  ## Syntactic sugar for `x.toObject(CLRVariant)`.
  if typ.isNil:
    clrError("variant is nil", E_POINTER)

  toObject(x, typ)

proc `[]`*[T](x: T, typ: CLRType): CLRVariant {.inline.} =
  ## Syntactic sugar for `x.toObject(CLRType)`.
  toObject(x, typ)

proc `{}`*(v, i: CLRVariant): CLRInterface {.inline.} =
  ## Syntactic sugar for creating a `CLRInterface` (requires a Nim compiler version >= 1.2.0).
  result.obj = v
  result.intf = i

proc item(v: CLRVariant, i: int): CLRVariant =
  var v = v
  if not v.isObject:
    v = v.toObject()

  let iList = CLRInterface(obj: v, intf: v.GetType.GetInterface("System.Collections.IList"))
  result = iList.Item(i)

proc `[]`*(v: CLRVariant, i: SomeOrdinal): CLRVariant =
  ## Index operator for `CLRVariant` via the `IList` interface.
  try:
    result = v.item(int i)
  except CLRError:
    clrError("variant is not indexable")

iterator pairs*(v: CLRVariant): (int, CLRVariant) =
  ## Iterates over all members of a `CLRVariant`, yielding `(int, CLRVariant)` pairs.
  ## Supports `System.Array`, enumerable, and collection types.
  var v = v
  if not v.isObject:
    if CLRArrayType.isNil:
      CLRArrayType = load("mscorlib").GetType("System.Array")

    try:
      v = v[CLRArrayType]
    except CLRError:
      clrError("variant is not enumerable")

  proc ok(i: CLRInterface): bool {.inline.} = (not i.intf.isNil) and (not i.intf.isNull)

  let
    vtype = v.GetType
    iCollection = CLRInterface(obj: v, intf: vtype.GetInterface("System.Collections.ICollection"))
    iList = CLRInterface(obj: v, intf: vtype.GetInterface("System.Collections.IList"))
    iEnumerable = CLRInterface(obj: v, intf: vtype.GetInterface("System.Collections.IEnumerable"))

  if iCollection.ok and iList.ok:
    for i in 0 ..< iCollection.Count:
      yield (i, iList.Item(i))

  elif iEnumerable.ok:
    var
      enumerator = iEnumerable.GetEnumerator
      i = 0

    let iDisposable = CLRInterface(
      obj: enumerator,
      intf: enumerator.GetType.GetInterface("System.IDisposable"))
    defer:
      if iDisposable.ok:
        discard iDisposable.Dispose()

    while enumerator.MoveNext:
      yield (i, enumerator.Current)
      i.inc

  else:
    clrError("variant is not enumerable")

iterator items*(v: CLRVariant): CLRVariant =
  ## Iterates over all members of a `CLRVariant`.
  ## Supports `System.Array`, enumerable, and collection types.
  for i, o in v:
    yield o
