#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#====================================================================

import winim/com
import threadpool

proc thread(stream: ptr IStream): bool {.thread.} =
  CoInitialize(nil)

  var disp: ptr IDispatch
  if SUCCEEDED CoGetInterfaceAndReleaseStream(stream, &IID_IDispatch, cast[ptr pointer](&disp)):
    var dict = wrap(disp)
    dict.add("child", "thread")
    disp.Release()

  COM_FullRelease()
  CoUninitialize()

proc main() =
  var dict = CreateObject("Scripting.Dictionary")
  dict.add("main", "thread")

  var stream: ptr IStream
  if SUCCEEDED CoMarshalInterThreadInterfaceInStream(&IID_IDispatch, unwrap(dict), &stream):
    var fv = spawn thread(stream)
    var msg: MSG
    while not fv.isReady():
      if PeekMessage(&msg, 0, 0, 0, PM_REMOVE) != 0:
        DispatchMessage(&msg)

  for key in dict:
    echo key, " => ", dict.item(key)

main()
