#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#                Windows String Type Utilities
#
#====================================================================

##  This module contains new string types and utilities to deal with strings in windows.
##  Windows use following types to represent a char or string:
##
##  .. code-block:: Nim
##    type
##      CHAR = char
##      WCHAR = uint16
##      LPSTR|LPCSTR = cstring # however, it should be ansi string, not utf8 string
##      LPWSTR|LPCWSTR = ptr WCHAR
##      BSTR = distinct ptr WCHAR # BSTR is not binary compatible with LPWSTR
##      (ptr) array[range, CHAR] # sometimes string defined as array[1, CHAR] but not only one char
##      (ptr) array[range, WCHAR] # sometimes string defined as array[1, WCHAR] but not only one widechar
##
##  By default, Nim's string type is utf8 encoding.
##  However, windows use wide character string (aka unicode string) or multibyte character string (aka ansi string).
##  So, we have following string types.
##
##  .. code-block:: Nim
##    type
##      string # nim built-in string type, utf8 encoding by default, can be ansi string sometimes.
##      cstring # compatible to the type char* in Ansi C
##      wstring = distinct string # new string type to store unicode string
##      mstring = distinct string # new string type to store ansi string
##
##  Here are the pseudocode for most useful functions introduced by this module.
##
##  .. code-block:: Nim
##    proc `&`(s: cstring|string|wstring|mstring): pointer
##      # Get address of the first char of a string.
##      # For string, it has the same meaning as cstring(s), but it checks the nil well.
##
##    proc `$`[T](x: T): string
##    proc `+$`[T](x: T): wstring
##    proc `-$`[T](x: T): mstring
##      # Convert any stringable type to string, wstring, or mstring.
##      # These operators assume string|cstring|LPSTR|ptr char|char array are utf8 encoding.
##      # T can be one of following stringable types:
##      #   char|WCHAR
##      #   string|mstring|wstring
##      #   LPSTR|cstring|ptr char
##      #   LPWSTR|BSTR|wstring|ptr WCHAR
##      #   array[range, char|WCHAR]
##      #   ptr array[range, char|WCHAR]
##
##    proc `$$`[T](x: T): string
##    proc `+$$`[T](x: T): wstring
##    proc `-$$`[T](x: T): mstring
##      # These operators assume string|cstring|LPSTR|ptr char|char array are ansi encoding.
##      # For mstring|wstring|LPWSTR etc, these operators are the same as `$`, `+$`, `-$`.
##
##    proc `<<`[S: SomeString, B: SomeBuffer](s: S, b: B)
##    proc `<<`[B: SomeBuffer, S: SomeString](b: B, s: S)
##    proc `<<<`[B: SomeBuffer, S: SomeString](b: B, s: S)
##    template `>>`(a: typed, b: typed) = b << a
##    template `>>>`(a: typed, b: typed) = b <<< a
##      # String << Buffer or Buffer >> String: Fill string by buffer.
##      # Buffer << String or String >> Buffer: Fill buffer by string.
##      # Buffer <<< String or String >>> Buffer: Fill buffer by string, include a null.
##      # SomeString means: string|mstring|wstring
##      # SomeBuffer means: (ptr) char array|(ptr) WCHAR array|LPWSTR|cstring|ptr WCHAR|ptr char
##
##      # These operators don't convert the encoding (copy byte by byte).
##      # Please make sure both side have the same character size.
##      # If destination is just a pointer, please make sure the buffer size is large enough.
##
##    proc nullTerminate(s: var string|var mstring|var wstring)
##      # Assume a string is null terminated and set the correct length.
##
##    proc nullTerminated[T: string|mstring|wstring](s: T): T
##      # Assume a string is null terminated and return the length-corrected string.
##
##    macro L(s: string): wstring
##      # Generate wstring at compile-time if possible.
##      # Only string literals can convert to unicode string at compile-time,
##      # otherwise it is just `+$`.
##
##    macro T(s: string): mstring|wstring
##      # Generate wstring or mstring depend on conditional symbol: useWinAnsi.
##      # For example: (this code works under both unicode and ansi mode)
##
##        MessageBox(0, T"hello, world", T"Nim is Powerful 中文測試", 0)
##
##    template T(n: Natural): mstring|wstring
##      # Generate wstring or mstring buffer depend on conditional symbol: useWinAnsi.
##      # Use `&` to get the buffer address and then pass to Windows API.
##
##    converter winstrConverter(s: SomeString): SomeString
##      # With these converters, pass string to Windows API is more easy.
##      #   Following converters don't need encoding conversion:
##      #     string => LPSTR (built-in)|ptr char
##      #     mstring => LPSTR|ptr char
##      #     wstring => LPWSTR|BSTR
##      #     cstring => ptr char
##      #     (ptr) char array => LPSTR|ptr char
##      #     (ptr) WCHAR array => LPWSTR
##      #     BSTR => LPWSTR
##      #
##      #   Some converters DO need encoding conversion (utf8 to unicode).
##      #   New memory block will be allocated. However, they are useful and convenience.
##      #     cstring|string => LPWSTR|BSTR
##      #
##      # Winim don't use built-in WideCString, but still support it by converter.
##      #   WideCString => LPWSTR
##      #   WideCString => wstring
##      #   wstring => WideCString
##
##  There are also new string functions to deal with wstring and mstring just like built-in string type.
##
##  .. code-block:: Nim
##    proc newWString(s: string|cstring|mstring): wstring
##      # Convert string to wstring and return it
##    proc newMString(s: string|cstring|wstring): mstring
##      # Convert string to mstring and return it
##    proc newWString(len: Natural): wstring
##      # Generate wstring buffer
##    proc newMString(len: Natural): mstring
##      # Generate mstring buffer
##
##    proc setLen(s: var mstring|var wstring, newLen: Natural)
##    proc substr(s: wstring|mstring, first = 0): wstring|mstring
##    proc substr(s: wstring|mstring, first, last: int): wstring|mstring
##    proc len(s: wstring|mstring): int
##    proc high(s: wstring|mstring): int
##    proc low(s: wstring|mstring): int
##    proc repr(s: wstring|mstring): string
##    proc toHex(s: wstring|mstring): string
##
##    proc `[]`(s: wstring|mstring, i: int): WCHAR|mstring
##    proc `[]=`(s: wstring|mstring, i: int, u: WCHAR|CHAR)
##    proc `[]=`(s: wstring|mstring, i: int, u: wstring|mstring)
##    proc `[]`(s: wstring|mstring, x: HSlice)
##    proc `[]=`(s: var wstring|var mstring, x: HSlice[int], b: wstring|mstring)
##    proc `==`(x, y: wstring|mstring): bool
##    proc `<=`(x, y: wstring|mstring): bool
##    proc `<`(x, y: wstring|mstring): bool
##    proc cmp(x, y: wstring|mstring): int
##    proc `&`(s: wstring|mstring, t: wstring|mstring): wstring|mstring
##
##    iterator items(s: wstring|mstring): WCHAR|mstring
##    iterator mitems(s: var wstring): WCHAR
##    iterator pairs(s: wstring|mstring): tuple[key: int, val: WCHAR|mstring]
##    iterator mpairs(s: var wstring): WCHAR

