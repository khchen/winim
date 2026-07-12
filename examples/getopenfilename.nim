#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
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
  # This proc always uses the ANSI version of the API.
  # Here we need to pass an ANSI string to the API, namely an mstring in Winim.
  # Use -$ to convert the built-in string (UTF-8) to an mstring (ANSI).
  var
    buffer = newMString(bufferSize)
    o = OPENFILENAMEA(
      lStructSize: sizeof OPENFILENAMEA,
      lpstrTitle: -$"ansi test 中文測試",
      lpstrFile: &buffer,
      nMaxFile: bufferSize,
      Flags: OFN_EXPLORER or OFN_ALLOWMULTISELECT)

  if GetOpenFileNameA(o):
    echoResult($buffer) # `$` here converts an ANSI string to a UTF-8 string.

# This version always uses a Unicode string and the Unicode version of the API.
# Without L, the code still works, but it needs runtime encoding conversion.

proc unicodeTest() =
  # This proc always uses the Unicode version of the API.
  # Here we need to pass a Unicode string to the API, namely a wstring in Winim.
  # Use +$ to convert the built-in string (UTF-8) to a wstring (Unicode).
  # However, using L performs this conversion at compile time (+$ does it at run time).
  var
    buffer = newWString(bufferSize)
    o = OPENFILENAMEW(
      lStructSize: sizeof OPENFILENAMEW,
      lpstrTitle: L"unicode test 中文測試",
      lpstrFile: &buffer, # `&` get address for any string type
      nMaxFile: bufferSize,
      Flags: OFN_EXPLORER or OFN_ALLOWMULTISELECT)

  if GetOpenFileNameW(o):
    echoResult($buffer) # `$` here converts a Unicode string to a UTF-8 string.

proc universalTest() =
  # This proc uses the ANSI or Unicode version of the API depending on the conditional symbol.
  # Here we need to use T for strings and buffers.
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
