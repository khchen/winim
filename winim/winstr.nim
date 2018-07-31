#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2018 Ward
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
##      wstring # new string type to store unicode string
##      mstring # new string type to store ansi string
##
##  *Warning: Assignment for wstring is copy by reference.
##  However, built-in string and mstring is copy by value.*
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
##    converter winstringConverter(s: SomeString): SomeString
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
##    proc newWString(s: string|cstring): wstring
##      # Convert string to wstring and return it (utf8 to unicode)
##    proc newMString(s: string|cstring): mstring
##      # Convert string to mstring and return it (utf8 to ansi)
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
##    proc `[]=`(s: wstring|mstring, i: int, u: string)
##    proc `[]`(s: wstring|mstring, x: HSlice)
##    proc `[]=`(s: var wstring|var mstring, x: Slice[int], b: wstring|mstring)
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
##

{.deadCodeElim: on.}

import macros, strutils, inc.winimbase, core
export strutils.toHex, winimbase

# copy from widestrs.nim, these functions used both compile-time and run-time
# use WCHAR instead of Utf16Char

const
  UNI_REPLACEMENT_CHAR = WCHAR(0xFFFD'i16)
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

proc free(x: pointer) {.inline.} =
  if not x.isNil:
    system.dealloc(x)

proc toHex*(s: cstring): string {.inline.} =
  ## Converts a cstring to its hexadecimal representation.
  ## No prefix like ``0x`` is generated.

  result = toHex($s)

type
  mIndex* = distinct int
    ## Use mIndex in [] or []= for mstring means
    ## index by MBCS characters, not by bytes.

  # todo: add capacity for optimization
  wstring* = ref object
    size: uint32
    data: UncheckedArray[WCHAR]

  mstring* = distinct string

  # for alloc version
  pwstring* = ptr object
    size: uint32
    data: UncheckedArray[WCHAR]

  pmstring* = ptr object
    length: int
    capacity: int
    data: UncheckedArray[char]

  pstring* = pmstring

proc length(x: wstring|pwstring): int {.inline.} =
  result = (x[].size shr 1).int

proc `length=`(x: wstring|pwstring, L: Natural) {.inline.} =
  x[].size = L.uint32 shl 1

proc `&`*(s: string): ptr char {.inline.} =
  ## Get address of the first char of a string.
  ## For string, it has the same meaning as cstring(string), but it checks the nil well.

  if s.isNil:
    result = nil
  else:
    result = cast[ptr char](cstring s)

proc `&`*(s: cstring): ptr char {.inline.} =
  ## Get address of the first char of a string.
  ## For string, it has the same meaning as cstring(string), but it checks the nil well.

  result = cast[ptr char](s)

proc `&`*(s: wstring): ptr WCHAR {.inline.} =
  ## Get address of the first char of a wstring.
  ## For string, it has the same meaning as cstring(string), but it checks the nil well.

  var dummy: wstring
  assert(cast[uint](dummy.data.addr) == 4)

  result = cast[ptr WCHAR](cast[uint](s) + (if s.isNil: 0 else: 4))

proc `&`*(s: mstring): ptr char {.inline.} =
  ## Get address of the first char of a string.
  ## For string, it has the same meaning as cstring(string), but it checks the nil well.

  result = &cast[string](s)

proc stringBuffer(L: Natural, alloc: bool): pointer =
  if alloc:
    result = alloc0(L + sizeof(int) * 2 + 2)
    cast[pmstring](result).length = L
  else:
    result = cast[pointer](newString(L))

proc wstringBuffer(L: Natural, alloc: bool): pointer =
  # make sure there are extra null after wstring
  let size = L * 2 + sizeof(int32) + 4
  if alloc:
    result = alloc0(size)
  else:
    var ws: wstring
    unsafeNew(ws, size)
    result = cast[pointer](ws)

  cast[wstring](result).length = L

template mstringBuffer(L: Natural, alloc: bool): pointer =
  stringBuffer(L, alloc)

proc `UTF8->wstring`(source: ptr char, L: Natural, alloc: bool): pointer =
  if source.isNil: return nil

  result = wstringBuffer(L * 2, alloc)

  var d = 0'i32
  for u in WCHARs(source, L):
    cast[wstring](result).data[d] = u
    inc d

  cast[wstring](result).data[d] = WCHAR(0'i16)
  cast[wstring](result).length = d

proc `UTF8->mstring`(source: ptr char, L: int, alloc: bool): pointer =
  if source.isNil: return nil

  var
    pws = cast[pwstring](`UTF8->wstring`(source, L, alloc=true))
    mLen = WideCharToMultiByte(CP_ACP, 0, pws.data[0].addr, pws.length.int32, nil, 0, nil, nil)
  defer: free(pws)

  result = mstringBuffer(mLen, alloc)
  discard WideCharToMultiByte(CP_ACP, 0, pws.data[0].addr, pws.length.int32, &(cast[string](result)), mLen, nil, nil)

proc `UTF8->string`(source: ptr char, L: int, alloc: bool): pointer =
  if source.isNil: return nil

  result = stringBuffer(L, alloc)
  copyMem(&(cast[string](result)), source, L)

proc `ANSI->wstring`(source: ptr char, L: int, alloc: bool): pointer =
  if source.isNil: return nil

  var nLen = MultiByteToWideChar(CP_ACP, 0, source, L.int32, nil, 0)
  result = wstringBuffer(nLen, alloc)
  discard MultiByteToWideChar(CP_ACP, 0, source, L.int32, cast[wstring](result).data[0].addr, nLen)

proc `ANSI->string`(source: ptr char, L: int, alloc: bool): pointer =
  if source.isNil: return nil

  var
    pws = cast[pwstring](`ANSI->wstring`(source, L, alloc=true))
    mLen = WideCharToMultiByte(CP_UTF8, 0, pws.data[0].addr, pws.length.int32, nil, 0, nil, nil)
  defer: free(pws)

  result = stringBuffer(mLen, alloc)
  discard WideCharToMultiByte(CP_UTF8, 0, pws.data[0].addr, pws.length.int32, &(cast[string](result)), mLen, nil, nil)

template `ANSI->mstring`(source: ptr char, L: int, alloc: bool): pointer =
  `UTF8->string`(source, L, alloc)

proc `UNICODE->mstring`(source: ptr WCHAR, L: int, alloc: bool): pointer =
  if source.isNil: return nil

  var mLen = WideCharToMultiByte(CP_ACP, 0, source, L.int32, nil, 0, nil, nil)
  result = mstringBuffer(mLen, alloc)
  discard WideCharToMultiByte(CP_ACP, 0, source, L.int32, &(cast[string](result)), mLen, nil, nil)

proc `UNICODE->string`(source: ptr WCHAR, L: int, alloc: bool): pointer =
  if source.isNil: return nil

  var mLen = WideCharToMultiByte(CP_UTF8, 0, source, L.int32, nil, 0, nil, nil)
  result = stringBuffer(mLen, alloc)
  discard WideCharToMultiByte(CP_UTF8, 0, source, L.int32, &(cast[string](result)), mLen, nil, nil)

proc `UNICODE->wstring`(source: ptr WCHAR, L: int, alloc: bool): pointer =
  if source.isNil: return nil

  result = wstringBuffer(L, alloc)
  copyMem(cast[wstring](result).data[0].addr, source, L * 2)

# wstring functions

proc len*(x: wstring): int {.inline.} = x.length
proc high*(x:wstring): int {.inline.} = x.length - 1
proc low*(x:wstring): int {.inline.} = 0

proc setLen*(s: var wstring, newLen: Natural) =
  if newLen < s.length:
    s.data[int newLen] = 0.WCHAR
    s.length = newLen.int32
  else:
    var n = cast[wstring](wstringBuffer(newLen, alloc=false))
    copyMem(&n, &s, s.length * 2)
    s = n

proc `==`*(x, y: wstring): bool {.inline.} =
  if x.length == y.length:
    result = equalMem(&x, &y, x.length*2)
  else:
    result = false

proc cmp*(x, y: wstring): int {.inline.} =
  lstrcmpW(&x, &y)

proc `<=`*(x, y: wstring): bool {.inline.} =
  if cmp(x, y) <= 0: return true
  return false

proc `<`*(x, y: wstring): bool {.inline.} =
  if cmp(x, y) < 0: return true
  return false

proc wstringFromPtr[P: ptr](src1: P, len1: int, src2: P = nil, len2: int = 0): wstring =
  var newLen = len1 + len2
  result = cast[wstring](wstringBuffer(newLen, alloc=false))
  copyMem(result.data.unsafeaddr, src1, len1 * 2)
  if len2 != 0: copyMem(result.data[len1].unsafeaddr, src2, len2 * 2)

proc substr*(s: wstring, first = 0): wstring {.inline.} =
  result = wstringFromPtr(s.data[first].unsafeaddr, s.length - first)

proc substr*(s: wstring, first, last: int): wstring =
  let first = if first < 0: 0 else: first
  if last < first:
    result = cast[wstring](wstringBuffer(0, alloc=false))
  else:
    let last = if last >= s.length: s.length - 1 else: last
    result = wstringFromPtr(s.data[first].unsafeaddr, last - first + 1)

proc `[]`*(s: wstring, i: int): WCHAR {.inline.} =
  if i >= s.length:
    raise newException(IndexError, "index out of bounds")
  s.data[i]

proc `[]=`*(s: wstring, i: int, u: WCHAR|char) {.inline.} =
  if i >= s.length:
    raise newException(IndexError, "index out of bounds")
  s.data[i] = cast[WCHAR](u)

proc `[]=`*(s: wstring, i: int, u: string) =
  if i >= s.length:
    raise newException(IndexError, "index out of bounds")
  elif u.isNil or u.len == 0:
    s[i] = 0
  else:
    for ch in runes(u, u.len):
      s[i] = cast[WCHAR](ch)
      break

template `^^`(s, i: untyped): untyped =
  (when i is BackwardsIndex: s.len - int(i) else: int(i))

proc `[]`*[T, U](s: wstring, x: HSlice[T, U]): wstring =
  let a = s ^^ x.a
  let L = (s ^^ x.b) - a + 1
  if a < 0 or a + L > s.length:
    raise newException(IndexError, "index out of bounds")
  result = s.substr(a, a + L-1)

proc `&`*(x, y: wstring): wstring {.inline.} =
  result = wstringFromPtr(x.data.unsafeaddr, x.length, y.data.unsafeaddr, y.length)

proc `&`*(x: wstring, y: WCHAR|char): wstring {.inline.} =
  var c = y.WCHAR
  result = wstringFromPtr(x.data[0].unsafeaddr, x.length, c.addr, 1)

proc `[]=`*[T, U](s: var wstring, x: HSlice[T, U], b: wstring) =
  let a = s ^^ x.a
  let L = (s ^^ x.b) - a + 1
  if L == b.length:
    for i in 0 ..< L: s.data[i+a] = b.data[i]
  else:
    var slen = s.length
    var shift = b.length - L
    var newLen = slen + shift
    if shift > 0:
      setLen(s, newLen)
      for i in countdown(newLen-1, a+shift+1): s.data[i] = s.data[i-shift]
    else:
      for i in countup(a+b.length, s.length-1+shift): s.data[i] = s.data[i-shift]
      setLen(s, newLen)
    for i in 0 ..< b.length: s.data[i+a] = b.data[i]

proc add*(x: var wstring, y: char|WCHAR) {.inline.} =
  ## bad implement, don't use if possible !!
  var n = x & y
  shallowCopy(x, n)

proc add*(x: var wstring, y: wstring) {.inline.} =
  ## bad implement, don't use if possible !!
  var n = x & y
  shallowCopy(x, n)

proc toHex*(s: wstring): string {.inline.} =
  ## Converts a wstring to its hexadecimal representation.
  ## No prefix like ``0x`` is generated.

  result = toHex(&s, s.len * 2)

iterator items*(a: wstring): WCHAR =
  var i = 0
  while i < a.length:
    yield a.data[i]
    inc(i)

iterator mitems*(a: var wstring): var WCHAR =
  var i = 0
  while i < a.length:
    yield a.data[i]
    inc(i)

iterator pairs*(a: wstring): tuple[key: int, val: WCHAR] =
  var i = 0
  while i < a.length:
    yield (i, a.data[i])
    inc(i)

iterator mpairs*(a: var wstring): tuple[key: int, val: var WCHAR] =
  var i = 0
  while i < a.length:
    yield (i, a.data[i])
    inc(i)

proc repr*(s: wstring): string =
  result = $cast[int](s).tohex & "(wstring)\""
  if not s.isNil:
    for u in s:
      if u == 0.WCHAR:
        result &= "\\0"
      else:
        var wchar = u
        var pstr = cast[pstring](`UNICODE->string`(wchar.addr, 1, alloc=true))
        defer: free(pstr)
        result &= cast[string](pstr)
  result &= "\""

# mstring functions

proc `&` * (x: mstring, y: char): mstring {.borrow.}
proc `&` * (x, y: mstring): mstring {.borrow.}
proc `&` * (x: char, y: mstring): mstring {.borrow.}
proc add*(x: var mstring, y: char) {.borrow.}
proc add*(x: var mstring, y: string) {.borrow.}
proc add*(x: var mstring, y: mstring) {.borrow.}
proc cmp*(x, y: mstring): int {.borrow.}
proc cmp*(x: mstring, y: string): int {.borrow.}
proc `==`*(x, y: mstring): bool {.borrow.}
proc `<=` *(x, y: mstring): bool {.borrow.}
proc `<=` *(x: mstring, y: string): bool {.borrow.}
proc `<` *(x, y: mstring): bool {.borrow.}
proc substr*(s: mstring, first = 0): mstring {.borrow.}
proc substr*(s: mstring, first, last: int): mstring {.borrow.}
proc isNil(x: mstring): bool {.borrow.}

proc setLen*(s: var mstring, newLen: Natural) {.inline.} =
  var pstr = cast[ptr string](s.unsafeaddr)
  setLen(pstr[], newLen)

proc `[]`*(s: mstring, i: int): char {.inline.} =
  var pstr = cast[ptr string](s.unsafeaddr)
  result = pstr[i]

proc `[]=`*(s: mstring, i: int, x: char) {.inline.} =
  var pstr = cast[ptr string](s.unsafeaddr)
  pstr[i] = x

proc len*(s: mstring): int {.inline.} =
  result = cast[string](s).len

proc toHex*(s: mstring): string {.inline.} =
  ## Converts a mstring to its hexadecimal representation.
  ## No prefix like ``0x`` is generated.

  result = toHex(&s, s.len)

iterator items*(s: mstring): mstring =
  let pws = cast[pwstring](`ANSI->wstring`(&s, s.len, alloc=true))
  defer: free(pws)

  for w in cast[wstring](pws):
    var wchar = w
    let pms = cast[pmstring](`UNICODE->mstring`(wchar.addr, 1, alloc=true))
    defer: free(pms)

    yield cast[mstring](pms)

iterator pairs*(s: mstring): tuple[key: int, val: mstring] =
  let pws = cast[pwstring](`ANSI->wstring`(&s, s.len, alloc=true))
  defer: free(pws)

  var i = 0
  for w in cast[wstring](pws):
    var wchar = w
    let pms = cast[pmstring](`UNICODE->mstring`(wchar.addr, 1, alloc=true))
    defer: free(pms)

    yield (i, cast[mstring](pms))
    i += pms.length

proc repr*(s: mstring): string =
  result = $cast[int](s).tohex & "(mstring)\""
  if not s.isNil:
    for sub in s:
      if sub[0] == '\0':
        result &= "\\0"
      else:
        var pstr = cast[pstring](`ANSI->string`(&sub, sub.len, alloc=true))
        defer: free(pstr)
        result &= cast[string](pstr)

  result &= "\""

proc mlen*(s: mstring): int =
  let pws = cast[pwstring](`ANSI->wstring`(&s, s.len, alloc=true))
  defer: free(pws)
  result = cast[wstring](pws).len

proc `[]`*(s: mstring, i: mIndex): mstring =
  let
    pws = cast[pwstring](`ANSI->wstring`(&s, s.len, alloc=true))
    L = cast[wstring](pws).len
    i = int i
  defer: free(pws)

  if i >= L:
    raise newException(IndexError, "index out of bounds")

  var wchar = cast[wstring](pws)[i]
  result = cast[mstring](`UNICODE->mstring`(wchar.addr, 1, alloc=false))

proc `[]=`*(s: var mstring, i: mIndex, x: mstring) =
  let
    pws = cast[pwstring](`ANSI->wstring`(&s, s.len, alloc=true))
    ws = cast[wstring](pws)
    L = ws.len
    i = int i
  defer: free(pws)

  if i >= L:
    raise newException(IndexError, "index out of bounds")

  var wchar: WCHAR = 0
  if x.len > 0:
    let pws2 = cast[pwstring](`ANSI->wstring`(&x, x.len, alloc=true))
    defer: free(pws2)
    wchar = cast[wstring](pws2)[0]

  cast[wstring](pws)[i] = wchar
  s = cast[mstring](`UNICODE->mstring`(&ws, L, alloc=false))

proc `[]`*[T, U](s: mstring, x: HSlice[T, U]): mstring =
  when T is mIndex or U is mIndex:
    let
      pws = cast[pwstring](`ANSI->wstring`(&s, s.len, alloc=true))
      ws = `[]`(cast[wstring](pws), x)
    defer: free(pws)

    result = cast[mstring](`UNICODE->mstring`(&ws, ws.len, alloc=false))
  else:
    result = cast[mstring](`[]`(cast[string](s), x))

proc `[]=`*[T, U](s: var mstring, x: HSlice[T, U], b: mstring) =
  when T is mIndex or U is mIndex:
    var
      pws = cast[pwstring](`ANSI->wstring`(&s, s.len, alloc=true))
      pwsb = cast[pwstring](`ANSI->wstring`(&b, b.len, alloc=true))
      ws = cast[wstring](pws)
    defer:
      free(pws)
      free(pwsb)

    `[]=`(ws, x, cast[wstring](pwsb))
    s = cast[mstring](`UNICODE->mstring`(&ws, ws.len, alloc=false))
  else:
    `[]=`(cast[var string](s.unsafeaddr), x, cast[string](b))


proc newWString*(s: cstring|string|int): wstring =
  ## Return a new wstring.

  when s is cstring|string:
    result = cast[wstring](`UTF8->wstring`(&s, s.len, alloc=false))
  elif s is int:
    result = cast[wstring](wstringBuffer(s, alloc=false))


proc newMString*(s: string|cstring|int): mstring =
  ## Return a new mstring.

  when s is cstring|string:
    result = cast[mstring](`UTF8->mstring`(&s, s.len, alloc=false))
  elif s is int:
    result = cast[mstring](mstringBuffer(s, alloc=false))


proc allocString*(s: string|cstring|wstring|mstring|int): pstring =
  ## Create a string buffer, need to be dealloc.
  ## Exists only for optimization purposes.

  when s is cstring|string:
    result = cast[pstring](`UTF8->string`(&s, s.len, alloc=true))
  elif s is wstring:
    result = cast[pstring](`UNICODE->string`(&s, s.len, alloc=true))
  elif s is mstring:
    result = cast[pstring](`ANSI->string`(&s, s.len, alloc=true))
  elif s is int:
    result = cast[pstring](stringBuffer(s, alloc=true))


proc allocWString*(s: cstring|string|wstring|mstring|int): pwstring =
  ## Create a wstring buffer, need to be dealloc.
  ## Exists only for optimization purposes.

  when s is cstring|string:
    result = cast[pwstring](`UTF8->wstring`(&s, s.len, alloc=true))
  elif s is wstring:
    result = cast[pwstring](`UNICODE->wstring`(&s, s.len, alloc=true))
  elif s is mstring:
    result = cast[pwstring](`ANSI->wstring`(&s, s.len, alloc=true))
  elif s is int:
    result = cast[pwstring](wstringBuffer(s, alloc=true))


proc allocMString*(s: string|cstring|wstring|mstring|int): pmstring =
  ## Create a mstring buffer, need to be dealloc.
  ## Exists only for optimization purposes.

  when s is cstring|string:
    result = cast[pmstring](`UTF8->mstring`(&s, s.len, alloc=true))
  elif s is wstring:
    result = cast[pmstring](`UNICODE->mstring`(&s, s.len, alloc=true))
  elif s is mstring:
    result = cast[pmstring](`ANSI->mstring`(&s, s.len, alloc=true))
  elif s is int:
    result = cast[pmstring](mstringBuffer(s, alloc=true))


proc `&`[I, T](a: array[I, T]|var array[I, T]): ptr array[I, T] {.inline.} =
  result = a.unsafeaddr

# use proc instead of template to avoid re-evaluation of s
proc `$`*(s: wstring|mstring|LPWSTR|BSTR): string {.inline.} =
  ## Convert any stringable type to string.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.

  when s is wstring:
    cast[string](`UNICODE->string`(&s, s.len, alloc=false))
  elif s is mstring:
    cast[string](`ANSI->string`(&s, s.len, alloc=false))
  elif s is LPWSTR:
    cast[string](`UNICODE->string`(s, lstrlenW(s), alloc=false))
  elif s is BSTR:
    cast[string](`UNICODE->string`(s, SysStringLen(s).int, alloc=false))

proc `$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): string {.inline.} =
  ## Convert any stringable type to string.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.

  when a is array[I, char]:
    cast[string](`UTF8->string`(&a, a.len, alloc=false))
  elif a is array[I, WCHAR]:
    cast[string](`UNICODE->string`(&a, a.len, alloc=false))
  elif a is ptr array[I, char]:
    cast[string](`UTF8->string`(cast[ptr char](a), a[].len, alloc=false))
  elif a is ptr array[I, WCHAR]:
    cast[string](`UNICODE->string`(cast[ptr WCHAR](a), a[].len, alloc=false))

proc `+$`*(s: string|cstring|ptr char|wstring|mstring|LPWSTR|BSTR|char|WCHAR): wstring {.inline.} =
  ## Convert any stringable type to wstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.

  when s is string:
    cast[wstring](`UTF8->wstring`(&s, s.len, alloc=false))
  elif s is cstring|ptr char:
    cast[wstring](`UTF8->wstring`(&s, cast[cstring](s).len, alloc=false))
  elif s is mstring:
    cast[wstring](`ANSI->wstring`(&s, s.len, alloc=false))
  elif s is wstring:
    s
  elif s is LPWSTR:
    cast[wstring](`UNICODE->wstring`(s, lstrlenW(s), alloc=false))
  elif s is BSTR:
    cast[wstring](`UNICODE->wstring`(s, SysStringLen(s).int, alloc=false))
  elif s is char|WCHAR:
    var wchar = s.WCHAR
    cast[wstring](`UNICODE->wstring`(wchar.addr, 1, alloc=false))

proc `+$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): wstring {.inline.} =
  ## Convert any stringable type to wstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.

  when a is array[I, char]:
    cast[wstring](`UTF8->wstring`(&a, a.len, alloc=false))
  elif a is array[I, WCHAR]:
    cast[wstring](`UNICODE->wstring`(&a, a.len, alloc=false))
  elif a is ptr array[I, char]:
    cast[wstring](`UTF8->wstring`(cast[ptr char](a), a[].len, alloc=false))
  elif a is ptr array[I, WCHAR]:
    cast[wstring](`UNICODE->wstring`(cast[ptr WCHAR](a), a[].len, alloc=false))

proc `-$`*(s: string|cstring|ptr char|wstring|mstring|LPWSTR|BSTR|char|WCHAR): mstring {.inline.} =
  ## Convert any stringable type to mstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.

  when s is string:
    cast[mstring](`UTF8->mstring`(&s, s.len, alloc=false))
  elif s is cstring|ptr char:
    cast[mstring](`UTF8->mstring`(&s, cast[cstring](s).len, alloc=false))
  elif s is wstring:
    cast[mstring](`UNICODE->mstring`(&s, s.len, alloc=false))
  elif s is mstring:
    s
  elif s is LPWSTR:
    cast[mstring](`UNICODE->mstring`(s, lstrlenW(s), alloc=false))
  elif s is BSTR:
    cast[mstring](`UNICODE->mstring`(s, SysStringLen(s).int, alloc=false))
  elif s is char:
    var c = s
    cast[mstring](`ANSI->mstring`(c.addr, 1, alloc=false))
  elif s is WCHAR:
    var c = s
    cast[mstring](`UNICODE->mstring`(c.addr, 1, alloc=false))


proc `-$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): mstring {.inline.} =
  ## Convert any stringable type to mstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is utf8 encoding.

  when a is array[I, char]:
    cast[mstring](`UTF8->mstring`(&a, a.len, alloc=false))
  elif a is array[I, WCHAR]:
    cast[mstring](`UNICODE->mstring`(&a, a.len, alloc=false))
  elif a is ptr array[I, char]:
    cast[mstring](`UTF8->mstring`(cast[ptr char](a), a[].len, alloc=false))
  elif a is ptr array[I, WCHAR]:
    cast[mstring](`UNICODE->mstring`(cast[ptr WCHAR](a), a[].len, alloc=false))


proc `$$`*(s: string|cstring|ptr char|wstring|mstring|LPWSTR|BSTR|char|WCHAR): string {.inline.} =
  ## Convert any stringable type to string.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.

  when s is string:
    cast[string](`ANSI->string`(&s, s.len, alloc=false))
  elif s is cstring|ptr char:
    cast[string](`ANSI->string`(&s, cast[cstring](s).len, alloc=false))
  elif s is WCHAR:
    var c = s
    cast[string](`UNICODE->string`(c.addr, 1, alloc=false))
  else:
    $s


proc `$$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): string {.inline.} =
  ## Convert any stringable type to string.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.

  when a is array[I, char]:
    cast[string](`ANSI->string`(&a, a.len, alloc=false))
  elif a is ptr array[I, char]:
    cast[string](`ANSI->string`(cast[ptr char](a), a[].len, alloc=false))
  else:
    $a