{.deadCodeElim: on.}

import macros, strutils, inc/[winimbase, windef]
export strutils.toHex, winimbase

# generate from winimx (avoid importing objbase everytime)
const
  CP_ACP = 0
  CP_UTF8 = 65001

proc lstrlenA(lpString: LPCSTR): int32 {.winapi, stdcall, dynlib: "kernel32", importc.}
proc lstrlenW(lpString: LPCWSTR): int32 {.winapi, stdcall, dynlib: "kernel32", importc.}
proc MultiByteToWideChar(CodePage: UINT, dwFlags: DWORD, lpMultiByteStr: LPCCH, cbMultiByte: int32, lpWideCharStr: LPWSTR, cchWideChar: int32): int32 {.winapi, stdcall, dynlib: "kernel32", importc.}
proc WideCharToMultiByte(CodePage: UINT, dwFlags: DWORD, lpWideCharStr: LPCWCH, cchWideChar: int32, lpMultiByteStr: LPSTR, cbMultiByte: int32, lpDefaultChar: LPCCH, lpUsedDefaultChar: LPBOOL): int32 {.winapi, stdcall, dynlib: "kernel32", importc.}
proc SysStringLen(P1: BSTR): UINT {.winapi, stdcall, dynlib: "oleaut32", importc.}

# copy from widestrs.nim, these functions used at both compile-time and run-time
# use WCHAR instead of Utf16Char

