{.compile: "miniz.c".}

proc mz_compressBound(source_len: culong): culong {.importc, cdecl.}
proc mz_compress2(pDest: cstring, pDest_len: ptr culong, pSource: cstring, source_len: culong, level: cint): cint {.importc, cdecl.}
proc mz_uncompress(pDest: cstring, pDest_len: ptr culong, pSource: cstring, source_len: culong): cint {.importc, cdecl.}

# Compression levels: 0-9 are the standard zlib-style levels, 10 is best possible compression (not zlib compatible, and may be very slow), MZ_DEFAULT_COMPRESSION=MZ_DEFAULT_LEVEL.
proc compress*(src: cstring, srcLen: int, level = 6): string =
  var maxLen = mz_compressBound(culong srcLen) + culong sizeof(culong)
  result = newString(maxLen)
  var destLen = maxLen
  var ret = mz_compress2(result, addr destLen, src, culong srcLen, cint level)
  assert ret == 0
  cast[ptr culong](addr result[destLen])[] = culong srcLen
  result.setLen(destLen + culong sizeof(culong))

proc compress*(src: string, level = 6): string {.inline.} =
  result = compress(cstring src, src.len, level)

proc uncompress*(src: cstring, srcLen: int): string =
  var originalLen = cast[ptr culong](cast[int](src) + srcLen - sizeof(culong))[]
  result = newString(originalLen)
  var destLen = originalLen
  var ret = mz_uncompress(result, addr destLen, src, culong srcLen)
  assert ret == 0 and destLen == originalLen

proc uncompress*(src: string): string {.inline.} =
  result = uncompress(cstring src, src.len)