proc `+$$`*(s: string|cstring|ptr char|wstring|mstring|LPWSTR|BSTR|char|WCHAR): wstring {.inline.} =
  ## Convert any stringable type to wstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.

  when s is string:
    cast[wstring](`ANSI->wstring`(&s, s.len, alloc=false))
  elif s is cstring|ptr char:
    cast[wstring](`ANSI->wstring`(&s, cast[cstring](s).len, alloc=false))
  else:
    +$s


proc `+$$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): wstring {.inline.} =
  ## Convert any stringable type to wstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.

  when a is array[I, char]:
    cast[wstring](`ANSI->wstring`(&a, a.len, alloc=false))
  elif a is ptr array[I, char]:
    cast[wstring](`ANSI->wstring`(cast[ptr char](a), a[].len, alloc=false))
  else:
    +$a


proc `-$$`*(s: string|cstring|ptr char|wstring|mstring|LPWSTR|BSTR|char|WCHAR): mstring {.inline.} =
  ## Convert any stringable type to mstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.

  when s is string:
    cast[mstring](`ANSI->mstring`(&s, s.len, alloc=false))
  elif s is cstring|ptr char:
    cast[mstring](`ANSI->mstring`(&s, cast[cstring](s).len, alloc=false))
  else:
    -$s


proc `-$$`*[I](a: array[I, char]|array[I, WCHAR]|ptr array[I, char]|ptr array[I, WCHAR]): mstring {.inline.} =
  ## Convert any stringable type to mstring.
  ## This operator assume string|cstring|LPSTR|ptr char|char array is ansi encoding.

  when a is array[I, char]:
    cast[mstring](`ANSI->mstring`(&a, a.len, alloc=false))
  elif a is ptr array[I, char]:
    cast[mstring](`ANSI->mstring`(cast[ptr char](a), a[].len, alloc=false))
  else:
    -$a

proc nullTerminate*(s: var string) {.inline.} =
  ## Assume a string is null terminated and set the correct length

  let L = lstrlenA(cast[LPCSTR](&s))
  if L < s.len:
    s.setLen(L)

proc nullTerminate*(s: var mstring) {.inline.} =
  ## Assume a string is null terminated and set the correct length

  # why not use generics? because there is a bug about var string|string in generics version
  # setLen there will complain s is "string" not var "string"
  nullTerminate(cast[var string](s.unsafeaddr))

proc nullTerminate*(s: var wstring) {.inline.} =
  ## Assume a string is null terminated and set the correct length

  let L = lstrlenW(cast[LPWSTR](&s))
  if L < s.len:
    s.setLen(L)

proc nullTerminated*[T: string|mstring|wstring](s: T): T {.inline.} =
  ## Assume a string is null terminated and return the length-corrected string

  when s is wstring:
    result = +$(&s)
  elif s is mstring:
    result = -$(&s)
  else: # string
    result = $(&s)

template fastCharAt(s: string|mstring|wstring, i: int): untyped =
  when s is wstring:
    s.data[int i]
  else:
    s[i]

proc fillArray[I, T: char|byte|WCHAR](a: ptr array[I, T]|var array[I, T], s: mstring|string|wstring, inclNull = false) =
  when T is WCHAR and s is not wstring:
    {.fatal: "type mismatch".}

  when a is ptr:
    for i in a[].low..min(a[].high, s.len-1):
      a[i] = cast[T](s.fastCharAt i)

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
    cast[ptr T](cast[int](p) + i*sizeof(T))[] = cast[T](s.fastCharAt i)

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
converter winstringConverterStringToLPWSTR*(x: string): LPWSTR = cast[LPWSTR](&(+$x))
converter winstringConverterCStringToLPWSTR*(x: cstring): LPWSTR = cast[LPWSTR](&(+$x))
converter winstringConverterWStringToLPWSTR*(x: wstring): LPWSTR = cast[LPWSTR](&x)
converter winstringConverterBSTRToLPWSTR*(x: BSTR): LPWSTR = cast[LPWSTR](x)

converter winstringConverterStringToBSTR*(x: string): BSTR = cast[BSTR](&(+$x))
converter winstringConverterCStringToBSTR*(x: cstring): BSTR = cast[BSTR](&(+$x))
converter winstringConverterWStringToBSTR*(x: wstring): BSTR = cast[BSTR](&x)

converter winstringConverterStringToPtrChar*(x: string): ptr char = cast[ptr char](&x)
converter winstringConverterCStringToPtrChar*(x: cstring): ptr char = cast[ptr char](x)
converter winstringConverterMStringToPtrChar*(x: mstring): ptr char = cast[ptr char](&x)
converter winstringConverterMStringToLPSTR*(x: mstring): LPSTR = cast[LPSTR](&x)

converter winstringConverterArrayToLPSTR*[I, T: char](x: array[I, T]): LPSTR = cast[LPSTR](x.unsafeaddr)
converter winstringConverterPtrArrayToLPSTR*[I, T: char](x: ptr array[I, T]): LPSTR = cast[LPSTR](x)

converter winstringConverterArrayToPtrChar*[I, T: char](x: array[I, T]): ptr char = cast[ptr char](x.unsafeaddr)
converter winstringConverterPtrArrayToPtrChar*[I, T: char](x: ptr array[I, T]): ptr char = cast[ptr char](x)

converter winstringConverterArrayToLPWSTR*[I, T: WCHAR](x: array[I, T]): LPWSTR = cast[LPWSTR](x.unsafeaddr)
converter winstringConverterPtrArrayToLPWSTR*[I, T: WCHAR](x: ptr array[I, T]): LPWSTR = cast[LPWSTR](x)

converter winstringConverterWideCStringToLPWSTR*(x: WideCString): LPWSTR = cast[LPWSTR](x[0].unsafeaddr)
converter winstringConverterWideCStringToWString*(x: WideCString): wstring = +$cast[LPWSTR](x[0].unsafeaddr)
converter winstringConverterWStringToWideCString*(x: wstring): WideCString =
  unsafeNew(result, x.length * 2 + 2)
  copyMem(result[0].unsafeaddr, &x, x.length * 2)

macro L*(x: string): untyped =
  ## Generate unicode string at compile-time if possible.

  if x.kind in {nnkStrLit, nnkRStrLit, nnkTripleStrLit}:
    var str = x.strVal
    if str.len == 0:
      result = prefix(newStrLitNode(""), "+$")
    else:
      var node = newNimNode(nnkBracket)
      for u in WCHARs(str, str.len):
        node.add(newDotExpr(newIntLitNode(u.int), newIdentNode("WCHAR")))

      result = prefix(node, "+$")

  else:
    result = prefix(x, "+$")

macro T*(x: string): untyped =
  ## Generate wstring or mstring depend on conditional symbol: useWinAnsi.

  when winimAnsi:
    result = prefix(x, "-$")
  else:
    if x.kind in {nnkStrLit, nnkRStrLit, nnkTripleStrLit}:
      result = prefix(x, "L")
    else:
      result = prefix(x, "+$")

template T*(x: Natural): untyped =
  ## Generate wstring or mstring buffer depend on conditional symbol: useWinAnsi.
  ## Use `&` to get the buffer address and then pass to Windows API.

  when winimAnsi:
    newMString(x)
  else:
    newWString(x)

when isMainModule:

  let str = "the quick brown fox jumps over the lazy dog"
  echo +$str == L"the quick brown fox jumps over the lazy dog"

  # for some example to see how to use mstring/wstring
  # see getopenfilename.nim in examples folder
