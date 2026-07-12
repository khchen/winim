#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#                Windows String Type Utilities
#
#====================================================================

##  This module contains new string types and utilities for dealing with Windows strings.
##  The Windows SDK uses the following types to represent a character or string:
##
##  .. code-block:: Nim
##    type
##      CHAR = char
##      WCHAR = uint16
##      LPSTR|LPCSTR = ptr CHAR # however, it should be an ANSI string, not a UTF-8 string
##      LPWSTR|LPCWSTR = ptr WCHAR
##      BSTR = distinct ptr WCHAR # BSTR is not binary compatible with LPWSTR
##      (ptr) array[I, CHAR] # sometimes a string is defined as array[1, CHAR], but not necessarily only one character
##      (ptr) array[I, WCHAR] # sometimes a string is defined as array[1, WCHAR], but not necessarily only one wide character
##
##  By default, Nim's string type uses UTF-8 encoding.
##  However, Windows uses wide-character strings (a.k.a. Unicode strings) or multibyte-character strings
##  (a.k.a. ANSI strings). Therefore, this module introduces the following string types.
##
##  .. code-block:: Nim
##    type
##      string # Nim's built-in string type, UTF-8 encoded by default; can sometimes be an ANSI string.
##      cstring # compatible with the type char* in ANSI C
##      wstring = distinct string # a new string type to store Unicode strings
##      mstring = distinct string # a new string type to store ANSI strings
##
##  Some type classes are also defined for convenience when dealing with strings.
##
##  .. code-block:: Nim
##    type
##      SomeChar = byte | char | WCHAR
##      SomeString = string | mstring | wstring
##      SomeBuffer[I] = ptr SomeChar | array[I, SomeChar] | ptr array[I, SomeChar] |
##        ptr UncheckedArray[SomeChar] | openArray[SomeChar] | seq[SomeChar]
##      Stringable = SomeChar | SomeString | SomeBuffer | cstring | BSTR
##
##  Here is pseudocode for the most useful functions introduced by this module.
##
##  .. code-block:: Nim
##    proc `&`(s: cstring|string|wstring|mstring): pointer
##      # Get address of the first char of a string.
##      # For string, it has a similar meaning to cstring(s).
##
##    proc `$`(x: Stringable): string
##    proc `+$`(x: Stringable): wstring
##    proc `-$`(x: Stringable): mstring
##      # Convert any stringable type to string, wstring, or mstring.
##      # These operators assume string|cstring|ptr char|openArray[char] are UTF-8-encoded strings.
##      # Use `%$` to treat `openArray[SomeChar]` explicitly as a string.
##
##    proc `$$`(x: Stringable): string
##    proc `+$$`(x: Stringable): wstring
##    proc `-$$`(x: Stringable): mstring
##      # Convert any stringable type to string, wstring, or mstring.
##      # These operators assume string|cstring|ptr char|openArray[char] are ANSI-encoded strings.
##      # For mstring|wstring|LPWSTR etc, these operators are the same as `$`, `+$`, `-$`.
##
##    template `<<`(s: SomeString, b: SomeBuffer)
##    template `<<`(b: SomeBuffer, s: SomeString)
##    template `<<<`(b: SomeBuffer, s: SomeString)
##    template `>>`(a: typed, b: typed) = b << a
##    template `>>>`(a: typed, b: typed) = b <<< a
##      # String << Buffer or Buffer >> String: Fill string by buffer.
##      # Buffer << String or String >> Buffer: Fill buffer by string.
##      # Buffer <<< String or String >>> Buffer: Fill a buffer with a string, including a null terminator.
##
##      # These operators don't convert the encoding (they copy byte by byte).
##      # Please make sure both sides have the same character size.
##      # If the destination does not have length information (e.g. pointer or UncheckedArray),
##      # please make sure the buffer size is large enough.
##
##    proc nullTerminate(s: var SomeString)
##      # Assume a string is null terminated and set the correct length.
##
##    proc nullTerminated[T: SomeString](s: T): T
##      # Assume a string is null terminated and return the length-corrected string.
##
##    template L(s: string): wstring
##      # Generate wstring at compile-time if possible.
##      # Only a const string or string literal can be converted to a Unicode string at compile time;
##      # otherwise it is just `+$`.
##
##    template T(s: string): mstring|wstring
##      # Generate a wstring or mstring depending on the conditional symbol: useWinAnsi.
##      # For example: (this code works under both Unicode and ANSI modes)
##
##        MessageBox(0, T"hello, world", T"Nim is Powerful 中文測試", 0)
##
##    template T(n: Natural): mstring|wstring
##      # Generate a wstring or mstring buffer depending on the conditional symbol: useWinAnsi.
##      # Use `&` to get the buffer address and then pass to Windows API.
##
##    converter winstrConverter(s: SomeString): SomeBuffer
##      # With these converters, passing strings to the Windows API is easier.
##      #   The following converters don't need encoding conversion:
##      #     string => LPSTR|ptr char
##      #     mstring => LPSTR|ptr char
##      #     wstring => LPWSTR|BSTR
##      #     cstring => ptr char
##      #     BSTR => LPWSTR
##      #
##      #   Some converters do need encoding conversion (UTF-8 to Unicode).
##      #   A new memory block will be allocated. However, these converters are useful and convenient.
##      #     cstring|string => LPWSTR|BSTR
##
##  There are also new string functions for dealing with wstring and mstring like the built-in string type.
##
##  .. code-block:: Nim
##    proc newWString(len: Natural): wstring
##      # Generate wstring buffer
##    proc newMString(len: Natural): mstring
##      # Generate mstring buffer
##
##    proc setLen(s: var mstring|wstring, newLen: Natural)
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
##    iterator pairs(s: wstring|mstring): tuple[key: int|mIndex, val: WCHAR|mstring]
##    iterator mpairs(s: var wstring): WCHAR
##
##  Winim doesn't use the built-in `WideCString`, but still supports it.
##
##  .. code-block:: Nim
##    converter winstrConverter(s: WideCString): LPWSTR
##      # WideCString can be sent directly to the Windows API (Unicode only).
##
##    proc `+$`(s: WideCString): wstring
##      # Converts WideCString to wstring.
##
##    proc newWideCString(s: wstring): WideCString
##      # Converts wstring to WideCString.

import std/[hashes, macros, strutils], inc/[winimbase, windef]
export strutils.toHex, winimbase

const
  CP_ACP = 0
  CP_UTF8 = 65001
  BSTRSlotCount = 32

proc lstrlenA(lpString: LPCSTR): int32 {.winapi, stdcall, dynlib: "kernel32", importc.}
proc lstrlenW(lpString: LPCWSTR): int32 {.winapi, stdcall, dynlib: "kernel32", importc.}
proc MultiByteToWideChar(CodePage: UINT, dwFlags: DWORD, lpMultiByteStr: LPCCH, cbMultiByte: int32, lpWideCharStr: LPWSTR, cchWideChar: int32): int32 {.winapi, stdcall, dynlib: "kernel32", importc.}
proc WideCharToMultiByte(CodePage: UINT, dwFlags: DWORD, lpWideCharStr: LPCWCH, cchWideChar: int32, lpMultiByteStr: LPSTR, cbMultiByte: int32, lpDefaultChar: LPCCH, lpUsedDefaultChar: LPBOOL): int32 {.winapi, stdcall, dynlib: "kernel32", importc.}
proc SysStringLen(P1: BSTR): UINT {.winapi, stdcall, dynlib: "oleaut32", importc.}
proc GetLastError(): DWORD {.winapi, stdcall, dynlib: "kernel32", importc.}
proc SetLastError(dwErrCode: DWORD) {.winapi, stdcall, dynlib: "kernel32", importc.}

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
  ## Converts a `cstring` to its hexadecimal representation.
  ## No prefix like ``0x`` is generated.
  result = toHex($s)