const
  UNI_REPLACEMENT_CHAR = WCHAR(0xFFFD'u16)
  UNI_MAX_BMP = 0x0000FFFF
  UNI_MAX_UTF16 = 0x0010FFFF

  halfShift = 10
  halfBase = 0x0010000
  halfMask = 0x3FF

  UNI_SUR_HIGH_START = 0xD800
  UNI_SUR_LOW_START = 0xDC00
  UNI_SUR_LOW_END = 0xDFFF

template ones(n: untyped): untyped = ((1 shl n)-1)

template fastRuneAt(s: cstring, i: int, result: untyped, doInc = true) =
  bind ones

  if ord(s[i]) <=% 127:
    result = ord(s[i])
    when doInc: inc(i)
  elif ord(s[i]) shr 5 == 0b110:
    result = (ord(s[i]) and (ones(5))) shl 6 or (ord(s[i+1]) and ones(6))
    when doInc: inc(i, 2)
  elif ord(s[i]) shr 4 == 0b1110:
    result = (ord(s[i]) and ones(4)) shl 12 or
             (ord(s[i+1]) and ones(6)) shl 6 or
             (ord(s[i+2]) and ones(6))
    when doInc: inc(i, 3)
  elif ord(s[i]) shr 3 == 0b11110:
    result = (ord(s[i]) and ones(3)) shl 18 or
             (ord(s[i+1]) and ones(6)) shl 12 or
             (ord(s[i+2]) and ones(6)) shl 6 or
             (ord(s[i+3]) and ones(6))
    when doInc: inc(i, 4)
  else:
    result = 0xFFFD
    when doInc: inc(i)

iterator runes(s: cstring, L: int): int =
  var
    i = 0
    result: int
  while i < L:
    fastRuneAt(s, i, result, true)
    yield result

iterator WCHARs(source: cstring, L: int): WCHAR =
  for ch in runes(source, L):
    if ch <=% UNI_MAX_BMP:
      if ch >=% UNI_SUR_HIGH_START and ch <=% UNI_SUR_LOW_END:
        yield UNI_REPLACEMENT_CHAR
      else:
        yield WCHAR(ch)
    elif ch >% UNI_MAX_UTF16:
      yield UNI_REPLACEMENT_CHAR
    else:
      let ch = ch -% halfBase
      yield WCHAR((ch shr halfShift) +% UNI_SUR_HIGH_START)
      yield WCHAR((ch and halfMask) +% UNI_SUR_LOW_START)

# helper functions

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

proc toHex*(s: cstring): string {.inline.} =
  ## Converts a cstring to its hexadecimal representation.
  ## No prefix like ``0x`` is generated.
  result = toHex($s)

proc `&`[I, T](a: array[I, T]|var array[I, T]): ptr array[I, T] {.inline.} =
  result = a.unsafeaddr

converter NaturalToInt32(x: Natural): int32 = int32 x

# new string types

type
  # for wstring, always add extra null wchar to ensure null-terminated.

  wstring* = distinct string ## New string type to store unicode string.
  mstring* = distinct string ## New string type to store ansi(MBCS) string.

  mIndex* = distinct int
    ## Use mIndex in substr, [] or []= for mstring means
    ## index by MBCS characters, not by bytes.

template raw(s: wstring, L: Natural): var WCHAR =
  cast[ptr WCHAR](unsafeaddr(string(s)[L * 2]))[]

template `^^`(s, i: untyped): untyped =
  (when i is BackwardsIndex: s.len - int(i) else: int(i))

proc newWString*(L: Natural): wstring = wstring(newString((L + 1) * 2))
  ## Returns a new wstring of length L.

proc newMString*(L: Natural): mstring = mstring(newString(L))
  ## Returns a new mstring of length L.

proc len*(s: wstring): int {.inline.} = max(string(s).len div 2 - 1, 0)
  ## Returns the length of a wstring.

proc len*(s: mstring): int {.inline.} = string(s).len
  ## Returns the length of a mstring.

proc newWStringOfCap*(L: Natural): wstring =
  ## Returns a new wstring of length 0 but with capacity L.
  result = wstring(newStringOfCap((L + 1) * 2))
  string(result).add "\0\0"

proc newMStringOfCap*(L: Natural): mstring =
  ## Returns a new mstring of length 0 but with capacity L.
  result = mstring(newStringOfCap(L))

proc setLen*(s: var wstring, L: Natural) {.inline.} =
  ## Sets the length of wstring s to L.
  setLen(string(s), (L + 1) * 2)
  s.raw(s.len) = 0

proc setLen*(s: var mstring, L: Natural) {.inline.} =
  ## Sets the length of mstring s to L.
  setLen(string(s), L)

proc `&`*(s: string): ptr char {.inline.} =
  ## Get address of the first char of a string.
  if s.len == 0:
    result = cast[ptr char](cstring "\0\0")
  else:
    result = cast[ptr char](cstring s)

proc `&`*(s: cstring): ptr char {.inline.} =
  ## Get address of the first char of a cstring.
  result = cast[ptr char](s)

proc `&`*(s: wstring): ptr WCHAR {.inline.} =
  ## Get address of the first WCHAR of a wstring.
  result = cast[ptr WCHAR](&(string(s)))

proc `&`*(s: mstring): ptr char {.inline.} =
  ## Get address of the first char of a mstring.
  result = &(string(s))

proc `UTF8->wstring`(source: ptr char, L: Natural): wstring =
  if not source.isNil:
    var wLen = MultiByteToWideChar(CP_UTF8, 0, source, L, nil, 0)
    result = newWString(wLen)
    discard MultiByteToWideChar(CP_UTF8, 0, source, L, &result, wLen)

proc `ANSI->wstring`(source: ptr char, L: Natural): wstring =
  if not source.isNil:
    var wLen = MultiByteToWideChar(CP_ACP, 0, source, L, nil, 0)
    result = newWString(wLen)
    discard MultiByteToWideChar(CP_ACP, 0, source, L, &result, wLen)

proc `UNICODE->wstring`(source: ptr WCHAR, L: Natural): wstring =
  if not source.isNil:
    result = newWString(L)
    copyMem(&result, source, L * 2)

proc `UTF8->mstring`(source: ptr char, L: Natural): mstring =
  if not source.isNil:
    var wLen = MultiByteToWideChar(CP_UTF8, 0, source, L, nil, 0)
    var buffer = cast[ptr WCHAR](alloc(wLen * 2))
    if not buffer.isNil:
      discard MultiByteToWideChar(CP_UTF8, 0, source, L, buffer, wLen)

      var mLen = WideCharToMultiByte(CP_ACP, 0, buffer, wLen, nil, 0, nil, nil)
      result = newMString(mLen)
      discard WideCharToMultiByte(CP_ACP, 0, buffer, wLen, &result, mLen, nil, nil)
      dealloc(buffer)

proc `ANSI->mstring`(source: ptr char, L: Natural): mstring =
  if not source.isNil:
    result = newMString(L)
    copyMem(&result, source, L)

proc `UNICODE->mstring`(source: ptr WCHAR, L: Natural): mstring =
  if not source.isNil:
    var mLen = WideCharToMultiByte(CP_ACP, 0, source, L, nil, 0, nil, nil)
    result = newMString(mLen)
    discard WideCharToMultiByte(CP_ACP, 0, source, L, &result, mLen, nil, nil)

proc `UTF8->string`(source: ptr char, L: Natural): string =
  if not source.isNil:
    result = newString(L)
    copyMem(&result, source, L)

proc `ANSI->string`(source: ptr char, L: Natural): string =
  if not source.isNil:
    var wLen = MultiByteToWideChar(CP_ACP, 0, source, L, nil, 0)
    var buffer = cast[ptr WCHAR](alloc(wLen * 2))
    if not buffer.isNil:
      discard MultiByteToWideChar(CP_ACP, 0, source, L, buffer, wLen)

      var mLen = WideCharToMultiByte(CP_UTF8, 0, buffer, wLen, nil, 0, nil, nil)
      result = newString(mLen)
      discard WideCharToMultiByte(CP_UTF8, 0, buffer, wLen, &result, mLen, nil, nil)
      dealloc(buffer)

proc `UNICODE->string`(source: ptr WCHAR, L: Natural): string =
  if not source.isNil:
    var mLen = WideCharToMultiByte(CP_UTF8, 0, source, L, nil, 0, nil, nil)
    result = newString(mLen)
    discard WideCharToMultiByte(CP_UTF8, 0, source, L, &result, mLen, nil, nil)

# wstring functions

proc high*(s: wstring): int {.inline.} = s.len - 1
proc low*(s: wstring): int {.inline.} = 0
proc cmp*(x, y: wstring): int {.borrow.}
proc `==`*(x, y: wstring): bool {.borrow.}
proc `<=` *(x, y: wstring): bool {.borrow.}
proc `<` *(x, y: wstring): bool {.borrow.}

proc substr*(s: wstring, first, last: int): wstring =
  result = wstring(string(s).substr(first * 2, last * 2 + 3))
  if result.len != 0:
    result.raw(result.len) = 0

  else:
    result = newWString(0)

proc substr*(s: wstring, first = 0): wstring {.inline.} =
  result = s.substr(first, s.high)

proc `[]`*(s: wstring, i: int): WCHAR {.inline.} =
  when compileOption("boundChecks"):
    if i >= s.len:
      raise newException(IndexError, "index out of bounds")

  result = s.raw(i)

proc `[]=`*(s: var wstring, i: int, c: WCHAR|char) {.inline.} =
  when compileOption("boundChecks"):
    if i >= s.len:
      raise newException(IndexError, "index out of bounds")

  s.raw(i) = WCHAR c

proc `[]`*[T, U](s: wstring, x: HSlice[T, U]): wstring =
  let a = s ^^ x.a
  let L = (s ^^ x.b) - a + 1
  when compileOption("boundChecks"):
    if a < 0 or a + L > s.len:
      raise newException(IndexError, "index out of bounds")
  result = s.substr(a, a + L-1)

proc `[]=`*[T, U](s: var wstring, x: HSlice[T, U], b: wstring) =
  let a = s ^^ x.a
  let L = (s ^^ x.b) - a + 1
  if L == b.len:
    for i in 0 ..< L: s[i+a] = b[i]
  else:
    var slen = s.len
    var shift = b.len - L
    var newLen = slen + shift
    if shift > 0:
      setLen(s, newLen)
      for i in countdown(newLen-1, a+shift+1): s[i] = s[i-shift]
    else:
      for i in countup(a+b.len, s.len-1+shift): s[i] = s[i-shift]
      setLen(s, newLen)
    for i in 0 ..< b.len: s[i+a] = b[i]

    s.raw(s.len) = 0

proc `[]=`*(s: var wstring, i: int, u: wstring) =
  when compileOption("boundChecks"):
    if i >= s.len:
      raise newException(IndexError, "index out of bounds")

  if u.len == 0:
    s[i] = 0

  else:
    s[i] = u[0]

proc add*(s: var wstring, c: char|WCHAR) =
  s.raw(s.len) = WCHAR c
  string(s).add "\0\0"

proc add*(s: var wstring, i: wstring) =
  setLen(string(s), string(s).len - 2)
  string(s).add(string(i))

proc `&`*(x: wstring, c: WCHAR|char): wstring {.inline.} =
  result = x
  result.add c

proc `&`*(x, y: wstring): wstring {.inline.} =
  result = x
  result.add y

proc toHex*(s: wstring): string {.inline.} =
  ## Converts a wstring to its hexadecimal representation.
  ## No prefix like ``0x`` is generated.
  result = toHex(&s, s.len * 2)

iterator items*(s: wstring): WCHAR =
  var i = 0
  while i < s.len:
    yield s.raw(i)
    inc i

iterator mitems*(s: var wstring): var WCHAR =
  var i = 0
  while i < s.len:
    yield s.raw(i)
    inc i

iterator pairs*(s: wstring): tuple[key: int, val: WCHAR] =
  var i = 0
  while i < s.len:
    yield (i, s.raw(i))
    inc i

iterator mpairs*(s: var wstring): tuple[key: int, val: var WCHAR] =
  var i = 0
  while i < s.len:
    yield (i, s.raw(i))
    inc i

proc repr*(s: wstring): string =
  result = $cast[int](&s).tohex & "(wstring)\""
  if s.len != 0:
    for w in s:
      if w == 0:
        result.add "\\0"

      else:
        result.add `UNICODE->string`(w.unsafeaddr, 1)

  result.add  "\""

# mstring functions

proc mlen*(s: mstring): int =
  ## Returns the length of the mstring, counting by MBCS characters.
  result = int MultiByteToWideChar(CP_ACP, 0, &s, int32 s.len, nil, 0)

proc high*(s: mstring): int {.borrow.}
proc low*(s: mstring): int {.borrow.}
proc cmp*(x, y: mstring): int {.borrow.}
proc `==`*(x, y: mstring): bool {.borrow.}
proc `<=` *(x, y: mstring): bool {.borrow.}
proc `<` *(x, y: mstring): bool {.borrow.}
proc substr*(s: mstring, first, last: int): mstring {.borrow.}
proc substr*(s: mstring, first = 0): mstring {.borrow.}

proc `[]`*(s: mstring, i: int): char {.inline.} = string(s)[i]
proc `[]=`*(s: var mstring, i: int, x: char) {.inline.} = string(s)[i] = x

proc substr*(s: mstring, first, last: mIndex): mstring =
  var ws = `ANSI->wstring`(&s, s.len)
  ws = ws.substr(int first, int last)
  result = `UNICODE->mstring`(&ws, ws.len)

proc substr*(s: mstring, first: mIndex = 0.mIndex): mstring =
  var ws = `ANSI->wstring`(&s, s.len)
  ws = ws.substr(int first)
  result = `UNICODE->mstring`(&ws, ws.len)

proc `[]`*(s: mstring, i: mIndex): mstring =
  let ws = `ANSI->wstring`(&s, s.len)
  var wchar = ws[int i]
  result = `UNICODE->mstring`(addr wchar, 1)

proc `[]=`*(s: var mstring, i: mIndex, u: mstring) =
  var ws = `ANSI->wstring`(&s, s.len)
  let wu = `ANSI->wstring`(&u, u.len)

  if wu.len == 0:
    ws[int i] = 0

  else:
    ws[int i] = wu[0]

  s = `UNICODE->mstring`(&ws, ws.len)

proc `[]`*[T, U](s: mstring, x: HSlice[T, U]): mstring =
  when T is mIndex or U is mIndex:
    var ws = `[]`(`ANSI->wstring`(&s, s.len), x)
    result = `UNICODE->mstring`(&ws, ws.len)

  else:
    result = mstring(`[]`(string(s), x))

proc `[]=`*[T, U](s: var mstring, x: HSlice[T, U], u: mstring) =
  when T is mIndex or U is mIndex:
    var ws = `ANSI->wstring`(&s, s.len)
    `[]=`(ws, x, `ANSI->wstring`(&u, u.len))
    s = `UNICODE->mstring`(&ws, ws.len)
  else:
    `[]=`(string(s), x, string(u))

proc add*(x: var mstring, y: char) {.borrow.}
proc add*(x: var mstring, y: string) {.borrow.}
proc add*(x: var mstring, y: mstring) {.borrow.}

proc `&`* (x: mstring, y: char): mstring {.borrow.}
proc `&`* (x, y: mstring): mstring {.borrow.}
proc `&`* (x: char, y: mstring): mstring {.borrow.}

proc toHex*(s: mstring): string {.inline.} =
  ## Converts a mstring to its hexadecimal representation.
  ## No prefix like ``0x`` is generated.
  result = toHex(&s, s.len)

iterator items*(s: mstring): mstring =
  var ws = `ANSI->wstring`(&s, s.len)
  for wchar in ws.mitems:
    yield `UNICODE->mstring`(addr wchar, 1)

iterator pairs*(s: mstring): tuple[key: int, val: mstring] =
  var ws = `ANSI->wstring`(&s, s.len)
  for i, wchar in ws.mpairs:
    yield (i, `UNICODE->mstring`(addr wchar, 1))

proc repr*(s: mstring): string =
  result = $cast[int](&s).tohex & "(mstring)\""
  if s.len != 0:
    for m in s:
      if m[0]  == '\0':
        result.add "\\0"

      else:
        result.add `ANSI->string`(&m, m.len)

  result &= "\""

# conversion functions

proc `$`*(s: wstring|mstring|LPWSTR|BSTR): string {.inline.} =
  ## Convert any stringable type to string.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.
  when s is wstring:
    `UNICODE->string`(&s, s.len)
  elif s is mstring:
    `ANSI->string`(&s, s.len)
  elif s is LPWSTR:
    `UNICODE->string`(s, lstrlenW(s))
  elif s is BSTR:
    `UNICODE->string`(s, int SysStringLen(s))

proc `%$`*[I](a: array[I, char]|array[I, WCHAR]): string {.inline.} =
  ## Convert any stringable type to string.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.
  ## *`$` for array cause ambiguous call since 0.2.0, use %$ instead*
  when a is array[I, char]:
    `UTF8->string`(&a, a.len)
  elif a is array[I, WCHAR]:
    `UNICODE->string`(&a, a.len)

proc `$`*[I](a: ptr array[I, char]|ptr array[I, WCHAR]): string {.inline.} =
  ## Convert any stringable type to string.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.
  when a is ptr array[I, char]:
    `UTF8->string`(cast[ptr char](a), a[].len)
  elif a is ptr array[I, WCHAR]:
    `UNICODE->string`(cast[ptr WCHAR](a), a[].len)

proc `+$`*(s: string|cstring|ptr char|wstring|mstring|LPWSTR|BSTR|char|WCHAR): wstring {.inline.} =
  ## Convert any stringable type to wstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.
  when s is string:
    `UTF8->wstring`(&s, s.len)
  elif s is cstring|ptr char:
    `UTF8->wstring`(&s, cast[cstring](s).len)
  elif s is mstring:
    `ANSI->wstring`(&s, s.len)
  elif s is wstring:
    s
  elif s is LPWSTR:
    `UNICODE->wstring`(s, lstrlenW(s))
  elif s is BSTR:
    `UNICODE->wstring`(s, int SysStringLen(s))
  elif s is char|WCHAR:
    var wchar = s.WCHAR
    `UNICODE->wstring`(wchar.addr, 1)

proc `+$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): wstring {.inline.} =
  ## Convert any stringable type to wstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.
  when a is array[I, char]:
    `UTF8->wstring`(&a, a.len)
  elif a is array[I, WCHAR]:
    `UNICODE->wstring`(&a, a.len)
  elif a is ptr array[I, char]:
    `UTF8->wstring`(cast[ptr char](a), a[].len)
  elif a is ptr array[I, WCHAR]:
    `UNICODE->wstring`(cast[ptr WCHAR](a), a[].len)

proc `-$`*(s: string|cstring|ptr char|wstring|mstring|LPWSTR|BSTR|char|WCHAR): mstring {.inline.} =
  ## Convert any stringable type to mstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.
  when s is string:
    `UTF8->mstring`(&s, s.len)
  elif s is cstring|ptr char:
    `UTF8->mstring`(&s, cast[cstring](s).len)
  elif s is wstring:
    `UNICODE->mstring`(&s, s.len)
  elif s is mstring:
    s
  elif s is LPWSTR:
    `UNICODE->mstring`(s, lstrlenW(s))
  elif s is BSTR:
    `UNICODE->mstring`(s, int SysStringLen(s))
  elif s is char:
    var c = s
    `ANSI->mstring`(c.addr, 1)
  elif s is WCHAR:
    var c = s
    `UNICODE->mstring`(c.addr, 1)

proc `-$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): mstring {.inline.} =
  ## Convert any stringable type to mstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.
  when a is array[I, char]:
    `UTF8->mstring`(&a, a.len)
  elif a is array[I, WCHAR]:
    `UNICODE->mstring`(&a, a.len)
  elif a is ptr array[I, char]:
    `UTF8->mstring`(cast[ptr char](a), a[].len)
  elif a is ptr array[I, WCHAR]:
    `UNICODE->mstring`(cast[ptr WCHAR](a), a[].len)

