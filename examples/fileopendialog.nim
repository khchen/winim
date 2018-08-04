# source at: https://msdn.microsoft.com/en-us/library/windows/desktop/ff485843(v=vs.85).aspx

import winim/mean

converter pointerConverter(x: ptr): ptr PVOID = cast[ptr PVOID](x)

try:
  if CoInitializeEx(nil, COINIT_APARTMENTTHREADED or COINIT_DISABLE_OLE1DDE).FAILED: raise
  defer: CoUninitialize()

  var
    pFileOpen: ptr IFileOpenDialog
    pItem: ptr IShellItem
    pszFilePath: PWSTR

  if CoCreateInstance(&CLSID_FileOpenDialog, NULL, CLSCTX_ALL, &IID_IFileOpenDialog, &pFileOpen).FAILED: raise
  defer: pFileOpen.Release()

  if pFileOpen.Show(0).SUCCEEDED:
    if pFileOpen.GetResult(&pItem).FAILED: raise
    defer: pItem.Release()

    if pItem.GetDisplayName(SIGDN_FILESYSPATH, &pszFilePath).FAILED: raise
    defer: CoTaskMemFree(pszFilePath)

    MessageBoxW(0, pszFilePath, L"File Path", MB_OK)

except:
  echo "something wrong !"