when defined(cpu64):
  converter NaturalToInt32(x: Natural): int32 {.inline.} =
    if x > Natural(int32.high):
      raise newException(RangeDefect, "Windows string length exceeds int32.high")
    int32 x

# new string types

type
  # Winstr-created wstrings include an extra null WCHAR. A default-initialized
  # wstring is also a valid logical empty value and is normalized by mutation.

  wstring* = distinct string
    ## New string type to store UTF-16 code units for Windows wide strings.

  mstring* = distinct string
    ## New string type to store multibyte character strings (a.k.a. ANSI strings).

  mIndex* = distinct int
    ## Using `mIndex` with `substr`, `[]`, or `[]=` on an `mstring` means indexing
    ## by MBCS characters, not by bytes.

  SomeChar* = byte | char | WCHAR
    ## Type class matching all char types.

  SomeString* = string | mstring | wstring
    ## Type class matching all string types.

  SomeBuffer*[I] = ptr SomeChar | array[I, SomeChar] | ptr array[I, SomeChar] |
      ptr UncheckedArray[SomeChar] | openArray[SomeChar] | seq[SomeChar]
    ## Type class matching all string buffer types.

  Stringable* = SomeChar | SomeString | SomeBuffer | cstring | BSTR
    ## Type class matching all stringable types.

  BSTRSlots = object
    data: seq[seq[byte]]
    next: int

var temporaryBSTRs {.threadvar.}: BSTRSlots

when defined(gcDestructors):
  const WStringSlotCount = 64

  type WStringSlots = object
    data: seq[wstring]
    next: int

  var temporaryWStrings {.threadvar.}: WStringSlots

template raw(s: wstring, L: Natural): WCHAR =
  cast[ptr WCHAR](unsafeaddr(string(s)[L * 2]))[]

template rawMut(s: var wstring, L: Natural): var WCHAR =
  cast[ptr WCHAR](addr(string(s)[L * 2]))[]

template prepareMutation(s: var wstring) =
  system.prepareMutation(string(s))

proc wcharBytes(L: Natural, inclNull = false): int {.inline.} =
  let extra = int inclNull
  if L > Natural(int.high div 2 - extra):
    raise newException(RangeDefect, "wstring length is too large")
  (int(L) + extra) * 2

proc canonicalEmptyWString(error = DWORD(0), restoreError = false): wstring {.inline.} =
  result = wstring(newString(2))
  if restoreError:
    SetLastError(error)

template `^^`(s, i: untyped): untyped =
  (when i is BackwardsIndex: s.len - int(i) else: int(i))

proc newWString*(L: Natural): wstring = wstring(newString(wcharBytes(L, inclNull=true)))
  ## Returns a new `wstring` of length L, counted in UTF-16 code units.

proc newMString*(L: Natural): mstring = mstring(newString(L))
  ## Returns a new `mstring` of length L, counting by bytes.

proc len*(s: wstring): int {.inline.} = max(string(s).len div 2 - 1, 0)
  ## Returns the length of `wstring`, counting by UTF-16 code units.

proc len*(s: mstring): int {.inline.} = string(s).len
  ## Returns the length of `mstring`, counting by bytes.

proc newWStringOfCap*(L: Natural): wstring =
  ## Returns a new `wstring` of length 0 but with capacity L, counting by UTF-16 code units.
  result = wstring(newStringOfCap(wcharBytes(L, inclNull=true)))
  string(result).add "\0\0"

proc newMStringOfCap*(L: Natural): mstring =
  ## Returns a new `mstring` of length 0 but with capacity L, counting by bytes.
  result = mstring(newStringOfCap(L))

proc setLen*(s: var wstring, L: Natural) {.inline.} =
  ## Sets the length of `wstring` s to L, counting by UTF-16 code units.
  setLen(string(s), wcharBytes(L, inclNull=true))
  s.rawMut(s.len) = 0

proc setLen*(s: var mstring, L: Natural) {.inline.} =
  ## Sets the length of `mstring` s to L, counting by bytes.
  setLen(string(s), L)

proc `&`*(s: string): ptr char {.inline.} =
  ## Gets the address of the first character of a `string`.
  result = cast[ptr char](cstring s)

proc `&`*(s: cstring): ptr char {.inline.} =
  ## Gets the address of the first character of a `cstring`.
  result = cast[ptr char](s)

proc `&`*(s: wstring): ptr WCHAR {.inline.} =
  ## Gets the address of the first WCHAR of a `wstring`.
  result = cast[ptr WCHAR](&(string(s)))

proc `&`*(s: mstring): ptr char {.inline.} =
  ## Gets the address of the first character of a `mstring`.
  result = &(string(s))

proc `UTF8->wstring`(source: ptr char, L: Natural): wstring =
  if source.isNil: return canonicalEmptyWString()
  if L == 0: return canonicalEmptyWString()
  let wLen = MultiByteToWideChar(CP_UTF8, 0, source, L, nil, 0)
  if wLen == 0:
    let error = GetLastError()
    return canonicalEmptyWString(error, true)
  result = newWString(wLen)
  if MultiByteToWideChar(CP_UTF8, 0, source, L, &result, wLen) != wLen:
    let error = GetLastError()
    result = canonicalEmptyWString(error, true)

proc `ANSI->wstring`(source: ptr char, L: Natural): wstring =
  if source.isNil: return canonicalEmptyWString()
  if L == 0: return canonicalEmptyWString()
  let wLen = MultiByteToWideChar(CP_ACP, 0, source, L, nil, 0)
  if wLen == 0:
    let error = GetLastError()
    return canonicalEmptyWString(error, true)
  result = newWString(wLen)
  if MultiByteToWideChar(CP_ACP, 0, source, L, &result, wLen) != wLen:
    let error = GetLastError()
    result = canonicalEmptyWString(error, true)

proc `UNICODE->wstring`(source: ptr WCHAR, L: Natural): wstring =
  if source.isNil: return canonicalEmptyWString()
  result = newWString(L)
  if L != 0:
    copyMem(&result, source, wcharBytes(L))

proc `UNICODE->mstring`(source: ptr WCHAR, L: Natural): mstring
proc `UNICODE->string`(source: ptr WCHAR, L: Natural): string

proc `UTF8->mstring`(source: ptr char, L: Natural): mstring =
  let wide = `UTF8->wstring`(source, L)
  if L != 0 and wide.len == 0: return
  result = `UNICODE->mstring`(&wide, wide.len)

proc `ANSI->mstring`(source: ptr char, L: Natural): mstring =
  if not source.isNil:
    result = newMString(L)
    copyMem(&result, source, L)

proc `UNICODE->mstring`(source: ptr WCHAR, L: Natural): mstring =
  if source.isNil or L == 0: return
  let mLen = WideCharToMultiByte(CP_ACP, 0, source, L, nil, 0, nil, nil)
  if mLen == 0: return
  result = newMString(mLen)
  if WideCharToMultiByte(CP_ACP, 0, source, L, &result, mLen, nil, nil) != mLen:
    let error = GetLastError()
    result.setLen(0)
    SetLastError(error)

proc `UTF8->string`(source: ptr char, L: Natural): string =
  if not source.isNil:
    result = newString(L)
    copyMem(&result, source, L)

proc `ANSI->string`(source: ptr char, L: Natural): string =
  let wide = `ANSI->wstring`(source, L)
  if L != 0 and wide.len == 0: return
  result = `UNICODE->string`(&wide, wide.len)

proc `UNICODE->string`(source: ptr WCHAR, L: Natural): string =
  if source.isNil or L == 0: return
  let mLen = WideCharToMultiByte(CP_UTF8, 0, source, L, nil, 0, nil, nil)
  if mLen == 0: return
  result = newString(mLen)
  if WideCharToMultiByte(CP_UTF8, 0, source, L, &result, mLen, nil, nil) != mLen:
    let error = GetLastError()
    result.setLen(0)
    SetLastError(error)