proc `$$`*(s: string|cstring|ptr char|wstring|mstring|LPWSTR|BSTR|char|WCHAR): string {.inline.} =
  ## Convert any stringable type to string.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.
  when s is string:
    `ANSI->string`(&s, s.len)
  elif s is cstring|ptr char:
    `ANSI->string`(&s, cast[cstring](s).len)
  elif s is WCHAR:
    var c = s
    `UNICODE->string`(c.addr, 1)
  else:
    $s

proc `$$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): string {.inline.} =
  ## Convert any stringable type to string.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.
  when a is array[I, char]:
    `ANSI->string`(&a, a.len)
  elif a is ptr array[I, char]:
    `ANSI->string`(cast[ptr char](a), a[].len)
  else:
    $a

proc `+$$`*(s: string|cstring|ptr char|wstring|mstring|LPWSTR|BSTR|char|WCHAR): wstring {.inline.} =
  ## Convert any stringable type to wstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.
  when s is string:
    `ANSI->wstring`(&s, s.len)
  elif s is cstring|ptr char:
    `ANSI->wstring`(&s, cast[cstring](s).len)
  else:
    +$s

proc `+$$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): wstring {.inline.} =
  ## Convert any stringable type to wstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.
  when a is array[I, char]:
    `ANSI->wstring`(&a, a.len)
  elif a is ptr array[I, char]:
    `ANSI->wstring`(cast[ptr char](a), a[].len)
  else:
    +$a

