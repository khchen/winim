#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2022 Ward
#
#====================================================================

{.push hint[XDeclaredButNotUsed]: off.}

import winim/core except FAILED # conflict with TestStatus.FAILED
import winim/inc/objbase # for SysAllocString
import winim/[winstr, utils]
import unittest, unicode

when not declared(IndexDefect):
  type
    IndexDefect = ref IndexError

suite "Test Suites for winim/winstr":
  setup:
    setOpenArrayStringable(true)

    var
      c = 'E'
      b = byte 'E'
      w = WCHAR 20013

      str = "English Test 中文測試"
      mstr = -$"English Test 中文測試"
      wstr = +$"English Test 中文測試"
      lstr = L"English Test 中文測試"
      cstr = cstring str
      str_ansi = string(-$"English Test 中文測試")
      cstr_ansi = cstring mstr

      lpchar = &"English Test 中文測試"
      lpbyte = cast[ptr byte](&(-$"English Test 中文測試"))
      lpwchar = &(L"English Test 中文測試")
      bstr = SysAllocString(L"English Test 中文測試")

      utf8Array: array[100, char]
      mbcsArray: array[100, byte]
      wideArray: array[100, WCHAR]
      putf8Array = addr utf8Array
      pmbcsArray = addr mbcsArray
      pwideArray = addr wideArray

      utf8Seq = newSeq[char](100)
      mbcsSeq = newSeq[byte](100)
      wideSeq = newSeq[WCHAR](100)
      utf8Puca = cast[ptr UncheckedArray[char]](addr utf8Seq[0])
      mbcsPuca = cast[ptr UncheckedArray[byte]](addr mbcsSeq[0])
      widePuca = cast[ptr UncheckedArray[WCHAR]](addr wideSeq[0])

      nilstr: string
      nilmstr: mstring
      nilwstr: wstring
      nilcstr: cstring

    utf8Array << "English Test 中文測試"
    mbcsArray << -$"English Test 中文測試"
    wideArray << L"English Test 中文測試"
    utf8Seq << "English Test 中文測試"
    mbcsSeq << -$"English Test 中文測試"
    wideSeq << L"English Test 中文測試"

    proc resetFF[T](a: var openArray[T]) =
      for i in a.mitems:
        when sizeof(T) == 2:
          i = T(0xffff)
        else:
          i = T(0xff)

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

    proc toHex[T](a: openArray[T]): string =
      toHex(a.unsafeaddr, a.len * sizeof(T))

    template nt(x: untyped): untyped = nullTerminated(x)

    template openArray(x: seq): untyped = toOpenArray(x, 0, x.len - 1)

  test "String Address":
    check:
      (&str)[] == 'E'
      (&mstr)[] == 'E'
      (&cstr)[] == 'E'
      (&wstr)[] == WCHAR ord 'E'
      (&lstr)[] == WCHAR ord 'E'

      &nilstr == &""
      &nilmstr == &""
      &nilwstr == &""
      &nilcstr == nil

  test "String Conversion":
    const
      CHAR_E = tohex("E")
      CHAR_E_ASCII = tohex("69")
      WCHAR_E = tohex("E\0")
      WCHAR_CHINESE_ASCII = tohex("20013")
      WCHAR_CHINESE = "2D4E"
      ANSI_CHINESE = "A4A4"
      UTF8_CHINESE = "E4B8AD"

      UTF8_STRING = tohex("English Test 中文測試")
      ANSI_STRING = tohex("English Test ") & "A4A4A4E5B4FAB8D5"
      UNICODE_STRING = "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"

      UTF8_FROM_ANSI_FAIL = "456E676C697368205465737420E98A9DE5899C3FE79A9CE7A588E5B2AB"
      ANSI_FROM_UTF8_FAIL = "456E676C6973682054657374203F3F3F3F3F3F3F"
      UNICODE_FROM_UTF8_FAIL = "45006E0067006C00690073006800200054006500730074002000FDFFFDFFFDFFFDFFFDFFFDFFFDFF"
      UNICODE_FROM_ANSI_FAIL = "45006E0067006C006900730068002000540065007300740020009D925C523F009C764879AB5C"

    check:
      # original
      tohex(str) == UTF8_STRING
      tohex(mstr) == ANSI_STRING
      tohex(wstr) == UNICODE_STRING
      tohex(lstr) == UNICODE_STRING
      tohex(cstr) == UTF8_STRING
      tohex(str_ansi) == ANSI_STRING
      tohex(cstr_ansi) == ANSI_STRING

      # all stringable for $
      tohex($c) == CHAR_E
      tohex($b) == CHAR_E_ASCII
      tohex($w) == WCHAR_CHINESE_ASCII
      tohex($str) == UTF8_STRING
      tohex($mstr) == UTF8_STRING
      tohex($wstr) == UTF8_STRING
      tohex($lstr) == UTF8_STRING
      tohex($cstr) == UTF8_STRING
      tohex($str_ansi) == ANSI_STRING
      tohex($cstr_ansi) == ANSI_STRING
      tohex($lpchar) == UTF8_STRING
      tohex($lpbyte) == ANSI_STRING
      tohex($lpwchar) == UTF8_STRING
      tohex($bstr) == UTF8_STRING
      tohex(nt $utf8Array) == UTF8_STRING
      tohex(nt $mbcsArray) == ANSI_STRING
      tohex(nt $wideArray) == UTF8_STRING
      tohex(nt $putf8Array) == UTF8_STRING
      tohex(nt $pmbcsArray) == ANSI_STRING
      tohex(nt $pwideArray) == UTF8_STRING
      tohex(nt $utf8Seq) == UTF8_STRING
      tohex(nt $mbcsSeq) == ANSI_STRING
      tohex(nt $wideSeq) == UTF8_STRING
      tohex($utf8Puca) == UTF8_STRING
      tohex($mbcsPuca) == ANSI_STRING
      tohex($widePuca) == UTF8_STRING
      tohex(nt $openArray(utf8Seq)) == UTF8_STRING
      tohex(nt $openArray(mbcsSeq)) == ANSI_STRING
      tohex(nt $openArray(wideSeq)) == UTF8_STRING

      # all stringable for +$
      tohex(+$c) == WCHAR_E
      tohex(+$b) == WCHAR_E
      tohex(+$w) == WCHAR_CHINESE
      tohex(+$str) == UNICODE_STRING
      tohex(+$mstr) == UNICODE_STRING
      tohex(+$wstr) == UNICODE_STRING
      tohex(+$lstr) == UNICODE_STRING
      tohex(+$cstr) == UNICODE_STRING
      tohex(+$str_ansi) == UNICODE_FROM_UTF8_FAIL
      tohex(+$cstr_ansi) == UNICODE_FROM_UTF8_FAIL
      tohex(+$lpchar) == UNICODE_STRING
      tohex(+$lpbyte) == UNICODE_FROM_UTF8_FAIL
      tohex(+$lpwchar) == UNICODE_STRING
      tohex(+$bstr) == UNICODE_STRING
      tohex(nt +$utf8Array) == UNICODE_STRING
      tohex(nt +$mbcsArray) == UNICODE_FROM_UTF8_FAIL
      tohex(nt +$wideArray) == UNICODE_STRING
      tohex(nt +$putf8Array) == UNICODE_STRING
      tohex(nt +$pmbcsArray) == UNICODE_FROM_UTF8_FAIL
      tohex(nt +$pwideArray) == UNICODE_STRING
      tohex(nt +$utf8Seq) == UNICODE_STRING
      tohex(nt +$mbcsSeq) == UNICODE_FROM_UTF8_FAIL
      tohex(nt +$wideSeq) == UNICODE_STRING
      tohex(+$utf8Puca) == UNICODE_STRING
      tohex(+$mbcsPuca) == UNICODE_FROM_UTF8_FAIL
      tohex(+$widePuca) == UNICODE_STRING
      tohex(nt +$openArray(utf8Seq)) == UNICODE_STRING
      tohex(nt +$openArray(mbcsSeq)) == UNICODE_FROM_UTF8_FAIL
      tohex(nt +$openArray(wideSeq)) == UNICODE_STRING

      # all stringable for -$
      tohex(-$c) == CHAR_E
      tohex(-$b) == CHAR_E
      tohex(-$w) == ANSI_CHINESE
      tohex(-$str) == ANSI_STRING
      tohex(-$mstr) == ANSI_STRING
      tohex(-$wstr) == ANSI_STRING
      tohex(-$lstr) == ANSI_STRING
      tohex(-$cstr) == ANSI_STRING
      tohex(-$str_ansi) == ANSI_FROM_UTF8_FAIL
      tohex(-$cstr_ansi) == ANSI_FROM_UTF8_FAIL
      tohex(-$lpchar) == ANSI_STRING
      tohex(-$lpbyte) == ANSI_FROM_UTF8_FAIL
      tohex(-$lpwchar) == ANSI_STRING
      tohex(-$bstr) == ANSI_STRING
      tohex(nt -$utf8Array) == ANSI_STRING
      tohex(nt -$mbcsArray) == ANSI_FROM_UTF8_FAIL
      tohex(nt -$wideArray) == ANSI_STRING
      tohex(nt -$putf8Array) == ANSI_STRING
      tohex(nt -$pmbcsArray) == ANSI_FROM_UTF8_FAIL
      tohex(nt -$pwideArray) == ANSI_STRING
      tohex(nt -$utf8Seq) == ANSI_STRING
      tohex(nt -$mbcsSeq) == ANSI_FROM_UTF8_FAIL
      tohex(nt -$wideSeq) == ANSI_STRING
      tohex(-$utf8Puca) == ANSI_STRING
      tohex(-$mbcsPuca) == ANSI_FROM_UTF8_FAIL
      tohex(-$widePuca) == ANSI_STRING
      tohex(nt -$openArray(utf8Seq)) == ANSI_STRING
      tohex(nt -$openArray(mbcsSeq)) == ANSI_FROM_UTF8_FAIL
      tohex(nt -$openArray(wideSeq)) == ANSI_STRING

      # all stringable for $$
      tohex($$c) == CHAR_E
      tohex($$b) == CHAR_E_ASCII
      tohex($$w) == UTF8_CHINESE
      tohex($$str) == UTF8_FROM_ANSI_FAIL
      tohex($$mstr) == UTF8_STRING
      tohex($$wstr) == UTF8_STRING
      tohex($$lstr) == UTF8_STRING
      tohex($$cstr) == UTF8_FROM_ANSI_FAIL
      tohex($$str_ansi) == UTF8_STRING
      tohex($$cstr_ansi) == UTF8_STRING
      tohex($$lpchar) == UTF8_FROM_ANSI_FAIL
      tohex($$lpbyte) == UTF8_STRING
      tohex($$lpwchar) == UTF8_STRING
      tohex($$bstr) == UTF8_STRING
      tohex(nt $$utf8Array) == UTF8_FROM_ANSI_FAIL
      tohex(nt $$mbcsArray) == UTF8_STRING
      tohex(nt $$wideArray) == UTF8_STRING
      tohex(nt $$putf8Array) == UTF8_FROM_ANSI_FAIL
      tohex(nt $$pmbcsArray) == UTF8_STRING
      tohex(nt $$pwideArray) == UTF8_STRING
      tohex(nt $$utf8Seq) == UTF8_FROM_ANSI_FAIL
      tohex(nt $$mbcsSeq) == UTF8_STRING
      tohex(nt $$wideSeq) == UTF8_STRING
      tohex($$utf8Puca) == UTF8_FROM_ANSI_FAIL
      tohex($$mbcsPuca) == UTF8_STRING
      tohex($$widePuca) == UTF8_STRING
      tohex(nt $$openArray(utf8Seq)) == UTF8_FROM_ANSI_FAIL
      tohex(nt $$openArray(mbcsSeq)) == UTF8_STRING
      tohex(nt $$openArray(wideSeq)) == UTF8_STRING

      # all stringable for +$$
      tohex(+$$c) == WCHAR_E
      tohex(+$$b) == WCHAR_E
      tohex(+$$w) == WCHAR_CHINESE
      tohex(+$$str) == UNICODE_FROM_ANSI_FAIL
      tohex(+$$mstr) == UNICODE_STRING
      tohex(+$$wstr) == UNICODE_STRING
      tohex(+$$lstr) == UNICODE_STRING
      tohex(+$$cstr) == UNICODE_FROM_ANSI_FAIL
      tohex(+$$str_ansi) == UNICODE_STRING
      tohex(+$$cstr_ansi) == UNICODE_STRING
      tohex(+$$lpchar) == UNICODE_FROM_ANSI_FAIL
      tohex(+$$lpbyte) == UNICODE_STRING
      tohex(+$$lpwchar) == UNICODE_STRING
      tohex(+$$bstr) == UNICODE_STRING
      tohex(nt +$$utf8Array) == UNICODE_FROM_ANSI_FAIL
      tohex(nt +$$mbcsArray) == UNICODE_STRING
      tohex(nt +$$wideArray) == UNICODE_STRING
      tohex(nt +$$putf8Array) == UNICODE_FROM_ANSI_FAIL
      tohex(nt +$$pmbcsArray) == UNICODE_STRING
      tohex(nt +$$pwideArray) == UNICODE_STRING
      tohex(nt +$$utf8Seq) == UNICODE_FROM_ANSI_FAIL
      tohex(nt +$$mbcsSeq) == UNICODE_STRING
      tohex(nt +$$wideSeq) == UNICODE_STRING
      tohex(+$$utf8Puca) == UNICODE_FROM_ANSI_FAIL
      tohex(+$$mbcsPuca) == UNICODE_STRING
      tohex(+$$widePuca) == UNICODE_STRING
      tohex(nt +$$openArray(utf8Seq)) == UNICODE_FROM_ANSI_FAIL
      tohex(nt +$$openArray(mbcsSeq)) == UNICODE_STRING
      tohex(nt +$$openArray(wideSeq)) == UNICODE_STRING

      # all stringable for -$$
      tohex(-$$c) == CHAR_E
      tohex(-$$b) == CHAR_E
      tohex(-$$w) == ANSI_CHINESE
      tohex(-$$str) == UTF8_STRING
      tohex(-$$mstr) == ANSI_STRING
      tohex(-$$wstr) == ANSI_STRING
      tohex(-$$lstr) == ANSI_STRING
      tohex(-$$cstr) == UTF8_STRING
      tohex(-$$str_ansi) == ANSI_STRING
      tohex(-$$cstr_ansi) == ANSI_STRING
      tohex(-$$lpchar) == UTF8_STRING
      tohex(-$$lpbyte) == ANSI_STRING
      tohex(-$$lpwchar) == ANSI_STRING
      tohex(-$$bstr) == ANSI_STRING
      tohex(nt -$$utf8Array) == UTF8_STRING
      tohex(nt -$$mbcsArray) == ANSI_STRING
      tohex(nt -$$wideArray) == ANSI_STRING
      tohex(nt -$$putf8Array) == UTF8_STRING
      tohex(nt -$$pmbcsArray) == ANSI_STRING
      tohex(nt -$$pwideArray) == ANSI_STRING
      tohex(nt -$$utf8Seq) == UTF8_STRING
      tohex(nt -$$mbcsSeq) == ANSI_STRING
      tohex(nt -$$wideSeq) == ANSI_STRING
      tohex(-$$utf8Puca) == UTF8_STRING
      tohex(-$$mbcsPuca) == ANSI_STRING
      tohex(-$$widePuca) == ANSI_STRING
      tohex(nt -$$openArray(utf8Seq)) == UTF8_STRING
      tohex(nt -$$openArray(mbcsSeq)) == ANSI_STRING
      tohex(nt -$$openArray(wideSeq)) == ANSI_STRING

      # convert to utf8 string
      toHex($str) == UTF8_STRING
      toHex($mstr) == UTF8_STRING
      toHex($wstr) == UTF8_STRING
      toHex($lstr) == UTF8_STRING
      toHex($cstr) == UTF8_STRING
      toHex($$cstr_ansi) == UTF8_STRING
      toHex($$str_ansi) == UTF8_STRING

      # convert to ansi string (mstring)
      toHex(-$str) == ANSI_STRING
      toHex(-$mstr) == ANSI_STRING
      toHex(-$wstr) == ANSI_STRING
      toHex(-$lstr) == ANSI_STRING
      toHex(-$cstr) == ANSI_STRING
      toHex(-$$cstr_ansi) == ANSI_STRING
      toHex(-$$str_ansi) == ANSI_STRING

      # convert to unicode string (wstring)
      toHex(+$str) == UNICODE_STRING
      toHex(+$mstr) == UNICODE_STRING
      toHex(+$wstr) == UNICODE_STRING
      toHex(+$lstr) == UNICODE_STRING
      toHex(+$cstr) == UNICODE_STRING
      toHex(+$$cstr_ansi) == UNICODE_STRING
      toHex(+$$str_ansi) == UNICODE_STRING

      # convert from windows' string buffer to nim's string
      toHex($lpchar) == UTF8_STRING
      toHex(-$lpchar) == ANSI_STRING
      toHex(+$lpchar) == UNICODE_STRING
      toHex($$lpbyte) == UTF8_STRING
      toHex(-$$lpbyte) == ANSI_STRING
      toHex(+$$lpbyte) == UNICODE_STRING
      toHex($lpwchar) == UTF8_STRING
      toHex(-$lpwchar) == ANSI_STRING
      toHex(+$lpwchar) == UNICODE_STRING
      toHex($bstr) == UTF8_STRING
      toHex(-$bstr) == ANSI_STRING
      toHex(+$bstr) == UNICODE_STRING

      # char conversion
      $'A' == "A"
      # +$'A' == +$"A"
      # -$'A' == -$"A"
      # $$(WCHAR 20013) == "中"
      # +$(WCHAR 20013) == +$"中"
      # -$(WCHAR 20013) == -$"中"

  test "String Manipulation":
    check:
      str.low == 0
      mstr.low == 0
      wstr.low == 0
      str.high == str.len - 1
      mstr.high == mstr.len - 1
      wstr.high == wstr.len - 1

      str[11] == 't'
      mstr[11] == 't'
      wstr[11] == WCHAR ord 't'

      str[13..15] == "中"
      str[13..18] == "中文"
      mstr[13..14] == -$"中"
      mstr[13..16] == -$"中文"
      mstr[13.mIndex] == -$"中"
      mstr[13.mIndex..14.mIndex] == -$"中文"
      wstr[13] == L"中"[0]
      wstr[13..14] == +$"中文"

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
    mstr[10..16] = -$"0123456789"
    wstr[10..14] = L"0123456789"

    check:
      str == "English Te0123456789測試"
      mstr == -$"English Te0123456789測試"
      wstr == L"English Te0123456789測試"

    str = newString(10)
    mstr = newMString(10)
    wstr = newWString(10)

    check:
      str == "\0\0\0\0\0\0\0\0\0\0"
      mstr == -$"\0\0\0\0\0\0\0\0\0\0"
      wstr == +$"\0\0\0\0\0\0\0\0\0\0"

    for i in 0..9:
      str[i] = char(i)
      mstr[i] = byte(i)
      wstr[i] = WCHAR(i)

    check:
      str == "\0\1\2\3\4\5\6\7\8\9"
      mstr == -$"\0\1\2\3\4\5\6\7\8\9"
      wstr == +$"\0\1\2\3\4\5\6\7\8\9"

    str = newStringOfCap(10)
    mstr = newMStringOfCap(10)
    wstr = newWStringOfCap(10)
    for i in 0..9:
      str.add char(i)
      mstr.add byte(i)
      wstr.add WCHAR(i)

    check:
      str == "\0\1\2\3\4\5\6\7\8\9"
      str & str == "\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9"
      mstr == -$"\0\1\2\3\4\5\6\7\8\9"
      mstr & mstr == -$"\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9"
      wstr == L("\0\1\2\3\4\5\6\7\8\9")
      wstr & wstr == L("\0\1\2\3\4\5\6\7\8\9\0\1\2\3\4\5\6\7\8\9")

    for i in 0..9:
      mstr[mIndex i] = (-$"中文測試")[mIndex(i mod 4)]

    check:
      mstr == -$"中文測試中文測試中文"
      mstr.mlen == 10

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

    for i, j in str: check(str[i] == j)
    for i, j in mstr: check(mstr[i] == j)
    for i, j in wstr: check(wstr[i] == j)

    for i in wstr.mitems: i = 0
    check(wstr == L("\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"))

    for i, j in wstr.mpairs: j = WCHAR s1[i]
    check(wstr == +$str)

  test "String With Null Terminated":
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
    var l = L("123\x00456\x00中文\x00測試")
    var ws = +$s
    var ms = -$s
    check:
      l == ws
      l.len == 13
      ms.mlen == 13

  test "String Bound Check":
    var s = "12345"
    var ms = -$"12345"
    var ws = +$"12345"

    when not defined(nimv2):
      expect IndexDefect: discard s[5]
      expect IndexDefect: discard ms[5]
      expect IndexDefect: discard ws[5]

      expect IndexDefect: discard s[-1..0]
      expect IndexDefect: discard ms[-1..0]
      expect IndexDefect: discard ws[-1..0]

      expect IndexDefect: discard s[0..s.len+1]
      expect IndexDefect: discard ms[0..ms.len+1]
      expect IndexDefect: discard ws[0..ws.len]

    check:
      s.substr(-1, 10) == s
      ms.substr(-1, 10) == ms
      ws.substr(-1, 10) == ws

  test "Low Level Buffer Fill":
    var byteBuffer: array[10, byte]
    var byteArray: array[2..10, byte]
    var byteSeq = newSeq[byte](10)
    var wcharBuffer: array[10, WCHAR]
    var wcharArray: array[2..10, WCHAR]
    var wcharSeq = newSeq[WCHAR](10)

    template check(target: untyped, output: string, body: untyped) =
      target.resetFF
      body
      check(target.toHex == output)

    template expect(target: untyped, output: string, body: untyped) =
      target.resetFF
      expect IndexDefect:
        body
      check(target.toHex == output)

    check(byteBuffer, "E4B8ADE69687FFFFFFFF"): byteBuffer << "中文"
    check(byteBuffer, "E4B8ADE69687FFFFFFFF"): (addr byteBuffer) << "中文"
    check(byteBuffer, "E4B8ADE69687FFFFFFFF"): (addr byteBuffer[0]) << "中文"
    check(byteBuffer, "E4B8ADE69687FFFFFFFF"): (cast[ptr UncheckedArray[byte]](addr byteBuffer[0])) << "中文"
    check(byteBuffer, "E4B8ADE69687FFFFFFFF"): byteBuffer.toOpenArray(0, 9) << "中文"
    check(byteBuffer, "FFFFE4B8ADE69687FFFF"): byteBuffer.toOpenArray(2, 8) << "中文"
    check(byteBuffer, "A4A4A4E5FFFFFFFFFFFF"): byteBuffer << -$"中文"
    check(byteBuffer, "A4A4A4E5FFFFFFFFFFFF"): (addr byteBuffer) << -$"中文"
    check(byteBuffer, "A4A4A4E5FFFFFFFFFFFF"): (addr byteBuffer[0]) << -$"中文"
    check(byteBuffer, "A4A4A4E5FFFFFFFFFFFF"): (cast[ptr UncheckedArray[byte]](addr byteBuffer[0])) << -$"中文"
    check(byteBuffer, "A4A4A4E5FFFFFFFFFFFF"): byteBuffer.toOpenArray(0, 9) << -$"中文"
    check(byteBuffer, "FFFFA4A4A4E5FFFFFFFF"): byteBuffer.toOpenArray(2, 8) << -$"中文"

    check(byteBuffer, "E4B8ADE6968700FFFFFF"): byteBuffer <<< "中文"
    check(byteBuffer, "E4B8ADE6968700FFFFFF"): (addr byteBuffer) <<< "中文"
    check(byteBuffer, "E4B8ADE6968700FFFFFF"): (addr byteBuffer[0]) <<< "中文"
    check(byteBuffer, "E4B8ADE6968700FFFFFF"): (cast[ptr UncheckedArray[byte]](addr byteBuffer[0])) <<< "中文"
    check(byteBuffer, "E4B8ADE6968700FFFFFF"): byteBuffer.toOpenArray(0, 9) <<< "中文"
    check(byteBuffer, "FFFFE4B8ADE6968700FF"): byteBuffer.toOpenArray(2, 8) <<< "中文"
    check(byteBuffer, "A4A4A4E500FFFFFFFFFF"): byteBuffer <<< -$"中文"
    check(byteBuffer, "A4A4A4E500FFFFFFFFFF"): (addr byteBuffer) <<< -$"中文"
    check(byteBuffer, "A4A4A4E500FFFFFFFFFF"): (addr byteBuffer[0]) <<< -$"中文"
    check(byteBuffer, "A4A4A4E500FFFFFFFFFF"): (cast[ptr UncheckedArray[byte]](addr byteBuffer[0])) <<< -$"中文"
    check(byteBuffer, "A4A4A4E500FFFFFFFFFF"): byteBuffer.toOpenArray(0, 9) <<< -$"中文"
    check(byteBuffer, "FFFFA4A4A4E500FFFFFF"): byteBuffer.toOpenArray(2, 8) <<< -$"中文"

    check(byteArray, "E4B8ADE69687FFFFFF"): byteArray << "..中文" # skip two char
    check(byteArray, "E4B8ADE69687FFFFFF"): (addr byteArray) << "..中文" # skip two char
    check(byteArray, "A4A4A4E5FFFFFFFFFF"): byteArray << -$"..中文" # skip two char
    check(byteArray, "A4A4A4E5FFFFFFFFFF"): (addr byteArray) << -$"..中文" # skip two char

    check(byteArray, "E4B8ADE6968700FFFF"): byteArray <<< "..中文" # skip two char
    check(byteArray, "E4B8ADE6968700FFFF"): (addr byteArray) <<< "..中文" # skip two char
    check(byteArray, "A4A4A4E500FFFFFFFF"): byteArray <<< -$"..中文" # skip two char
    check(byteArray, "A4A4A4E500FFFFFFFF"): (addr byteArray) <<< -$"..中文" # skip two char

    check(byteSeq, "E4B8ADE69687FFFFFFFF"): byteSeq << "中文"
    check(byteSeq, "A4A4A4E5FFFFFFFFFFFF"): byteSeq << -$"中文"
    check(byteSeq, "E4B8ADE6968700FFFFFF"): byteSeq <<< "中文"
    check(byteSeq, "A4A4A4E500FFFFFFFFFF"): byteSeq <<< -$"中文"

    check(wcharBuffer, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"): wcharBuffer << L"中文"
    check(wcharBuffer, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"): (addr wcharBuffer) << L"中文"
    check(wcharBuffer, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"): (addr wcharBuffer[0]) << L"中文"
    check(wcharBuffer, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"): (cast[ptr UncheckedArray[WCHAR]](addr  wcharBuffer[0])) << L"中文"
    check(wcharBuffer, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"): wcharBuffer.toOpenArray(0, 9) << L"中文"
    check(wcharBuffer, "FFFFFFFF2D4E8765FFFFFFFFFFFFFFFFFFFFFFFF"): wcharBuffer.toOpenArray(2, 8) << L"中文"

    check(wcharBuffer, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): wcharBuffer <<< L"中文"
    check(wcharBuffer, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): (addr wcharBuffer) <<< L"中文"
    check(wcharBuffer, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): (addr wcharBuffer[0]) <<< L"中文"
    check(wcharBuffer, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): (cast[ptr UncheckedArray[WCHAR]](addr  wcharBuffer[0])) <<< L"中文"
    check(wcharBuffer, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): wcharBuffer.toOpenArray(0, 9) <<< L"中文"
    check(wcharBuffer, "FFFFFFFF2D4E87650000FFFFFFFFFFFFFFFFFFFF"): wcharBuffer.toOpenArray(2, 8) <<< L"中文"

    check(wcharArray, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): wcharArray << L"..中文" # skip two wchar
    check(wcharArray, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): (addr wcharArray) << L"..中文" # skip two wchar
    check(wcharArray, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFF"): wcharArray <<< L"..中文" # skip two wchar
    check(wcharArray, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFF"): (addr wcharArray) <<< L"..中文" # skip two wchar
    check(wcharSeq, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"): wcharSeq << L"中文"
    check(wcharSeq, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): wcharSeq <<< L"中文"

    expect(byteBuffer, "30313233343536373839"): byteBuffer << "01234567890"
    expect(byteBuffer, "30313233343536373839"): byteBuffer <<< "0123456789"
    expect(byteBuffer, "30313233343536373839"): byteBuffer.toOpenArray(0, 9) << "01234567890"
    expect(byteBuffer, "30313233343536373839"): byteBuffer.toOpenArray(0, 9) <<< "0123456789"
    expect(byteBuffer, "FFFF30313233343536FF"): byteBuffer.toOpenArray(2, 8) << "01234567"
    expect(byteBuffer, "FFFF30313233343536FF"): byteBuffer.toOpenArray(2, 8) <<< "0123456"
    expect(byteArray, "323334353637383941"): byteArray << "0123456789AB"
    expect(byteArray, "323334353637383941"): byteArray <<< "0123456789A"
    expect(byteSeq, "30313233343536373839"): byteSeq << "01234567890"
    expect(byteSeq, "30313233343536373839"): byteSeq <<< "0123456789"

    expect(wcharBuffer, "3000310032003300340035003600370038003900"): wcharBuffer << L"01234567890"
    expect(wcharBuffer, "3000310032003300340035003600370038003900"): wcharBuffer <<< L"0123456789"
    expect(wcharBuffer, "3000310032003300340035003600370038003900"): wcharBuffer.toOpenArray(0, 9) << L"01234567890"
    expect(wcharBuffer, "3000310032003300340035003600370038003900"): wcharBuffer.toOpenArray(0, 9) <<< L"0123456789"
    expect(wcharBuffer, "FFFFFFFF3000310032003300340035003600FFFF"): wcharBuffer.toOpenArray(2, 8) << L"01234567"
    expect(wcharBuffer, "FFFFFFFF3000310032003300340035003600FFFF"): wcharBuffer.toOpenArray(2, 8) <<< L"0123456"
    expect(wcharArray, "320033003400350036003700380039004100"): wcharArray << L"0123456789AB"
    expect(wcharArray, "320033003400350036003700380039004100"): wcharArray <<< L"0123456789A"
    expect(wcharSeq, "3000310032003300340035003600370038003900"): wcharSeq << L"01234567890"
    expect(wcharSeq, "3000310032003300340035003600370038003900"): wcharSeq <<< L"0123456789"

  test "Low Level String Fill":
    var byteBuffer = [byte 2, 3, 4, 5, 6, 7, 8]
    var byteArray: array[2..8, byte] = byteBuffer
    var byteSeq = @byteBuffer
    var wcharBuffer = [WCHAR 2, 3, 4, 5, 6, 7, 8]
    var wcharArray: array[2..8, WCHAR] = wcharBuffer
    var wcharSeq = @wcharArray

    template check(target: untyped, output: string, body: untyped) =
      when target is wstring: target = newWString(output.len div 4)
      elif target is mstring: target = newMString(output.len div 2)
      else: target = newString(output.len div 2)
      body
      check(target.toHex == output)

    template expect(target: untyped, output: string, body: untyped) =
      when target is wstring: target = newWString(output.len div 4)
      elif target is mstring: target = newMString(output.len div 2)
      else: target = newString(output.len div 2)
      expect IndexDefect:
        body
      check(target.toHex == output)

    check(str, "02030405060708"): str << byteBuffer
    check(str, "02030405060708"): str << (addr byteBuffer)
    check(str, "02030405060708"): str << (addr byteBuffer[0])
    check(str, "02030405060708"): str << (cast[ptr UncheckedArray[byte]](addr byteBuffer))
    check(str, "02030405060708"): str << byteBuffer.toOpenArray(0, 6)
    check(str, "0304050607"): str << byteBuffer.toOpenArray(1, 5)
    check(str, "000002030405060708"): str << byteArray
    check(str, "000002030405060708"): str << (addr byteArray)
    check(str, "02030405060708"): str << byteSeq

    check(wstr, "0200030004000500060007000800"): wstr << wcharBuffer
    check(wstr, "0200030004000500060007000800"): wstr << (addr wcharBuffer)
    check(wstr, "0200030004000500060007000800"): wstr << (addr wcharBuffer[0])
    check(wstr, "0200030004000500060007000800"): wstr << (cast[ptr UncheckedArray[WCHAR]](addr wcharBuffer))
    check(wstr, "0200030004000500060007000800"): wstr << wcharBuffer.toOpenArray(0, 6)
    check(wstr, "03000400050006000700"): wstr << wcharBuffer.toOpenArray(1, 5)
    check(wstr, "000000000200030004000500060007000800"): wstr << wcharArray
    check(wstr, "0200030004000500060007000800"): wstr << wcharSeq

    check(str, "30313233343536373839"): str << "0123456789"
    check(mstr, "30313233343536373839"): mstr << "0123456789"
    check(wstr, "3000310032003300340035003600370038003900"): wstr << L"0123456789"
    check(str, "3031323334353637383900"): str <<< "0123456789"
    check(mstr, "3031323334353637383900"): mstr <<< "0123456789"
    check(wstr, "30003100320033003400350036003700380039000000"): wstr <<< L"0123456789"

    expect(str, "30313233343536373839"): str << "01234567890"
    expect(mstr, "30313233343536373839"): mstr << "01234567890"
    expect(wstr, "3000310032003300340035003600370038003900"): wstr << L"01234567890"
    expect(str, "30313233343536373839"): str <<< "0123456789"
    expect(mstr, "30313233343536373839"): mstr <<< "0123456789"
    expect(wstr, "3000310032003300340035003600370038003900"): wstr <<< L"0123456789"

  test "MBCS characters Index (mIndex)":
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