template getptr[T](x: openArray[T]): untyped =
  if x.len == 0:
    when sizeof(T) == 1: cast[ptr char](nil)
    elif sizeof(T) == 2: cast[ptr WCHAR](nil)
  else:
    when sizeof(T) == 1: cast[ptr char](unsafeaddr x[0])
    elif sizeof(T) == 2: cast[ptr WCHAR](unsafeaddr x[0])

template getptr[T](x: ptr UncheckedArray[T]): untyped =
  when sizeof(T) == 1:
    cast[ptr char](unsafeaddr x[0])

  elif sizeof(T) == 2:
    cast[ptr WCHAR](unsafeaddr x[0])

proc `UTF8->wstring`(source: openArray[byte|char]): wstring {.inline.} =
  `UTF8->wstring`(source.getptr, source.len)

proc `ANSI->wstring`(source: openArray[byte|char]): wstring {.inline.} =
  `ANSI->wstring`(source.getptr, source.len)

proc `UNICODE->wstring`(source: openArray[WCHAR]): wstring {.inline.} =
  `UNICODE->wstring`(source.getptr, source.len)

proc `UTF8->mstring`(source: openArray[byte|char]): mstring {.inline.} =
  `UTF8->mstring`(source.getptr, source.len)

proc `ANSI->mstring`(source: openArray[byte|char]): mstring {.inline.} =
  `ANSI->mstring`(source.getptr, source.len)

proc `UNICODE->mstring`(source: openArray[WCHAR]): mstring {.inline.} =
  `UNICODE->mstring`(source.getptr, source.len)

proc `UTF8->string`(source: openArray[byte|char]): string {.inline.} =
  `UTF8->string`(source.getptr, source.len)

proc `ANSI->string`(source: openArray[byte|char]): string {.inline.} =
  `ANSI->string`(source.getptr, source.len)

proc `UNICODE->string`(source: openArray[WCHAR]): string {.inline.} =
  `UNICODE->string`(source.getptr, source.len)

# wstring functions

proc high*(s: wstring): int {.inline.} = s.len - 1
  ## Returns the highest possible index of `wstring`.

proc low*(s: wstring): int {.inline.} = 0
  ## Returns the lowest possible index of `wstring`.

proc cmp*(x, y: wstring): int =
  ## Compares `wstring` values by ordinal UTF-16 code units.
  let common = min(x.len, y.len)
  for i in 0 ..< common:
    let a = x.raw(i)
    let b = y.raw(i)
    if a < b: return -1
    if a > b: return 1
  system.cmp(x.len, y.len)

proc `==`*(x, y: wstring): bool =
  ## Checks for equality between two `wstring` values.
  if x.len != y.len: return false
  x.len == 0 or equalMem(&x, &y, wcharBytes(Natural(x.len)))

proc `<=`*(x, y: wstring): bool {.inline.} = cmp(x, y) <= 0
  ## Lexicographic ``<=`` operator for `wstring`.

proc `<`*(x, y: wstring): bool {.inline.} = cmp(x, y) < 0
  ## Lexicographic ``<`` operator for `wstring`.

proc substr*(s: wstring, first, last: int): wstring =
  ## Copies a slice of `s` into a new `wstring` and returns it.
  let
    firstUnit = max(first, 0)
    lastUnit = min(last, s.high)
  if firstUnit > lastUnit:
    return newWString(0)
  let
    firstByte = wcharBytes(Natural(firstUnit))
    lastByte = wcharBytes(Natural(lastUnit + 1), inclNull=true) - 1
  result = wstring(string(s).substr(firstByte, lastByte))
  if result.len != 0:
    prepareMutation(result)
    result.rawMut(result.len) = 0

  else:
    result = newWString(0)

proc substr*(s: wstring, first = 0): wstring {.inline.} =
  ## Copies a slice of `s` into a new `wstring` and returns it.
  result = s.substr(first, s.high)

proc `[]`*(s: wstring, i: int): WCHAR {.inline.} =
  ## Index operator for `wstring`.
  when compileOption("boundChecks"):
    if i < 0 or i >= s.len:
      raise newException(IndexDefect, "index out of bounds")

  result = s.raw(i)

proc `[]=`*(s: var wstring, i: int, c: WCHAR|char) {.inline.} =
  ## Index assignment operator for `wstring`.
  when compileOption("boundChecks"):
    if i < 0 or i >= s.len:
      raise newException(IndexDefect, "index out of bounds")

  prepareMutation(s)
  s.rawMut(i) = WCHAR c

proc `[]`*[T, U](s: wstring, x: HSlice[T, U]): wstring =
  ## Slice operation for `wstring`.
  let a = s ^^ x.a
  let L = (s ^^ x.b) - a + 1
  if L < 0:
    raise newException(RangeDefect, "slice length is negative")
  if L == 0:
    return newWString(0)
  when compileOption("boundChecks"):
    if a < 0 or a + L > s.len:
      raise newException(IndexDefect, "index out of bounds")
  result = s.substr(a, a + L-1)

proc `[]=`*[T, U](s: var wstring, x: HSlice[T, U], b: wstring) =
  ## Slice assignment for `wstring`.
  let
    a = s ^^ x.a
    z = s ^^ x.b
  when compileOption("boundChecks"):
    if a < 0 or a > s.len or (z >= a and z >= s.len):
      raise newException(IndexDefect, "index out of bounds")
  let L = max(z - a + 1, 0)

  if b.len > int.high - (s.len - L):
    raise newException(RangeDefect, "wstring length is too large")

  prepareMutation(s)
  if L == b.len:
    for i in 0 ..< L: s.rawMut(i+a) = b.raw(i)
  else:
    let slen = s.len
    let shift = b.len - L
    let newLen = slen + shift
    if shift > 0:
      setLen(s, newLen)
      for i in countdown(newLen-1, a+b.len):
        s.rawMut(i) = s.raw(i-shift)
    else:
      for i in countup(a+b.len, newLen-1):
        s.rawMut(i) = s.raw(i-shift)
      setLen(s, newLen)
    for i in 0 ..< b.len: s.rawMut(i+a) = b.raw(i)

    s.rawMut(s.len) = 0

proc add*(s: var wstring, c: char|WCHAR) =
  ## Appends `c` to `s` in place.
  if string(s).len < 2:
    s = newWString(0)
  prepareMutation(s)
  s.rawMut(s.len) = WCHAR c
  string(s).add "\0\0"

proc add*(s: var wstring, u: wstring) =
  ## Appends `u` to `s` in place.
  if u.len == 0: return
  if string(s).len < 2:
    s = newWString(0)
  if cast[pointer](&s) == cast[pointer](&u):
    let oldLen = s.len
    s.setLen(oldLen + u.len)
    moveMem(cast[pointer](cast[uint](&s) + uint(oldLen * 2)), &s, oldLen * 2)
    return
  setLen(string(s), string(s).len - 2)
  string(s).add(string(u))

proc `&`*(s: wstring, c: WCHAR|char): wstring {.inline.} =
  ## Concatenates `s` with `c`.
  result = s
  result.add c

proc `&`*(s, u: wstring): wstring {.inline.} =
  ## Concatenates `s` with `u`.
  result = s
  result.add u

proc toHex*(s: wstring): string {.inline.} =
  ## Converts `wstring` to its hexadecimal representation.
  ## No prefix like ``0x`` is generated.
  result = toHex(&s, s.len * 2)

iterator items*(s: wstring): WCHAR =
  ## Iterates over each `WCHAR` of `wstring`.
  var i = 0
  while i < s.len:
    yield s.raw(i)
    inc i

iterator mitems*(s: var wstring): var WCHAR =
  ## Iterates over each `WCHAR` of `wstring` so that you can modify the yielded value.
  var i = 0
  prepareMutation(s)
  while i < s.len:
    yield s.rawMut(i)
    inc i

