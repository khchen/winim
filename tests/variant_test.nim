#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2018 Ward
#====================================================================

{.push hint[XDeclaredButNotUsed]: off.}

import winim/com except FAILED # conflict with TestStatus.FAILED
import unittest

suite "Test Suites for Varient in winim/com":
  setup:
    template Check(x: untyped) =
      var v = toVariant(x)
      when x.type is float32:
        check(abs(fromVariant[x.type](v) - x) < 0.001)
      else:
        check(fromVariant[x.type](v) == x)

    template CheckPtr(x: untyped) =
      var n = x
      Check(&n)

    template CheckConv(x: untyped) =
      var y: x.type = toVariant(x)
      when x.type is float32:
        check(abs(y - x) < 0.01)
      else:
        check(y == x)

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

  test "Basic Type Convert":
    Check(true)
    Check(false)
    Check(123.uint)
    Check(123'u8)
    Check(123'u16)
    Check(123'u32)
    Check(123'u64)
    Check(-123.int)
    Check(-123'i8)
    Check(-123'i16)
    Check(-123'i32)
    Check(-123'i64)
    Check(-123.45'f32)
    Check(-123.45'f64)
    Check('A')
    Check(cast[pointer](123))

  test "Basic Type Pointer Convert":
    CheckPtr(true)
    CheckPtr(false)
    CheckPtr(123.uint)
    CheckPtr(123'u8)
    CheckPtr(123'u16)
    CheckPtr(123'u32)
    CheckPtr(123'u64)
    CheckPtr(-123.int)
    CheckPtr(-123'i8)
    CheckPtr(-123'i16)
    CheckPtr(-123'i32)
    CheckPtr(-123'i64)
    CheckPtr(-123.45'f32)
    CheckPtr(-123.45'f64)
    CheckPtr('A')

  test "String Convert":
    Check("English Test 中文測試")
    Check(cstring "English Test 中文測試")
    Check(-$"English Test 中文測試")
    Check(+$"English Test 中文測試")

  test "SystemTime and FileTime":
    Check(st)
    Check(ft)

  test "Array and Seq":
    check($fromVariant[COMArray1D](toVariant(a1)) == "@[1, 2, 3]")
    check($fromVariant[COMArray2D](toVariant(a2)) == "@[@[1, 2, 3], @[4, 5, 6], @[7, 8, 9]]")
    check($fromVariant[COMArray3D](toVariant(a3)) == "@[@[@[1, 3, 4], @[4, 5, 6], @[7, 8, 9]], @[@[10, 11, 12], @[13, 14, 15], @[16, 17, 18]], @[@[19, 20, 21], @[22, 23, 24], @[25, 26, 27]]]")

    check($fromVariant[COMArray1D](toVariant(s1)) == "@[105, 110, 112, 117, 116, 61, 116, 101, 115, 116]")
    check($fromVariant[COMArray2D](toVariant(s2)) == "@[@[1, 2, , , ], @[3, 4, 5, 6, 7], @[8, 9, 10, 11, ], @[12, , , , ], @[13, 14, 15, , ]]")
    check($fromVariant[COMArray3D](toVariant(s3)) == "@[@[@[1, 2, , , , ], @[3, 4, 5, 6, , ], @[7, , , , , ], @[, , , , , ]], @[@[8, 9, 10, 11, 12, 13], @[14, 15, , , , ], @[, , , , , ], @[, , , , , ]], @[@[16, 17, 18, , , ], @[19, , , , , ], @[20, 21, , , , ], @[22, 23, 24, 25, , ]]]")

  test "Converters":
    CheckConv(true)
    CheckConv(false)
    CheckConv(123.uint)
    CheckConv(123'u8)
    CheckConv(123'u16)
    CheckConv(123'u32)
    CheckConv(123'u64)
    CheckConv(-123.int)
    CheckConv(-123'i8)
    CheckConv(-123'i16)
    CheckConv(-123'i32)
    CheckConv(-123'i64)
    CheckConv(-123.45'f32)
    CheckConv(-123.45'f64)
    CheckConv('A')
    CheckConv(cast[pointer](123))
    CheckConv("English Test 中文測試")
    CheckConv(cstring "English Test 中文測試")
    CheckConv(-$"English Test 中文測試")
    CheckConv(+$"English Test 中文測試")
    CheckConv(st)
    CheckConv(ft)

  test "VariantConversionError":
    st.wMonth = 9999
    ft.dwLowDateTime = 0xffffffff'i32
    ft.dwHighDateTime = 0xffffffff'i32
    V.vt = VT_RESERVED.VARTYPE

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
