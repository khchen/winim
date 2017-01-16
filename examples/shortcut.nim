import os
import winim

var
  pIL: ptr IShellLink
  pPF: ptr IPersistFile
  link = getTempDir() & "shortcut_test.lnk"

proc save() =
  try:
    if CoCreateInstance(&CLSID_ShellLink, nil, CLSCTX_LOCAL_SERVER, &IID_IShellLink, cast[ptr PVOID](&pIL)).FAILED: raise
    defer: pIL.Release()

    if pIL.QueryInterface(&IID_IPersistFile, cast[ptr PVOID](&pPF)).FAILED: raise
    defer: pPF.Release()

    if pIL.SetPath(getAppFilename()).FAILED or pPF.Save(link, true).FAILED: raise

    echo "save path to shortcut: ", link

  except:
    echo "something wrong !!"

proc load() =
  try:
    if CoCreateInstance(&CLSID_ShellLink, nil, CLSCTX_LOCAL_SERVER, &IID_IShellLink, cast[ptr PVOID](&pIL)).FAILED: raise
    defer: pIL.Release()

    if pIL.QueryInterface(&IID_IPersistFile, cast[ptr PVOID](&pPF)).FAILED: raise
    defer: pPF.Release()

    if pPF.Load(link, STGM_READ).FAILED or pIL.Resolve(0, SLR_NO_UI.DWORD).FAILED: raise

    var buffer = T(MAX_PATH.int)
    if pIL.GetPath(&buffer, MAX_PATH.int32, nil, 0).FAILED: raise

    echo "load path from shortcut: ", buffer

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