iterator pairs*(s: wstring): tuple[key: int, val: WCHAR] =
  ## Iterates over each `WCHAR` of `wstring`. Yields `(int, WCHAR)` pairs.
  var i = 0
  while i < s.len:
    yield (i, s.raw(i))
    inc i

iterator mpairs*(s: var wstring): tuple[key: int, val: var WCHAR] =
  ## Iterates over each `WCHAR` of `wstring`. Yields `(int, var WCHAR)` pairs.
  var i = 0
  prepareMutation(s)
  while i < s.len:
    yield (i, s.rawMut(i))
    inc i

proc repr*(s: wstring): string =
  ## Returns string representation of `wstring`.
  result = $cast[int](&s).tohex & "(wstring)\""
  let converted = `UNICODE->string`(&s, s.len)
  for c in converted:
    if c == '\0': result.add "\\0"
    else: result.add c

  result.add  "\""

proc hash*(s: wstring): Hash =
  var h: Hash
  for i in 0 ..< s.len:
    h = h !& hashes.hash(uint16(s.raw(i)))
  result = !$h

# mstring functions

proc utf16CharWidth(s: wstring, offset: int): int {.inline.} =
  if offset + 1 < s.len and s.raw(offset) in WCHAR(0xD800)..WCHAR(0xDBFF) and
      s.raw(offset + 1) in WCHAR(0xDC00)..WCHAR(0xDFFF): 2
  else: 1

proc logicalLen(s: wstring): int =
  var offset = 0
  while offset < s.len:
    inc result
    inc offset, utf16CharWidth(s, offset)

proc utf16Offset(s: wstring, index: int, allowEnd = false): int =
  if index < 0:
    raise newException(IndexDefect, "index out of bounds")
  var logical = 0
  while result < s.len and logical < index:
    inc result, utf16CharWidth(s, result)
    inc logical
  if logical != index or (not allowEnd and result >= s.len):
    raise newException(IndexDefect, "index out of bounds")

proc mlen*(s: mstring): int =
  ## Returns the length of `mstring`, counting by MBCS characters.
  result = logicalLen(`ANSI->wstring`(&s, s.len))

proc high*(s: mstring): int {.borrow.}
  ## Returns the highest possible index of `mstring`.

proc low*(s: mstring): int {.borrow.}
  ## Returns the lowest possible index of `mstring`.

proc cmp*(x, y: mstring): int {.borrow.}
  ## Comparison proc for `mstring` (in binary format only).

proc `==`*(x, y: mstring): bool {.borrow.}
  ## Checks for equality between two `mstring` values.

proc `<=`*(x, y: mstring): bool {.borrow.}
  ## Lexicographic ``<=`` operator for `mstring`.

proc `<`*(x, y: mstring): bool {.borrow.}
  ## Lexicographic ``<`` operator for `mstring`.

proc substr*(s: mstring, first, last: int): mstring {.borrow.}
  ## Copies a slice of `s` into a new `mstring` and returns it, counting by bytes.

proc substr*(s: mstring, first = 0): mstring {.borrow.}
  ## Copies a slice of `s` into a new `mstring` and returns it, counting by bytes.

proc `[]`*(s: mstring, i: int): char {.inline.} = string(s)[i]
  ## Index operator for `mstring`, counting by bytes.

proc `[]=`*(s: var mstring, i: int, x: char|byte) {.inline.} = string(s)[i] = cast[char](x)
  ## Index assignment operator for `mstring`, counting by bytes.

proc substr*(s: mstring, first, last: mIndex): mstring =
  ## Copies a slice of `s` into a new `mstring` and returns it, counting by MBCS characters.
  let ws = `ANSI->wstring`(&s, s.len)
  let total = logicalLen(ws)
  let firstIndex = max(int(first), 0)
  let lastIndex = min(int(last), total - 1)
  if firstIndex > lastIndex or firstIndex >= total: return
  let a = utf16Offset(ws, firstIndex)
  let z = utf16Offset(ws, lastIndex)
  let part = ws.substr(a, z + utf16CharWidth(ws, z) - 1)
  result = `UNICODE->mstring`(&part, part.len)

proc substr*(s: mstring, first: mIndex = 0.mIndex): mstring =
  ## Copies a slice of `s` into a new `mstring` and returns it, counting by MBCS characters.
  let ws = `ANSI->wstring`(&s, s.len)
  let total = logicalLen(ws)
  let firstIndex = max(int(first), 0)
  if firstIndex >= total: return
  let part = ws.substr(utf16Offset(ws, firstIndex))
  result = `UNICODE->mstring`(&part, part.len)

proc `[]`*(s: mstring, i: mIndex): mstring =
  ## Index operator for `mstring`, counting by MBCS characters.
  let ws = `ANSI->wstring`(&s, s.len)
  let offset = utf16Offset(ws, int i)
  result = `UNICODE->mstring`(cast[ptr WCHAR](unsafeaddr string(ws)[offset * 2]),
      utf16CharWidth(ws, offset))

proc `[]=`*(s: var mstring, i: mIndex, u: mstring) =
  ## Index assignment operator for `mstring`, counting by MBCS characters,
  ## and only the first MBCS character of `u` will be used.
  var ws = `ANSI->wstring`(&s, s.len)
  let wu = `ANSI->wstring`(&u, u.len)

  let offset = utf16Offset(ws, int i)
  let destination = offset .. offset + utf16CharWidth(ws, offset) - 1
  if wu.len == 0:
    var replacement = newWString(1)
    replacement[0] = 0
    ws[destination] = replacement
  else:
    ws[destination] = wu[0 .. utf16CharWidth(wu, 0) - 1]

  s = `UNICODE->mstring`(&ws, ws.len)

proc `[]`*[T, U](s: mstring, x: HSlice[T, U]): mstring =
  ## Slice operation for `mstring`.
  when T is mIndex or U is mIndex:
    let ws = `ANSI->wstring`(&s, s.len)
    let total = logicalLen(ws)
    let first = when T is BackwardsIndex: total - int(x.a) else: int(x.a)
    let last = when U is BackwardsIndex: total - int(x.b) else: int(x.b)
    if last < first - 1:
      raise newException(RangeDefect, "slice length is negative")
    if last == first - 1:
      return
    let a = utf16Offset(ws, first, allowEnd=true)
    let z = utf16Offset(ws, last)
    let part = ws[a .. z + utf16CharWidth(ws, z) - 1]
    result = `UNICODE->mstring`(&part, part.len)

  else:
    result = mstring(`[]`(string(s), x))

proc `[]=`*[T, U](s: var mstring, x: HSlice[T, U], u: mstring) =
  ## Slice assignment for `mstring`.
  when T is mIndex or U is mIndex:
    var ws = `ANSI->wstring`(&s, s.len)
    let total = logicalLen(ws)
    let first = when T is BackwardsIndex: total - int(x.a) else: int(x.a)
    let last = when U is BackwardsIndex: total - int(x.b) else: int(x.b)
    let a = utf16Offset(ws, first, allowEnd=true)
    if last < first:
      ws[a .. a - 1] = `ANSI->wstring`(&u, u.len)
    else:
      let z = utf16Offset(ws, last)
      ws[a .. z + utf16CharWidth(ws, z) - 1] = `ANSI->wstring`(&u, u.len)
    s = `UNICODE->mstring`(&ws, ws.len)
  else:
    `[]=`(string(s), x, string(u))

proc add*(x: var mstring, y: char) {.borrow.}
  ## Appends `y` to `x` in place.

proc add*(x: var mstring, y: string) {.borrow.}
  ## Appends `y` to `x` in place.

proc add*(x: var mstring, y: mstring) {.borrow.}
  ## Appends `y` to `x` in place.

proc add*(x: var mstring, y: byte) {.inline.} = x.add(char(y))
  ## Appends `y` to `x` in place.

proc `&`*(x: mstring, y: char): mstring {.borrow.}
  ## Concatenates `x` with `y`.

