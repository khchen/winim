#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import winim/com

proc getBinaryMethod1(obj: com): string =
  var arr = fromVariant[COMArray1D](obj.responseBody)
  result = newStringOfCap(arr.len)

  for i in arr:
    result.add(char i)

proc getBinaryMethod2(obj: com): string =
  var
    unknown = fromVariant[ptr IUnknown](obj.responseStream)
    stream: ptr IStream

  if unknown.QueryInterface(&IID_IStream, cast[ptr pointer](&stream)).SUCCEEDED:
    defer: stream.Release()

    var
      buffer = newString(1024)
      cbRead: ULONG

    while true:
      if not stream.Read(&buffer, ULONG buffer.len, &cbRead).SUCCEEDED:
        break

      if cbRead == 0:
        break

      result.add buffer[0..<cbRead]

proc getBinaryMethod3(obj: com): string =
  result = string fromVariant[COMBinary](obj.responseBody)


when isMainModule:

  const PNGSignature = "\x89\x50\x4E\x47\x0D\x0A\x1A\x0A"

  var obj = CreateObject("WinHttp.WinHttpRequest.5.1")
  obj.open("get", "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")
  obj.send()

  let
    binary1 = obj.getBinaryMethod1()
    binary2 = obj.getBinaryMethod2()
    binary3 = obj.getBinaryMethod3()

  if binary1 == binary2 and binary2 == binary3 and binary1[0..7] == PNGSignature:
    echo "Get a PNG file (", binary1.len, " bytes)."
