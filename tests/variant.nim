#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

{.push hint[XDeclaredButNotUsed]: off.}

import winim/com
import std/[macros, math, unittest]

suite "Test Suites for winim/com Variant":
  setup:
    type TestEnum = enum
      enumZero = 0
      enumTwo = 2

    template variantValue(x: untyped): untyped =
      var v = toVariant(x)
      when x.type is float32:
        abs(fromVariant[x.type](v) - x) < 0.001
      else:
        fromVariant[x.type](v) == x

    template variantPointerValue(x: untyped): untyped =
      var n = x
      variantValue(&n)

    template variantConvValue(x: untyped): untyped =
      var y: x.type = toVariant(x)
      when x.type is float32:
        abs(y - x) < 0.01
      else:
        y == x

    macro checkVariantValues(body, valueTemplate: untyped): untyped =
      result = newStmtList()
      let values = if body.kind == nnkStmtList: body else: newStmtList(body)
      for value in values:
        result.add quote do:
          check(`valueTemplate`(`value`))

    template checkVariant(body: untyped): untyped =
      checkVariantValues(body, variantValue)

    template checkVariantPtr(body: untyped): untyped =
      checkVariantValues(body, variantPointerValue)

    template checkVariantConv(body: untyped): untyped =
      checkVariantValues(body, variantConvValue)

    var
      a1 = [1, 2, 3]
      a2 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      a3 = [[[1, 3, 4], [4, 5, 6], [7, 8, 9]], [[10, 11, 12], [13, 14, 15], [16, 17, 18]], [[19, 20, 21], [22, 23, 24], [25, 26, 27]]]
      s1 = @[105, 110, 112, 117, 116, 61, 116, 101, 115, 116]
      s2 = @[@[1, 2], @[3, 4, 5, 6, 7], @[8, 9, 10, 11], @[12], @[13, 14, 15]]
      s3 = @[@[@[1, 2], @[3, 4, 5, 6], @[7]], @[@[8, 9, 10, 11, 12, 13], @[14, 15]], @[@[16, 17, 18], @[19], @[20, 21], @[22, 23, 24, 25]]]
      s4 = @[@[@[@[1, 2], @[3, 4, 5, 6], @[7]], @[@[8, 9, 10, 11, 12, 13], @[14, 15]], @[@[16, 17, 18], @[19], @[20, 21], @[22, 23, 24, 25]]]]
      st: SYSTEMTIME
      ft: FILETIME
      V: VARIANT

    GetLocalTime(&st)
    ft = toVariant(st).FILETIME

  teardown:
    COM_FullRelease()

  test "Basic, Null, And Raw Variant Conversion":
    checkVariant:
      true
      false
      123.uint
      123'u8
      123'u16
      123'u32
      123'u64
      -123.int
      -123'i8
      -123'i16
      -123'i32
      -123'i64
      -123.45'f32
      -123.45'f64
      'A'
      cast[pointer](123)

    check:
      fromVariant[uint64](toVariant(uint64.high)) == uint64.high

    let unknownEnum = fromVariant[TestEnum](toVariant(1))
    check:
      cast[int](unknownEnum) == 1

    var
      nullCom: com
      nullDispatch: ptr IDispatch
      nullUnknown: ptr IUnknown

    let nullComVariant = toVariant(nullCom)
    check:
      nullComVariant.rawType == VT_DISPATCH
      nullComVariant.isNull
      fromVariant[ptr IDispatch](nullComVariant).isNil

    let nullDispatchVariant = toVariant(nullDispatch)
    check:
      nullDispatchVariant.rawType == VT_DISPATCH
      nullDispatchVariant.isNull
      fromVariant[ptr IDispatch](nullDispatchVariant).isNil

    let nullUnknownVariant = toVariant(nullUnknown)
    check:
      nullUnknownVariant.rawType == VT_UNKNOWN
      nullUnknownVariant.isNull
      unwrap(nullUnknownVariant).punkVal.isNil
      fromVariant[ptr IUnknown](nullUnknownVariant).isNil
      nil.variant.isNull
      nil.variant.rawType == VT_EMPTY
      nil.variant.rawTypeDesc == "VT_EMPTY"
      unwrap(nil.variant).vt == VT_EMPTY
      unwrap(nullCom).isNil

    check:
      toVariant(int8.low).rawType == VT_I1
      toVariant(int16.low).rawType == VT_I2
      toVariant(int32.low).rawType == VT_I4
      toVariant(int64.low).rawType == VT_I8
      toVariant(uint8.high).rawType == VT_UI1
      toVariant(uint16.high).rawType == VT_UI2
      toVariant(uint32.high).rawType == VT_UI4
      toVariant(uint64.high).rawType == VT_UI8
      toVariant(1.25'f32).rawType == VT_R4
      toVariant(1.25'f64).rawType == VT_R8
      toVariant(true).rawType == VT_BOOL
      unwrap(toVariant(true)).boolVal == VARIANT_TRUE
      unwrap(toVariant(false)).boolVal == VARIANT_FALSE
      toVariant('x').rawType == VT_UI1
      toVariant(cast[pointer](1)).rawType == VT_PTR
      toVariant("x").rawTypeDesc == "VT_BSTR"
      toVariant([1, 2]).rawTypeDesc == "VT_ARRAY(1D)|VT_VARIANT"
      toVariant([[1, 2]]).rawTypeDesc == "VT_ARRAY(2D)|VT_VARIANT"
      toVariant([[[1, 2]]]).rawTypeDesc == "VT_ARRAY(3D)|VT_VARIANT"

    let missing = toVariant(nil.variant)
    check:
      missing.rawType == VT_ERROR
      unwrap(missing).scode == DISP_E_PARAMNOTFOUND

    check:
      fromVariant[int8](toVariant(int8.low)) == int8.low
      fromVariant[int8](toVariant(int8.high)) == int8.high
      fromVariant[int16](toVariant(int16.low)) == int16.low
      fromVariant[int16](toVariant(int16.high)) == int16.high
      fromVariant[int32](toVariant(int32.low)) == int32.low
      fromVariant[int32](toVariant(int32.high)) == int32.high
      fromVariant[int64](toVariant(int64.low)) == int64.low
      fromVariant[int64](toVariant(int64.high)) == int64.high
      fromVariant[uint8](toVariant(uint8.high)) == uint8.high
      fromVariant[uint16](toVariant(uint16.high)) == uint16.high
      fromVariant[uint32](toVariant(uint32.high)) == uint32.high
      fromVariant[uint64](toVariant(uint64.high)) == uint64.high

    let positiveInfinity = fromVariant[float64](toVariant(Inf))
    let negativeInfinity = fromVariant[float64](toVariant(NegInf))
    let notANumber = fromVariant[float64](toVariant(NaN))
    check:
      positiveInfinity == Inf
      negativeInfinity == NegInf
      notANumber.isNaN

  test "Pointer And Referenced Storage Conversion":
    checkVariantPtr:
      true
      false
      123.uint
      123'u8
      123'u16
      123'u32
      123'u64
      -123.int
      -123'i8
      -123'i16
      -123'i32
      -123'i64
      -123.45'f32
      -123.45'f64
      'A'

    var
      signedValue = -12'i32
      unsignedValue = 12'u64
      floatValue = 1.5'f64
      charValue = 'A'
      boolValue = false
      bstrValue = SysAllocString("before")

    defer:
      SysFreeString(bstrValue)

    let
      signedVariant = toVariant(&signedValue)
      unsignedVariant = toVariant(&unsignedValue)
      floatVariant = toVariant(&floatValue)
      charVariant = toVariant(&charValue)
      boolVariant = toVariant(&boolValue)
      bstrVariant = toVariant(&bstrValue)

    check:
      (signedVariant.rawType and VT_BYREF) != 0
      (unsignedVariant.rawType and VT_BYREF) != 0
      (floatVariant.rawType and VT_BYREF) != 0
      (charVariant.rawType and VT_BYREF) != 0
      (boolVariant.rawType and VT_BYREF) != 0
      (bstrVariant.rawType and VT_BYREF) != 0

    signedValue = 99
    unsignedValue = uint64.high
    floatValue = -2.25
    charValue = 'Z'
    boolValue = true
    SysFreeString(bstrValue)
    bstrValue = SysAllocString("after")

    check:
      fromVariant[ptr int32](signedVariant) == &signedValue
      fromVariant[ptr int32](signedVariant)[] == 99
      fromVariant[ptr uint64](unsignedVariant)[] == uint64.high
      fromVariant[ptr float64](floatVariant)[] == -2.25
      fromVariant[ptr char](charVariant)[] == 'Z'
      fromVariant[ptr bool](boolVariant)[]
      $fromVariant[ptr BSTR](bstrVariant)[] == "after"

    var inner = unwrap(toVariant(321))
    var outer: VARIANT
    outer.vt = VARTYPE(VT_BYREF or VT_VARIANT)
    outer.pvarVal = &inner
    check:
      fromVariant[int](adoptVariant(outer)) == 321

  test "String, Binary, And Time Conversion":
    checkVariant:
      "English Test 中文測試"
      "embedded\0null"
      cstring "English Test 中文測試"
      -$"English Test 中文測試"
      +$"English Test 中文測試"
      COMBinary "Binary\0String\0"

    let v = toVariant("English Test 中文測試")

    let borrowed = fromVariant[cstring](v)
    check:
      $borrowed == "English Test 中文測試"

    let bstr = fromVariant[BSTR](v)
    check:
      $bstr == "English Test 中文測試"
    SysFreeString(bstr)
    check:
      $v == "English Test 中文測試"

    var raw = fromVariant[VARIANT](v)
    check:
      $raw.bstrVal == "English Test 中文測試"
    VariantClear(&raw)
    check:
      $v == "English Test 中文測試"

    checkVariant:
      ""
      "\0leading"
      "trailing\0"
      "A😀����Z"

    var nilBstr: BSTR
    let nilBstrVariant = toVariant(nilBstr)
    check:
      nilBstrVariant.rawType == VT_BSTR
      unwrap(nilBstrVariant).bstrVal.isNil
      fromVariant[string](nilBstrVariant) == ""

    let firstCStringVariant = toVariant("first")
    let secondCStringVariant = toVariant("second")
    check:
      $fromVariant[cstring](firstCStringVariant) == "first"
      $fromVariant[cstring](secondCStringVariant) == "second"

    let original = toVariant("owned copy")
    let duplicate = original.copy
    var originalRaw = unwrap(original)
    cast[ptr UncheckedArray[WCHAR]](originalRaw.bstrVal)[0] = WCHAR('O'.ord)
    check:
      $original == "Owned copy"
      $duplicate == "owned copy"

    let
      empty = COMBinary ""
      first = COMBinary "abc\0def"
      same = COMBinary "abc\0def"
      greater = COMBinary "abd"

    check:
      empty.len == 0
      first.low == 0
      first.high == 6
      first == same
      first < greater
      first <= same
      first.cmp(same) == 0
      string(first.substr(3, 5)) == "\0de"
      string(first.substr(4)) == "def"
      string(fromVariant[COMBinary](toVariant(empty))) == ""

    var allBytes = newString(256)
    for i in 0..255: allBytes[i] = char(i)
    check:
      string(fromVariant[COMBinary](toVariant(COMBinary allBytes))) == allBytes

    checkVariant:
      st
      ft

    var preciseTime = st
    preciseTime.wMilliseconds = 789
    var preciseFileTime: FILETIME
    check:
      SystemTimeToFileTime(&preciseTime, &preciseFileTime) != FALSE
      fromVariant[FILETIME](toVariant(preciseFileTime)) == preciseFileTime

    var historicalTime = SYSTEMTIME(
      wYear: 1899,
      wMonth: 12,
      wDayOfWeek: 4,
      wDay: 28,
      wHour: 6,
      wMinute: 7,
      wSecond: 8,
      wMilliseconds: 789)
    check:
      fromVariant[SYSTEMTIME](toVariant(historicalTime)) == historicalTime

  test "Arrays And Variant Copies":

    check:
      $fromVariant[COMArray1D](toVariant(a1)) == "@[1, 2, 3]"
      $fromVariant[COMArray2D](toVariant(a2)) == "@[@[1, 2, 3], @[4, 5, 6], @[7, 8, 9]]"
      $fromVariant[COMArray3D](toVariant(a3)) == "@[@[@[1, 3, 4], @[4, 5, 6], @[7, 8, 9]], @[@[10, 11, 12], @[13, 14, 15], @[16, 17, 18]], @[@[19, 20, 21], @[22, 23, 24], @[25, 26, 27]]]"

    check:
      $fromVariant[COMArray1D](toVariant(s1)) == "@[105, 110, 112, 117, 116, 61, 116, 101, 115, 116]"
      $fromVariant[COMArray2D](toVariant(s2)) == "@[@[1, 2, , , ], @[3, 4, 5, 6, 7], @[8, 9, 10, 11, ], @[12, , , , ], @[13, 14, 15, , ]]"
      $fromVariant[COMArray3D](toVariant(s3)) == "@[@[@[1, 2, , , , ], @[3, 4, 5, 6, , ], @[7, , , , , ], @[, , , , , ]], @[@[8, 9, 10, 11, 12, 13], @[14, 15, , , , ], @[, , , , , ], @[, , , , , ]], @[@[16, 17, 18, , , ], @[19, , , , , ], @[20, 21, , , , ], @[22, 23, 24, 25, , ]]]"

    let floatArray = fromVariant[COMArray1D](toVariant([1, 2], VT_R8))
    check:
      floatArray[0].float64 == 1.0
      floatArray[1].float64 == 2.0

    let
      empty1D = fromVariant[COMArray1D](toVariant(newSeq[int]()))
      empty2D = fromVariant[COMArray2D](toVariant(newSeq[seq[int]]()))
      empty3D = fromVariant[COMArray3D](toVariant(newSeq[seq[seq[int]]]()))
    check:
      empty1D.len == 0
      empty2D.len == 0
      empty3D.len == 0

    let stringArray = fromVariant[COMArray1D](toVariant(["a", "b"], VT_BSTR))
    check:
      stringArray[0].string == "a"
      stringArray[1].string == "b"

    let uintArray = fromVariant[COMArray1D](toVariant([0, 255], VT_UI1))
    check:
      uintArray[0].uint8 == 0
      uintArray[1].uint8 == 255

    var bound = SAFEARRAYBOUND(cElements: 3, lLbound: -2)
    var nonZeroBounds: VARIANT
    nonZeroBounds.vt = VARTYPE(VT_ARRAY or VT_I4)
    nonZeroBounds.parray = SafeArrayCreate(VT_I4, 1, &bound)
    require(not nonZeroBounds.parray.isNil)
    for i, value in [10'i32, 20'i32, 30'i32]:
      var index = LONG(i - 2)
      var value = value
      require(SafeArrayPutElement(nonZeroBounds.parray, &index, &value) == S_OK)
    let boundedArray = fromVariant[COMArray1D](adoptVariant(nonZeroBounds))
    check:
      boundedArray.len == 3
      boundedArray[0].int32 == 10
      boundedArray[1].int32 == 20
      boundedArray[2].int32 == 30

    let originalString = toVariant("original")
    let copiedString = originalString.copy
    var originalRaw = unwrap(originalString)
    cast[ptr UncheckedArray[WCHAR]](originalRaw.bstrVal)[0] = WCHAR('O'.ord)
    check:
      $originalString == "Original"
      $copiedString == "original"

    let originalArray = toVariant(["one", "two"])
    let copiedArray = originalArray.copy
    var rawArray = unwrap(originalArray)
    var index = 0.LONG
    var replacement = unwrap(toVariant("changed"))
    require(SafeArrayPutElement(rawArray.parray, &index, &replacement) == S_OK)
    check:
      fromVariant[COMArray1D](originalArray)[0].string == "changed"
      fromVariant[COMArray1D](copiedArray)[0].string == "one"

  test "Implicit Variant Conversion":
    checkVariantConv:
      true
      false
      123.uint
      123'u8
      123'u16
      123'u32
      123'u64
      -123.int
      -123'i8
      -123'i16
      -123'i32
      -123'i64
      -123.45'f32
      -123.45'f64
      'A'
      cast[pointer](123)
      "English Test 中文測試"
      cstring "English Test 中文測試"
      -$"English Test 中文測試"
      +$"English Test 中文測試"
      COMBinary "Binary\0String\0"
      st
      ft

  test "Variant Conversion Errors":
    st.wMonth = 9999
    ft.dwLowDateTime = 0xffffffff'i32
    ft.dwHighDateTime = 0xffffffff'i32
    V.vt = VT_RESERVED.VARTYPE

    var invalidArray: VARIANT
    invalidArray.vt = VARTYPE(VT_ARRAY or VT_VARIANT)
    let invalidArrayVariant = adoptVariant(invalidArray)

    var invalidByRef: VARIANT
    invalidByRef.vt = VARTYPE(VT_BYREF or VT_VARIANT)
    let invalidByRefVariant = adoptVariant(invalidByRef)

    var nilInt: ptr int

    expect VariantConversionError: discard toVariant(st)
    expect VariantConversionError: discard toVariant(ft)
    expect VariantConversionError: discard toVariant(V)
    expect VariantConversionError: discard toVariant(s1, VT_EMPTY)
    expect VariantConversionError: discard toVariant(s2, VT_EMPTY)
    expect VariantConversionError: discard toVariant(s3, VT_EMPTY)
    expect VariantConversionError: discard toVariant(s4)
    expect VariantConversionError: discard toVariant(a2).COMArray1D
    expect VariantConversionError: discard toVariant(a3).COMArray2D
    expect VariantConversionError: discard toVariant(a1).COMArray3D
    expect VariantConversionError: discard toVariant(a1).int
    expect VariantConversionError: discard toVariant("abc").int
    expect VariantConversionError: discard toVariant(nil.variant).int
    expect VariantConversionError: discard invalidArrayVariant.COMArray1D
    expect VariantConversionError: discard invalidByRefVariant.int
    expect VariantConversionError: discard toVariant(nilInt)
    expect VariantConversionError: discard fromVariant[int8](toVariant(300))
    expect VariantConversionError: discard fromVariant[uint8](toVariant(-1))
    expect VariantConversionError: discard toVariant(["not a number"], VT_I4)

    var nullSafeArray: VARIANT
    nullSafeArray.vt = VARTYPE(VT_ARRAY or VT_I4)
    expect VariantConversionError:
      discard fromVariant[COMArray1D](adoptVariant(nullSafeArray))

    var fourBounds: array[4, SAFEARRAYBOUND]
    for bound in fourBounds.mitems: bound.cElements = 1
    var fourDimensional: VARIANT
    fourDimensional.vt = VARTYPE(VT_ARRAY or VT_I4)
    fourDimensional.parray = SafeArrayCreate(VT_I4, 4, &fourBounds[0])
    require(not fourDimensional.parray.isNil)
    let fourDimensionalVariant = adoptVariant(fourDimensional)
    expect VariantConversionError: discard fromVariant[COMArray3D](fourDimensionalVariant)