proc `&`*(x, y: mstring): mstring {.borrow.}
  ## Concatenates `x` with `y`.

proc `&`*(x: char, y: mstring): mstring {.borrow.}
  ## Concatenates `x` with `y`.

proc toHex*(s: mstring): string {.inline.} =
  ## Converts `mstring` to its hexadecimal representation.
  ## No prefix like ``0x`` is generated.
  result = toHex(&s, s.len)

iterator items*(s: mstring): mstring =
  ## Iterates over each MBCS character of `mstring`.
  let ws = `ANSI->wstring`(&s, s.len)
  var offset = 0
  while offset < ws.len:
    let width = utf16CharWidth(ws, offset)
    yield `UNICODE->mstring`(cast[ptr WCHAR](unsafeaddr string(ws)[offset * 2]), width)
    inc offset, width

iterator pairs*(s: mstring): tuple[key: mIndex, val: mstring] =
  ## Iterates over each MBCS character of `mstring`. Yields `(mIndex, mstring)` pairs.
  let ws = `ANSI->wstring`(&s, s.len)
  var offset, logical = 0
  while offset < ws.len:
    let width = utf16CharWidth(ws, offset)
    yield (mIndex logical,
        `UNICODE->mstring`(cast[ptr WCHAR](unsafeaddr string(ws)[offset * 2]), width))
    inc offset, width
    inc logical

proc repr*(s: mstring): string =
  ## Returns string representation of `mstring`.
  result = $cast[int](&s).tohex & "(mstring)\""
  let converted = `ANSI->string`(&s, s.len)
  for c in converted:
    if c == '\0': result.add "\\0"
    else: result.add c

  result &= "\""

# conversion functions

proc `$`*(s: Stringable): string {.inline.} =
  ## Converts any stringable type to `string`.
  ## This operator assumes `string|cstring|ptr char|openArray[char]` are UTF-8-encoded strings.
  when s is char|byte: system.`$`(s)
  elif s is WCHAR: system.`$`(s)
  elif s is string: s
  elif s is mstring: `ANSI->string`(&s, s.len)
  elif s is wstring: `UNICODE->string`(&s, s.len)
  elif s is cstring|ptr char|ptr byte: system.`$`(cast[cstring](s))
  elif s is ptr WCHAR: `UNICODE->string`(s, lstrlenW(s))
  elif s is BSTR: `UNICODE->string`(s, int SysStringLen(s))
  elif s is array|seq|openArray:
    system.`$`(s)
  elif s is ptr array:
    when sizeof(s[][0]) == 1: `UTF8->string`(s[])
    elif sizeof(s[][0]) == 2: `UNICODE->string`(s[])
    else: {.fatal: "invalid type".}
  elif s is ptr UncheckedArray[auto]:
    when sizeof(s[0]) == 1: `UTF8->string`(s.getptr, lstrlenA(s.getptr))
    elif sizeof(s[0]) == 2: `UNICODE->string`(s.getptr, lstrlenW(s.getptr))
    else: {.fatal: "invalid type".}
  else: {.fatal: "invalid type".}

proc `%$`*(s: Stringable): string {.inline.} =
  ## Converts any stringable type to `string`. Always treats `openArray[SomeChar]` as a string.
  ## This operator assumes `string|cstring|ptr char|openArray[char]` are UTF-8-encoded strings.
  when s is char|byte: system.`$`(s)
  elif s is WCHAR: `UNICODE->string`(unsafeaddr s, 1)
  elif s is string: s
  elif s is mstring: `ANSI->string`(&s, s.len)
  elif s is wstring: `UNICODE->string`(&s, s.len)
  elif s is cstring|ptr char|ptr byte: system.`$`(cast[cstring](s))
  elif s is ptr WCHAR: `UNICODE->string`(s, lstrlenW(s))
  elif s is BSTR: `UNICODE->string`(s, int SysStringLen(s))
  elif s is array|seq|openArray:
    when sizeof(s[0]) == 1: `UTF8->string`(s)
    elif sizeof(s[0]) == 2: `UNICODE->string`(s)
    else: {.fatal: "invalid type".}
  elif s is ptr array:
    when sizeof(s[][0]) == 1: `UTF8->string`(s[])
    elif sizeof(s[][0]) == 2: `UNICODE->string`(s[])
    else: {.fatal: "invalid type".}
  elif s is ptr UncheckedArray[auto]:
    when sizeof(s[0]) == 1: `UTF8->string`(s.getptr, lstrlenA(s.getptr))
    elif sizeof(s[0]) == 2: `UNICODE->string`(s.getptr, lstrlenW(s.getptr))
    else: {.fatal: "invalid type".}
  else: {.fatal: "invalid type".}

proc `+$`*(s: Stringable): wstring {.inline.} =
  ## Converts any stringable type to `wstring`.
  ## This operator assumes `string|cstring|ptr char|openArray[char]` are UTF-8-encoded strings.
  when s is char|byte: `UTF8->wstring`(cast[ptr char](unsafeaddr s), 1)
  elif s is WCHAR: `UNICODE->wstring`(unsafeaddr s, 1)
  elif s is string: `UTF8->wstring`(&s, s.len)
  elif s is mstring: `ANSI->wstring`(&s, s.len)
  elif s is wstring: s
  elif s is cstring|ptr char|ptr byte: `UTF8->wstring`(cast[ptr char](s), cast[cstring](s).len)
  elif s is ptr WCHAR: `UNICODE->wstring`(s, lstrlenW(s))
  elif s is BSTR: `UNICODE->wstring`(s, int SysStringLen(s))
  elif s is array|seq|openArray:
    when sizeof(s[0]) == 1: `UTF8->wstring`(s)
    elif sizeof(s[0]) == 2: `UNICODE->wstring`(s)
    else: {.fatal: "invalid type".}
  elif s is ptr array:
    when sizeof(s[][0]) == 1: `UTF8->wstring`(s[])
    elif sizeof(s[][0]) == 2: `UNICODE->wstring`(s[])
    else: {.fatal: "invalid type".}
  elif s is ptr UncheckedArray[auto]:
    when sizeof(s[0]) == 1: `UTF8->wstring`(s.getptr, lstrlenA(s.getptr))
    elif sizeof(s[0]) == 2: `UNICODE->wstring`(s.getptr, lstrlenW(s.getptr))
    else: {.fatal: "invalid type".}
  else: {.fatal: "invalid type".}

proc `-$`*(s: Stringable): mstring {.inline.} =
  ## Converts any stringable type to `mstring`.
  ## This operator assumes `string|cstring|ptr char|openArray[char]` are UTF-8-encoded strings.
  when s is char|byte: `UTF8->mstring`(cast[ptr char](unsafeaddr s), 1)
  elif s is WCHAR: `UNICODE->mstring`(unsafeaddr s, 1)
  elif s is string: `UTF8->mstring`(&s, s.len)
  elif s is mstring: s
  elif s is wstring: `UNICODE->mstring`(&s, s.len)
  elif s is cstring|ptr char|ptr byte: `UTF8->mstring`(cast[ptr char](s), cast[cstring](s).len)
  elif s is ptr WCHAR: `UNICODE->mstring`(s, lstrlenW(s))
  elif s is BSTR: `UNICODE->mstring`(s, int SysStringLen(s))
  elif s is array|seq|openArray:
    when sizeof(s[0]) == 1: `UTF8->mstring`(s)
    elif sizeof(s[0]) == 2: `UNICODE->mstring`(s)
    else: {.fatal: "invalid type".}
  elif s is ptr array:
    when sizeof(s[][0]) == 1: `UTF8->mstring`(s[])
    elif sizeof(s[][0]) == 2: `UNICODE->mstring`(s[])
    else: {.fatal: "invalid type".}
  elif s is ptr UncheckedArray[auto]:
    when sizeof(s[0]) == 1: `UTF8->mstring`(s.getptr, lstrlenA(s.getptr))
    elif sizeof(s[0]) == 2: `UNICODE->mstring`(s.getptr, lstrlenW(s.getptr))
    else: {.fatal: "invalid type".}
  else: {.fatal: "invalid type".}

