#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#====================================================================

import ../winim/core except FAILED # conflict with TestStatus.FAILED
import ../winim/inc/objbase # for SysAllocString
import ../winim/[winstr, utils]
import unittest, strutils, unicode

suite "Winim Winstr Module Test Suites":
  setup:
    var
      str = "English Test 中文測試"
      mstr = -$"English Test 中文測試"
      wstr = +$"English Test 中文測試"
      cstr = cstring "English Test 中文測試"
      astr = cstring cast[string](mstr)

      lpstr = &(-$"English Test 中文測試") # a.k.a cstring
      lpwstr = &(L"English Test 中文測試")
      bstr = SysAllocString(L"English Test 中文測試")

      nilstr: string
      nilmstr: mstring
      nilwstr: wstring
      nilcstr: cstring

    proc resetFF(buffer: var string) =
      for i in 0..<buffer.len:
        buffer[i] = '\xff'

    proc resetFF(buffer: pointer, L: int) =
      for i in 0..<L:
        cast[ptr byte](cast[int](buffer) + i)[] = 0xff

    proc toHex(p: pointer, L: int): string =
      const HexChars = "0123456789ABCDEF"
      let a = cast[ptr UncheckedArray[byte]](p)
      result = newStringOfCap(L * 2)
      for i in 0 ..< L:
        let
          hi = int a[i] shr 4
          lo = int a[i] and 0xF
        result.add HexChars[hi]
        result.add HexChars[lo]

    proc toHex[I, T](a: array[I, T]): string =
      toHex(a.unsafeaddr, sizeof(a))

    proc resetFF[I, T](a: array[I, T]) =
      resetFF(a.unsafeaddr, sizeof(a))

  test "String Address":
    check:
      cast[ptr char](&str)[] == 'E'
      cast[ptr byte](&str)[] == byte 'E'
      cast[ptr WCHAR](&wstr)[] == WCHAR ord 'E'
      cast[ptr char](&cstr)[] == 'E'

      &nilstr == &""
      &nilmstr == &""
      &nilwstr == nil
      &nilcstr == nil

  test "String Conversion":
    check:
      # original
      toHex(str) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6"
      toHex(mstr) == "456E676C697368205465737420A4A4A4E5B4FAB8D5"
      toHex(wstr) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"
      toHex(cstr) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6"
      toHex(astr) == "456E676C697368205465737420A4A4A4E5B4FAB8D5"

      # convert to string (to utf8)
      toHex($str) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6"
      toHex($mstr) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6"
      toHex($wstr) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6"
      toHex($cstr) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6"
      toHex($$astr) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6"

      # convert to mstring (to ansi)
      toHex(-$str) == "456E676C697368205465737420A4A4A4E5B4FAB8D5"
      toHex(-$mstr) == "456E676C697368205465737420A4A4A4E5B4FAB8D5"
      toHex(-$wstr) == "456E676C697368205465737420A4A4A4E5B4FAB8D5"
      toHex(-$cstr) == "456E676C697368205465737420A4A4A4E5B4FAB8D5"
      toHex(-$$astr) == "456E676C697368205465737420A4A4A4E5B4FAB8D5"

      # convert to wstring (to unicode)
      toHex(+$str) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"
      toHex(+$mstr) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"
      toHex(+$wstr) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"
      toHex(+$cstr) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"
      toHex(+$$astr) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"

      # convert from windows' string buffer to nim's string
      toHex($$lpstr) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6"
      toHex(-$$lpstr) == "456E676C697368205465737420A4A4A4E5B4FAB8D5"
      toHex(+$$lpstr) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"
      toHex($lpwstr) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6"
      toHex(-$lpwstr) == "456E676C697368205465737420A4A4A4E5B4FAB8D5"
      toHex(+$lpwstr) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"
      toHex($bstr) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6"
      toHex(-$bstr) == "456E676C697368205465737420A4A4A4E5B4FAB8D5"
      toHex(+$bstr) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"

      # char conversion
      $'A' == "A"
      +$'A' == +$"A"
      -$'A' == -$"A"
      $$(WCHAR 20013) == "中"
      +$(WCHAR 20013) == +$"中"
      -$(WCHAR 20013) == -$"中"

    # fill nim's string to windows' string buffer
    var
      buffer = newString(40)
      pstr = cast[PSTR](&buffer)
      pwstr = cast[PWSTR](&buffer)

    buffer.resetFF
    str >> pstr
    check(toHex(buffer) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF")

    buffer.resetFF
    str >>> pstr
    check(toHex(buffer) == "456E676C697368205465737420E4B8ADE69687E6B8ACE8A9A600FFFFFFFFFFFFFFFFFFFFFFFFFFFF")

    buffer.resetFF
    wstr >> pwstr
    check(toHex(buffer) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668AFFFFFFFFFFFF")

    buffer.resetFF
    wstr >>> pwstr
    check(toHex(buffer) == "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A0000FFFFFFFF")

  test "String Manipulation":
    check:
      str[11] == 't'
      mstr[11] == 't'
      wstr[11] == WCHAR ord 't'

      str[13..15] == "中"
      mstr[13..14] == -$"中"
      wstr[13..13] == +$"中"

      str[^17..^14] == "Test"
      mstr[^13..^10] == -$"Test"
      wstr[^9..^6] == +$"Test"

      str.substr(10) == "st 中文測試"
      str.substr(10, 18) == "st 中文"
      str.substr(10, 9) == ""

      mstr.substr(10) == -$"st 中文測試"
      mstr.substr(10, 16) == -$"st 中文"
      mstr.substr(10, 9) == -$""

      wstr.substr(10) == +$"st 中文測試"
      wstr.substr(10, 14) == +$"st 中文"
      wstr.substr(10, 9) == +$""

    str[10..18] = "0123456789"
    check(str == "English Te0123456789測試")

    mstr[10..16] = -$"0123456789"
    check(mstr == -$"English Te0123456789測試")

    wstr[10..14] = L"0123456789"
    check(wstr == L"English Te0123456789測試")

  test "String Iterator":
    var
      s1 = newSeq[int]()
      s2 = newSeq[int]()
      s3 = newSeq[int]()

    for i in str.runes:
      s1.add int i

    for i in mstr:
      if i.len == 1:
        s2.add int cast[ptr uint8](&i)[]
      elif i.len == 2:
        s2.add int cast[ptr uint16](&i)[]

    for i in wstr:
      s3.add int i

    check:
      s1 == @[69, 110, 103, 108, 105, 115, 104, 32, 84, 101, 115, 116, 32, 20013, 25991, 28204, 35430]
      s2 == @[69, 110, 103, 108, 105, 115, 104, 32, 84, 101, 115, 116, 32, 0xA4A4, 0xE5A4, 0xFAB4, 0xD5B8]
      s3 == @[69, 110, 103, 108, 105, 115, 104, 32, 84, 101, 115, 116, 32, 20013, 25991, 28204, 35430]

  test "Null Terminated String":
    str[12] = '\0'
    check(toHex(str) == "456E676C697368205465737400E4B8ADE69687E6B8ACE8A9A6")
    check(toHex(str.nullTerminated) == "456E676C6973682054657374")
    str.nullTerminate
    check(toHex(str) == "456E676C6973682054657374")

    mstr[12] = '\0'
    check(toHex(mstr) == "456E676C697368205465737400A4A4A4E5B4FAB8D5")
    check(toHex(mstr.nullTerminated) == "456E676C6973682054657374")
    mstr.nullTerminate
    check(toHex(mstr) == "456E676C6973682054657374")

    wstr[12] = 0
    check(toHex(wstr) == "45006E0067006C006900730068002000540065007300740000002D4E87652C6E668A")
    check(toHex(wstr.nullTerminated) == "45006E0067006C0069007300680020005400650073007400")
    wstr.nullTerminate
    check(toHex(wstr) == "45006E0067006C0069007300680020005400650073007400")

  test "String With Null Char":
    var s = "123\x00456\x00中文\x00測試"
    var c = L("123\x00456\x00中文\x00測試")
    var w = +$s
    var m = -$s
    check:
      c == w
      c.len == 13
      m.mlen == 13

  test "String Bound Check":
    var s = "12345"
    var m = -$"12345"
    var w = +$"12345"

    # It shoud be 5 to raise the error, this is bug in Nim,
    expect IndexError: discard s[6]
    expect IndexError: discard m[6]
    expect IndexError: discard w[5]

    expect IndexError: discard s[-1..0]
    expect IndexError: discard m[-1..0]
    expect IndexError: discard w[-1..0]

    expect IndexError: discard s[0..s.len+1]
    expect IndexError: discard m[0..m.len+1]
    expect IndexError: discard w[0..w.len]

    check:
      s.substr(-1, 10) == s
      m.substr(-1, 10) == m
      w.substr(-1, 10) == w

  test "Assignment Behavior":
    var newstr = str
    var newmstr = mstr
    var newwstr = wstr

    check:
      &newstr != &str # by value
      &newmstr != &mstr # by value
      &newwstr == &wstr # by ref

  test "Low Level Buffer Fill":
    var byteBuffer: array[10, byte]
    var byteArray: array[2..10, byte]
    var wcharBuffer: array[10, WCHAR]
    var wcharArray: array[2..10, WCHAR]

    byteBuffer.resetFF
    byteBuffer << "中文"
    check(byteBuffer.toHex == "E4B8ADE69687FFFFFFFF")

    byteBuffer.resetFF
    byteBuffer <<< "中文"
    check(byteBuffer.toHex == "E4B8ADE6968700FFFFFF")

    byteArray.resetFF
    byteArray << "..中文" # skip two char
    check(byteArray.toHex == "E4B8ADE69687FFFFFF")

    byteBuffer.resetFF
    byteBuffer << -$"中文"
    check(byteBuffer.toHex == "A4A4A4E5FFFFFFFFFFFF")

    byteBuffer.resetFF
    byteBuffer <<< -$"中文"
    check(byteBuffer.toHex == "A4A4A4E500FFFFFFFFFF")

    byteArray.resetFF
    byteArray << -$"..中文" # skip two char
    check(byteArray.toHex == "A4A4A4E5FFFFFFFFFF")

    byteBuffer.resetFF
    expect IndexError:
      byteBuffer << "01234567890"
    check(byteBuffer.toHex == "30313233343536373839")

    byteBuffer.resetFF
    expect IndexError:
      byteBuffer <<< "0123456789"
    check(byteBuffer.toHex == "30313233343536373839")

    byteArray.resetFF
    expect IndexError:
      byteArray << "0123456789AB"
    check(byteArray.toHex == "323334353637383941")

    byteArray.resetFF
    expect IndexError:
      byteArray <<< "0123456789A"
    check(byteArray.toHex == "323334353637383941")

    wcharBuffer.resetFF
    wcharBuffer << L"中文"
    check(wcharBuffer.toHex == "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF")

    wcharBuffer.resetFF
    wcharBuffer <<< L"中文"
    check(wcharBuffer.toHex == "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFFFFFF")

    wcharArray.resetFF
    wcharArray << L"..中文" # skip two wchar
    check(wcharArray.toHex == "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFF")

    wcharBuffer.resetFF
    expect IndexError:
      wcharBuffer << L"01234567890"
    check(wcharBuffer.toHex == "3000310032003300340035003600370038003900")

    wcharBuffer.resetFF
    expect IndexError:
      wcharBuffer <<< L"0123456789"
    check(wcharBuffer.toHex == "3000310032003300340035003600370038003900")

    wcharArray.resetFF
    expect IndexError:
      wcharArray << L"0123456789AB"
    check(wcharArray.toHex == "320033003400350036003700380039004100")

    wcharArray.resetFF
    expect IndexError:
      wcharArray <<< L"0123456789A"
    check(wcharArray.toHex == "320033003400350036003700380039004100")

  test "Low Level Pointer Fill":
    var utf8Buffer: array[7, byte]
    var mbcsBuffer: array[5, byte]
    var wcharBuffer: array[3, WCHAR]
    var pUtf8Buffer = addr utf8Buffer
    var pMbcsBuffer  = addr mbcsBuffer
    var pWcharBuffer  = addr wcharBuffer

    utf8Buffer.resetFF
    pUtf8Buffer <<< "中文"
    check(utf8Buffer.toHex == "E4B8ADE6968700")

    mbcsBuffer.resetFF
    pMbcsBuffer <<< -$"中文"
    check(mbcsBuffer.toHex == "A4A4A4E500")

    wcharBuffer.resetFF
    pWcharBuffer <<< L"中文"
    check(wcharBuffer.toHex == "2D4E87650000")

  test "mIndex (mString Index)":
    check(wstr[13] == L"中"[0])
    check(mstr[mIndex 13] == -$"中")

    wstr[13] = L"英"[0]
    mstr[mIndex 13] = -$"英"
    check(wstr == +$"English Test 英文測試")
    check(mstr == -$"English Test 英文測試")

    wstr[7..14] = +$" ABC "
    mstr[7..14.mIndex] = -$" ABC "
    check(wstr == +$"English ABC 測試")
    check(mstr == -$"English ABC 測試")
