#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2021 Ward
#
#====================================================================

import winim/com
import threadpool

proc getGit(): ptr IGlobalInterfaceTable =
  const CLSID_StdGlobalInterfaceTable = DEFINE_GUID(0x00000323'i32, 0x0000, 0x0000,
    [0xC0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])

  if FAILED CoCreateInstance(&CLSID_StdGlobalInterfaceTable, nil, CLSCTX_INPROC_SERVER,
    &IID_IGlobalInterfaceTable, cast[ptr pointer](&result)):
    raise

proc thread(cookie: DWORD): bool {.thread.} =
  CoInitialize(nil)

  var git = getGit()
  var disp: ptr IDispatch
  if SUCCEEDED git.GetInterfaceFromGlobal(cookie, &IID_IDispatch, cast[ptr pointer](&disp)):
    var dict = wrap(disp)
    dict.add("child", "thread")
    disp.Release()

  COM_FullRelease()
  CoUninitialize()

proc main() =
  var dict = CreateObject("Scripting.Dictionary")
  dict.add("main", "thread")

  var git = getGit()
  var cookie: DWORD
  if SUCCEEDED git.RegisterInterfaceInGlobal(unwrap(dict), &IID_IDispatch, &cookie):
    var fv = spawn thread(cookie)
    var msg: MSG
    while not fv.isReady():
      if PeekMessage(&msg, 0, 0, 0, PM_REMOVE) != 0:
        DispatchMessage(&msg)

  for key in dict:
    echo key, " => ", dict.item(key)

main()