proc `$$`*(s: Stringable): string {.inline.} =
  ## Converts any stringable type to `string`.
  ## This operator assumes `string|cstring|ptr char|openArray[char]` are ANSI-encoded strings.
  # Only exception is `WCHAR(uint16)`: regard as number in `$`, but string in `$$`
  when s is WCHAR: `UNICODE->string`(unsafeaddr s, 1)
  elif s is string: `ANSI->string`(&s, s.len)
  elif s is cstring|ptr char|ptr byte: `ANSI->string`(cast[ptr char](s), cast[cstring](s).len)
  elif s is array|seq|openArray:
    when sizeof(s[0]) == 1: `ANSI->string`(s)
    elif sizeof(s[0]) == 2: `UNICODE->string`(s)
  elif s is ptr array:
    when sizeof(s[][0]) == 1: `ANSI->string`(s[])
    else: `$`(s)
  elif s is ptr UncheckedArray[auto]:
    when sizeof(s[0]) == 1: `ANSI->string`(s.getptr, lstrlenA(s.getptr))
    else: `$`(s)
  else: `$`(s)

proc `+$$`*(s: Stringable): wstring {.inline.} =
  ## Converts any stringable type to `wstring`.
  ## This operator assumes `string|cstring|ptr char|openArray[char]` are ANSI-encoded strings.
  when s is string: `ANSI->wstring`(&s, s.len)
  elif s is cstring|ptr char|ptr byte: `ANSI->wstring`(cast[ptr char](s), cast[cstring](s).len)
  elif s is array|seq|openArray:
    when sizeof(s[0]) == 1: `ANSI->wstring`(s)
    else: `+$`(s)
  elif s is ptr array:
    when sizeof(s[][0]) == 1: `ANSI->wstring`(s[])
    else: `+$`(s)
  elif s is ptr UncheckedArray[auto]:
    when sizeof(s[0]) == 1: `ANSI->wstring`(s.getptr, lstrlenA(s.getptr))
    else: `+$`(s)
  else: `+$`(s)

proc `-$$`*(s: Stringable): mstring {.inline.} =
  ## Converts any stringable type to `mstring`.
  ## This operator assumes `string|cstring|ptr char|openArray[char]` are ANSI-encoded strings.
  when s is string: `ANSI->mstring`(&s, s.len)
  elif s is cstring|ptr char|ptr byte: `ANSI->mstring`(cast[ptr char](s), cast[cstring](s).len)
  elif s is array|seq|openArray:
    when sizeof(s[0]) == 1: `ANSI->mstring`(s)
    else: `-$`(s)
  elif s is ptr array:
    when sizeof(s[][0]) == 1: `ANSI->mstring`(s[])
    else: `-$`(s)
  elif s is ptr UncheckedArray[auto]:
    when sizeof(s[0]) == 1: `ANSI->mstring`(s.getptr, lstrlenA(s.getptr))
    else: `-$`(s)
  else: `-$`(s)

proc fillBuffer[T: SomeChar](a: var openArray[T], s: SomeString, skip = 0, inclNull = false) =
  when sizeof(a[0]) != sizeof(s[0]):
    {.fatal: "type mismatch".}

  if skip < 0 or skip > s.len:
    raise newException(IndexDefect, "invalid source offset")

  let copyLen = min(a.len, s.len - skip)
  if copyLen > 0:
    moveMem(addr a[0], cast[pointer](cast[uint](&s) + uint(skip * sizeof(T))),
        copyLen * sizeof(T))

  if inclNull and a.high >= s.len - skip:
    a[s.len - skip] = cast[T](0)

  # fill as much as possible before raise an exception
  if (not inclNull and a.high < s.len - skip - 1) or (inclNull and a.high < s.len - skip):
    raise newException(IndexDefect, "string length too long")

proc fillString[T: SomeChar](s: var SomeString, a: openArray[T], skip = 0) =
  when sizeof(a[0]) != sizeof(s[0]):
    {.fatal: "type mismatch".}

  if skip < 0 or skip > s.len:
    raise newException(IndexDefect, "invalid destination offset")

  let copyLen = min(a.len, s.len - skip)
  if copyLen > 0:
    let
      source = cast[uint](unsafeaddr a[0])
      sourceEnd = source + uint(copyLen * sizeof(T))
      destination = cast[uint](&s)
      destinationEnd = destination + uint(s.len * sizeof(T))
      overlaps = source < destinationEnd and destination < sourceEnd

    var saved: seq[T]
    if overlaps:
      saved = newSeq[T](copyLen)
      copyMem(addr saved[0], unsafeaddr a[0], copyLen * sizeof(T))

    when s is wstring:
      prepareMutation(s)
    elif s is string:
      system.prepareMutation(s)
    else:
      system.prepareMutation(string(s))

    let target = cast[pointer](cast[uint](&s) + uint(skip * sizeof(T)))
    if overlaps:
      moveMem(target, addr saved[0], copyLen * sizeof(T))
    else:
      moveMem(target, unsafeaddr a[0], copyLen * sizeof(T))

macro requireMutable(value: typed): untyped =
  proc isMutable(node: NimNode): bool =
    case node.kind
    of nnkSym:
      result = node.symKind in {nskVar, nskResult, nskTemp} or
          (node.symKind == nskParam and node.getTypeInst.kind == nnkVarTy)
    of nnkDotExpr, nnkBracketExpr:
      result = isMutable(node[0])
    of nnkDerefExpr, nnkHiddenDeref:
      result = true
    else:
      result = false
  if not isMutable(value):
    error("string destination must be a mutable lvalue", value)
  result = newEmptyNode()

template fillOp[A: SomeString, B: SomeBuffer|SomeString](a: var A, b: B) =
  ## Fill operator for `SomeBuffer` and `SomeString`.
  ## Please make sure both sides have the same character size.
  when B is SomeString:
    # treat string a as buffer
    if cast[pointer](&a) != cast[pointer](&b):
      when a is wstring:
        prepareMutation(a)
      elif a is string:
        system.prepareMutation(a)
      else:
        system.prepareMutation(string(a))
      var v = cast[ptr UncheckedArray[a[0].type]](&a)
      fillBuffer(v.toOpenArray(0, a.len - 1), b, inclNull=false)

  else:
    when B is array:
      fillString(a, b.toOpenArray(b.low, b.high), skip=b.low)

    elif B is ptr array:
      fillString(a, b[].toOpenArray(b[].low, b[].high), skip=b[].low)

    elif B is ptr char | ptr byte:
      fillString(a, cast[ptr UncheckedArray[byte]](b).toOpenArray(0, int.high - 1))

    elif B is ptr WCHAR:
      fillString(a, cast[ptr UncheckedArray[WCHAR]](b).toOpenArray(0, int.high - 1))

    elif B is ptr UncheckedArray[auto]:
      fillString(a, b.toOpenArray(0, int.high - 1))

    elif B is openArray | seq:
      fillString(a, b)

    else:
      {.fatal: "type mismatch".}

template fillOp[A: SomeBuffer](a: A, b: SomeString) =
  ## Fills a buffer with a string without a terminating null.
  when A is array:
    fillBuffer(a.toOpenArray(a.low, a.high), b, skip=a.low, inclNull=false)
  elif A is ptr array:
    fillBuffer(a[].toOpenArray(a[].low, a[].high), b, skip=a[].low, inclNull=false)
  elif A is ptr char | ptr byte:
    var v = cast[ptr UncheckedArray[byte]](a)
    fillBuffer(v.toOpenArray(0, int.high - 1), b, inclNull=false)
  elif A is ptr WCHAR:
    var v = cast[ptr UncheckedArray[WCHAR]](a)
    fillBuffer(v.toOpenArray(0, int.high - 1), b, inclNull=false)
  elif A is ptr UncheckedArray[auto]:
    var v = a
    fillBuffer(v.toOpenArray(0, int.high - 1), b, inclNull=false)
  elif A is openArray | seq:
    fillBuffer(a, b, inclNull=false)
  else:
    {.fatal: "type mismatch".}

