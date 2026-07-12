#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import winim/com
import threadpool

const monikerName = "winimcomtest"

proc thread(): bool {.thread.} =
  var dict = GetObject(monikerName)
  dict.add("child", "thread")

proc main() =
  var dict = CreateObject("Scripting.Dictionary")
  dict.add("main", "thread")

  var pROT: ptr IRunningObjectTable
  GetRunningObjectTable(0, &pROT)
  defer: pROT.Release()

  var pMoniker: ptr IMoniker
  CreateFileMoniker(monikerName, &pMoniker)
  defer: pMoniker.Release()

  var cookie: DWORD
  pROT.Register(ROTFLAGS_REGISTRATIONKEEPSALIVE,
    cast[ptr IUnknown](unwrap(dict)), pMoniker, &cookie)
  defer: pROT.Revoke(cookie)

  var fv = spawn thread()
  var msg: MSG
  while not fv.isReady():
    if PeekMessage(&msg, 0, 0, 0, PM_REMOVE) != 0:
      DispatchMessage(&msg)

  for key in dict:
    echo key, " => ", dict.item(key)

main()
