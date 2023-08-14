#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
#====================================================================

import winim/[lean, shell]
import strutils

const bufferSize = 65536
converter intToDWORD(x: int): DWORD = DWORD x

proc echoResult(str: string) =
  var str = str
  str.setLen(str.find("\0\0"))
  for i in str.split("\0"):
    echo i

proc ansiTest() =
  # this proc always use ansi version API
  # here we need to pass ansi string to API, aka mstring in winim
  # use -$ to convert built-in string (utf8) to mstring (ansi)
  var
    buffer = newMString(bufferSize)
    o = OPENFILENAMEA(
      lStructSize: sizeof OPENFILENAMEA,
      lpstrTitle: -$"ansi test 中文測試",
      lpstrFile: &buffer,
      nMaxFile: bufferSize,
      Flags: OFN_EXPLORER or OFN_ALLOWMULTISELECT)

  if GetOpenFileNameA(o):
    echoResult($buffer) # `$` here convert ansi string to utf8 string

# this version always use unicode string and use unicode version API
# without L the code still works, but need runtime encoding conversion

proc unicodeTest() =
  # this proc always use unicode version API
  # here we need to pass unicode string to API, aka wstring in winim
  # use +$ to convert built-in string (utf8) to mstring (ansi)
  # however, use L we can do this convsersion on compile-time (+$ is for run-time)
  var
    buffer = newWString(bufferSize)
    o = OPENFILENAMEW(
      lStructSize: sizeof OPENFILENAMEW,
      lpstrTitle: L"unicode test 中文測試",
      lpstrFile: &buffer, # `&` get address for any string type
      nMaxFile: bufferSize,
      Flags: OFN_EXPLORER or OFN_ALLOWMULTISELECT)

  if GetOpenFileNameW(o):
    echoResult($buffer) # `$` here convert unicode string to utf8 string

proc universalTest() =
  # this proc use ansi or unicode version API depend on conditional symbol
  # here we need to
  var
    buffer = T(bufferSize)
    o = OPENFILENAME(
      lStructSize: OPENFILENAME.sizeof,
      lpstrTitle: T("universal test 中文測試"),
      lpstrFile: &buffer,
      nMaxFile: bufferSize,
      Flags: OFN_EXPLORER or OFN_ALLOWMULTISELECT)

  if GetOpenFileName(o):
    echoResult($buffer)

ansiTest()
unicodeTest()
universalTest()