template fillOpNull[A: SomeString](a: var A, b: SomeString) =
  ## Fill a buffer with a string, including a null terminator.
  ## Please make sure both sides have the same character size.
  if cast[pointer](&a) == cast[pointer](&b):
    raise newException(IndexDefect, "string length too long")
  else:
    when a is wstring:
      prepareMutation(a)
    elif a is string:
      system.prepareMutation(a)
    else:
      system.prepareMutation(string(a))
    var v = cast[ptr UncheckedArray[a[0].type]](&a)
    fillBuffer(v.toOpenArray(0, a.len - 1), b, inclNull=true)

template fillOpNull[A: SomeBuffer](a: A, b: SomeString) =
  ## Fills a buffer with a string including a terminating null.
  when A is array:
    fillBuffer(a.toOpenArray(a.low, a.high), b, skip=a.low, inclNull=true)
  elif A is ptr array:
    fillBuffer(a[].toOpenArray(a[].low, a[].high), b, skip=a[].low, inclNull=true)
  elif A is ptr char | ptr byte:
    var v = cast[ptr UncheckedArray[byte]](a)
    fillBuffer(v.toOpenArray(0, int.high - 1), b, inclNull=true)
  elif A is ptr WCHAR:
    var v = cast[ptr UncheckedArray[WCHAR]](a)
    fillBuffer(v.toOpenArray(0, int.high - 1), b, inclNull=true)
  elif A is ptr UncheckedArray[auto]:
    var v = a
    fillBuffer(v.toOpenArray(0, int.high - 1), b, inclNull=true)
  elif A is openArray | seq:
    fillBuffer(a, b, inclNull=true)
  else:
    {.fatal: "type mismatch".}

macro `<<`*(a, b: typed): untyped =
  result = quote do:
    when `a` is SomeString:
      requireMutable(`a`)
    fillOp(`a`, `b`)

macro `<<<`*(a, b: typed): untyped =
  result = quote do:
    when `a` is SomeString:
      requireMutable(`a`)
    fillOpNull(`a`, `b`)

template `>>`*(a: typed, b: typed) =
  ## This is the same as `b << a`.
  b << a

template `>>>`*(a: typed, b: typed) =
  ## This is the same as `b <<< a`.
  b <<< a

proc nullTerminate*(s: var SomeString) {.inline.} =
  ## Assume a string is null terminated and set the correct length.
  when s is string|mstring:
    let L = lstrlenA(cast[LPCSTR](&s))
    if L < s.len:
      s.setLen(L)

  elif s is wstring:
    if string(s).len < 2:
      s = newWString(0)
    let L = lstrlenW(cast[LPWSTR](&s))
    if L < s.len:
      s.setLen(L)

  else: {.fatal: "invalid type".}

proc nullTerminated*[T: SomeString](s: T): T {.inline.} =
  ## Assume a string is null terminated and return the length-corrected string.
  when s is string:
    result = newString(lstrlenA(cast[LPCSTR](&s)))
    result << &s

  elif s is mstring:
    result = newMString(lstrlenA(cast[LPCSTR](&s)))
    result << &s

  elif s is wstring:
    result = newWString(lstrlenW(cast[LPWSTR](&s)))
    result << &s

  else: {.fatal: "invalid type".}

proc baddr(str: wstring): BSTR =
  # Returns a thread-local, BSTR-layout-compatible copy of `str`.
  # The result is a borrowed input value. It must not be retained or freed
  # with `SysFreeString`.
  if temporaryBSTRs.data.len == 0:
    temporaryBSTRs.data = newSeq[seq[byte]](BSTRSlotCount)

  if uint64(str.len) > uint64(uint32.high) div uint64(sizeof(WCHAR)):
    raise newException(OverflowDefect, "string is too long for BSTR")

  let
    slot = temporaryBSTRs.next
    byteLen = str.len * sizeof(WCHAR)
    totalLen = 4 + byteLen + sizeof(WCHAR)
    bstrLen = uint32(byteLen)
  temporaryBSTRs.data[slot].setLen(totalLen)
  copyMem(addr temporaryBSTRs.data[slot][0], unsafeAddr bstrLen, 4)
  if byteLen != 0:
    copyMem(addr temporaryBSTRs.data[slot][4], &str, byteLen)
  temporaryBSTRs.data[slot][4 + byteLen] = 0
  temporaryBSTRs.data[slot][5 + byteLen] = 0

  temporaryBSTRs.next = slot + 1
  if temporaryBSTRs.next == BSTRSlotCount:
    temporaryBSTRs.next = 0

  result = cast[BSTR](addr temporaryBSTRs.data[slot][4])

proc baddr(str: string): BSTR = baddr(+$str)

proc baddr(str: cstring): BSTR = baddr(+$str)

# generics has problems on converters, define one by one

converter winstrConverterWStringToLPWSTR*(x: wstring): LPWSTR = cast[LPWSTR](&x)
  ## Borrows an `LPWSTR` for an immediate input call. The callee must not retain,
  ## modify, or free it.

converter winstrConverterWStringToBSTR*(x: wstring): BSTR = baddr(x)
  ## Borrows a BSTR-layout-compatible input for an immediate call. The callee
  ## must not retain or free it; a later conversion on this thread may reuse it.

converter winstrConverterStringToBSTR*(x: string): BSTR = baddr(x)
  ## Borrows a BSTR-layout-compatible input for an immediate call. The callee
  ## must not retain or free it; a later conversion on this thread may reuse it.

converter winstrConverterCStringToBSTR*(x: cstring): BSTR = baddr(x)
  ## Borrows a BSTR-layout-compatible input for an immediate call. The callee
  ## must not retain or free it; a later conversion on this thread may reuse it.

converter winstrConverterBSTRToLPWSTR*(x: BSTR): LPWSTR = cast[LPWSTR](x)
  ## Borrows the BSTR buffer as `LPWSTR` for an immediate input call. The
  ## callee must not retain, modify, or free it.

converter winstrConverterStringToPtrChar*(x: string): ptr char = cast[ptr char](&x)
  ## Borrows a UTF-8 `ptr char` for an immediate input call. The callee must not
  ## retain, modify, or free it.

converter winstrConverterCStringToPtrChar*(x: cstring): ptr char = cast[ptr char](x)
  ## Borrows the `cstring` buffer as `ptr char`. Its lifetime is the source
  ## lifetime, and the callee must not modify or free it.

converter winstrConverterMStringToPtrChar*(x: mstring): ptr char = cast[ptr char](&x)
  ## Borrows an ANSI/MBCS `ptr char` for an immediate input call. The callee
  ## must not retain, modify, or free it.

converter winstrConverterMStringToLPSTR*(x: mstring): LPSTR = cast[LPSTR](&x)
  ## Borrows an ANSI/MBCS `LPSTR` for an immediate input call. The callee must
  ## not retain, modify, or free it.

when defined(gcDestructors):
  converter winstrConverterWideCStringToLPWSTR*(x: WideCStringObj): LPWSTR = cast[LPWSTR](x[0].unsafeaddr)
    ## Borrows the `WideCString` buffer as `LPWSTR`; the pointer is valid only
    ## while the source remains alive and must not be freed.

  proc `+$`*(s: WideCStringObj): wstring {.inline.} =
    ## Converts `WideCString` to `wstring`.
    +$cast[LPWSTR](s[0].unsafeaddr)

  proc newWideCString*(s: wstring): WideCStringObj {.inline.} =
    ## Converts `wstring` to `WideCString`.
    when compiles(newWideCString(1)):
      result = newWideCString(s.len)
      copyMem(result[0].unsafeaddr, &s, s.len * 2)
    else:
      result = newWideCString("", s.len)
      s >> result