proc `-$$`*(s: string|cstring|ptr char|wstring|mstring|LPWSTR|BSTR|char|WCHAR): mstring {.inline.} =
  ## Convert any stringable type to mstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.
  when s is string:
    `ANSI->mstring`(&s, s.len)
  elif s is cstring|ptr char:
    `ANSI->mstring`(&s, cast[cstring](s).len)
  else:
    -$s

proc `-$$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): mstring {.inline.} =
  ## Convert any stringable type to mstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.
  when a is array[I, char]:
    `ANSI->mstring`(&a, a.len)
  elif a is ptr array[I, char]:
    `ANSI->mstring`(cast[ptr char](a), a[].len)
  else:
    -$a

proc nullTerminate*(s: var string) {.inline.} =
  ## Assume a string is null terminated and set the correct length.
  let L = lstrlenA(cast[LPCSTR](&s))
  if L < s.len:
    s.setLen(L)

proc nullTerminate*(s: var mstring) {.inline.} =
  ## Assume a string is null terminated and set the correct length.

  # why not use generics? because there is a bug about var string|string in generics version
  # setLen there will complain s is "string" not var "string"
  nullTerminate(string(s))

proc nullTerminate*(s: var wstring) {.inline.} =
  ## Assume a string is null terminated and set the correct length.
  let L = lstrlenW(cast[LPWSTR](&s))
  if L < s.len:
    s.setLen(L)

proc nullTerminated*[T: string|mstring|wstring](s: T): T {.inline.} =
  ## Assume a string is null terminated and return the length-corrected string.
  result = s
  result.nullTerminate

proc fillArray[I, T: char|byte|WCHAR](a: ptr array[I, T]|var array[I, T], s: mstring|string|wstring, inclNull = false) =
  when T is WCHAR and s is not wstring:
    {.fatal: "type mismatch".}

  when a is ptr:
    for i in a[].low..min(a[].high, s.len-1):
      a[i] = cast[T](s[i])

    if inclNull and a[].high >= s.len:
      a[s.len] = cast[T](0)

    # fill as much as possible before raise an exception
    if (not inclNull and a[].high < s.len-1) or (inclNull and a[].high < s.len):
      raise newException(IndexError, "string length too long")

  else:
    fillArray(a.unsafeaddr, s, inclNull)

proc fillPtr[T: char|byte|WCHAR](p: ptr T, s: mstring|string|wstring, inclNull = false) =
  when T is WCHAR and s is not wstring:
    {.fatal: "type mismatch".}

  for i in 0..<s.len:
    cast[ptr T](cast[int](p) + i*sizeof(T))[] = cast[T](s[i])

  if inclNull:
    cast[ptr T](cast[int](p) + s.len*sizeof(T))[] = cast[T](0)

proc fillStr[I, T: char|byte|WCHAR](s: var mstring|var string|var wstring, a: ptr array[I, T]|array[I, T]) =
  when T is WCHAR and s is not wstring:
    {.fatal: "type mismatch".}

  when a is ptr:
    var p = cast[a.type](cast[int](&s) + a[].low*sizeof(T))
    for i in a[].low..min(a[].high, s.len-1):
      p[i] = a[i]

    # fill as much as possible before raise an exception
    if a[].high > s.len - 1:
      raise newException(IndexError, "string length too short")

  else:
    fillStr(s, a.unsafeaddr)


template `<<`*[I, T: char|byte](a: ptr array[I, T]|var array[I, T], s: mstring|string) =
  ## Fill buffer by string.
  fillArray(a, s, inclNull=false)

template `<<<`*[I, T: char|byte](a: ptr array[I, T]|var array[I, T], s: mstring|string) =
  ## Fill buffer by string, include a null
  fillArray(a, s, inclNull=true)

template `<<`*[I, T: WCHAR](a: ptr array[I, T]|var array[I, T], s: wstring) =
  ## Fill buffer by string.
  fillArray(a, s, inclNull=false)

template `<<<`*[I, T: WCHAR](a: ptr array[I, T]|var array[I, T], s: wstring) =
  ## Fill buffer by string, include a null
  fillArray(a, s, inclNull=true)

template `<<`*(p: ptr char|ptr byte|cstring, s: mstring|string) =
  ## Fill buffer by string.
  fillPtr(cast[ptr char](p), s, inclNull=false)

template `<<<`*(p: ptr char|byte|cstring, s: mstring|string) =
  ## Fill buffer by string, include a null
  fillPtr(cast[ptr char](p), s, inclNull=true)

template `<<`*(p: ptr WCHAR, s: wstring) =
  ## Fill buffer by string.
  fillPtr(p, s, inclNull=false)

template `<<<`*(p: ptr WCHAR, s: wstring) =
  ## Fill buffer by string, include a null
  fillPtr(p, s, inclNull=true)

template `<<`*[I, T: char|byte](s: var mstring|var string, a: ptr array[I, T]|array[I, T]) =
  ## Fill string by buffer.
  fillStr(s, a)

template `<<`*[I, T: WCHAR](s: var wstring, a: ptr array[I, T]|var array[I, T]) =
  ## Fill string by buffer.
  fillStr(s, a)

template `>>`*(a: typed, b: typed) =
  b << a

template `>>>`*(a: typed, b: typed) =
  b <<< a

# generics has problems on converters, define one by one

converter winstrConverterWStringToLPWSTR*(x: wstring): LPWSTR = cast[LPWSTR](&x)
converter winstrConverterWStringToBSTR*(x: wstring): BSTR = cast[BSTR](&x)
converter winstrConverterBSTRToLPWSTR*(x: BSTR): LPWSTR = cast[LPWSTR](x)

converter winstrConverterStringToPtrChar*(x: string): ptr char = cast[ptr char](&x)
converter winstrConverterCStringToPtrChar*(x: cstring): ptr char = cast[ptr char](x)
converter winstrConverterMStringToPtrChar*(x: mstring): ptr char = cast[ptr char](&x)
converter winstrConverterMStringToLPSTR*(x: mstring): LPSTR = cast[LPSTR](&x)

converter winstrConverterArrayToLPSTR*[I, T: char](x: array[I, T]): LPSTR = cast[LPSTR](x.unsafeaddr)
converter winstrConverterPtrArrayToLPSTR*[I, T: char](x: ptr array[I, T]): LPSTR = cast[LPSTR](x)

converter winstrConverterArrayToPtrChar*[I, T: char](x: array[I, T]): ptr char = cast[ptr char](x.unsafeaddr)
converter winstrConverterPtrArrayToPtrChar*[I, T: char](x: ptr array[I, T]): ptr char = cast[ptr char](x)

converter winstrConverterArrayToLPWSTR*[I, T: WCHAR](x: array[I, T]): LPWSTR = cast[LPWSTR](x.unsafeaddr)
converter winstrConverterPtrArrayToLPWSTR*[I, T: WCHAR](x: ptr array[I, T]): LPWSTR = cast[LPWSTR](x)

# when declared(WideCStringObj):
#   converter winstrConverterWideCStringToObj*(x: WideCString): WideCStringObj = WideCStringObj(x)
#   converter winstrConverterObjToWideCString*(x: WideCStringObj): WideCString = WideCString(x)

# else:
#   converter winstrConverterWideCStringToLPWSTR*(x: WideCString): LPWSTR = cast[LPWSTR](x[0].unsafeaddr)
#   converter winstrConverterWideCStringToWString*(x: WideCString): wstring = +$cast[LPWSTR](x[0].unsafeaddr)
  # converter winstrConverterWStringToWideCString*(x: wstring): WideCString = newWString()
when defined(nimv2):
  converter winstrConverterWideCStringToLPWSTR*(x: WideCStringObj): LPWSTR = cast[LPWSTR](x[0].unsafeaddr)
  converter winstrConverterWideCStringToWString*(x: WideCStringObj): wstring = +$cast[LPWSTR](x[0].unsafeaddr)
  converter winstrConverterWStringToWideCString*(x: wstring): WideCStringObj = newWideCString($x)

else:
  converter winstrConverterWideCStringToLPWSTR*(x: WideCString): LPWSTR = cast[LPWSTR](x[0].unsafeaddr)
  converter winstrConverterWideCStringToWString*(x: WideCString): wstring = +$cast[LPWSTR](x[0].unsafeaddr)
  converter winstrConverterWStringToWideCString*(x: wstring): WideCString = newWideCString($x)

when defined(nimv2):
  # Here is the workaround for --gc:arc and --newruntime. It is a tricky problem,
  # wstring needs to be alive until converter ending so that the windows API can
  # use the pointer later. This trick works for now, but I don't know is it
  # reliable in newer version of compiler. The worst situation is that every
  # string in winim needs to be generated by T() template.

  converter winstrConverterStringToLPWSTR*(x: string): LPWSTR =
    var ws = +$x
    result = (cast[LPWSTR](&ws), ws)[0]

  converter winstrConverterCStringToLPWSTR*(x: cstring): LPWSTR =
    var ws = +$x
    result = (cast[LPWSTR](&ws), ws)[0]

  converter winstrConverterStringToBSTR*(x: string): BSTR =
    var ws = +$x
    result = (cast[BSTR](&ws), ws)[0]

  converter winstrConverterCStringToBSTR*(x: cstring): BSTR =
    var ws = +$x
    result = (cast[BSTR](&ws), ws)[0]

else:
  converter winstrConverterStringToLPWSTR*(x: string): LPWSTR = cast[LPWSTR](&(+$x))
  converter winstrConverterCStringToLPWSTR*(x: cstring): LPWSTR = cast[LPWSTR](&(+$x))
  converter winstrConverterStringToBSTR*(x: string): BSTR = cast[BSTR](&(+$x))
  converter winstrConverterCStringToBSTR*(x: cstring): BSTR = cast[BSTR](&(+$x))


proc newWString*(s: cstring|string|mstring): wstring {.inline.} =
  ## Return a new wstring.
  result = +$s

proc newMString*(s: string|cstring|wstring): mstring {.inline.} =
  ## Return a new mstring.
  result = -$s

macro L*(x: static[string]): untyped =
  ## Generate static wstring at compile-time for static string.

  # Use static here can force some string generated at compiling time.
  # for example:
  #  const s = "abc"
  #  echo L(s.replace("a", ""))

  if x.len == 0:
    result = prefix(newStrLitNode(""), "+$")
  else:
    var node = newNimNode(nnkBracket)
    for u in WCHARs(x, x.len):
      node.add(newDotExpr(newIntLitNode(u.int), newIdentNode("WCHAR")))

    result = prefix(node, "+$")

template L*(x: string): untyped = +$x
  ## Same as +$ for dynamic string.

template T*(x: string): untyped =
  ## Generate wstring or mstring depend on conditional symbol: useWinAnsi.
  # must export winimbase to use winimAnsi here.
  when winimAnsi:
    -$x
  else:
    L(x)

template T*(x: Natural): untyped =
  ## Generate wstring or mstring buffer depend on conditional symbol: useWinAnsi.
  ## Use `&` to get the buffer address and then pass to Windows API.
  when winimAnsi:
    newMString(x)
  else:
    newWString(x)

when winimAnsi:
  type
    TString* = mstring ## *wstring* or *mstring* depend on conditional symbol: useWinAnsi.
else:
  type
    TString* = wstring ## *wstring* or *mstring* depend on conditional symbol: useWinAnsi.

when isMainModule:

  let str = "the quick brown fox jumps over the lazy dog"
  echo +$str == L"the quick brown fox jumps over the lazy dog"
