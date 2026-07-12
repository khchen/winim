#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

{.push hint[XDeclaredButNotUsed]: off.}

import winim/[core, winstr, utils, inc/objbase]
import std/[hashes, sequtils, sets, strutils, tables, unittest, unicode]

suite "Test Suites for winim/winstr":
  setup:
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

    template validate(s: wstring) =
      check:
        string(s).len == (s.len + 1) * 2
        cast[ptr UncheckedArray[WCHAR]](&s)[s.len] == 0

    template nt(x: untyped): untyped = nullTerminated(x)

    template openArray(x: seq): untyped = toOpenArray(x, 0, x.len - 1)

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

  teardown:
    if bstr != nil:
      SysFreeString(bstr)

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

    when defined(gcDestructors):
      var pointers: array[64, LPWSTR]

      for i in pointers.low..pointers.high:
        pointers[i] = "temporary wide string " & $i

      for i in pointers.low..pointers.high:
        check $pointers[i] == "temporary wide string " & $i

      let wrapped: LPWSTR = "wrapped temporary wide string"
      check $wrapped == "wrapped temporary wide string"

    block: # BSTR-compatible slots are rooted across the immediate API call
      proc readBSTR(x: BSTR): string = %$x

      var pointers: array[16, BSTR]
      for i in pointers.low..pointers.high:
        pointers[i] = "temporary BSTR " & $i
      for i in pointers.low..pointers.high:
        check:
          SysStringLen(pointers[i]) == UINT(("temporary BSTR " & $i).len)
          $pointers[i] == "temporary BSTR " & $i

      let embedded: BSTR = L("A\0中😀Z")
      check:
        SysStringLen(embedded) == UINT(L("A\0中😀Z").len)
        %$embedded == "A\0中😀Z"
        readBSTR("A\0中😀Z") == "A\0中😀Z"
        readBSTR(L("A\0中😀Z")) == "A\0中😀Z"
        readBSTR(cstring("中😀")) == "中😀"

      let empty: BSTR = ""
      check:
        empty != nil
        SysStringLen(empty) == 0
        readBSTR(empty) == ""

    block: # BSTR ownership boundary
      wstr = L("A\0中😀Z")
      let owned = SysAllocStringLen(&wstr, UINT(wstr.len))
      require owned != nil
      defer: SysFreeString(owned)

      check:
        SysStringLen(owned) == UINT(wstr.len)
        $owned == "A\0中😀Z"
        +$owned == wstr
        -$owned == -$"A\0中😀Z"
        %$owned == "A\0中😀Z"
        cast[LPWSTR](owned) == winstrConverterBSTRToLPWSTR(owned)

  test "String Conversion":
    const
      CHAR_E = tohex("E")
      CHAR_E_ASCII = tohex("69")
      WCHAR_E = tohex("E\0")
      WCHAR_CHINESE_ASCII = tohex("20013")
      WCHAR_CHINESE = "2D4E"
      UTF8_CHINESE = "E4B8AD"

      UTF8_STRING = tohex("English Test 中文測試")
      UNICODE_STRING = "45006E0067006C006900730068002000540065007300740020002D4E87652C6E668A"

    let
      isCP950 = GetACP() == 950
      ANSI_CHINESE = if isCP950: "A4A4" else: tohex(-$(WCHAR 20013))
      ANSI_STRING = if isCP950: tohex("English Test ") & "A4A4A4E5B4FAB8D5" else: tohex(mstr)
      UTF8_FROM_ANSI_FAIL = if isCP950: "456E676C697368205465737420E98A9DE5899C3FE79A9CE7A588E5B2AB" else: tohex($$str)
      ANSI_FROM_UTF8_FAIL = if isCP950: "456E676C6973682054657374203F3F3F3F3F3F3F" else: tohex(-$str_ansi)
      UNICODE_FROM_UTF8_FAIL = if isCP950: "45006E0067006C00690073006800200054006500730074002000FDFFFDFFFDFFFDFFFDFFFDFFFDFF" else: tohex(+$str_ansi)
      UNICODE_FROM_ANSI_FAIL = if isCP950: "45006E0067006C006900730068002000540065007300740020009D925C523F009C764879AB5C" else: tohex(+$$str)

    check:
      # original
      tohex(str) == UTF8_STRING
      tohex(mstr) == ANSI_STRING
      tohex(wstr) == UNICODE_STRING
      tohex(lstr) == UNICODE_STRING
      tohex(cstr) == UTF8_STRING
      tohex(str_ansi) == ANSI_STRING
      tohex(cstr_ansi) == ANSI_STRING

      # scalar and pointer stringables for `$`; arrays use explicit `%$`.
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
      tohex(nt %$utf8Array) == UTF8_STRING
      tohex(nt %$mbcsArray) == ANSI_STRING
      tohex(nt %$wideArray) == UTF8_STRING
      tohex(nt $putf8Array) == UTF8_STRING
      tohex(nt $pmbcsArray) == ANSI_STRING
      tohex(nt $pwideArray) == UTF8_STRING
      tohex(nt %$utf8Seq) == UTF8_STRING
      tohex(nt %$mbcsSeq) == ANSI_STRING
      tohex(nt %$wideSeq) == UTF8_STRING
      tohex($utf8Puca) == UTF8_STRING
      tohex($mbcsPuca) == ANSI_STRING
      tohex($widePuca) == UTF8_STRING
      tohex(nt %$openArray(utf8Seq)) == UTF8_STRING
      tohex(nt %$openArray(mbcsSeq)) == ANSI_STRING
      tohex(nt %$openArray(wideSeq)) == UTF8_STRING

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

      # Convert to a UTF-8 string.
      toHex($str) == UTF8_STRING
      toHex($mstr) == UTF8_STRING
      toHex($wstr) == UTF8_STRING
      toHex($lstr) == UTF8_STRING
      toHex($cstr) == UTF8_STRING
      toHex($$cstr_ansi) == UTF8_STRING
      toHex($$str_ansi) == UTF8_STRING

      # Convert to an ANSI string (mstring).
      toHex(-$str) == ANSI_STRING
      toHex(-$mstr) == ANSI_STRING
      toHex(-$wstr) == ANSI_STRING
      toHex(-$lstr) == ANSI_STRING
      toHex(-$cstr) == ANSI_STRING
      toHex(-$$cstr_ansi) == ANSI_STRING
      toHex(-$$str_ansi) == ANSI_STRING

      # Convert to a Unicode string (wstring).
      toHex(+$str) == UNICODE_STRING
      toHex(+$mstr) == UNICODE_STRING
      toHex(+$wstr) == UNICODE_STRING
      toHex(+$lstr) == UNICODE_STRING
      toHex(+$cstr) == UNICODE_STRING
      toHex(+$$cstr_ansi) == UNICODE_STRING
      toHex(+$$str_ansi) == UNICODE_STRING

      # Convert from a Windows string buffer to a Nim string.
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
      +$'A' == +$"A"
      -$'A' == -$"A"
      $$(WCHAR 20013) == "中"
      +$(WCHAR 20013) == +$"中"
      -$(WCHAR 20013) == -$"中"

    block:
      wstr = L"😀"
      check:
        wstr.len == 2
        wstr[0] == WCHAR(0xD83D)
        wstr[1] == WCHAR(0xDE00)
        $wstr == "😀"

      check:
        L("") == +$""
        L("\0") == +$"\0"
        L("\xC2") == +$"\xC2"
        L("\xE2\x82") == +$"\xE2\x82"
        L("\xE2\x82A") == +$"\xE2\x82A"
        L("\xE0\xA0") == +$"\xE0\xA0"
        L("\xED\x9F") == +$"\xED\x9F"
        L("\xF0\x9F\x98") == +$"\xF0\x9F\x98"
        L("\xF0\x90\x80A") == +$"\xF0\x90\x80A"
        L("\xF0\x90A") == +$"\xF0\x90A"
        L("\x80") == +$"\x80"
        L("\xC0\xAF") == +$"\xC0\xAF"
        L("\xE0\x80\x80") == +$"\xE0\x80\x80"
        L("\xED\xA0\x80") == +$"\xED\xA0\x80"
        L("\xF4\x90\x80\x80") == +$"\xF4\x90\x80\x80"
        L("\xEF\xBF\xBF") == +$"\xEF\xBF\xBF"
        L("\xF0\x90\x80\x80") == +$"\xF0\x90\x80\x80"
        L("\xF4\x8F\xBF\xBF") == +$"\xF4\x8F\xBF\xBF"
        L("\xBF") == +$"\xBF"
        L("\xE1") == +$"\xE1"
        L("\xF1") == +$"\xF1"
        L("\xF1\x80") == +$"\xF1\x80"
        L("\xF1\x80\x80") == +$"\xF1\x80\x80"
        L("\xF5\x80\x80\x80") == +$"\xF5\x80\x80\x80"
        L("\xFE") == +$"\xFE"
        L("\xFF") == +$"\xFF"
        L("A\x80B") == +$"A\x80B"

    block:
      utf8Seq = newSeq[char]()
      mbcsSeq = newSeq[byte]()
      wideSeq = newSeq[WCHAR]()
      check:
        %$utf8Seq == ""
        %$mbcsSeq == ""
        %$wideSeq == ""
        %$openArray(utf8Seq) == ""
        %$openArray(wideSeq) == ""
        (+$utf8Seq).len == 0
        (+$wideSeq).len == 0
        (-$utf8Seq).len == 0

    block:
      str = "A\0中😀Z"
      wstr = +$str
      mstr = -$str
      utf8Seq = @['A', '\0', 'B']
      mbcsSeq = @[byte 'A', byte 0, byte 'B']
      wideSeq = @[WCHAR('A'), WCHAR(0), WCHAR('B')]
      var nonZeroChars: array[2..4, char] = ['A', '\0', 'B']
      var nonZeroWide: array[2..4, WCHAR] = [WCHAR('A'), WCHAR(0), WCHAR('B')]

      check:
        $wstr == str
        $(-$"A\0B") == "A\0B"
        +$utf8Seq == L("A\0B")
        +$mbcsSeq == L("A\0B")
        $wideSeq == system.`$`(wideSeq)
        %$wideSeq == "A\0B"
        +$wideSeq == L("A\0B")
        %$nonZeroChars == "A\0B"
        %$nonZeroWide == "A\0B"
        +$nonZeroChars == L("A\0B")
        +$nonZeroWide == L("A\0B")

    block: # explicit open-array string conversion
      utf8Seq = @['A', '\0', 'B']
      check:
        $utf8Seq == system.`$`(utf8Seq)
        %$utf8Seq == "A\0B"

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

    block:
      nilwstr.add 'A'
      nilwstr.add L"BC"
      check nilwstr == L"ABC"

      nilwstr = default(wstring)
      check nilwstr == L""
      check hash(nilwstr) == hash(L"")
      check nilwstr & L"abc" == L"abc"
      check L"abc" & nilwstr == L"abc"

      wstr = L"abc"
      wstr[0] = 'X'
      check wstr == L"Xbc"

      wstr = L"ab"
      wstr.add 'c'
      check wstr == L"abc"

      wstr = L"ab"
      for item in wstr.mitems:
        item = 0
      check wstr == L("\0\0")

      wstr = L"abcd"
      wstr[2..1] = L"XY"
      check wstr == L"abXYcd"

      let beforeInvalid = wstr
      when compileOption("boundChecks"):
        expect IndexDefect:
          wstr[-1..0] = L"x"
        check wstr == beforeInvalid

      let
        lowerCodeUnit = L"ÿ" # U+00FF
        higherCodeUnit = L"Ā" # U+0100
        nilWide = +$cast[ptr char](nil)
      check:
        lowerCodeUnit < higherCodeUnit
        cmp(lowerCodeUnit, higherCodeUnit) < 0
        nilWide == L""
        string(nilWide).len == 2

    block:
      wstr = newWString(3); validate(wstr)
      wstr.setLen(5); validate(wstr)
      wstr.setLen(1); validate(wstr)
      wstr = newWStringOfCap(8); validate(wstr)
      wstr.add 'A'; validate(wstr)
      wstr.add L"😀B"; validate(wstr)
      wstr[0] = 'X'; validate(wstr)
      wstr[1..2] = L"YZ"; validate(wstr)
      wstr[1..2] = L"Q"; validate(wstr)
      wstr[1..1] = L"RST"; validate(wstr)
      wstr[wstr.len .. wstr.len - 1] = L"!"; validate(wstr)
      validate(wstr.substr(1, 2))

      for item in wstr.mitems:
        item = item
      validate(wstr)
      for _, item in wstr.mpairs:
        item = item
      validate(wstr)

    block:
      wstr = L"abc"
      nilwstr = wstr
      wstr[0] = 'X'
      check:
        wstr == L"Xbc"
        nilwstr == L"abc"

      wstr = nilwstr
      wstr[1..1] = L"YZ"
      check:
        wstr == L"aYZc"
        nilwstr == L"abc"

      wstr = nilwstr
      wstr.add 'd'
      check:
        wstr == L"abcd"
        nilwstr == L"abc"

      wstr = nilwstr
      for item in wstr.mitems:
        item = 'Q'.WCHAR
      check:
        wstr == L"QQQ"
        nilwstr == L"abc"

      wstr = nilwstr
      wstr.setLen(1)
      check:
        wstr == L"a"
        nilwstr == L"abc"

      wstr = L"ab"
      wstr.add wstr
      check wstr == L"abab"

      wstr = L"ab"
      nilwstr = wstr
      wstr.add nilwstr
      check:
        wstr == L"abab"
        nilwstr == L"ab"

      wstr = L"abcd"
      wstr[1..2] = wstr
      check wstr == L"aabcdd"

      wstr = L"shared"
      nilwstr = L"shared"
      wstr[0] = 'X'
      check nilwstr == L"shared"

    # Comparison and hash contract.
    let values = @[wstring(default(string)), L"", L"a", L"aa", L("a\0"), L("a\0b"), L"😀"]
    check:
      values[0] == values[1]
      hash(values[0]) == hash(values[1])
      L"a" < L"aa"
      L"a" < L("a\0")
      cmp(L("a\0"), L("a\0b")) < 0
      L"😀" == +$"😀"
      hash(L"😀") == hash(+$"😀")

    var setOfWide = initHashSet[wstring]()
    setOfWide.incl L("key\0😀")
    check +$"key\0😀" in setOfWide

    var tableOfWide = initTable[wstring, int]()
    tableOfWide[L"key"] = 42
    check tableOfWide[+$"key"] == 42

    wstr = L"before"
    let oldHash = hash(wstr)
    wstr[0] = 'B'
    check:
      wstr == L"Before"
      hash(wstr) != oldHash

    # Substring and slice semantics.
    wstr = L("A😀B\0C")
    nilwstr = newWString(1)
    nilwstr[0] = WCHAR(0xD83D)
    check:
      wstr.substr(0, wstr.high) == wstr[0..wstr.high]
      wstr.substr(-10, 100) == wstr
      wstr.substr(3, 2) == L""
      wstr.substr(wstr.len) == L""
      wstr[1..1] == nilwstr
      wstr[1..2] == L"😀"
      wstr[wstr.len .. wstr.len - 1] == L""
      wstr[wstr.len + 1 .. wstr.len] == L""

    expect RangeDefect:
      discard wstr[3..1]

    wstr = L"abcd"
    wstr[3..1] = L"X"
    check wstr == L"abcXd"
    when compileOption("boundChecks"):
      expect IndexDefect:
        wstr[wstr.len + 1 .. wstr.len] = L"X"

    mstr = -$"A中B"
    check:
      mstr.substr(0, mstr.high) == mstr[0..mstr.high]
      mstr.substr(-10, 100) == mstr
      mstr.substr(3.mIndex, 2.mIndex) == -$""
      mstr.substr(1.mIndex, 1.mIndex) == -$"中"
      mstr[1.mIndex..1.mIndex] == -$"中"
      mstr[^2..1.mIndex] == -$"中"

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
      reconstructed = newMString(0)
      pairKeys = newSeq[int]()

    for i in str.runes:
      s1.add int i

    for i in mstr:
      reconstructed.add i
      if i.len == 1:
        s2.add int cast[ptr uint8](&i)[]
      elif i.len == 2:
        s2.add int cast[ptr uint16](&i)[]

    for i in wstr:
      s3.add int i

    check:
      s1 == @[69, 110, 103, 108, 105, 115, 104, 32, 84, 101, 115, 116, 32, 20013, 25991, 28204, 35430]
      s3 == @[69, 110, 103, 108, 105, 115, 104, 32, 84, 101, 115, 116, 32, 20013, 25991, 28204, 35430]
      reconstructed == mstr

    if GetACP() == 950:
      check s2 == @[69, 110, 103, 108, 105, 115, 104, 32, 84, 101, 115, 116, 32, 0xA4A4, 0xE5A4, 0xFAB4, 0xD5B8]

    for key, value in mstr.pairs:
      pairKeys.add int(key)
      check value == mstr[key]
    check pairKeys == toSeq(0..<mstr.mlen)

    for i, j in str: check(str[i] == j)
    for i, j in mstr: check(mstr[i] == j)
    for i, j in wstr: check(wstr[i] == j)

    for i in wstr.mitems: i = 0
    check(wstr == L("\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"))

    for i, j in wstr.mpairs: j = WCHAR s1[i]
    check(wstr == +$str)

  test "String Null Handling":
    str[12] = '\0'
    check:
      toHex(str) == "456E676C697368205465737400E4B8ADE69687E6B8ACE8A9A6"
      toHex(str.nullTerminated) == "456E676C6973682054657374"
    str.nullTerminate
    check toHex(str) == "456E676C6973682054657374"

    mstr[12] = '\0'
    check:
      toHex(mstr) == "456E676C697368205465737400A4A4A4E5B4FAB8D5"
      toHex(mstr.nullTerminated) == "456E676C6973682054657374"
    mstr.nullTerminate
    check toHex(mstr) == "456E676C6973682054657374"

    wstr[12] = 0
    check:
      toHex(wstr) == "45006E0067006C006900730068002000540065007300740000002D4E87652C6E668A"
      toHex(wstr.nullTerminated) == "45006E0067006C0069007300680020005400650073007400"
    wstr.nullTerminate
    check toHex(wstr) == "45006E0067006C0069007300680020005400650073007400"
    validate(wstr)

    wstr = L"abc"
    wstr.nullTerminate
    check:
      wstr == L"abc"
      wstr.nullTerminated == L"abc"
    validate(wstr)

    wstr = default(wstring)
    wstr.nullTerminate
    check wstr == L""
    validate(wstr)

    # Strings containing embedded null characters.
    str = "123\x00456\x00中文\x00測試"
    wstr = +$str
    mstr = -$str
    check:
      wstr == L("123\x00456\x00中文\x00測試")
      wstr.len == 13
      mstr.mlen == 13

  test "String Bound Check":
    str = "12345"
    mstr = -$str
    wstr = +$str

    when compileOption("boundChecks"):
      expect IndexDefect: discard str[5]
      expect IndexDefect: discard mstr[5]
      expect IndexDefect: discard wstr[5]
      expect IndexDefect: discard wstr[-1]
      expect IndexDefect: wstr[-1] = WCHAR(0)

      expect IndexDefect: discard str[-1..0]
      expect IndexDefect: discard mstr[-1..0]
      expect IndexDefect: discard wstr[-1..0]

      expect IndexDefect: discard str[0..str.len+1]
      expect IndexDefect: discard mstr[0..mstr.len+1]
      expect IndexDefect: discard wstr[0..wstr.len]

    check:
      str.substr(-1, 10) == str
      mstr.substr(-1, 10) == mstr
      wstr.substr(-1, 10) == wstr

    expect RangeDefect:
      discard newWString(Natural(int.high div 2))

  test "Low Level Fill Operators":
    var
      byteBuffer: array[10, byte]
      byteArray: array[2..10, byte]
      byteSeq = newSeq[byte](10)
      wcharBuffer: array[10, WCHAR]
      wcharArray: array[2..10, WCHAR]
      wcharSeq = newSeq[WCHAR](10)

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

    check(byteArray, "E4B8ADE69687FFFFFF"): byteArray << "..中文" # skip two characters
    check(byteArray, "E4B8ADE69687FFFFFF"): (addr byteArray) << "..中文" # skip two characters
    check(byteArray, "A4A4A4E5FFFFFFFFFF"): byteArray << -$"..中文" # skip two characters
    check(byteArray, "A4A4A4E5FFFFFFFFFF"): (addr byteArray) << -$"..中文" # skip two characters

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

    check(wcharArray, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): wcharArray << L"..中文" # skip two wide characters
    check(wcharArray, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): (addr wcharArray) << L"..中文" # skip two wide characters
    check(wcharArray, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFF"): wcharArray <<< L"..中文" # skip two wide characters
    check(wcharArray, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFF"): (addr wcharArray) <<< L"..中文" # skip two wide characters
    check(wcharSeq, "2D4E8765FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"): wcharSeq << L"中文"
    check(wcharSeq, "2D4E87650000FFFFFFFFFFFFFFFFFFFFFFFFFFFF"): wcharSeq <<< L"中文"

    var exactArray: array[2..8, byte]
    exactArray.resetFF
    exactArray <<< "..123456"
    check exactArray.toHex == "31323334353600"

    static:
      let immutable = "fixed"
      let immutableWide = L"fixed"
      doAssert not compiles("literal" << [byte 1, 2, 3])
      doAssert not compiles(L"literal" <<< L"x")
      doAssert not compiles(immutable << [byte 1, 2, 3])
      doAssert not compiles(immutableWide <<< L"x")
      doAssert not compiles((block:
        proc immutableParameter(destination: string) =
          destination << [byte 'o', byte 'k']))

    block:
      type MutableHolder = object
        text: string

      proc fillVarParameter(destination: var string) =
        destination << [byte 'o', byte 'k']

      var mutable = "fixed"
      mutable << [byte 1, 2, 3, 4, 5]

      var mutableWide = newWString(2)
      mutableWide <<< L"x"

      var holder = MutableHolder(text: newString(2))
      holder.text << [byte 'o', byte 'k']

      var values = @[newString(2)]
      values[0] << [byte 'o', byte 'k']

      var destination = newString(2)
      fillVarParameter(destination)

      check:
        mutable.toHex == "0102030405"
        mutableWide.toHex == "78000000"
        holder.text == "ok"
        values[0] == "ok"
        destination == "ok"

    block:
      var
        oneByte = [byte 0xFF]
        oneWide = [WCHAR 0xFFFF]
        exactBytes: array[3, byte]
        exactBytesNull: array[4, byte]
        exactWide: array[2, WCHAR]
        exactWideNull: array[3, WCHAR]

      oneByte <<< ""
      oneWide <<< L""
      exactBytes << "abc"
      exactBytesNull <<< "abc"
      exactWide << L"中A"
      exactWideNull <<< L"中A"

      check:
        oneByte == [byte 0]
        oneWide == [WCHAR 0]
        exactBytes == [byte 'a', byte 'b', byte 'c']
        exactBytesNull == [byte 'a', byte 'b', byte 'c', byte 0]
        exactWide == [WCHAR(0x4E2D), WCHAR('A')]
        exactWideNull == [WCHAR(0x4E2D), WCHAR('A'), WCHAR(0)]

      var reverseBytes: array[4, byte]
      "abc" >>> reverseBytes
      check reverseBytes == [byte 'a', byte 'b', byte 'c', byte 0]

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
    var
      byteBuffer = [byte 2, 3, 4, 5, 6, 7, 8]
      byteArray: array[2..8, byte] = byteBuffer
      byteSeq = @byteBuffer
      wcharBuffer = [WCHAR 2, 3, 4, 5, 6, 7, 8]
      wcharArray: array[2..8, WCHAR] = wcharBuffer
      wcharSeq = @wcharArray

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

  test "MBCS And Windows String Compatibility":
    check:
      wstr[13] == L"中"[0]
      mstr[mIndex 13] == -$"中"

    wstr[13] = L"英"[0]
    mstr[mIndex 13] = -$"英"
    check:
      wstr == +$"English Test 英文測試"
      mstr == -$"English Test 英文測試"

    wstr[7..14] = +$" ABC "
    mstr[7..14.mIndex] = -$" ABC "
    check:
      wstr == +$"English ABC 測試"
      mstr == -$"English ABC 測試"

    block:
      mstr = -$"abc"
      check mstr[3.mIndex..2.mIndex] == -$""
      mstr[3.mIndex..2.mIndex] = -$"X"
      check mstr == -$"abcX"

      mstr[0.mIndex..(-1).mIndex] = -$"Y"
      check mstr == -$"YabcX"

      mstr[2.mIndex..1.mIndex] = -$"Z"
      check mstr == -$"YaZbcX"

      nilmstr = default(mstring)
      check nilmstr[0.mIndex..(-1).mIndex] == -$""
      nilmstr[0.mIndex..(-1).mIndex] = -$"Q"
      check nilmstr == -$"Q"

      check mstr[(mstr.mlen + 1).mIndex .. mstr.mlen.mIndex] == -$""
      expect RangeDefect:
        discard mstr[3.mIndex .. 1.mIndex]
      expect IndexDefect:
        mstr[(mstr.mlen + 1).mIndex .. mstr.mlen.mIndex] = -$"X"

    # WideCString round-trip and API character mode.
    wstr = L"A中😀Z"
    let wide = newWideCString(wstr)
    let widePtr: LPWSTR = wide
    check:
      +$wide == wstr
      widePtr[] == WCHAR('A')
      cast[ptr UncheckedArray[WCHAR]](widePtr)[wstr.len] == 0

    var changed = wstr
    changed[0] = 'X'
    check +$wide == L"A中😀Z"

    let empty = newWideCString(L"")
    check +$empty == L""

    let embedded = newWideCString(L("A\0B"))
    check +$embedded == L"A"

    # T string and buffer follow the selected API character mode.
    let
      value = T("A中")
      buffer = T(8)
    when winimAnsi:
      static:
        doAssert value is mstring
        doAssert buffer is mstring
        doAssert TString is mstring
      check:
        value == -$"A中"
        buffer.len == 8
    else:
      static:
        doAssert value is wstring
        doAssert buffer is wstring
        doAssert TString is wstring
      check:
        value == L"A中"
        buffer.len == 8

    str = "A\0中"
    check:
      $(+$str) == str
      $(-$str) == str

  test "Buffer Safety And Aliasing":
    var
      emptyBytes: array[0, byte]
      emptyWide: array[0, WCHAR]

    emptyBytes << ""
    emptyWide << L""
    expect IndexDefect:
      emptyBytes << "x"
    expect IndexDefect:
      emptyWide <<< L""

    # Self-fill and overlapping buffers preserve source semantics.
    str = "abc"
    str << str
    check str == "abc"

    expect IndexDefect:
      str <<< str
    check str == "abc"

    str = "abc"
    str_ansi = str
    str << "XYZ"
    check:
      str == "XYZ"
      str_ansi == "abc"

    str = "abcdef"
    expect IndexDefect:
      str.toOpenArray(1, 5) << str
    check str == "aabcde"

    str = "abcdef"
    str << addr str[1]
    check str == "bcdef\0"

    if GetACP() == CP_UTF8:
      mstr = -$"A😀B"
      check:
        mstr.mlen == 3
        mstr[1.mIndex] == -$"😀"

      mstr[1.mIndex] = -$"界"
      check mstr == -$"A界B"

      mstr[1.mIndex] = -$"😀"
      check mstr == -$"A😀B"

      check mstr[mstr.mlen.mIndex .. (mstr.mlen - 1).mIndex] == -$""
      mstr[mstr.mlen.mIndex .. (mstr.mlen - 1).mIndex] = -$"!"
      check mstr == -$"A😀B!"