else:
  converter winstrConverterWideCStringToLPWSTR*(x: WideCString): LPWSTR = cast[LPWSTR](x[0].unsafeaddr)
    ## Converts `WideCString` to `LPWSTR` automatically.

  proc `+$`*(s: WideCString): wstring {.inline.} =
    ## Converts `WideCString` to `wstring`.
    +$cast[LPWSTR](s[0].unsafeaddr)

  proc newWideCString*(s: wstring): WideCString {.inline.} =
    ## Converts `wstring` to `WideCString`.
    when compiles(newWideCString(1)):
      result = newWideCString(s.len)
      copyMem(result[0].unsafeaddr, &s, s.len * 2)
    else:
      result = newWideCString("", s.len)
      s >> result

when defined(gcDestructors):
  # Here is a workaround for --gc:arc and --newruntime. It is a tricky problem:
  # wstring needs to stay alive until the converter ends so that the Windows API can
  # use the pointer later.

  proc saddr(str: sink wstring): LPWSTR =
    if temporaryWStrings.data.len == 0:
      temporaryWStrings.data = newSeq[wstring](WStringSlotCount)
    let slot = temporaryWStrings.next
    temporaryWStrings.data[slot] = move(str)

    temporaryWStrings.next = slot + 1
    if temporaryWStrings.next == WStringSlotCount:
      temporaryWStrings.next = 0

    &temporaryWStrings.data[slot]

  converter winstrConverterStringToLPWSTR*(x: string): LPWSTR = saddr(+$x)
    ## Borrows an `LPWSTR` for an immediate input call. The callee must not
    ## retain, modify, or free it; a later conversion on this thread may reuse it.

  converter winstrConverterCStringToLPWSTR*(x: cstring): LPWSTR = saddr(+$x)
    ## Borrows an `LPWSTR` for an immediate input call. The callee must not
    ## retain, modify, or free it; a later conversion on this thread may reuse it.

else:
  converter winstrConverterStringToLPWSTR*(x: string): LPWSTR = cast[LPWSTR](&(+$x))
    ## Borrows an `LPWSTR` for an immediate input call. The callee must not
    ## retain, modify, or free it.

  converter winstrConverterCStringToLPWSTR*(x: cstring): LPWSTR = cast[LPWSTR](&(+$x))
    ## Borrows an `LPWSTR` for an immediate input call. The callee must not
    ## retain, modify, or free it.

proc newWString*(s: cstring|string|mstring): wstring {.inline, deprecated: "use `+$` instead".} =
  ## Returns a new `wstring`.
  result = +$s

proc newMString*(s: string|cstring|wstring): mstring {.inline, deprecated: "use `-$` instead".} =
  ## Returns a new `mstring`.
  result = -$s

proc ctNewWString(s: static[string]): wstring {.compiletime.} =
  # copy from widestrs.nim, use WCHAR instead of Utf16Char
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
    UNI_REPL = 0xFFFD

  template ones(n: untyped): untyped = ((1 shl n)-1)

  template fastRuneAt(s: cstring, i, L: int, result: untyped, doInc = true) =
    let b0 = ord(s[i])
    if b0 <= 0x7F:
      result = b0
      when doInc: inc(i)
    elif b0 in 0xC2..0xDF and i <= L - 2 and ord(s[i+1]) in 0x80..0xBF:
        result = (b0 and ones(5)) shl 6 or (ord(s[i+1]) and ones(6))
        when doInc: inc(i, 2)
    elif b0 in 0xE0..0xEF and i <= L - 3 and
        ord(s[i+1]) in 0x80..0xBF and ord(s[i+2]) in 0x80..0xBF and
        (b0 != 0xE0 or ord(s[i+1]) >= 0xA0) and
        (b0 != 0xED or ord(s[i+1]) <= 0x9F):
        result = (b0 and ones(4)) shl 12 or
                (ord(s[i+1]) and ones(6)) shl 6 or
                (ord(s[i+2]) and ones(6))
        when doInc: inc(i, 3)
    elif b0 in 0xE0..0xEF and i <= L - 2 and ord(s[i+1]) in 0x80..0xBF and
        ((b0 == 0xE0 and ord(s[i+1]) < 0xA0) or
         (b0 == 0xED and ord(s[i+1]) > 0x9F)):
        result = UNI_REPL
        when doInc: inc(i, 2)
    elif b0 in 0xE0..0xEF and i <= L - 2 and ord(s[i+1]) in 0x80..0xBF:
        # MultiByteToWideChar replaces a truncated valid prefix as one unit.
        result = UNI_REPL
        when doInc: inc(i, 2)
    elif b0 in 0xF0..0xF4 and i <= L - 4 and
        ord(s[i+1]) in 0x80..0xBF and ord(s[i+2]) in 0x80..0xBF and
        ord(s[i+3]) in 0x80..0xBF and
        (b0 != 0xF0 or ord(s[i+1]) >= 0x90) and
        (b0 != 0xF4 or ord(s[i+1]) <= 0x8F):
        result = (b0 and ones(3)) shl 18 or
                (ord(s[i+1]) and ones(6)) shl 12 or
                (ord(s[i+2]) and ones(6)) shl 6 or
                (ord(s[i+3]) and ones(6))
        when doInc: inc(i, 4)
    elif b0 in 0xF0..0xF4 and i <= L - 2 and ord(s[i+1]) in 0x80..0xBF and
        ((b0 == 0xF0 and ord(s[i+1]) < 0x90) or
         (b0 == 0xF4 and ord(s[i+1]) > 0x8F)):
        result = UNI_REPL
        when doInc: inc(i, 2)
    elif b0 in 0xF0..0xF4 and i <= L - 3 and
        ord(s[i+1]) in 0x80..0xBF and ord(s[i+2]) in 0x80..0xBF:
        # MultiByteToWideChar replaces a three-byte truncated prefix as one unit.
        result = UNI_REPL
        when doInc: inc(i, 3)
    elif b0 in 0xF0..0xF4 and i <= L - 2 and ord(s[i+1]) in 0x80..0xBF:
        result = UNI_REPL
        when doInc: inc(i, 2)
    else:
      result = UNI_REPL
      when doInc: inc(i)

  iterator runes(s: cstring, L: int): int =
    var
      i = 0
      ret: int

    while i < L:
      fastRuneAt(s, i, L, ret, true)
      yield ret

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

  var ret: string
  for u in WCHARs(s, s.len):
    ret.add char(u and 0xFF)
    ret.add char(u shr 8)

  ret.add "\0\0"
  result = wstring ret

template L*(x: static[string]): wstring =
  ## Generates a const wstring from `static[string]` at compile time.
  const wstr = ctNewWString(x)
  wstr

template L*(x: string): wstring = +$x
  ## Same as `+$` for dynamic string (string at run-time).

template T*(x: string): untyped =
  ## Generates a wstring or mstring depending on the conditional symbol: `useWinAnsi`.
  # must export winimbase to use winimAnsi here.
  when winimAnsi:
    -$x
  else:
    L(x)

template T*(x: Natural): untyped =
  ## Generates a wstring or mstring buffer depending on the conditional symbol: `useWinAnsi`.
  ## Uses `&` to get the buffer address and then passes it to the Windows API.
  when winimAnsi:
    newMString(x)
  else:
    newWString(x)

when winimAnsi:
  type
    TString* = mstring ## `wstring` or `mstring` depending on the conditional symbol: `useWinAnsi`.
else:
  type
    TString* = wstring ## `wstring` or `mstring` depending on the conditional symbol: `useWinAnsi`.

when isMainModule:
  let str = "the quick brown fox jumps over the lazy dog"
  echo +$str == L"the quick brown fox jumps over the lazy dog"
