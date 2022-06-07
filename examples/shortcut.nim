#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2022 Ward
#
#====================================================================

import os, winim/mean

var
  pIL: ptr IShellLink
  pPF: ptr IPersistFile
  link = getTempDir() & "shortcut_test.lnk"

converter pointerConverter(x: ptr): ptr PVOID = cast[ptr PVOID](x)

proc save() =
  try:
    if CoCreateInstance(&CLSID_ShellLink, nil, CLSCTX_LOCAL_SERVER, &IID_IShellLink, &pIL).FAILED: raise
    defer: pIL.Release()

    if pIL.QueryInterface(&IID_IPersistFile, &pPF).FAILED: raise
    defer: pPF.Release()

    if pIL.SetPath(getAppFilename()).FAILED or pPF.Save(link, true).FAILED: raise

    echo "save path to shortcut: ", link

  except:
    echo "something wrong !!"

proc load() =
  try:
    if CoCreateInstance(&CLSID_ShellLink, nil, CLSCTX_LOCAL_SERVER, &IID_IShellLink, &pIL).FAILED: raise
    defer: pIL.Release()

    if pIL.QueryInterface(&IID_IPersistFile, &pPF).FAILED: raise
    defer: pPF.Release()

    if pPF.Load(link, STGM_READ).FAILED or pIL.Resolve(0, SLR_NO_UI).FAILED: raise

    var buffer = T(MAX_PATH)
    if pIL.GetPath(&buffer, MAX_PATH, nil, 0).FAILED: raise

    echo "load path from shortcut: ", buffer.null_terminated

  except:
    echo "something wrong !!"

  finally:
    removeFile(link)

proc main() =
  CoInitialize(nil)
  defer: CoUninitialize()

  save()
  load()

main()
