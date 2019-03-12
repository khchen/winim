#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#
#====================================================================

import winimbase
import windef
import winbase
import wingdi
import winuser
import wincon
import winreg
import winnetwk
import wininet
import objbase
import iphlpapi
import commctrl
import regstr
#include <shellapi.h>
#include <shlwapi.h>
#include <shlobj.h>
#include <shlguid.h>
#include <isguids.h>
#include <shldisp.h>
#include <knownfolders.h>
#include <shobjidl.h>
#include <objectarray.h>
#include <sherrors.h>
type
  ASSOCCLASS* = int32
  QUERY_USER_NOTIFICATION_STATE* = int32
  SHSTOCKICONID* = int32
  URL_SCHEME* = int32
  URL_PART* = int32
  TURLIS* = int32
  SHREGDEL_FLAGS* = int32
  SHREGENUM_FLAGS* = int32
  ASSOCSTR* = int32
  ASSOCKEY* = int32
  ASSOCDATA* = int32
  ASSOCENUM* = int32
  SHGFP_TYPE* = int32
  OfflineFolderStatus* = int32
  ShellFolderViewOptions* = int32
  ShellSpecialFolderConstants* = int32
  AUTOCOMPLETEOPTIONS* = int32
  ACENUMOPTION* = int32
  FOLDER_ENUM_MODE* = int32
  LPVIEWSETTINGS* = cstring
  FOLDERFLAGS* = int32
  FOLDERVIEWMODE* = int32
  FOLDERLOGICALVIEWMODE* = int32
  FOLDERVIEWOPTIONS* = int32
  SVSIF* = int32
  SVGIO* = int32
  SVUIA_STATUS* = int32
  SORTDIRECTION* = int32
  FVTEXTTYPE* = int32
  VPWATERMARKFLAGS* = int32
  VPCOLORFLAGS* = int32
  CM_MASK* = int32
  CM_STATE* = int32
  CM_ENUM_FLAGS* = int32
  CM_SET_WIDTH_VALUE* = int32
  SIGDN* = int32
  DATAOBJ_GET_ITEM_FLAGS* = int32
  SIIGBF* = int32
  STGOP* = int32
  SIATTRIBFLAGS* = int32
  CATEGORYINFO_FLAGS* = int32
  CATSORT_FLAGS* = int32
  DSH_FLAGS* = int32
  SLR_FLAGS* = int32
  SLGP_FLAGS* = int32
  SPACTION* = int32
  SPTEXT* = int32
  THUMBBUTTONFLAGS* = int32
  THUMBBUTTONMASK* = int32
  TBPFLAG* = int32
  STPFLAG* = int32
  EXPLORER_BROWSER_OPTIONS* = int32
  EXPLORER_BROWSER_FILL_FLAGS* = int32
  PDOPSTATUS* = int32
  NAMESPACEWALKFLAG* = int32
  MP_POPUPFLAGS* = int32
  FILE_USAGE_TYPE* = int32
  FDE_OVERWRITE_RESPONSE* = int32
  FDE_SHAREVIOLATION_RESPONSE* = int32
  FDAP* = int32
  CDCONTROLSTATEF* = int32
  ASSOCIATIONLEVEL* = int32
  ASSOCIATIONTYPE* = int32
  NWMF* = int32
  ATTACHMENT_PROMPT* = int32
  ATTACHMENT_ACTION* = int32
  KF_CATEGORY* = int32
  FFFP_MODE* = int32
  SHARE_ROLE* = int32
  DEF_SHARE_ID* = int32
  NMCII_FLAGS* = int32
  NMCSAEI_FLAGS* = int32
  NSTCGNI* = int32
  NSTCSTYLE2* = int32
  NSTCFOLDERCAPABILITIES* = int32
  CPVIEW* = int32
  KNOWNDESTCATEGORY* = int32
  APPDOCLISTTYPE* = int32
  DESKTOP_SLIDESHOW_OPTIONS* = int32
  DESKTOP_SLIDESHOW_STATE* = int32
  DESKTOP_SLIDESHOW_DIRECTION* = int32
  DESKTOP_WALLPAPER_POSITION* = int32
  HOMEGROUPSHARINGCHOICES* = int32
  LIBRARYFOLDERFILTER* = int32
  LIBRARYOPTIONFLAGS* = int32
  DEFAULTSAVEFOLDERTYPE* = int32
  LIBRARYSAVEFLAGS* = int32
  PBM_EVENT* = int32
  PBM_SESSION_TYPE* = int32
  PBM_PLAY_STATE* = int32
  PBM_MUTE_STATE* = int32
  DEFAULT_FOLDER_MENU_RESTRICTIONS* = int32
  ACTIVATEOPTIONS* = int32
  LIBRARYMANAGEDIALOGOPTIONS* = int32
  ASSOC_FILTER* = int32
  UNDOCK_REASON* = int32
  MONITOR_APP_VISIBILITY* = int32
  PACKAGE_EXECUTION_STATE* = int32
  AHE_TYPE* = int32
  EC_HOST_UI_MODE* = int32
  APPLICATION_VIEW_STATE* = int32
  EDGE_GESTURE_KIND* = int32
  SHELL_LINK_DATA_FLAGS* = int32
  GPFIDL_FLAGS* = int32
  KNOWN_FOLDER_FLAG* = int32
  AUTOCOMPLETELISTOPTIONS* = int32
  FD_FLAGS* = int32
  DROPIMAGETYPE* = int32
  SHARD* = int32
  SCNRT_STATUS* = int32
  RESTRICTIONS* = int32
  OPEN_AS_INFO_FLAGS* = int32
  IESHORTCUTFLAGS* = int32
  HDROP* = HANDLE
  FILEOP_FLAGS* = WORD
  PRINTEROP_FLAGS* = WORD
  SRRF* = DWORD
  HUSKEY* = HANDLE
  ASSOCF* = DWORD
  SHGDNF* = DWORD
  SHCONTF* = DWORD
  SFGAOF* = ULONG
  SV3CVW3_FLAGS* = DWORD
  SICHINTF* = DWORD
  TRANSFER_SOURCE_FLAGS* = DWORD
  TRANSFER_ADVISE_STATE* = DWORD
  PROPERTYUI_NAME_FLAGS* = DWORD
  PROPERTYUI_FLAGS* = DWORD
  PROPERTYUI_FORMAT_FLAGS* = DWORD
  SPINITF* = DWORD
  SPBEGINF* = DWORD
  OPPROGDLGF* = DWORD
  PDMODE* = DWORD
  CDBE_ACTIONS* = DWORD
  FILEOPENDIALOGOPTIONS* = DWORD
  BROWSERFRAMEOPTIONS* = DWORD
  KF_DEFINITION_FLAGS* = DWORD
  KF_REDIRECTION_CAPABILITIES* = DWORD
  NSTCSTYLE* = DWORD
  NSTCROOTSTYLE* = DWORD
  NSTCITEMSTATE* = DWORD
  NSTCEHITTEST* = DWORD
  NSTCECLICKTYPE* = DWORD
  EXPLORERPANESTATE* = DWORD
  EXPCMDSTATE* = DWORD
  EXPCMDFLAGS* = DWORD
  HTHEME* = HANDLE
  HPSXA* = HANDLE
  DRAGINFOA* {.pure.} = object
    uSize*: UINT
    pt*: POINT
    fNC*: WINBOOL
    lpFileList*: LPSTR
    grfKeyState*: DWORD
  LPDRAGINFOA* = ptr DRAGINFOA
  DRAGINFOW* {.pure.} = object
    uSize*: UINT
    pt*: POINT
    fNC*: WINBOOL
    lpFileList*: LPWSTR
    grfKeyState*: DWORD
  LPDRAGINFOW* = ptr DRAGINFOW
  APPBARDATA* {.pure.} = object
    cbSize*: DWORD
    hWnd*: HWND
    uCallbackMessage*: UINT
    uEdge*: UINT
    rc*: RECT
    lParam*: LPARAM
  PAPPBARDATA* = ptr APPBARDATA
  SHFILEOPSTRUCTA* {.pure.} = object
    hwnd*: HWND
    wFunc*: UINT
    pFrom*: LPCSTR
    pTo*: LPCSTR
    fFlags*: FILEOP_FLAGS
    fAnyOperationsAborted*: WINBOOL
    hNameMappings*: LPVOID
    lpszProgressTitle*: PCSTR
  LPSHFILEOPSTRUCTA* = ptr SHFILEOPSTRUCTA
  SHFILEOPSTRUCTW* {.pure.} = object
    hwnd*: HWND
    wFunc*: UINT
    pFrom*: LPCWSTR
    pTo*: LPCWSTR
    fFlags*: FILEOP_FLAGS
    fAnyOperationsAborted*: WINBOOL
    hNameMappings*: LPVOID
    lpszProgressTitle*: PCWSTR
  LPSHFILEOPSTRUCTW* = ptr SHFILEOPSTRUCTW
  SHNAMEMAPPINGA* {.pure.} = object
    pszOldPath*: LPSTR
    pszNewPath*: LPSTR
    cchOldPath*: int32
    cchNewPath*: int32
  LPSHNAMEMAPPINGA* = ptr SHNAMEMAPPINGA
  SHNAMEMAPPINGW* {.pure.} = object
    pszOldPath*: LPWSTR
    pszNewPath*: LPWSTR
    cchOldPath*: int32
    cchNewPath*: int32
  LPSHNAMEMAPPINGW* = ptr SHNAMEMAPPINGW
  SHELLEXECUTEINFOA_UNION1* {.pure, union.} = object
    hIcon*: HANDLE
    hMonitor*: HANDLE
  SHELLEXECUTEINFOA* {.pure.} = object
    cbSize*: DWORD
    fMask*: ULONG
    hwnd*: HWND
    lpVerb*: LPCSTR
    lpFile*: LPCSTR
    lpParameters*: LPCSTR
    lpDirectory*: LPCSTR
    nShow*: int32
    hInstApp*: HINSTANCE
    lpIDList*: pointer
    lpClass*: LPCSTR
    hkeyClass*: HKEY
    dwHotKey*: DWORD
    union1*: SHELLEXECUTEINFOA_UNION1
    hProcess*: HANDLE
  LPSHELLEXECUTEINFOA* = ptr SHELLEXECUTEINFOA
  SHELLEXECUTEINFOW_UNION1* {.pure, union.} = object
    hIcon*: HANDLE
    hMonitor*: HANDLE
  SHELLEXECUTEINFOW* {.pure.} = object
    cbSize*: DWORD
    fMask*: ULONG
    hwnd*: HWND
    lpVerb*: LPCWSTR
    lpFile*: LPCWSTR
    lpParameters*: LPCWSTR
    lpDirectory*: LPCWSTR
    nShow*: int32
    hInstApp*: HINSTANCE
    lpIDList*: pointer
    lpClass*: LPCWSTR
    hkeyClass*: HKEY
    dwHotKey*: DWORD
    union1*: SHELLEXECUTEINFOW_UNION1
    hProcess*: HANDLE
  LPSHELLEXECUTEINFOW* = ptr SHELLEXECUTEINFOW
  SHCREATEPROCESSINFOW* {.pure.} = object
    cbSize*: DWORD
    fMask*: ULONG
    hwnd*: HWND
    pszFile*: LPCWSTR
    pszParameters*: LPCWSTR
    pszCurrentDirectory*: LPCWSTR
    hUserToken*: HANDLE
    lpProcessAttributes*: LPSECURITY_ATTRIBUTES
    lpThreadAttributes*: LPSECURITY_ATTRIBUTES
    bInheritHandles*: WINBOOL
    dwCreationFlags*: DWORD
    lpStartupInfo*: LPSTARTUPINFOW
    lpProcessInformation*: LPPROCESS_INFORMATION
  PSHCREATEPROCESSINFOW* = ptr SHCREATEPROCESSINFOW
  SHQUERYRBINFO* {.pure.} = object
    cbSize*: DWORD
    i64Size*: int64
    i64NumItems*: int64
  LPSHQUERYRBINFO* = ptr SHQUERYRBINFO
  NOTIFYICONDATAA_UNION1* {.pure, union.} = object
    uTimeout*: UINT
    uVersion*: UINT
  NOTIFYICONDATAA* {.pure.} = object
    cbSize*: DWORD
    hWnd*: HWND
    uID*: UINT
    uFlags*: UINT
    uCallbackMessage*: UINT
    hIcon*: HICON
    szTip*: array[128, CHAR]
    dwState*: DWORD
    dwStateMask*: DWORD
    szInfo*: array[256, CHAR]
    union1*: NOTIFYICONDATAA_UNION1
    szInfoTitle*: array[64, CHAR]
    dwInfoFlags*: DWORD
    guidItem*: GUID
    hBalloonIcon*: HICON
  PNOTIFYICONDATAA* = ptr NOTIFYICONDATAA
  NOTIFYICONDATAW_UNION1* {.pure, union.} = object
    uTimeout*: UINT
    uVersion*: UINT
  NOTIFYICONDATAW* {.pure.} = object
    cbSize*: DWORD
    hWnd*: HWND
    uID*: UINT
    uFlags*: UINT
    uCallbackMessage*: UINT
    hIcon*: HICON
    szTip*: array[128, WCHAR]
    dwState*: DWORD
    dwStateMask*: DWORD
    szInfo*: array[256, WCHAR]
    union1*: NOTIFYICONDATAW_UNION1
    szInfoTitle*: array[64, WCHAR]
    dwInfoFlags*: DWORD
    guidItem*: GUID
    hBalloonIcon*: HICON
  PNOTIFYICONDATAW* = ptr NOTIFYICONDATAW
  NOTIFYICONIDENTIFIER* {.pure.} = object
    cbSize*: DWORD
    hWnd*: HWND
    uID*: UINT
    guidItem*: GUID
  PNOTIFYICONIDENTIFIER* = ptr NOTIFYICONIDENTIFIER
  OPEN_PRINTER_PROPS_INFOA* {.pure.} = object
    dwSize*: DWORD
    pszSheetName*: LPSTR
    uSheetIndex*: UINT
    dwFlags*: DWORD
    bModal*: WINBOOL
  POPEN_PRINTER_PROPS_INFOA* = ptr OPEN_PRINTER_PROPS_INFOA
  OPEN_PRINTER_PROPS_INFOW* {.pure.} = object
    dwSize*: DWORD
    pszSheetName*: LPWSTR
    uSheetIndex*: UINT
    dwFlags*: DWORD
    bModal*: WINBOOL
  POPEN_PRINTER_PROPS_INFOW* = ptr OPEN_PRINTER_PROPS_INFOW
  NC_ADDRESS* {.pure.} = object
    pAddrInfo*: ptr NET_ADDRESS_INFO
    PortNumber*: USHORT
    PrefixLength*: BYTE
  PNC_ADDRESS* = ptr NC_ADDRESS
  PHUSKEY* = ptr HUSKEY
  IDefViewID* = IUnknown
  FolderItemVerb* {.pure.} = object
    lpVtbl*: ptr FolderItemVerbVtbl
  FolderItemVerbVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    get_Application*: proc(self: ptr FolderItemVerb, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_Parent*: proc(self: ptr FolderItemVerb, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_Name*: proc(self: ptr FolderItemVerb, pbs: ptr BSTR): HRESULT {.stdcall.}
    DoIt*: proc(self: ptr FolderItemVerb): HRESULT {.stdcall.}
  FolderItemVerbs* {.pure.} = object
    lpVtbl*: ptr FolderItemVerbsVtbl
  FolderItemVerbsVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    get_Count*: proc(self: ptr FolderItemVerbs, plCount: ptr LONG): HRESULT {.stdcall.}
    get_Application*: proc(self: ptr FolderItemVerbs, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_Parent*: proc(self: ptr FolderItemVerbs, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    Item*: proc(self: ptr FolderItemVerbs, index: VARIANT, ppid: ptr ptr FolderItemVerb): HRESULT {.stdcall.}
    NewEnum*: proc(self: ptr FolderItemVerbs, ppunk: ptr ptr IUnknown): HRESULT {.stdcall.}
  FolderItem* {.pure.} = object
    lpVtbl*: ptr FolderItemVtbl
  FolderItemVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    get_Application*: proc(self: ptr FolderItem, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_Parent*: proc(self: ptr FolderItem, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_Name*: proc(self: ptr FolderItem, pbs: ptr BSTR): HRESULT {.stdcall.}
    put_Name*: proc(self: ptr FolderItem, bs: BSTR): HRESULT {.stdcall.}
    get_Path*: proc(self: ptr FolderItem, pbs: ptr BSTR): HRESULT {.stdcall.}
    get_GetLink*: proc(self: ptr FolderItem, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_GetFolder*: proc(self: ptr FolderItem, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_IsLink*: proc(self: ptr FolderItem, pb: ptr VARIANT_BOOL): HRESULT {.stdcall.}
    get_IsFolder*: proc(self: ptr FolderItem, pb: ptr VARIANT_BOOL): HRESULT {.stdcall.}
    get_IsFileSystem*: proc(self: ptr FolderItem, pb: ptr VARIANT_BOOL): HRESULT {.stdcall.}
    get_IsBrowsable*: proc(self: ptr FolderItem, pb: ptr VARIANT_BOOL): HRESULT {.stdcall.}
    get_ModifyDate*: proc(self: ptr FolderItem, pdt: ptr DATE): HRESULT {.stdcall.}
    put_ModifyDate*: proc(self: ptr FolderItem, dt: DATE): HRESULT {.stdcall.}
    get_Size*: proc(self: ptr FolderItem, pul: ptr LONG): HRESULT {.stdcall.}
    get_Type*: proc(self: ptr FolderItem, pbs: ptr BSTR): HRESULT {.stdcall.}
    Verbs*: proc(self: ptr FolderItem, ppfic: ptr ptr FolderItemVerbs): HRESULT {.stdcall.}
    InvokeVerb*: proc(self: ptr FolderItem, vVerb: VARIANT): HRESULT {.stdcall.}
  LPFOLDERITEM* = ptr FolderItem
  IAutoComplete* {.pure.} = object
    lpVtbl*: ptr IAutoCompleteVtbl
  IAutoCompleteVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Init*: proc(self: ptr IAutoComplete, hwndEdit: HWND, punkACL: ptr IUnknown, pwszRegKeyPath: LPCWSTR, pwszQuickComplete: LPCWSTR): HRESULT {.stdcall.}
    Enable*: proc(self: ptr IAutoComplete, fEnable: WINBOOL): HRESULT {.stdcall.}
  LPAUTOCOMPLETE* = ptr IAutoComplete
  IAutoComplete2* {.pure.} = object
    lpVtbl*: ptr IAutoComplete2Vtbl
  IAutoComplete2Vtbl* {.pure, inheritable.} = object of IAutoCompleteVtbl
    SetOptions*: proc(self: ptr IAutoComplete2, dwFlag: DWORD): HRESULT {.stdcall.}
    GetOptions*: proc(self: ptr IAutoComplete2, pdwFlag: ptr DWORD): HRESULT {.stdcall.}
  LPAUTOCOMPLETE2* = ptr IAutoComplete2
  IEnumACString* {.pure.} = object
    lpVtbl*: ptr IEnumACStringVtbl
  IEnumACStringVtbl* {.pure, inheritable.} = object of IEnumStringVtbl
    NextItem*: proc(self: ptr IEnumACString, pszUrl: LPWSTR, cchMax: ULONG, pulSortIndex: ptr ULONG): HRESULT {.stdcall.}
    SetEnumOptions*: proc(self: ptr IEnumACString, dwOptions: DWORD): HRESULT {.stdcall.}
    GetEnumOptions*: proc(self: ptr IEnumACString, pdwOptions: ptr DWORD): HRESULT {.stdcall.}
  PENUMACSTRING* = ptr IEnumACString
  LPENUMACSTRING* = ptr IEnumACString
  CMINVOKECOMMANDINFO* {.pure.} = object
    cbSize*: DWORD
    fMask*: DWORD
    hwnd*: HWND
    lpVerb*: LPCSTR
    lpParameters*: LPCSTR
    lpDirectory*: LPCSTR
    nShow*: int32
    dwHotKey*: DWORD
    hIcon*: HANDLE
  LPCMINVOKECOMMANDINFO* = ptr CMINVOKECOMMANDINFO
  PCCMINVOKECOMMANDINFO* = ptr CMINVOKECOMMANDINFO
  CMINVOKECOMMANDINFOEX* {.pure.} = object
    cbSize*: DWORD
    fMask*: DWORD
    hwnd*: HWND
    lpVerb*: LPCSTR
    lpParameters*: LPCSTR
    lpDirectory*: LPCSTR
    nShow*: int32
    dwHotKey*: DWORD
    hIcon*: HANDLE
    lpTitle*: LPCSTR
    lpVerbW*: LPCWSTR
    lpParametersW*: LPCWSTR
    lpDirectoryW*: LPCWSTR
    lpTitleW*: LPCWSTR
    ptInvoke*: POINT
  LPCMINVOKECOMMANDINFOEX* = ptr CMINVOKECOMMANDINFOEX
  PCCMINVOKECOMMANDINFOEX* = ptr CMINVOKECOMMANDINFOEX
  IContextMenu* {.pure.} = object
    lpVtbl*: ptr IContextMenuVtbl
  IContextMenuVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    QueryContextMenu*: proc(self: ptr IContextMenu, hmenu: HMENU, indexMenu: UINT, idCmdFirst: UINT, idCmdLast: UINT, uFlags: UINT): HRESULT {.stdcall.}
    InvokeCommand*: proc(self: ptr IContextMenu, pici: ptr CMINVOKECOMMANDINFO): HRESULT {.stdcall.}
    GetCommandString*: proc(self: ptr IContextMenu, idCmd: UINT_PTR, uType: UINT, pReserved: ptr UINT, pszName: cstring, cchMax: UINT): HRESULT {.stdcall.}
  LPCONTEXTMENU* = ptr IContextMenu
  IContextMenu2* {.pure.} = object
    lpVtbl*: ptr IContextMenu2Vtbl
  IContextMenu2Vtbl* {.pure, inheritable.} = object of IContextMenuVtbl
    HandleMenuMsg*: proc(self: ptr IContextMenu2, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.stdcall.}
  LPCONTEXTMENU2* = ptr IContextMenu2
  IContextMenu3* {.pure.} = object
    lpVtbl*: ptr IContextMenu3Vtbl
  IContextMenu3Vtbl* {.pure, inheritable.} = object of IContextMenu2Vtbl
    HandleMenuMsg2*: proc(self: ptr IContextMenu3, uMsg: UINT, wParam: WPARAM, lParam: LPARAM, plResult: ptr LRESULT): HRESULT {.stdcall.}
  LPCONTEXTMENU3* = ptr IContextMenu3
  IPersistFolder* {.pure.} = object
    lpVtbl*: ptr IPersistFolderVtbl
  IPersistFolderVtbl* {.pure, inheritable.} = object of IPersistVtbl
    Initialize*: proc(self: ptr IPersistFolder, pidl: PCIDLIST_ABSOLUTE): HRESULT {.stdcall.}
  LPPERSISTFOLDER* = ptr IPersistFolder
  IEnumIDList* {.pure.} = object
    lpVtbl*: ptr IEnumIDListVtbl
  IEnumIDListVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Next*: proc(self: ptr IEnumIDList, celt: ULONG, rgelt: ptr PITEMID_CHILD, pceltFetched: ptr ULONG): HRESULT {.stdcall.}
    Skip*: proc(self: ptr IEnumIDList, celt: ULONG): HRESULT {.stdcall.}
    Reset*: proc(self: ptr IEnumIDList): HRESULT {.stdcall.}
    Clone*: proc(self: ptr IEnumIDList, ppenum: ptr ptr IEnumIDList): HRESULT {.stdcall.}
  LPENUMIDLIST* = ptr IEnumIDList
  IShellFolder* {.pure.} = object
    lpVtbl*: ptr IShellFolderVtbl
  IShellFolderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ParseDisplayName*: proc(self: ptr IShellFolder, hwnd: HWND, pbc: ptr IBindCtx, pszDisplayName: LPWSTR, pchEaten: ptr ULONG, ppidl: ptr PIDLIST_RELATIVE, pdwAttributes: ptr ULONG): HRESULT {.stdcall.}
    EnumObjects*: proc(self: ptr IShellFolder, hwnd: HWND, grfFlags: SHCONTF, ppenumIDList: ptr ptr IEnumIDList): HRESULT {.stdcall.}
    BindToObject*: proc(self: ptr IShellFolder, pidl: PCUIDLIST_RELATIVE, pbc: ptr IBindCtx, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    BindToStorage*: proc(self: ptr IShellFolder, pidl: PCUIDLIST_RELATIVE, pbc: ptr IBindCtx, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    CompareIDs*: proc(self: ptr IShellFolder, lParam: LPARAM, pidl1: PCUIDLIST_RELATIVE, pidl2: PCUIDLIST_RELATIVE): HRESULT {.stdcall.}
    CreateViewObject*: proc(self: ptr IShellFolder, hwndOwner: HWND, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetAttributesOf*: proc(self: ptr IShellFolder, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, rgfInOut: ptr SFGAOF): HRESULT {.stdcall.}
    GetUIObjectOf*: proc(self: ptr IShellFolder, hwndOwner: HWND, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, riid: REFIID, rgfReserved: ptr UINT, ppv: ptr pointer): HRESULT {.stdcall.}
    GetDisplayNameOf*: proc(self: ptr IShellFolder, pidl: PCUITEMID_CHILD, uFlags: SHGDNF, pName: ptr STRRET): HRESULT {.stdcall.}
    SetNameOf*: proc(self: ptr IShellFolder, hwnd: HWND, pidl: PCUITEMID_CHILD, pszName: LPCWSTR, uFlags: SHGDNF, ppidlOut: ptr PITEMID_CHILD): HRESULT {.stdcall.}
  LPSHELLFOLDER* = ptr IShellFolder
  EXTRASEARCH* {.pure.} = object
    guidSearch*: GUID
    wszFriendlyName*: array[80, WCHAR]
    wszUrl*: array[2084, WCHAR]
  LPEXTRASEARCH* = ptr EXTRASEARCH
  IEnumExtraSearch* {.pure.} = object
    lpVtbl*: ptr IEnumExtraSearchVtbl
  IEnumExtraSearchVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Next*: proc(self: ptr IEnumExtraSearch, celt: ULONG, rgelt: ptr EXTRASEARCH, pceltFetched: ptr ULONG): HRESULT {.stdcall.}
    Skip*: proc(self: ptr IEnumExtraSearch, celt: ULONG): HRESULT {.stdcall.}
    Reset*: proc(self: ptr IEnumExtraSearch): HRESULT {.stdcall.}
    Clone*: proc(self: ptr IEnumExtraSearch, ppenum: ptr ptr IEnumExtraSearch): HRESULT {.stdcall.}
  LPENUMEXTRASEARCH* = ptr IEnumExtraSearch
  FOLDERSETTINGS* {.pure.} = object
    ViewMode*: UINT
    fFlags*: UINT
  LPFOLDERSETTINGS* = ptr FOLDERSETTINGS
  LPCFOLDERSETTINGS* = ptr FOLDERSETTINGS
  PFOLDERSETTINGS* = ptr FOLDERSETTINGS
  LPFNSVADDPROPSHEETPAGE* = LPFNADDPROPSHEETPAGE
  LPTBBUTTONSB* = LPTBBUTTON
  IShellBrowser* {.pure.} = object
    lpVtbl*: ptr IShellBrowserVtbl
  IShellBrowserVtbl* {.pure, inheritable.} = object of IOleWindowVtbl
    InsertMenusSB*: proc(self: ptr IShellBrowser, hmenuShared: HMENU, lpMenuWidths: LPOLEMENUGROUPWIDTHS): HRESULT {.stdcall.}
    SetMenuSB*: proc(self: ptr IShellBrowser, hmenuShared: HMENU, holemenuRes: HOLEMENU, hwndActiveObject: HWND): HRESULT {.stdcall.}
    RemoveMenusSB*: proc(self: ptr IShellBrowser, hmenuShared: HMENU): HRESULT {.stdcall.}
    SetStatusTextSB*: proc(self: ptr IShellBrowser, pszStatusText: LPCWSTR): HRESULT {.stdcall.}
    EnableModelessSB*: proc(self: ptr IShellBrowser, fEnable: WINBOOL): HRESULT {.stdcall.}
    TranslateAcceleratorSB*: proc(self: ptr IShellBrowser, pmsg: ptr MSG, wID: WORD): HRESULT {.stdcall.}
    BrowseObject*: proc(self: ptr IShellBrowser, pidl: PCUIDLIST_RELATIVE, wFlags: UINT): HRESULT {.stdcall.}
    GetViewStateStream*: proc(self: ptr IShellBrowser, grfMode: DWORD, ppStrm: ptr ptr IStream): HRESULT {.stdcall.}
    GetControlWindow*: proc(self: ptr IShellBrowser, id: UINT, phwnd: ptr HWND): HRESULT {.stdcall.}
    SendControlMsg*: proc(self: ptr IShellBrowser, id: UINT, uMsg: UINT, wParam: WPARAM, lParam: LPARAM, pret: ptr LRESULT): HRESULT {.stdcall.}
    QueryActiveShellView*: proc(self: ptr IShellBrowser, ppshv: ptr ptr IShellView): HRESULT {.stdcall.}
    OnViewWindowActive*: proc(self: ptr IShellBrowser, pshv: ptr IShellView): HRESULT {.stdcall.}
    SetToolbarItems*: proc(self: ptr IShellBrowser, lpButtons: LPTBBUTTONSB, nButtons: UINT, uFlags: UINT): HRESULT {.stdcall.}
  IShellView* {.pure.} = object
    lpVtbl*: ptr IShellViewVtbl
  IShellViewVtbl* {.pure, inheritable.} = object of IOleWindowVtbl
    TranslateAccelerator*: proc(self: ptr IShellView, pmsg: ptr MSG): HRESULT {.stdcall.}
    EnableModeless*: proc(self: ptr IShellView, fEnable: WINBOOL): HRESULT {.stdcall.}
    UIActivate*: proc(self: ptr IShellView, uState: UINT): HRESULT {.stdcall.}
    Refresh*: proc(self: ptr IShellView): HRESULT {.stdcall.}
    CreateViewWindow*: proc(self: ptr IShellView, psvPrevious: ptr IShellView, pfs: LPCFOLDERSETTINGS, psb: ptr IShellBrowser, prcView: ptr RECT, phWnd: ptr HWND): HRESULT {.stdcall.}
    DestroyViewWindow*: proc(self: ptr IShellView): HRESULT {.stdcall.}
    GetCurrentInfo*: proc(self: ptr IShellView, pfs: LPFOLDERSETTINGS): HRESULT {.stdcall.}
    AddPropertySheetPages*: proc(self: ptr IShellView, dwReserved: DWORD, pfn: LPFNSVADDPROPSHEETPAGE, lparam: LPARAM): HRESULT {.stdcall.}
    SaveViewState*: proc(self: ptr IShellView): HRESULT {.stdcall.}
    SelectItem*: proc(self: ptr IShellView, pidlItem: PCUITEMID_CHILD, uFlags: SVSIF): HRESULT {.stdcall.}
    GetItemObject*: proc(self: ptr IShellView, uItem: UINT, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  LPSHELLVIEW* = ptr IShellView
  SHELLVIEWID* = GUID
  SV2CVW2_PARAMS* {.pure.} = object
    cbSize*: DWORD
    psvPrev*: ptr IShellView
    pfs*: LPCFOLDERSETTINGS
    psbOwner*: ptr IShellBrowser
    prcView*: ptr RECT
    pvid*: ptr SHELLVIEWID
    hwndView*: HWND
  LPSV2CVW2_PARAMS* = ptr SV2CVW2_PARAMS
  DEPRECATED_HRESULT* = HRESULT
  ICommDlgBrowser* {.pure.} = object
    lpVtbl*: ptr ICommDlgBrowserVtbl
  ICommDlgBrowserVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnDefaultCommand*: proc(self: ptr ICommDlgBrowser, ppshv: ptr IShellView): HRESULT {.stdcall.}
    OnStateChange*: proc(self: ptr ICommDlgBrowser, ppshv: ptr IShellView, uChange: ULONG): HRESULT {.stdcall.}
    IncludeObject*: proc(self: ptr ICommDlgBrowser, ppshv: ptr IShellView, pidl: PCUITEMID_CHILD): HRESULT {.stdcall.}
  LPCOMMDLGBROWSER* = ptr ICommDlgBrowser
  ICommDlgBrowser2* {.pure.} = object
    lpVtbl*: ptr ICommDlgBrowser2Vtbl
  ICommDlgBrowser2Vtbl* {.pure, inheritable.} = object of ICommDlgBrowserVtbl
    Notify*: proc(self: ptr ICommDlgBrowser2, ppshv: ptr IShellView, dwNotifyType: DWORD): HRESULT {.stdcall.}
    GetDefaultMenuText*: proc(self: ptr ICommDlgBrowser2, ppshv: ptr IShellView, pszText: LPWSTR, cchMax: int32): HRESULT {.stdcall.}
    GetViewFlags*: proc(self: ptr ICommDlgBrowser2, pdwFlags: ptr DWORD): HRESULT {.stdcall.}
  LPCOMMDLGBROWSER2* = ptr ICommDlgBrowser2
  LPSHELLBROWSER* = ptr IShellBrowser
  STGTRANSCONFIRMATION* = GUID
  LPSTGTRANSCONFIRMATION* = ptr GUID
  SHDRAGIMAGE* {.pure.} = object
    sizeDragImage*: SIZE
    ptOffset*: POINT
    hbmpDragImage*: HBITMAP
    crColorKey*: COLORREF
  LPSHDRAGIMAGE* = ptr SHDRAGIMAGE
  IShellExtInit* {.pure.} = object
    lpVtbl*: ptr IShellExtInitVtbl
  IShellExtInitVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IShellExtInit, pidlFolder: PCIDLIST_ABSOLUTE, pdtobj: ptr IDataObject, hkeyProgID: HKEY): HRESULT {.stdcall.}
  LPSHELLEXTINIT* = ptr IShellExtInit
  EXPPS* = UINT
  IShellPropSheetExt* {.pure.} = object
    lpVtbl*: ptr IShellPropSheetExtVtbl
  IShellPropSheetExtVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    AddPages*: proc(self: ptr IShellPropSheetExt, pfnAddPage: LPFNSVADDPROPSHEETPAGE, lParam: LPARAM): HRESULT {.stdcall.}
    ReplacePage*: proc(self: ptr IShellPropSheetExt, uPageID: EXPPS, pfnReplaceWith: LPFNSVADDPROPSHEETPAGE, lParam: LPARAM): HRESULT {.stdcall.}
  LPSHELLPROPSHEETEXT* = ptr IShellPropSheetExt
  IExtractImage* {.pure.} = object
    lpVtbl*: ptr IExtractImageVtbl
  IExtractImageVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetLocation*: proc(self: ptr IExtractImage, pszPathBuffer: LPWSTR, cch: DWORD, pdwPriority: ptr DWORD, prgSize: ptr SIZE, dwRecClrDepth: DWORD, pdwFlags: ptr DWORD): HRESULT {.stdcall.}
    Extract*: proc(self: ptr IExtractImage, phBmpThumbnail: ptr HBITMAP): HRESULT {.stdcall.}
  LPEXTRACTIMAGE* = ptr IExtractImage
  IExtractImage2* {.pure.} = object
    lpVtbl*: ptr IExtractImage2Vtbl
  IExtractImage2Vtbl* {.pure, inheritable.} = object of IExtractImageVtbl
    GetDateStamp*: proc(self: ptr IExtractImage2, pDateStamp: ptr FILETIME): HRESULT {.stdcall.}
  LPEXTRACTIMAGE2* = ptr IExtractImage2
  THUMBBUTTON* {.pure.} = object
    dwMask*: THUMBBUTTONMASK
    iId*: UINT
    iBitmap*: UINT
    hIcon*: HICON
    szTip*: array[260, WCHAR]
    dwFlags*: THUMBBUTTONFLAGS
  LPTHUMBBUTTON* = ptr THUMBBUTTON
  DELEGATEITEMID* {.pure.} = object
    cbSize*: WORD
    wOuter*: WORD
    cbInner*: WORD
    rgb*: array[1, BYTE]
  PCDELEGATEITEMID* = ptr DELEGATEITEMID
  PDELEGATEITEMID* = ptr DELEGATEITEMID
  IBrowserFrameOptions* {.pure.} = object
    lpVtbl*: ptr IBrowserFrameOptionsVtbl
  IBrowserFrameOptionsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetFrameOptions*: proc(self: ptr IBrowserFrameOptions, dwMask: BROWSERFRAMEOPTIONS, pdwOptions: ptr BROWSERFRAMEOPTIONS): HRESULT {.stdcall.}
  LPBROWSERFRAMEOPTIONS* = ptr IBrowserFrameOptions
  SMDATA* {.pure.} = object
    dwMask*: DWORD
    dwFlags*: DWORD
    hmenu*: HMENU
    hwnd*: HWND
    uId*: UINT
    uIdParent*: UINT
    uIdAncestor*: UINT
    punk*: ptr IUnknown
    pidlFolder*: PIDLIST_ABSOLUTE
    pidlItem*: PUITEMID_CHILD
    psf*: ptr IShellFolder
    pvUserData*: pointer
  LPSMDATA* = ptr SMDATA
  SMINFO* {.pure.} = object
    dwMask*: DWORD
    dwType*: DWORD
    dwFlags*: DWORD
    iIcon*: int32
  PSMINFO* = ptr SMINFO
  EXPLORERPANE* = GUID
  REFEXPLORERPANE* = ptr EXPLORERPANE
  IExtractIconA* {.pure.} = object
    lpVtbl*: ptr IExtractIconAVtbl
  IExtractIconAVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetIconLocation*: proc(self: ptr IExtractIconA, uFlags: UINT, pszIconFile: PSTR, cchMax: UINT, piIndex: ptr int32, pwFlags: ptr UINT): HRESULT {.stdcall.}
    Extract*: proc(self: ptr IExtractIconA, pszFile: PCSTR, nIconIndex: UINT, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIconSize: UINT): HRESULT {.stdcall.}
  LPEXTRACTICONA* = ptr IExtractIconA
  IExtractIconW* {.pure.} = object
    lpVtbl*: ptr IExtractIconWVtbl
  IExtractIconWVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetIconLocation*: proc(self: ptr IExtractIconW, uFlags: UINT, pszIconFile: PWSTR, cchMax: UINT, piIndex: ptr int32, pwFlags: ptr UINT): HRESULT {.stdcall.}
    Extract*: proc(self: ptr IExtractIconW, pszFile: PCWSTR, nIconIndex: UINT, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIconSize: UINT): HRESULT {.stdcall.}
  LPEXTRACTICONW* = ptr IExtractIconW
  DATABLOCK_HEADER* {.pure.} = object
    cbSize*: DWORD
    dwSignature*: DWORD
  LPDATABLOCK_HEADER* = ptr DATABLOCK_HEADER
  LPDBLIST* = ptr DATABLOCK_HEADER
  NT_CONSOLE_PROPS* {.pure.} = object
    dbh*: DATABLOCK_HEADER
    wFillAttribute*: WORD
    wPopupFillAttribute*: WORD
    dwScreenBufferSize*: COORD
    dwWindowSize*: COORD
    dwWindowOrigin*: COORD
    nFont*: DWORD
    nInputBufferSize*: DWORD
    dwFontSize*: COORD
    uFontFamily*: UINT
    uFontWeight*: UINT
    FaceName*: array[LF_FACESIZE, WCHAR]
    uCursorSize*: UINT
    bFullScreen*: WINBOOL
    bQuickEdit*: WINBOOL
    bInsertMode*: WINBOOL
    bAutoPosition*: WINBOOL
    uHistoryBufferSize*: UINT
    uNumberOfHistoryBuffers*: UINT
    bHistoryNoDup*: WINBOOL
    ColorTable*: array[16, COLORREF]
  LPNT_CONSOLE_PROPS* = ptr NT_CONSOLE_PROPS
  NT_FE_CONSOLE_PROPS* {.pure.} = object
    dbh*: DATABLOCK_HEADER
    uCodePage*: UINT
  LPNT_FE_CONSOLE_PROPS* = ptr NT_FE_CONSOLE_PROPS
  EXP_DARWIN_LINK* {.pure.} = object
    dbh*: DATABLOCK_HEADER
    szDarwinID*: array[MAX_PATH, CHAR]
    szwDarwinID*: array[MAX_PATH, WCHAR]
  LPEXP_DARWIN_LINK* = ptr EXP_DARWIN_LINK
  EXP_SPECIAL_FOLDER* {.pure.} = object
    cbSize*: DWORD
    dwSignature*: DWORD
    idSpecialFolder*: DWORD
    cbOffset*: DWORD
  LPEXP_SPECIAL_FOLDER* = ptr EXP_SPECIAL_FOLDER
  EXP_SZ_LINK* {.pure.} = object
    cbSize*: DWORD
    dwSignature*: DWORD
    szTarget*: array[MAX_PATH, CHAR]
    swzTarget*: array[MAX_PATH, WCHAR]
  LPEXP_SZ_LINK* = ptr EXP_SZ_LINK
  ICopyHookA* {.pure.} = object
    lpVtbl*: ptr ICopyHookAVtbl
  ICopyHookAVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    CopyCallback*: proc(self: ptr ICopyHookA, hwnd: HWND, wFunc: UINT, wFlags: UINT, pszSrcFile: PCSTR, dwSrcAttribs: DWORD, pszDestFile: PCSTR, dwDestAttribs: DWORD): UINT {.stdcall.}
  LPCOPYHOOKA* = ptr ICopyHookA
  ICopyHookW* {.pure.} = object
    lpVtbl*: ptr ICopyHookWVtbl
  ICopyHookWVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    CopyCallback*: proc(self: ptr ICopyHookW, hwnd: HWND, wFunc: UINT, wFlags: UINT, pszSrcFile: PCWSTR, dwSrcAttribs: DWORD, pszDestFile: PCWSTR, dwDestAttribs: DWORD): UINT {.stdcall.}
  LPCOPYHOOKW* = ptr ICopyHookW
  IFileViewerSite* {.pure.} = object
    lpVtbl*: ptr IFileViewerSiteVtbl
  IFileViewerSiteVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetPinnedWindow*: proc(self: ptr IFileViewerSite, hwnd: HWND): HRESULT {.stdcall.}
    GetPinnedWindow*: proc(self: ptr IFileViewerSite, phwnd: ptr HWND): HRESULT {.stdcall.}
  LPFILEVIEWERSITE* = ptr IFileViewerSite
  FVSHOWINFO* {.pure.} = object
    cbSize*: DWORD
    hwndOwner*: HWND
    iShow*: int32
    dwFlags*: DWORD
    rect*: RECT
    punkRel*: ptr IUnknown
    strNewFile*: array[MAX_PATH, OLECHAR]
  LPFVSHOWINFO* = ptr FVSHOWINFO
  IFileViewerA* {.pure.} = object
    lpVtbl*: ptr IFileViewerAVtbl
  IFileViewerAVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ShowInitialize*: proc(self: ptr IFileViewerA, lpfsi: LPFILEVIEWERSITE): HRESULT {.stdcall.}
    Show*: proc(self: ptr IFileViewerA, pvsi: LPFVSHOWINFO): HRESULT {.stdcall.}
    PrintTo*: proc(self: ptr IFileViewerA, pszDriver: PSTR, fSuppressUI: WINBOOL): HRESULT {.stdcall.}
  LPFILEVIEWERA* = ptr IFileViewerA
  IFileViewerW* {.pure.} = object
    lpVtbl*: ptr IFileViewerWVtbl
  IFileViewerWVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ShowInitialize*: proc(self: ptr IFileViewerW, lpfsi: LPFILEVIEWERSITE): HRESULT {.stdcall.}
    Show*: proc(self: ptr IFileViewerW, pvsi: LPFVSHOWINFO): HRESULT {.stdcall.}
    PrintTo*: proc(self: ptr IFileViewerW, pszDriver: PWSTR, fSuppressUI: WINBOOL): HRESULT {.stdcall.}
  LPFILEVIEWERW* = ptr IFileViewerW
  SHFOLDERCUSTOMSETTINGS* {.pure.} = object
    dwSize*: DWORD
    dwMask*: DWORD
    pvid*: ptr SHELLVIEWID
    pszWebViewTemplate*: LPWSTR
    cchWebViewTemplate*: DWORD
    pszWebViewTemplateVersion*: LPWSTR
    pszInfoTip*: LPWSTR
    cchInfoTip*: DWORD
    pclsid*: ptr CLSID
    dwFlags*: DWORD
    pszIconFile*: LPWSTR
    cchIconFile*: DWORD
    iIconIndex*: int32
    pszLogo*: LPWSTR
    cchLogo*: DWORD
  LPSHFOLDERCUSTOMSETTINGS* = ptr SHFOLDERCUSTOMSETTINGS
  BFFCALLBACK* = proc (hwnd: HWND, uMsg: UINT, lParam: LPARAM, lpData: LPARAM): int32 {.stdcall.}
  BROWSEINFOA* {.pure.} = object
    hwndOwner*: HWND
    pidlRoot*: PCIDLIST_ABSOLUTE
    pszDisplayName*: LPSTR
    lpszTitle*: LPCSTR
    ulFlags*: UINT
    lpfn*: BFFCALLBACK
    lParam*: LPARAM
    iImage*: int32
  PBROWSEINFOA* = ptr BROWSEINFOA
  LPBROWSEINFOA* = ptr BROWSEINFOA
  BROWSEINFOW* {.pure.} = object
    hwndOwner*: HWND
    pidlRoot*: PCIDLIST_ABSOLUTE
    pszDisplayName*: LPWSTR
    lpszTitle*: LPCWSTR
    ulFlags*: UINT
    lpfn*: BFFCALLBACK
    lParam*: LPARAM
    iImage*: int32
  PBROWSEINFOW* = ptr BROWSEINFOW
  LPBROWSEINFOW* = ptr BROWSEINFOW
  IThumbnailCapture* {.pure.} = object
    lpVtbl*: ptr IThumbnailCaptureVtbl
  IThumbnailCaptureVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    CaptureThumbnail*: proc(self: ptr IThumbnailCapture, pMaxSize: ptr SIZE, pHTMLDoc2: ptr IUnknown, phbmThumbnail: ptr HBITMAP): HRESULT {.stdcall.}
  LPTHUMBNAILCAPTURE* = ptr IThumbnailCapture
  ENUMSHELLIMAGESTOREDATA* {.pure.} = object
    szPath*: array[MAX_PATH, WCHAR]
    ftTimeStamp*: FILETIME
  PENUMSHELLIMAGESTOREDATA* = ptr ENUMSHELLIMAGESTOREDATA
  IEnumShellImageStore* {.pure.} = object
    lpVtbl*: ptr IEnumShellImageStoreVtbl
  IEnumShellImageStoreVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Reset*: proc(self: ptr IEnumShellImageStore): HRESULT {.stdcall.}
    Next*: proc(self: ptr IEnumShellImageStore, celt: ULONG, prgElt: ptr PENUMSHELLIMAGESTOREDATA, pceltFetched: ptr ULONG): HRESULT {.stdcall.}
    Skip*: proc(self: ptr IEnumShellImageStore, celt: ULONG): HRESULT {.stdcall.}
    Clone*: proc(self: ptr IEnumShellImageStore, ppEnum: ptr ptr IEnumShellImageStore): HRESULT {.stdcall.}
  LPENUMSHELLIMAGESTORE* = ptr IEnumShellImageStore
  IShellImageStore* {.pure.} = object
    lpVtbl*: ptr IShellImageStoreVtbl
  IShellImageStoreVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Open*: proc(self: ptr IShellImageStore, dwMode: DWORD, pdwLock: ptr DWORD): HRESULT {.stdcall.}
    Create*: proc(self: ptr IShellImageStore, dwMode: DWORD, pdwLock: ptr DWORD): HRESULT {.stdcall.}
    ReleaseLock*: proc(self: ptr IShellImageStore, pdwLock: ptr DWORD): HRESULT {.stdcall.}
    Close*: proc(self: ptr IShellImageStore, pdwLock: ptr DWORD): HRESULT {.stdcall.}
    Commit*: proc(self: ptr IShellImageStore, pdwLock: ptr DWORD): HRESULT {.stdcall.}
    IsLocked*: proc(self: ptr IShellImageStore): HRESULT {.stdcall.}
    GetMode*: proc(self: ptr IShellImageStore, pdwMode: ptr DWORD): HRESULT {.stdcall.}
    GetCapabilities*: proc(self: ptr IShellImageStore, pdwCapMask: ptr DWORD): HRESULT {.stdcall.}
    AddEntry*: proc(self: ptr IShellImageStore, pszName: PCWSTR, pftTimeStamp: ptr FILETIME, dwMode: DWORD, hImage: HBITMAP): HRESULT {.stdcall.}
    GetEntry*: proc(self: ptr IShellImageStore, pszName: PCWSTR, dwMode: DWORD, phImage: ptr HBITMAP): HRESULT {.stdcall.}
    DeleteEntry*: proc(self: ptr IShellImageStore, pszName: PCWSTR): HRESULT {.stdcall.}
    IsEntryInStore*: proc(self: ptr IShellImageStore, pszName: PCWSTR, pftTimeStamp: ptr FILETIME): HRESULT {.stdcall.}
    Enum*: proc(self: ptr IShellImageStore, ppEnum: ptr LPENUMSHELLIMAGESTORE): HRESULT {.stdcall.}
  LPSHELLIMAGESTORE* = ptr IShellImageStore
  BANDINFOSFB* {.pure.} = object
    dwMask*: DWORD
    dwStateMask*: DWORD
    dwState*: DWORD
    crBkgnd*: COLORREF
    crBtnLt*: COLORREF
    crBtnDk*: COLORREF
    wViewMode*: WORD
    wAlign*: WORD
    psf*: ptr IShellFolder
    pidl*: PIDLIST_ABSOLUTE
  PBANDINFOSFB* = ptr BANDINFOSFB
  WALLPAPEROPT* {.pure.} = object
    dwSize*: DWORD
    dwStyle*: DWORD
  LPWALLPAPEROPT* = ptr WALLPAPEROPT
  LPCWALLPAPEROPT* = ptr WALLPAPEROPT
  COMPONENTSOPT* {.pure.} = object
    dwSize*: DWORD
    fEnableComponents*: WINBOOL
    fActiveDesktop*: WINBOOL
  LPCOMPONENTSOPT* = ptr COMPONENTSOPT
  LPCCOMPONENTSOPT* = ptr COMPONENTSOPT
  COMPPOS* {.pure.} = object
    dwSize*: DWORD
    iLeft*: int32
    iTop*: int32
    dwWidth*: DWORD
    dwHeight*: DWORD
    izIndex*: int32
    fCanResize*: WINBOOL
    fCanResizeX*: WINBOOL
    fCanResizeY*: WINBOOL
    iPreferredLeftPercent*: int32
    iPreferredTopPercent*: int32
  LPCOMPPOS* = ptr COMPPOS
  LPCCOMPPOS* = ptr COMPPOS
  COMPSTATEINFO* {.pure.} = object
    dwSize*: DWORD
    iLeft*: int32
    iTop*: int32
    dwWidth*: DWORD
    dwHeight*: DWORD
    dwItemState*: DWORD
  LPCOMPSTATEINFO* = ptr COMPSTATEINFO
  LPCCOMPSTATEINFO* = ptr COMPSTATEINFO
  IE4COMPONENT* {.pure.} = object
    dwSize*: DWORD
    dwID*: DWORD
    iComponentType*: int32
    fChecked*: WINBOOL
    fDirty*: WINBOOL
    fNoScroll*: WINBOOL
    cpPos*: COMPPOS
    wszFriendlyName*: array[MAX_PATH, WCHAR]
    wszSource*: array[2048, WCHAR]
    wszSubscribedURL*: array[2048, WCHAR]
  LPIE4COMPONENT* = ptr IE4COMPONENT
  LPCIE4COMPONENT* = ptr IE4COMPONENT
  COMPONENT* {.pure.} = object
    dwSize*: DWORD
    dwID*: DWORD
    iComponentType*: int32
    fChecked*: WINBOOL
    fDirty*: WINBOOL
    fNoScroll*: WINBOOL
    cpPos*: COMPPOS
    wszFriendlyName*: array[MAX_PATH, WCHAR]
    wszSource*: array[2048, WCHAR]
    wszSubscribedURL*: array[2048, WCHAR]
    dwCurItemState*: DWORD
    csiOriginal*: COMPSTATEINFO
    csiRestored*: COMPSTATEINFO
  LPCOMPONENT* = ptr COMPONENT
  LPCCOMPONENT* = ptr COMPONENT
  IActiveDesktop* {.pure.} = object
    lpVtbl*: ptr IActiveDesktopVtbl
  IActiveDesktopVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ApplyChanges*: proc(self: ptr IActiveDesktop, dwFlags: DWORD): HRESULT {.stdcall.}
    GetWallpaper*: proc(self: ptr IActiveDesktop, pwszWallpaper: PWSTR, cchWallpaper: UINT, dwFlags: DWORD): HRESULT {.stdcall.}
    SetWallpaper*: proc(self: ptr IActiveDesktop, pwszWallpaper: PCWSTR, dwReserved: DWORD): HRESULT {.stdcall.}
    GetWallpaperOptions*: proc(self: ptr IActiveDesktop, pwpo: LPWALLPAPEROPT, dwReserved: DWORD): HRESULT {.stdcall.}
    SetWallpaperOptions*: proc(self: ptr IActiveDesktop, pwpo: LPCWALLPAPEROPT, dwReserved: DWORD): HRESULT {.stdcall.}
    GetPattern*: proc(self: ptr IActiveDesktop, pwszPattern: PWSTR, cchPattern: UINT, dwReserved: DWORD): HRESULT {.stdcall.}
    SetPattern*: proc(self: ptr IActiveDesktop, pwszPattern: PCWSTR, dwReserved: DWORD): HRESULT {.stdcall.}
    GetDesktopItemOptions*: proc(self: ptr IActiveDesktop, pco: LPCOMPONENTSOPT, dwReserved: DWORD): HRESULT {.stdcall.}
    SetDesktopItemOptions*: proc(self: ptr IActiveDesktop, pco: LPCCOMPONENTSOPT, dwReserved: DWORD): HRESULT {.stdcall.}
    AddDesktopItem*: proc(self: ptr IActiveDesktop, pcomp: LPCCOMPONENT, dwReserved: DWORD): HRESULT {.stdcall.}
    AddDesktopItemWithUI*: proc(self: ptr IActiveDesktop, hwnd: HWND, pcomp: LPCOMPONENT, dwReserved: DWORD): HRESULT {.stdcall.}
    ModifyDesktopItem*: proc(self: ptr IActiveDesktop, pcomp: LPCCOMPONENT, dwFlags: DWORD): HRESULT {.stdcall.}
    RemoveDesktopItem*: proc(self: ptr IActiveDesktop, pcomp: LPCCOMPONENT, dwReserved: DWORD): HRESULT {.stdcall.}
    GetDesktopItemCount*: proc(self: ptr IActiveDesktop, pcItems: ptr int32, dwReserved: DWORD): HRESULT {.stdcall.}
    GetDesktopItem*: proc(self: ptr IActiveDesktop, nComponent: int32, pcomp: LPCOMPONENT, dwReserved: DWORD): HRESULT {.stdcall.}
    GetDesktopItemByID*: proc(self: ptr IActiveDesktop, dwID: ULONG_PTR, pcomp: LPCOMPONENT, dwReserved: DWORD): HRESULT {.stdcall.}
    GenerateDesktopItemHtml*: proc(self: ptr IActiveDesktop, pwszFileName: PCWSTR, pcomp: LPCOMPONENT, dwReserved: DWORD): HRESULT {.stdcall.}
    AddUrl*: proc(self: ptr IActiveDesktop, hwnd: HWND, pszSource: PCWSTR, pcomp: LPCOMPONENT, dwFlags: DWORD): HRESULT {.stdcall.}
    GetDesktopItemBySource*: proc(self: ptr IActiveDesktop, pwszSource: PCWSTR, pcomp: LPCOMPONENT, dwReserved: DWORD): HRESULT {.stdcall.}
  LPACTIVEDESKTOP* = ptr IActiveDesktop
  IActiveDesktopP* {.pure.} = object
    lpVtbl*: ptr IActiveDesktopPVtbl
  IActiveDesktopPVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetSafeMode*: proc(self: ptr IActiveDesktopP, dwFlags: DWORD): HRESULT {.stdcall.}
    EnsureUpdateHTML*: proc(self: ptr IActiveDesktopP): HRESULT {.stdcall.}
    SetScheme*: proc(self: ptr IActiveDesktopP, pwszSchemeName: PCWSTR, dwFlags: DWORD): HRESULT {.stdcall.}
    GetScheme*: proc(self: ptr IActiveDesktopP, pwszSchemeName: PWSTR, pdwcchBuffer: ptr DWORD, dwFlags: DWORD): HRESULT {.stdcall.}
  LPACTIVEDESKTOPP* = ptr IActiveDesktopP
  IADesktopP2* {.pure.} = object
    lpVtbl*: ptr IADesktopP2Vtbl
  IADesktopP2Vtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ReReadWallpaper*: proc(self: ptr IADesktopP2): HRESULT {.stdcall.}
    GetADObjectFlags*: proc(self: ptr IADesktopP2, pdwFlags: ptr DWORD, dwMask: DWORD): HRESULT {.stdcall.}
    UpdateAllDesktopSubscriptions*: proc(self: ptr IADesktopP2): HRESULT {.stdcall.}
    MakeDynamicChanges*: proc(self: ptr IADesktopP2, pOleObj: ptr IOleObject): HRESULT {.stdcall.}
  LPADESKTOPP2* = ptr IADesktopP2
const
  MAX_COLUMN_NAME_LEN* = 80
  MAX_COLUMN_DESC_LEN* = 128
type
  SHCOLUMNINFO* {.pure.} = object
    scid*: SHCOLUMNID
    vt*: VARTYPE
    fmt*: DWORD
    cChars*: UINT
    csFlags*: DWORD
    wszTitle*: array[MAX_COLUMN_NAME_LEN, WCHAR]
    wszDescription*: array[MAX_COLUMN_DESC_LEN, WCHAR]
  LPSHCOLUMNINFO* = ptr SHCOLUMNINFO
  LPCSHCOLUMNINFO* = ptr SHCOLUMNINFO
  SHCOLUMNINIT* {.pure.} = object
    dwFlags*: ULONG
    dwReserved*: ULONG
    wszFolder*: array[MAX_PATH, WCHAR]
  LPSHCOLUMNINIT* = ptr SHCOLUMNINIT
  LPCSHCOLUMNINIT* = ptr SHCOLUMNINIT
  SHCOLUMNDATA* {.pure.} = object
    dwFlags*: ULONG
    dwFileAttributes*: DWORD
    dwReserved*: ULONG
    pwszExt*: ptr WCHAR
    wszFile*: array[MAX_PATH, WCHAR]
  LPSHCOLUMNDATA* = ptr SHCOLUMNDATA
  LPCSHCOLUMNDATA* = ptr SHCOLUMNDATA
  NRESARRAY* {.pure.} = object
    cItems*: UINT
    nr*: array[1, NETRESOURCE]
  LPNRESARRAY* = ptr NRESARRAY
  CIDA* {.pure.} = object
    cidl*: UINT
    aoffset*: array[1, UINT]
  LPIDA* = ptr CIDA
  FILEDESCRIPTORA* {.pure.} = object
    dwFlags*: DWORD
    clsid*: CLSID
    sizel*: SIZEL
    pointl*: POINTL
    dwFileAttributes*: DWORD
    ftCreationTime*: FILETIME
    ftLastAccessTime*: FILETIME
    ftLastWriteTime*: FILETIME
    nFileSizeHigh*: DWORD
    nFileSizeLow*: DWORD
    cFileName*: array[MAX_PATH, CHAR]
  LPFILEDESCRIPTORA* = ptr FILEDESCRIPTORA
  FILEDESCRIPTORW* {.pure.} = object
    dwFlags*: DWORD
    clsid*: CLSID
    sizel*: SIZEL
    pointl*: POINTL
    dwFileAttributes*: DWORD
    ftCreationTime*: FILETIME
    ftLastAccessTime*: FILETIME
    ftLastWriteTime*: FILETIME
    nFileSizeHigh*: DWORD
    nFileSizeLow*: DWORD
    cFileName*: array[MAX_PATH, WCHAR]
  LPFILEDESCRIPTORW* = ptr FILEDESCRIPTORW
  FILEGROUPDESCRIPTORA* {.pure.} = object
    cItems*: UINT
    fgd*: array[1, FILEDESCRIPTORA]
  LPFILEGROUPDESCRIPTORA* = ptr FILEGROUPDESCRIPTORA
  FILEGROUPDESCRIPTORW* {.pure.} = object
    cItems*: UINT
    fgd*: array[1, FILEDESCRIPTORW]
  LPFILEGROUPDESCRIPTORW* = ptr FILEGROUPDESCRIPTORW
  DROPFILES* {.pure.} = object
    pFiles*: DWORD
    pt*: POINT
    fNC*: WINBOOL
    fWide*: WINBOOL
  LPDROPFILES* = ptr DROPFILES
  SHChangeDWORDAsIDList* {.pure.} = object
    cb*: USHORT
    dwItem1*: DWORD
    dwItem2*: DWORD
    cbZero*: USHORT
  LPSHChangeDWORDAsIDList* = ptr SHChangeDWORDAsIDList
  SHChangeUpdateImageIDList* {.pure.} = object
    cb*: USHORT
    iIconIndex*: int32
    iCurIndex*: int32
    uFlags*: UINT
    dwProcessID*: DWORD
    szName*: array[MAX_PATH, WCHAR]
    cbZero*: USHORT
  LPSHChangeUpdateImageIDList* = ptr SHChangeUpdateImageIDList
  SHChangeProductKeyAsIDList* {.pure.} = object
    cb*: USHORT
    wszProductKey*: array[39, WCHAR]
    cbZero*: USHORT
  LPSHChangeProductKeyAsIDList* = ptr SHChangeProductKeyAsIDList
  SHDESCRIPTIONID* {.pure.} = object
    dwDescriptionId*: DWORD
    clsid*: CLSID
  LPSHDESCRIPTIONID* = ptr SHDESCRIPTIONID
  CABINETSTATE* {.pure.} = object
    cLength*: WORD
    nVersion*: WORD
    fFullPathTitle* {.bitsize:1.}: WINBOOL
    fSaveLocalView* {.bitsize:1.}: WINBOOL
    fNotShell* {.bitsize:1.}: WINBOOL
    fSimpleDefault* {.bitsize:1.}: WINBOOL
    fDontShowDescBar* {.bitsize:1.}: WINBOOL
    fNewWindowMode* {.bitsize:1.}: WINBOOL
    fShowCompColor* {.bitsize:1.}: WINBOOL
    fDontPrettyNames* {.bitsize:1.}: WINBOOL
    fAdminsCreateCommonGroups* {.bitsize:1.}: WINBOOL
    fUnusedFlags* {.bitsize:7.}: UINT
    fMenuEnumFilter*: UINT
  LPCABINETSTATE* = ptr CABINETSTATE
  OPENASINFO* {.pure.} = object
    pcszFile*: LPCWSTR
    pcszClass*: LPCWSTR
    oaifInFlags*: OPEN_AS_INFO_FLAGS
  POPENASINFO* = ptr OPENASINFO
const
  PIFNAMESIZE* = 30
  PIFSTARTLOCSIZE* = 63
  PIFPARAMSSIZE* = 64
  PIFDEFPATHSIZE* = 64
  PIFDEFFILESIZE* = 80
  PIFMAXFILEPATH* = 260
type
  PROPPRG* {.pure.} = object
    flPrg*: WORD
    flPrgInit*: WORD
    achTitle*: array[PIFNAMESIZE, CHAR]
    achCmdLine*: array[PIFSTARTLOCSIZE+PIFPARAMSSIZE+1, CHAR]
    achWorkDir*: array[PIFDEFPATHSIZE, CHAR]
    wHotKey*: WORD
    achIconFile*: array[PIFDEFFILESIZE, CHAR]
    wIconIndex*: WORD
    dwEnhModeFlags*: DWORD
    dwRealModeFlags*: DWORD
    achOtherFile*: array[PIFDEFFILESIZE, CHAR]
    achPIFFile*: array[PIFMAXFILEPATH, CHAR]
  PPROPPRG* = ptr PROPPRG
  LPPROPPRG* = ptr PROPPRG
  LPCPROPPRG* = ptr PROPPRG
  QCMINFO_IDMAP_PLACEMENT* {.pure.} = object
    id*: UINT
    fFlags*: UINT
  QCMINFO_IDMAP* {.pure.} = object
    nMaxIds*: UINT
    pIdList*: array[1, QCMINFO_IDMAP_PLACEMENT]
  QCMINFO* {.pure.} = object
    hmenu*: HMENU
    indexMenu*: UINT
    idCmdFirst*: UINT
    idCmdLast*: UINT
    pIdMap*: ptr QCMINFO_IDMAP
  LPQCMINFO* = ptr QCMINFO
  TBINFO* {.pure.} = object
    cbuttons*: UINT
    uFlags*: UINT
  LPTBINFO* = ptr TBINFO
  DETAILSINFO* {.pure.} = object
    pidl*: PCUITEMID_CHILD
    fmt*: int32
    cxChar*: int32
    str*: STRRET
    iImage*: int32
  PDETAILSINFO* = ptr DETAILSINFO
  DFMICS* {.pure.} = object
    cbSize*: DWORD
    fMask*: DWORD
    lParam*: LPARAM
    idCmdFirst*: UINT
    idDefMax*: UINT
    pici*: LPCMINVOKECOMMANDINFO
    punkSite*: ptr IUnknown
  PDFMICS* = ptr DFMICS
  LPFNVIEWCALLBACK* = proc (psvOuter: ptr IShellView, psf: ptr IShellFolder, hwndMain: HWND, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.stdcall.}
  CSFV* {.pure.} = object
    cbSize*: UINT
    pshf*: ptr IShellFolder
    psvOuter*: ptr IShellView
    pidl*: PCIDLIST_ABSOLUTE
    lEvents*: LONG
    pfnCallback*: LPFNVIEWCALLBACK
    fvm*: FOLDERVIEWMODE
  LPCSFV* = ptr CSFV
  SFV_SETITEMPOS* {.pure.} = object
    pidl*: PCUITEMID_CHILD
    pt*: POINT
  LPSFV_SETITEMPOS* = ptr SFV_SETITEMPOS
  PCSFV_SETITEMPOS* = ptr SFV_SETITEMPOS
  SHELLSTATEA* {.pure.} = object
    fShowAllObjects* {.bitsize:1.}: WINBOOL
    fShowExtensions* {.bitsize:1.}: WINBOOL
    fNoConfirmRecycle* {.bitsize:1.}: WINBOOL
    fShowSysFiles* {.bitsize:1.}: WINBOOL
    fShowCompColor* {.bitsize:1.}: WINBOOL
    fDoubleClickInWebView* {.bitsize:1.}: WINBOOL
    fDesktopHTML* {.bitsize:1.}: WINBOOL
    fWin95Classic* {.bitsize:1.}: WINBOOL
    fDontPrettyPath* {.bitsize:1.}: WINBOOL
    fShowAttribCol* {.bitsize:1.}: WINBOOL
    fMapNetDrvBtn* {.bitsize:1.}: WINBOOL
    fShowInfoTip* {.bitsize:1.}: WINBOOL
    fHideIcons* {.bitsize:1.}: WINBOOL
    fWebView* {.bitsize:1.}: WINBOOL
    fFilter* {.bitsize:1.}: WINBOOL
    fShowSuperHidden* {.bitsize:1.}: WINBOOL
    fNoNetCrawling* {.bitsize:1.}: WINBOOL
    dwWin95Unused*: DWORD
    uWin95Unused*: UINT
    lParamSort*: LONG
    iSortDirection*: int32
    version*: UINT
    uNotUsed*: UINT
    fSepProcess* {.bitsize:1.}: WINBOOL
    fStartPanelOn* {.bitsize:1.}: WINBOOL
    fShowStartPage* {.bitsize:1.}: WINBOOL
    fAutoCheckSelect* {.bitsize:1.}: WINBOOL
    fIconsOnly* {.bitsize:1.}: WINBOOL
    fShowTypeOverlay* {.bitsize:1.}: WINBOOL
    fShowStatusBar* {.bitsize:1.}: WINBOOL
    fSpareFlags* {.bitsize:9.}: UINT
  LPSHELLSTATEA* = ptr SHELLSTATEA
  SHELLSTATEW* {.pure.} = object
    fShowAllObjects* {.bitsize:1.}: WINBOOL
    fShowExtensions* {.bitsize:1.}: WINBOOL
    fNoConfirmRecycle* {.bitsize:1.}: WINBOOL
    fShowSysFiles* {.bitsize:1.}: WINBOOL
    fShowCompColor* {.bitsize:1.}: WINBOOL
    fDoubleClickInWebView* {.bitsize:1.}: WINBOOL
    fDesktopHTML* {.bitsize:1.}: WINBOOL
    fWin95Classic* {.bitsize:1.}: WINBOOL
    fDontPrettyPath* {.bitsize:1.}: WINBOOL
    fShowAttribCol* {.bitsize:1.}: WINBOOL
    fMapNetDrvBtn* {.bitsize:1.}: WINBOOL
    fShowInfoTip* {.bitsize:1.}: WINBOOL
    fHideIcons* {.bitsize:1.}: WINBOOL
    fWebView* {.bitsize:1.}: WINBOOL
    fFilter* {.bitsize:1.}: WINBOOL
    fShowSuperHidden* {.bitsize:1.}: WINBOOL
    fNoNetCrawling* {.bitsize:1.}: WINBOOL
    dwWin95Unused*: DWORD
    uWin95Unused*: UINT
    lParamSort*: LONG
    iSortDirection*: int32
    version*: UINT
    uNotUsed*: UINT
    fSepProcess* {.bitsize:1.}: WINBOOL
    fStartPanelOn* {.bitsize:1.}: WINBOOL
    fShowStartPage* {.bitsize:1.}: WINBOOL
    fAutoCheckSelect* {.bitsize:1.}: WINBOOL
    fIconsOnly* {.bitsize:1.}: WINBOOL
    fShowTypeOverlay* {.bitsize:1.}: WINBOOL
    fShowStatusBar* {.bitsize:1.}: WINBOOL
    fSpareFlags* {.bitsize:9.}: UINT
  LPSHELLSTATEW* = ptr SHELLSTATEW
  SHELLFLAGSTATE* {.pure.} = object
    fShowAllObjects* {.bitsize:1.}: WINBOOL
    fShowExtensions* {.bitsize:1.}: WINBOOL
    fNoConfirmRecycle* {.bitsize:1.}: WINBOOL
    fShowSysFiles* {.bitsize:1.}: WINBOOL
    fShowCompColor* {.bitsize:1.}: WINBOOL
    fDoubleClickInWebView* {.bitsize:1.}: WINBOOL
    fDesktopHTML* {.bitsize:1.}: WINBOOL
    fWin95Classic* {.bitsize:1.}: WINBOOL
    fDontPrettyPath* {.bitsize:1.}: WINBOOL
    fShowAttribCol* {.bitsize:1.}: WINBOOL
    fMapNetDrvBtn* {.bitsize:1.}: WINBOOL
    fShowInfoTip* {.bitsize:1.}: WINBOOL
    fHideIcons* {.bitsize:1.}: WINBOOL
    fAutoCheckSelect* {.bitsize:1.}: WINBOOL
    fIconsOnly* {.bitsize:1.}: WINBOOL
    fRestFlags* {.bitsize:1.}: UINT
  LPSHELLFLAGSTATE* = ptr SHELLFLAGSTATE
  AASHELLMENUFILENAME* {.pure.} = object
    cbTotal*: SHORT
    rgbReserved*: array[12, BYTE]
    szFileName*: array[1, WCHAR]
  LPAASHELLMENUFILENAME* = ptr AASHELLMENUFILENAME
  AASHELLMENUITEM* {.pure.} = object
    lpReserved1*: pointer
    iReserved*: int32
    uiReserved*: UINT
    lpName*: LPAASHELLMENUFILENAME
    psz*: LPWSTR
  LPAASHELLMENUITEM* = ptr AASHELLMENUITEM
  SMCSHCHANGENOTIFYSTRUCT* {.pure.} = object
    lEvent*: LONG
    pidl1*: PCIDLIST_ABSOLUTE
    pidl2*: PCIDLIST_ABSOLUTE
  PSMCSHCHANGENOTIFYSTRUCT* = ptr SMCSHCHANGENOTIFYSTRUCT
const
  ABM_NEW* = 0x00000000
  ABM_REMOVE* = 0x00000001
  ABM_QUERYPOS* = 0x00000002
  ABM_SETPOS* = 0x00000003
  ABM_GETSTATE* = 0x00000004
  ABM_GETTASKBARPOS* = 0x00000005
  ABM_ACTIVATE* = 0x00000006
  ABM_GETAUTOHIDEBAR* = 0x00000007
  ABM_SETAUTOHIDEBAR* = 0x00000008
  ABM_WINDOWPOSCHANGED* = 0x0000009
  ABM_SETSTATE* = 0x0000000a
  ABM_GETAUTOHIDEBAREX* = 0x0000000b
  ABM_SETAUTOHIDEBAREX* = 0x0000000c
  ABN_STATECHANGE* = 0x0000000
  ABN_POSCHANGED* = 0x0000001
  ABN_FULLSCREENAPP* = 0x0000002
  ABN_WINDOWARRANGE* = 0x0000003
  ABS_AUTOHIDE* = 0x0000001
  ABS_ALWAYSONTOP* = 0x0000002
  ABE_LEFT* = 0
  ABE_TOP* = 1
  ABE_RIGHT* = 2
  ABE_BOTTOM* = 3
  FO_MOVE* = 0x1
  FO_COPY* = 0x2
  FO_DELETE* = 0x3
  FO_RENAME* = 0x4
  FOF_MULTIDESTFILES* = 0x1
  FOF_CONFIRMMOUSE* = 0x2
  FOF_SILENT* = 0x4
  FOF_RENAMEONCOLLISION* = 0x8
  FOF_NOCONFIRMATION* = 0x10
  FOF_WANTMAPPINGHANDLE* = 0x20
  FOF_ALLOWUNDO* = 0x40
  FOF_FILESONLY* = 0x80
  FOF_SIMPLEPROGRESS* = 0x100
  FOF_NOCONFIRMMKDIR* = 0x200
  FOF_NOERRORUI* = 0x400
  FOF_NOCOPYSECURITYATTRIBS* = 0x800
  FOF_NORECURSION* = 0x1000
  FOF_NO_CONNECTED_ELEMENTS* = 0x2000
  FOF_WANTNUKEWARNING* = 0x4000
  FOF_NORECURSEREPARSE* = 0x8000
  FOF_NO_UI* = FOF_SILENT or FOF_NOCONFIRMATION or FOF_NOERRORUI or FOF_NOCONFIRMMKDIR
  PO_DELETE* = 0x0013
  PO_RENAME* = 0x0014
  PO_PORTCHANGE* = 0x0020
  PO_REN_PORT* = 0x0034
  SE_ERR_FNF* = 2
  SE_ERR_PNF* = 3
  SE_ERR_ACCESSDENIED* = 5
  SE_ERR_OOM* = 8
  SE_ERR_DLLNOTFOUND* = 32
  SE_ERR_SHARE* = 26
  SE_ERR_ASSOCINCOMPLETE* = 27
  SE_ERR_DDETIMEOUT* = 28
  SE_ERR_DDEFAIL* = 29
  SE_ERR_DDEBUSY* = 30
  SE_ERR_NOASSOC* = 31
  SEE_MASK_DEFAULT* = 0x0
  SEE_MASK_CLASSNAME* = 0x1
  SEE_MASK_CLASSKEY* = 0x3
  SEE_MASK_IDLIST* = 0x4
  SEE_MASK_INVOKEIDLIST* = 0xc
  SEE_MASK_ICON* = 0x10
  SEE_MASK_HOTKEY* = 0x20
  SEE_MASK_NOCLOSEPROCESS* = 0x40
  SEE_MASK_CONNECTNETDRV* = 0x80
  SEE_MASK_NOASYNC* = 0x100
  SEE_MASK_FLAG_DDEWAIT* = SEE_MASK_NOASYNC
  SEE_MASK_DOENVSUBST* = 0x200
  SEE_MASK_FLAG_NO_UI* = 0x400
  SEE_MASK_UNICODE* = 0x4000
  SEE_MASK_NO_CONSOLE* = 0x8000
  SEE_MASK_ASYNCOK* = 0x100000
  SEE_MASK_HMONITOR* = 0x200000
  SEE_MASK_NOZONECHECKS* = 0x800000
  SEE_MASK_NOQUERYCLASSSTORE* = 0x1000000
  SEE_MASK_WAITFORINPUTIDLE* = 0x2000000
  SEE_MASK_FLAG_LOG_USAGE* = 0x4000000
  SEE_MASK_FLAG_HINST_IS_SITE* = 0x8000000
  ASSOCCLASS_SHELL_KEY* = 0
  ASSOCCLASS_PROGID_KEY* = 1
  ASSOCCLASS_PROGID_STR* = 2
  ASSOCCLASS_CLSID_KEY* = 3
  ASSOCCLASS_CLSID_STR* = 4
  ASSOCCLASS_APP_KEY* = 5
  ASSOCCLASS_APP_STR* = 6
  ASSOCCLASS_SYSTEM_STR* = 7
  ASSOCCLASS_FOLDER* = 8
  ASSOCCLASS_STAR* = 9
  ASSOCCLASS_FIXED_PROGID_STR* = 10
  ASSOCCLASS_PROTOCOL_STR* = 11
  SHERB_NOCONFIRMATION* = 0x00000001
  SHERB_NOPROGRESSUI* = 0x00000002
  SHERB_NOSOUND* = 0x00000004
  QUNS_NOT_PRESENT* = 1
  QUNS_BUSY* = 2
  QUNS_RUNNING_D3D_FULL_SCREEN* = 3
  QUNS_PRESENTATION_MODE* = 4
  QUNS_ACCEPTS_NOTIFICATIONS* = 5
  QUNS_QUIET_TIME* = 6
  QUNS_APP* = 7
  NIN_SELECT* = WM_USER+0
  NINF_KEY* = 0x1
  NIN_KEYSELECT* = NIN_SELECT or NINF_KEY
  NIN_BALLOONSHOW* = WM_USER+2
  NIN_BALLOONHIDE* = WM_USER+3
  NIN_BALLOONTIMEOUT* = WM_USER+4
  NIN_BALLOONUSERCLICK* = WM_USER+5
  NIN_POPUPOPEN* = WM_USER+6
  NIN_POPUPCLOSE* = WM_USER+7
  NIM_ADD* = 0x00000000
  NIM_MODIFY* = 0x00000001
  NIM_DELETE* = 0x00000002
  NIM_SETFOCUS* = 0x00000003
  NIM_SETVERSION* = 0x00000004
  NOTIFYICON_VERSION* = 3
  NOTIFYICON_VERSION_4* = 4
  NIF_MESSAGE* = 0x00000001
  NIF_ICON* = 0x00000002
  NIF_TIP* = 0x00000004
  NIF_STATE* = 0x00000008
  NIF_INFO* = 0x00000010
  NIF_GUID* = 0x00000020
  NIF_REALTIME* = 0x00000040
  NIF_SHOWTIP* = 0x00000080
  NIS_HIDDEN* = 0x00000001
  NIS_SHAREDICON* = 0x00000002
  NIIF_NONE* = 0x00000000
  NIIF_INFO* = 0x00000001
  NIIF_WARNING* = 0x00000002
  NIIF_ERROR* = 0x00000003
  NIIF_USER* = 0x00000004
  NIIF_ICON_MASK* = 0x0000000f
  NIIF_NOSOUND* = 0x00000010
  NIIF_LARGE_ICON* = 0x00000020
  NIIF_RESPECT_QUIET_TIME* = 0x00000080
  SHGFI_ICON* = 0x000000100
  SHGFI_DISPLAYNAME* = 0x000000200
  SHGFI_TYPENAME* = 0x000000400
  SHGFI_ATTRIBUTES* = 0x000000800
  SHGFI_ICONLOCATION* = 0x000001000
  SHGFI_EXETYPE* = 0x000002000
  SHGFI_SYSICONINDEX* = 0x000004000
  SHGFI_LINKOVERLAY* = 0x000008000
  SHGFI_SELECTED* = 0x000010000
  SHGFI_ATTR_SPECIFIED* = 0x000020000
  SHGFI_LARGEICON* = 0x000000000
  SHGFI_SMALLICON* = 0x000000001
  SHGFI_OPENICON* = 0x000000002
  SHGFI_SHELLICONSIZE* = 0x000000004
  SHGFI_PIDL* = 0x000000008
  SHGFI_USEFILEATTRIBUTES* = 0x000000010
  SHGFI_ADDOVERLAYS* = 0x000000020
  SHGFI_OVERLAYINDEX* = 0x000000040
  SHGSI_ICONLOCATION* = 0
  SHGSI_ICON* = SHGFI_ICON
  SHGSI_SYSICONINDEX* = SHGFI_SYSICONINDEX
  SHGSI_LINKOVERLAY* = SHGFI_LINKOVERLAY
  SHGSI_SELECTED* = SHGFI_SELECTED
  SHGSI_LARGEICON* = SHGFI_LARGEICON
  SHGSI_SMALLICON* = SHGFI_SMALLICON
  SHGSI_SHELLICONSIZE* = SHGFI_SHELLICONSIZE
  SIID_DOCNOASSOC* = 0
  SIID_DOCASSOC* = 1
  SIID_APPLICATION* = 2
  SIID_FOLDER* = 3
  SIID_FOLDEROPEN* = 4
  SIID_DRIVE525* = 5
  SIID_DRIVE35* = 6
  SIID_DRIVEREMOVE* = 7
  SIID_DRIVEFIXED* = 8
  SIID_DRIVENET* = 9
  SIID_DRIVENETDISABLED* = 10
  SIID_DRIVECD* = 11
  SIID_DRIVERAM* = 12
  SIID_WORLD* = 13
  SIID_SERVER* = 15
  SIID_PRINTER* = 16
  SIID_MYNETWORK* = 17
  SIID_FIND* = 22
  SIID_HELP* = 23
  SIID_SHARE* = 28
  SIID_LINK* = 29
  SIID_SLOWFILE* = 30
  SIID_RECYCLER* = 31
  SIID_RECYCLERFULL* = 32
  SIID_MEDIACDAUDIO* = 40
  SIID_LOCK* = 47
  SIID_AUTOLIST* = 49
  SIID_PRINTERNET* = 50
  SIID_SERVERSHARE* = 51
  SIID_PRINTERFAX* = 52
  SIID_PRINTERFAXNET* = 53
  SIID_PRINTERFILE* = 54
  SIID_STACK* = 55
  SIID_MEDIASVCD* = 56
  SIID_STUFFEDFOLDER* = 57
  SIID_DRIVEUNKNOWN* = 58
  SIID_DRIVEDVD* = 59
  SIID_MEDIADVD* = 60
  SIID_MEDIADVDRAM* = 61
  SIID_MEDIADVDRW* = 62
  SIID_MEDIADVDR* = 63
  SIID_MEDIADVDROM* = 64
  SIID_MEDIACDAUDIOPLUS* = 65
  SIID_MEDIACDRW* = 66
  SIID_MEDIACDR* = 67
  SIID_MEDIACDBURN* = 68
  SIID_MEDIABLANKCD* = 69
  SIID_MEDIACDROM* = 70
  SIID_AUDIOFILES* = 71
  SIID_IMAGEFILES* = 72
  SIID_VIDEOFILES* = 73
  SIID_MIXEDFILES* = 74
  SIID_FOLDERBACK* = 75
  SIID_FOLDERFRONT* = 76
  SIID_SHIELD* = 77
  SIID_WARNING* = 78
  SIID_INFO* = 79
  SIID_ERROR* = 80
  SIID_KEY* = 81
  SIID_SOFTWARE* = 82
  SIID_RENAME* = 83
  SIID_DELETE* = 84
  SIID_MEDIAAUDIODVD* = 85
  SIID_MEDIAMOVIEDVD* = 86
  SIID_MEDIAENHANCEDCD* = 87
  SIID_MEDIAENHANCEDDVD* = 88
  SIID_MEDIAHDDVD* = 89
  SIID_MEDIABLURAY* = 90
  SIID_MEDIAVCD* = 91
  SIID_MEDIADVDPLUSR* = 92
  SIID_MEDIADVDPLUSRW* = 93
  SIID_DESKTOPPC* = 94
  SIID_MOBILEPC* = 95
  SIID_USERS* = 96
  SIID_MEDIASMARTMEDIA* = 97
  SIID_MEDIACOMPACTFLASH* = 98
  SIID_DEVICECELLPHONE* = 99
  SIID_DEVICECAMERA* = 100
  SIID_DEVICEVIDEOCAMERA* = 101
  SIID_DEVICEAUDIOPLAYER* = 102
  SIID_NETWORKCONNECT* = 103
  SIID_INTERNET* = 104
  SIID_ZIPFILE* = 105
  SIID_SETTINGS* = 106
  SIID_DRIVEHDDVD* = 132
  SIID_DRIVEBD* = 133
  SIID_MEDIAHDDVDROM* = 134
  SIID_MEDIAHDDVDR* = 135
  SIID_MEDIAHDDVDRAM* = 136
  SIID_MEDIABDROM* = 137
  SIID_MEDIABDR* = 138
  SIID_MEDIABDRE* = 139
  SIID_CLUSTEREDDRIVE* = 140
  SIID_MAX_ICONS* = 175
  SIID_INVALID* = SHSTOCKICONID(-1)
  SHGNLI_PIDL* = 0x000000001
  SHGNLI_PREFIXNAME* = 0x000000002
  SHGNLI_NOUNIQUE* = 0x000000004
  SHGNLI_NOLNK* = 0x000000008
  SHGNLI_NOLOCNAME* = 0x000000010
  SHGNLI_USEURLEXT* = 0x000000020
  PRINTACTION_OPEN* = 0
  PRINTACTION_PROPERTIES* = 1
  PRINTACTION_NETINSTALL* = 2
  PRINTACTION_NETINSTALLLINK* = 3
  PRINTACTION_TESTPAGE* = 4
  PRINTACTION_OPENNETPRN* = 5
  PRINTACTION_DOCUMENTDEFAULTS* = 6
  PRINTACTION_SERVERPROPERTIES* = 7
  PRINT_PROP_FORCE_NAME* = 0x01
  OFFLINE_STATUS_LOCAL* = 0x0001
  OFFLINE_STATUS_REMOTE* = 0x0002
  OFFLINE_STATUS_INCOMPLETE* = 0x0004
  SHIL_LARGE* = 0
  SHIL_SMALL* = 1
  SHIL_EXTRALARGE* = 2
  SHIL_SYSSMALL* = 3
  SHIL_JUMBO* = 4
  SHIL_LAST* = SHIL_JUMBO
  WC_NETADDRESS* = "msctls_netaddress"
  NCM_GETADDRESS* = WM_USER+1
  NCM_SETALLOWTYPE* = WM_USER+2
  NCM_GETALLOWTYPE* = WM_USER+3
  NCM_DISPLAYERRORTIP* = WM_USER+4
  SZ_CONTENTTYPE_HTMLA* = "text/html"
  SZ_CONTENTTYPE_HTMLW* = "text/html"
  SZ_CONTENTTYPE_CDFA* = "application/x-cdf"
  SZ_CONTENTTYPE_CDFW* = "application/x-cdf"
  STIF_DEFAULT* = 0x00000000
  STIF_SUPPORT_HEX* = 0x00000001
  GCT_INVALID* = 0x0000
  GCT_LFNCHAR* = 0x0001
  GCT_SHORTCHAR* = 0x0002
  GCT_WILD* = 0x0004
  GCT_SEPARATOR* = 0x0008
  URL_SCHEME_INVALID* = -1
  URL_SCHEME_UNKNOWN* = 0
  URL_SCHEME_FTP* = 1
  URL_SCHEME_HTTP* = 2
  URL_SCHEME_GOPHER* = 3
  URL_SCHEME_MAILTO* = 4
  URL_SCHEME_NEWS* = 5
  URL_SCHEME_NNTP* = 6
  URL_SCHEME_TELNET* = 7
  URL_SCHEME_WAIS* = 8
  URL_SCHEME_FILE* = 9
  URL_SCHEME_MK* = 10
  URL_SCHEME_HTTPS* = 11
  URL_SCHEME_SHELL* = 12
  URL_SCHEME_SNEWS* = 13
  URL_SCHEME_LOCAL* = 14
  URL_SCHEME_JAVASCRIPT* = 15
  URL_SCHEME_VBSCRIPT* = 16
  URL_SCHEME_ABOUT* = 17
  URL_SCHEME_RES* = 18
  URL_SCHEME_MSSHELLROOTED* = 19
  URL_SCHEME_MSSHELLIDLIST* = 20
  URL_SCHEME_MSHELP* = 21
  URL_SCHEME_MAXVALUE* = 22
  URL_PART_NONE* = 0
  URL_PART_SCHEME* = 1
  URL_PART_HOSTNAME* = 2
  URL_PART_USERNAME* = 3
  URL_PART_PASSWORD* = 4
  URL_PART_PORT* = 5
  URL_PART_QUERY* = 6
  urlIsUrl* = 0
  urlIsOpaque* = 1
  urlIsNohistory* = 2
  urlIsFileurl* = 3
  urlIsAppliable* = 4
  urlIsDirectory* = 5
  urlIsHasquery* = 6
  urlUnescape* = 0x10000000
  URL_ESCAPE_UNSAFE* = 0x20000000
  URL_PLUGGABLE_PROTOCOL* = 0x40000000
  URL_WININET_COMPATIBILITY* = 0x80000000'i32
  URL_DONT_ESCAPE_EXTRA_INFO* = 0x02000000
  URL_DONT_UNESCAPE_EXTRA_INFO* = URL_DONT_ESCAPE_EXTRA_INFO
  URL_BROWSER_MODE* = URL_DONT_ESCAPE_EXTRA_INFO
  URL_ESCAPE_SPACES_ONLY* = 0x04000000
  URL_DONT_SIMPLIFY* = 0x08000000
  URL_NO_META* = URL_DONT_SIMPLIFY
  URL_UNESCAPE_INPLACE* = 0x00100000
  URL_CONVERT_IF_DOSPATH* = 0x00200000
  URL_UNESCAPE_HIGH_ANSI_ONLY* = 0x00400000
  URL_INTERNAL_PATH* = 0x00800000
  URL_FILE_USE_PATHURL* = 0x00010000
  URL_DONT_UNESCAPE* = 0x00020000
  URL_ESCAPE_PERCENT* = 0x00001000
  URL_ESCAPE_SEGMENT_ONLY* = 0x00002000
  URL_PARTFLAG_KEEPSCHEME* = 0x00000001
  URL_APPLY_DEFAULT* = 0x00000001
  URL_APPLY_GUESSSCHEME* = 0x00000002
  URL_APPLY_GUESSFILE* = 0x00000004
  URL_APPLY_FORCEAPPLY* = 0x00000008
  SRRF_RT_REG_NONE* = 0x00000001
  SRRF_RT_REG_SZ* = 0x00000002
  SRRF_RT_REG_EXPAND_SZ* = 0x00000004
  SRRF_RT_REG_BINARY* = 0x00000008
  SRRF_RT_REG_DWORD* = 0x00000010
  SRRF_RT_REG_MULTI_SZ* = 0x00000020
  SRRF_RT_REG_QWORD* = 0x00000040
  SRRF_RT_DWORD* = SRRF_RT_REG_BINARY or SRRF_RT_REG_DWORD
  SRRF_RT_QWORD* = SRRF_RT_REG_BINARY or SRRF_RT_REG_QWORD
  SRRF_RT_ANY* = 0x0000ffff
  SRRF_RM_ANY* = 0x00000000
  SRRF_RM_NORMAL* = 0x00010000
  SRRF_RM_SAFE* = 0x00020000
  SRRF_RM_SAFENETWORK* = 0x00040000
  SRRF_NOEXPAND* = 0x10000000
  SRRF_ZEROONFAILURE* = 0x20000000
  SHREGDEL_DEFAULT* = 0x00000000
  SHREGDEL_HKCU* = 0x00000001
  SHREGDEL_HKLM* = 0x00000010
  SHREGDEL_BOTH* = 0x00000011
  SHREGENUM_DEFAULT* = 0x00000000
  SHREGENUM_HKCU* = 0x00000001
  SHREGENUM_HKLM* = 0x00000010
  SHREGENUM_BOTH* = 0x00000011
  SHREGSET_HKCU* = 0x00000001
  SHREGSET_FORCE_HKCU* = 0x00000002
  SHREGSET_HKLM* = 0x00000004
  SHREGSET_FORCE_HKLM* = 0x00000008
  SHREGSET_DEFAULT* = SHREGSET_FORCE_HKCU or SHREGSET_HKLM
  ASSOCF_INIT_NOREMAPCLSID* = 0x00000001
  ASSOCF_INIT_BYEXENAME* = 0x00000002
  ASSOCF_OPEN_BYEXENAME* = 0x00000002
  ASSOCF_INIT_DEFAULTTOSTAR* = 0x00000004
  ASSOCF_INIT_DEFAULTTOFOLDER* = 0x00000008
  ASSOCF_NOUSERSETTINGS* = 0x00000010
  ASSOCF_NOTRUNCATE* = 0x00000020
  ASSOCF_VERIFY* = 0x00000040
  ASSOCF_REMAPRUNDLL* = 0x00000080
  ASSOCF_NOFIXUPS* = 0x00000100
  ASSOCF_IGNOREBASECLASS* = 0x00000200
  ASSOCF_INIT_IGNOREUNKNOWN* = 0x00000400
  ASSOCSTR_COMMAND* = 1
  ASSOCSTR_EXECUTABLE* = 2
  ASSOCSTR_FRIENDLYDOCNAME* = 3
  ASSOCSTR_FRIENDLYAPPNAME* = 4
  ASSOCSTR_NOOPEN* = 5
  ASSOCSTR_SHELLNEWVALUE* = 6
  ASSOCSTR_DDECOMMAND* = 7
  ASSOCSTR_DDEIFEXEC* = 8
  ASSOCSTR_DDEAPPLICATION* = 9
  ASSOCSTR_DDETOPIC* = 10
  ASSOCSTR_INFOTIP* = 11
  ASSOCSTR_QUICKTIP* = 12
  ASSOCSTR_TILEINFO* = 13
  ASSOCSTR_CONTENTTYPE* = 14
  ASSOCSTR_DEFAULTICON* = 15
  ASSOCSTR_SHELLEXTENSION* = 16
  ASSOCSTR_DROPTARGET* = 17
  ASSOCSTR_DELEGATEEXECUTE* = 18
  ASSOCSTR_MAX* = 19
  ASSOCKEY_SHELLEXECCLASS* = 1
  ASSOCKEY_APP* = 2
  ASSOCKEY_CLASS* = 3
  ASSOCKEY_BASECLASS* = 4
  ASSOCKEY_MAX* = 5
  ASSOCDATA_MSIDESCRIPTOR* = 1
  ASSOCDATA_NOACTIVATEHANDLER* = 2
  ASSOCDATA_QUERYCLASSSTORE* = 3
  ASSOCDATA_HASPERUSERASSOC* = 4
  ASSOCDATA_EDITFLAGS* = 5
  ASSOCDATA_VALUE* = 6
  ASSOCDATA_MAX* = 7
  ASSOCENUM_NONE* = 0
  SHGVSPB_PERUSER* = 0x00000001
  SHGVSPB_ALLUSERS* = 0x00000002
  SHGVSPB_PERFOLDER* = 0x00000004
  SHGVSPB_ALLFOLDERS* = 0x00000008
  SHGVSPB_INHERIT* = 0x00000010
  SHGVSPB_ROAM* = 0x00000020
  SHGVSPB_NOAUTODEFAULTS* = 0x80000000'i32
  SHGVSPB_FOLDER* = SHGVSPB_PERUSER or SHGVSPB_PERFOLDER
  SHGVSPB_FOLDERNODEFAULTS* = SHGVSPB_PERUSER or SHGVSPB_PERFOLDER or SHGVSPB_NOAUTODEFAULTS
  SHGVSPB_USERDEFAULTS* = SHGVSPB_PERUSER or SHGVSPB_ALLFOLDERS
  SHGVSPB_GLOBALDEAFAULTS* = SHGVSPB_ALLUSERS or SHGVSPB_ALLFOLDERS
  SHACF_DEFAULT* = 0x00000000
  SHACF_FILESYSTEM* = 0x00000001
  SHACF_URLHISTORY* = 0x00000002
  SHACF_URLMRU* = 0x00000004
  SHACF_URLALL* = SHACF_URLHISTORY or SHACF_URLMRU
  SHACF_USETAB* = 0x00000008
  SHACF_FILESYS_ONLY* = 0x00000010
  SHACF_FILESYS_DIRS* = 0x00000020
  SHACF_AUTOSUGGEST_FORCE_ON* = 0x10000000
  SHACF_AUTOSUGGEST_FORCE_OFF* = 0x20000000
  SHACF_AUTOAPPEND_FORCE_ON* = 0x40000000
  SHACF_AUTOAPPEND_FORCE_OFF* = 0x80000000'i32
  CTF_INSIST* = 0x00000001
  CTF_THREAD_REF* = 0x00000002
  CTF_PROCESS_REF* = 0x00000004
  CTF_COINIT* = 0x00000008
  CTF_FREELIBANDEXIT* = 0x00000010
  CTF_REF_COUNTED* = 0x00000020
  CTF_WAIT_ALLOWCOM* = 0x00000040
  DLLVER_PLATFORM_WINDOWS* = 0x00000001
  DLLVER_PLATFORM_NT* = 0x00000002
  DLLVER_MAJOR_MASK* = 0xFFFF000000000000
  DLLVER_MINOR_MASK* = 0x0000FFFF00000000
  DLLVER_BUILD_MASK* = 0x00000000FFFF0000'i32
  DLLVER_QFE_MASK* = 0x000000000000FFFF
  CSIDL_FLAG_CREATE* = 0x8000
  CSIDL_PERSONAL* = 0x0005
  CSIDL_MYPICTURES* = 0x0027
  CSIDL_APPDATA* = 0x001a
  CSIDL_MYMUSIC* = 0x000d
  CSIDL_MYVIDEO* = 0x000e
  SHGFP_TYPE_CURRENT* = 0
  SHGFP_TYPE_DEFAULT* = 1
  STR_MYDOCS_CLSID* = "{450D8FBA-AD25-11D0-98A8-0800361B1103}"
  PSGUID_INTERNETSHORTCUT* = DEFINE_GUID(0x000214a0'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  PSGUID_INTERNETSITE* = DEFINE_GUID(0x000214a1'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_ICopyHookA* = DEFINE_GUID(0x000214ef'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IShellCopyHookA* = IID_ICopyHookA
  IID_ICopyHookW* = DEFINE_GUID(0x000214fc'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IShellCopyHookW* = IID_ICopyHookW
  IID_IShellLinkW* = DEFINE_GUID(0x000214f9'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  SID_LinkSite* = IID_IShellLinkW
  IID_IShellFolderViewCB* = DEFINE_GUID(0x2047e320'i32, 0xf2a9, 0x11ce, [0xae'u8, 0x65, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62])
  SID_ShellFolderViewCB* = IID_IShellFolderViewCB
  IID_IShellBrowser* = DEFINE_GUID(0x000214e2'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  SID_SShellBrowser* = IID_IShellBrowser
  CLSID_ShellDesktop* = DEFINE_GUID(0x00021400'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  SID_SShellDesktop* = CLSID_ShellDesktop
  CLSID_NetworkDomain* = DEFINE_GUID(0x46e06680'i32, 0x4bf0, 0x11d1, [0x83'u8, 0xee, 0x00, 0xa0, 0xc9, 0x0d, 0xc8, 0x49])
  CLSID_NetworkServer* = DEFINE_GUID(0xc0542a90'i32, 0x4bf0, 0x11d1, [0x83'u8, 0xee, 0x00, 0xa0, 0xc9, 0x0d, 0xc8, 0x49])
  CLSID_NetworkShare* = DEFINE_GUID(0x54a754c0'i32, 0x4bf0, 0x11d1, [0x83'u8, 0xee, 0x00, 0xa0, 0xc9, 0x0d, 0xc8, 0x49])
  CLSID_MyComputer* = DEFINE_GUID(0x20d04fe0'i32, 0x3aea, 0x1069, [0xa2'u8, 0xd8, 0x08, 0x00, 0x2b, 0x30, 0x30, 0x9d])
  CLSID_Internet* = DEFINE_GUID(0x871c5380'i32, 0x42a0, 0x1069, [0xa2'u8, 0xea, 0x08, 0x00, 0x2b, 0x30, 0x30, 0x9d])
  CLSID_RecycleBin* = DEFINE_GUID(0x645ff040'i32, 0x5081, 0x101b, [0x9f'u8, 0x08, 0x00, 0xaa, 0x00, 0x2f, 0x95, 0x4e])
  CLSID_ControlPanel* = DEFINE_GUID(0x21ec2020'i32, 0x3aea, 0x1069, [0xa2'u8, 0xdd, 0x08, 0x00, 0x2b, 0x30, 0x30, 0x9d])
  CLSID_Printers* = DEFINE_GUID(0x2227a280'i32, 0x3aea, 0x1069, [0xa2'u8, 0xde, 0x08, 0x00, 0x2b, 0x30, 0x30, 0x9d])
  CLSID_MyDocuments* = DEFINE_GUID(0x450d8fba'i32, 0xad25, 0x11d0, [0x98'u8, 0xa8, 0x08, 0x00, 0x36, 0x1b, 0x11, 0x03])
  CATID_BrowsableShellExt* = DEFINE_GUID(0x00021490'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  CATID_BrowseInPlace* = DEFINE_GUID(0x00021491'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  CATID_DeskBand* = DEFINE_GUID(0x00021492'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  CATID_InfoBand* = DEFINE_GUID(0x00021493'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  CATID_CommBand* = DEFINE_GUID(0x00021494'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  FMTID_Intshcut* = DEFINE_GUID(0x000214a0'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  FMTID_InternetSite* = DEFINE_GUID(0x000214a1'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  CGID_Explorer* = DEFINE_GUID(0x000214d0'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  CGID_ShellDocView* = DEFINE_GUID(0x000214d1'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  CGID_ShellServiceObject* = DEFINE_GUID(0x000214d2'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  CGID_ExplorerBarDoc* = DEFINE_GUID(0x000214d3'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_INewShortcutHookA* = DEFINE_GUID(0x000214e1'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IExtractIconA* = DEFINE_GUID(0x000214eb'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IShellDetails* = DEFINE_GUID(0x000214ec'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IFileViewerA* = DEFINE_GUID(0x000214f0'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IFileViewerSite* = DEFINE_GUID(0x000214f3'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IShellExecuteHookA* = DEFINE_GUID(0x000214f5'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IPropSheetPage* = DEFINE_GUID(0x000214f6'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_INewShortcutHookW* = DEFINE_GUID(0x000214f7'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IFileViewerW* = DEFINE_GUID(0x000214f8'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IExtractIconW* = DEFINE_GUID(0x000214fa'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IShellExecuteHookW* = DEFINE_GUID(0x000214fb'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IQueryInfo* = DEFINE_GUID(0x00021500'i32, 0, 0, [0xc0'u8, 0, 0, 0, 0, 0, 0, 0x46])
  IID_IBriefcaseStg* = DEFINE_GUID(0x8bce1fa1'i32, 0x0921, 0x101b, [0xb1'u8, 0xff, 0x00, 0xdd, 0x01, 0x0c, 0xcc, 0x48])
  IID_IURLSearchHook* = DEFINE_GUID(0xac60f6a0'i32, 0x0fd9, 0x11d0, [0x99'u8, 0xcb, 0x00, 0xc0, 0x4f, 0xd6, 0x44, 0x97])
  IID_ISearchContext* = DEFINE_GUID(0x09f656a2'i32, 0x41af, 0x480c, [0x88'u8, 0xf7, 0x16, 0xcc, 0x0d, 0x16, 0x46, 0x15])
  IID_IURLSearchHook2* = DEFINE_GUID(0x5ee44da4'i32, 0x6d32, 0x46e3, [0x86'u8, 0xbc, 0x07, 0x54, 0x0d, 0xed, 0xd0, 0xe0])
  IID_IDefViewID* = DEFINE_GUID(0x985f64f0'i32, 0xd410, 0x4e02, [0xbe'u8, 0x22, 0xda, 0x07, 0xf2, 0xb5, 0xc5, 0xe1])
  CLSID_FolderShortcut* = DEFINE_GUID(0x0afaced1'i32, 0xe828, 0x11d1, [0x91'u8, 0x87, 0xb5, 0x32, 0xf1, 0xe9, 0x57, 0x5d])
  IID_IDockingWindowSite* = DEFINE_GUID(0x2a342fc2'i32, 0x7b26, 0x11d0, [0x8c'u8, 0xa9, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8])
  IID_IDockingWindowFrame* = DEFINE_GUID(0x47d2657a'i32, 0x7b27, 0x11d0, [0x8c'u8, 0xa9, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8])
  IID_IShellIconOverlay* = DEFINE_GUID(0x7d688a70'i32, 0xc613, 0x11d0, [0x99'u8, 0x9b, 0x00, 0xc0, 0x4f, 0xd6, 0x55, 0xe1])
  IID_IShellIconOverlayIdentifier* = DEFINE_GUID(0x0c6c4200'i32, 0xc589, 0x11d0, [0x99'u8, 0x9a, 0x00, 0xc0, 0x4f, 0xd6, 0x55, 0xe1])
  CLSID_CFSIconOverlayManager* = DEFINE_GUID(0x63b51f81'i32, 0xc868, 0x11d0, [0x99'u8, 0x9c, 0x00, 0xc0, 0x4f, 0xd6, 0x55, 0xe1])
  IID_IShellIconOverlayManager* = DEFINE_GUID(0xf10b5e34'i32, 0xdd3b, 0x42a7, [0xaa'u8, 0x7d, 0x2f, 0x4e, 0xc5, 0x4b, 0xb0, 0x9b])
  IID_IThumbnailCapture* = DEFINE_GUID(0x4ea39266'i32, 0x7211, 0x409f, [0xb6'u8, 0x22, 0xf6, 0x3d, 0xbd, 0x16, 0xc5, 0x33])
  IID_IShellImageStore* = DEFINE_GUID(0x48c8118c'i32, 0xb924, 0x11d1, [0x98'u8, 0xd5, 0x0, 0xc0, 0x4f, 0xb6, 0x87, 0xda])
  CLSID_ShellThumbnailDiskCache* = DEFINE_GUID(0x1ebdcf80'i32, 0xa200, 0x11d0, [0xa3'u8, 0xa4, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec])
  SID_DefView* = DEFINE_GUID(0x6d12fe80'i32, 0x7911, 0x11cf, [0x95'u8, 0x34, 0x00, 0x00, 0xc0, 0x5b, 0xae, 0x0b])
  CGID_DefView* = DEFINE_GUID(0x4af07f10'i32, 0xd231, 0x11d0, [0xb9'u8, 0x42, 0x0, 0xa0, 0xc9, 0x3, 0x12, 0xe1])
  CLSID_MenuBand* = DEFINE_GUID(0x5b4dae26'i32, 0xb807, 0x11d0, [0x98'u8, 0x15, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72])
  IID_IShellFolderBand* = DEFINE_GUID(0x7fe80cc8'i32, 0xc247, 0x11d0, [0xb9'u8, 0x3a, 0x0, 0xa0, 0xc9, 0x3, 0x12, 0xe1])
  IID_IDefViewFrame* = DEFINE_GUID(0x710eb7a0'i32, 0x45ed, 0x11d0, [0x92'u8, 0x4a, 0x00, 0x20, 0xaf, 0xc7, 0xac, 0x4d])
  VID_LargeIcons* = DEFINE_GUID(0x0057d0e0'i32, 0x3573, 0x11cf, [0xae'u8, 0x69, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62])
  VID_SmallIcons* = DEFINE_GUID(0x089000c0'i32, 0x3573, 0x11cf, [0xae'u8, 0x69, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62])
  VID_List* = DEFINE_GUID(0x0e1fa5e0'i32, 0x3573, 0x11cf, [0xae'u8, 0x69, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62])
  VID_Details* = DEFINE_GUID(0x137e7700'i32, 0x3573, 0x11cf, [0xae'u8, 0x69, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62])
  VID_Tile* = DEFINE_GUID(0x65f125e5'i32, 0x7be1, 0x4810, [0xba'u8, 0x9d, 0xd2, 0x71, 0xc8, 0x43, 0x2c, 0xe3])
  VID_Content* = DEFINE_GUID(0x30c2c434'i32, 0x0889, 0x4c8d, [0x98'u8, 0x5d, 0xa9, 0xf7, 0x18, 0x30, 0xb0, 0xa9])
  VID_Thumbnails* = DEFINE_GUID(0x8bebb290'i32, 0x52d0, 0x11d0, [0xb7'u8, 0xf4, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec])
  VID_ThumbStrip* = DEFINE_GUID(0x8eefa624'i32, 0xd1e9, 0x445b, [0x94'u8, 0xb7, 0x74, 0xfb, 0xce, 0x2e, 0xa1, 0x1a])
  SID_SInPlaceBrowser* = DEFINE_GUID(0x1d2ae02b'i32, 0x3655, 0x46cc, [0xb6'u8, 0x3a, 0x28, 0x59, 0x88, 0x15, 0x3b, 0xca])
  SID_SSearchBoxInfo* = DEFINE_GUID(0x142daa61'i32, 0x516b, 0x4713, [0xb4'u8, 0x9c, 0xfb, 0x98, 0x5e, 0xf8, 0x29, 0x98])
  SID_CommandsPropertyBag* = DEFINE_GUID(0x6e043250'i32, 0x4416, 0x485c, [0xb1'u8, 0x43, 0xe6, 0x2a, 0x76, 0x0d, 0x9f, 0xe5])
  IID_IDiscardableBrowserProperty* = DEFINE_GUID(0x49c3de7c'i32, 0xd329, 0x11d0, [0xab'u8, 0x73, 0x00, 0xc0, 0x4f, 0xc3, 0x3e, 0x80])
  IID_IShellChangeNotify* = DEFINE_GUID(0xd82be2b1'i32, 0x5764, 0x11d0, [0xa9'u8, 0x6e, 0x00, 0xc0, 0x4f, 0xd7, 0x05, 0xa2])
  CLSID_InternetShortcut* = DEFINE_GUID(0xFBF23B40'i32, 0xE3F0, 0x101B, [0x84'u8, 0x88, 0x00, 0xAA, 0x00, 0x3E, 0x56, 0xF8])
  IID_IUniformResourceLocatorA* = DEFINE_GUID(0xFBF23B80'i32, 0xE3F0, 0x101B, [0x84'u8, 0x88, 0x00, 0xAA, 0x00, 0x3E, 0x56, 0xF8])
  IID_IUniformResourceLocatorW* = DEFINE_GUID(0xCABB0DA0'i32, 0xDA57, 0x11CF, [0x99'u8, 0x74, 0x00, 0x20, 0xAF, 0xD7, 0x97, 0x62])
  LIBID_Shell32* = DEFINE_GUID(0x50a7e9b0'i32, 0x70ef, 0x11d1, [0xb7'u8, 0x5a, 0x00, 0xa0, 0xc9, 0x05, 0x64, 0xfe])
  IID_IFolderViewOC* = DEFINE_GUID(0x9ba05970'i32, 0xf6a8, 0x11cf, [0xa4'u8, 0x42, 0x00, 0xa0, 0xc9, 0x0a, 0x8f, 0x39])
  DIID_DShellFolderViewEvents* = DEFINE_GUID(0x62112aa2'i32, 0xebe4, 0x11cf, [0xa5'u8, 0xfb, 0x00, 0x20, 0xaf, 0xe7, 0x29, 0x2d])
  IID_DShellFolderViewEvents* = DEFINE_GUID(0x62112aa2'i32, 0xebe4, 0x11cf, [0xa5'u8, 0xfb, 0x00, 0x20, 0xaf, 0xe7, 0x29, 0x2d])
  CLSID_ShellFolderViewOC* = DEFINE_GUID(0x9ba05971'i32, 0xf6a8, 0x11cf, [0xa4'u8, 0x42, 0x00, 0xa0, 0xc9, 0x0a, 0x8f, 0x39])
  IID_DFConstraint* = DEFINE_GUID(0x4a3df050'i32, 0x23bd, 0x11d2, [0x93'u8, 0x9f, 0x00, 0xa0, 0xc9, 0x1e, 0xed, 0xba])
  IID_Folder* = DEFINE_GUID(0xbbcbde60'i32, 0xc3ff, 0x11ce, [0x83'u8, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00])
  IID_Folder2* = DEFINE_GUID(0xf0d2d8ef'i32, 0x3890, 0x11d2, [0xbf'u8, 0x8b, 0x00, 0xc0, 0x4f, 0xb9, 0x36, 0x61])
  OFS_INACTIVE* = -1
  OFS_ONLINE* = 0
  OFS_OFFLINE* = 1
  OFS_SERVERBACK* = 2
  OFS_DIRTYCACHE* = 3
  IID_Folder3* = DEFINE_GUID(0xa7ae5f64'i32, 0xc4d7, 0x4d7f, [0x93'u8, 0x07, 0x4d, 0x24, 0xee, 0x54, 0xb8, 0x41])
  IID_FolderItem* = DEFINE_GUID(0xfac32c80'i32, 0xcbe4, 0x11ce, [0x83'u8, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00])
  IID_FolderItem2* = DEFINE_GUID(0xedc817aa'i32, 0x92b8, 0x11d1, [0xb0'u8, 0x75, 0x00, 0xc0, 0x4f, 0xc3, 0x3a, 0xa5])
  CLSID_ShellFolderItem* = DEFINE_GUID(0x2fe352ea'i32, 0xfd1f, 0x11d2, [0xb1'u8, 0xf4, 0x00, 0xc0, 0x4f, 0x8e, 0xeb, 0x3e])
  IID_FolderItems* = DEFINE_GUID(0x744129e0'i32, 0xcbe5, 0x11ce, [0x83'u8, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00])
  IID_FolderItems2* = DEFINE_GUID(0xc94f0ad0'i32, 0xf363, 0x11d2, [0xa3'u8, 0x27, 0x00, 0xc0, 0x4f, 0x8e, 0xec, 0x7f])
  IID_FolderItems3* = DEFINE_GUID(0xeaa7c309'i32, 0xbbec, 0x49d5, [0x82'u8, 0x1d, 0x64, 0xd9, 0x66, 0xcb, 0x66, 0x7f])
  IID_FolderItemVerb* = DEFINE_GUID(0x08ec3e00'i32, 0x50b0, 0x11cf, [0x96'u8, 0x0c, 0x00, 0x80, 0xc7, 0xf4, 0xee, 0x85])
  IID_FolderItemVerbs* = DEFINE_GUID(0x1f8352c0'i32, 0x50b0, 0x11cf, [0x96'u8, 0x0c, 0x00, 0x80, 0xc7, 0xf4, 0xee, 0x85])
  IID_IShellLinkDual* = DEFINE_GUID(0x88a05c00'i32, 0xf000, 0x11ce, [0x83'u8, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00])
  IID_IShellLinkDual2* = DEFINE_GUID(0x317ee249'i32, 0xf12e, 0x11d2, [0xb1'u8, 0xe4, 0x00, 0xc0, 0x4f, 0x8e, 0xeb, 0x3e])
  CLSID_ShellLinkObject* = DEFINE_GUID(0x11219420'i32, 0x1768, 0x11d1, [0x95'u8, 0xbe, 0x00, 0x60, 0x97, 0x97, 0xea, 0x4f])
  IID_IShellFolderViewDual* = DEFINE_GUID(0xe7a1af80'i32, 0x4d96, 0x11cf, [0x96'u8, 0x0c, 0x00, 0x80, 0xc7, 0xf4, 0xee, 0x85])
  IID_IShellFolderViewDual2* = DEFINE_GUID(0x31c147b6'i32, 0x0ade, 0x4a3c, [0xb5'u8, 0x14, 0xdd, 0xf9, 0x32, 0xef, 0x6d, 0x17])
  IID_IShellFolderViewDual3* = DEFINE_GUID(0x29ec8e6c'i32, 0x46d3, 0x411f, [0xba'u8, 0xaa, 0x61, 0x1a, 0x6c, 0x9c, 0xac, 0x66])
  CLSID_ShellFolderView* = DEFINE_GUID(0x62112aa1'i32, 0xebe4, 0x11cf, [0xa5'u8, 0xfb, 0x00, 0x20, 0xaf, 0xe7, 0x29, 0x2d])
  SFVVO_SHOWALLOBJECTS* = 0x1
  SFVVO_SHOWEXTENSIONS* = 0x2
  SFVVO_SHOWCOMPCOLOR* = 0x8
  SFVVO_SHOWSYSFILES* = 0x20
  SFVVO_WIN95CLASSIC* = 0x40
  SFVVO_DOUBLECLICKINWEBVIEW* = 0x80
  SFVVO_DESKTOPHTML* = 0x200
  IID_IShellDispatch* = DEFINE_GUID(0xd8f015c0'i32, 0xc278, 0x11ce, [0xa4'u8, 0x9e, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00])
  IID_IShellDispatch2* = DEFINE_GUID(0xa4c6892c'i32, 0x3ba9, 0x11d2, [0x9d'u8, 0xea, 0x00, 0xc0, 0x4f, 0xb1, 0x61, 0x62])
  IID_IShellDispatch3* = DEFINE_GUID(0x177160ca'i32, 0xbb5a, 0x411c, [0x84'u8, 0x1d, 0xbd, 0x38, 0xfa, 0xcd, 0xea, 0xa0])
  IID_IShellDispatch4* = DEFINE_GUID(0xefd84b2d'i32, 0x4bcf, 0x4298, [0xbe'u8, 0x25, 0xeb, 0x54, 0x2a, 0x59, 0xfb, 0xda])
  IID_IShellDispatch5* = DEFINE_GUID(0x866738b9'i32, 0x6cf2, 0x4de8, [0x87'u8, 0x67, 0xf7, 0x94, 0xeb, 0xe7, 0x4f, 0x4e])
  IID_IShellDispatch6* = DEFINE_GUID(0x286e6f1b'i32, 0x7113, 0x4355, [0x95'u8, 0x62, 0x96, 0xb7, 0xe9, 0xd6, 0x4c, 0x54])
  CLSID_Shell* = DEFINE_GUID(0x13709620'i32, 0xc279, 0x11ce, [0xa4'u8, 0x9e, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00])
  CLSID_ShellDispatchInproc* = DEFINE_GUID(0x0a89a860'i32, 0xd7b1, 0x11ce, [0x83'u8, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00])
  ssfDESKTOP* = 0x0
  ssfPROGRAMS* = 0x2
  ssfCONTROLS* = 0x3
  ssfPRINTERS* = 0x4
  ssfPERSONAL* = 0x5
  ssfFAVORITES* = 0x6
  ssfSTARTUP* = 0x7
  ssfRECENT* = 0x8
  ssfSENDTO* = 0x9
  ssfBITBUCKET* = 0xa
  ssfSTARTMENU* = 0xb
  ssfDESKTOPDIRECTORY* = 0x10
  ssfDRIVES* = 0x11
  ssfNETWORK* = 0x12
  ssfNETHOOD* = 0x13
  ssfFONTS* = 0x14
  ssfTEMPLATES* = 0x15
  ssfCOMMONSTARTMENU* = 0x16
  ssfCOMMONPROGRAMS* = 0x17
  ssfCOMMONSTARTUP* = 0x18
  ssfCOMMONDESKTOPDIR* = 0x19
  ssfAPPDATA* = 0x1a
  ssfPRINTHOOD* = 0x1b
  ssfLOCALAPPDATA* = 0x1c
  ssfALTSTARTUP* = 0x1d
  ssfCOMMONALTSTARTUP* = 0x1e
  ssfCOMMONFAVORITES* = 0x1f
  ssfINTERNETCACHE* = 0x20
  ssfCOOKIES* = 0x21
  ssfHISTORY* = 0x22
  ssfCOMMONAPPDATA* = 0x23
  ssfWINDOWS* = 0x24
  ssfSYSTEM* = 0x25
  ssfPROGRAMFILES* = 0x26
  ssfMYPICTURES* = 0x27
  ssfPROFILE* = 0x28
  ssfSYSTEMx86* = 0x29
  ssfPROGRAMFILESx86* = 0x30
  IID_IFileSearchBand* = DEFINE_GUID(0x2d91eea1'i32, 0x9932, 0x11d2, [0xbe'u8, 0x86, 0x00, 0xa0, 0xc9, 0xa8, 0x3d, 0xa1])
  CLSID_FileSearchBand* = DEFINE_GUID(0xc4ee31f3'i32, 0x4768, 0x11d2, [0xbe'u8, 0x5c, 0x00, 0xa0, 0xc9, 0xa8, 0x3d, 0xa1])
  IID_IWebWizardHost* = DEFINE_GUID(0x18bcc359'i32, 0x4990, 0x4bfb, [0xb9'u8, 0x51, 0x3c, 0x83, 0x70, 0x2b, 0xe5, 0xf9])
  IID_INewWDEvents* = DEFINE_GUID(0x0751c551'i32, 0x7568, 0x41c9, [0x8e'u8, 0x5b, 0xe2, 0x2e, 0x38, 0x91, 0x92, 0x36])
  IID_IAutoComplete* = DEFINE_GUID(0x00bb2762'i32, 0x6a77, 0x11d0, [0xa5'u8, 0x35, 0x00, 0xc0, 0x4f, 0xd7, 0xd0, 0x62])
  ACO_NONE* = 0x0
  ACO_AUTOSUGGEST* = 0x1
  ACO_AUTOAPPEND* = 0x2
  ACO_SEARCH* = 0x4
  ACO_FILTERPREFIXES* = 0x8
  ACO_USETAB* = 0x10
  ACO_UPDOWNKEYDROPSLIST* = 0x20
  ACO_RTLREADING* = 0x40
  ACO_WORD_FILTER* = 0x80
  ACO_NOPREFIXFILTERING* = 0x100
  IID_IAutoComplete2* = DEFINE_GUID(0xeac04bc0'i32, 0x3791, 0x11d2, [0xbb'u8, 0x95, 0x00, 0x60, 0x97, 0x7b, 0x46, 0x4c])
  ACEO_NONE* = 0x0
  ACEO_MOSTRECENTFIRST* = 0x1
  ACEO_FIRSTUNUSED* = 0x10000
  IID_IEnumACString* = DEFINE_GUID(0x8e74c210'i32, 0xcf9d, 0x4eaf, [0xa4'u8, 0x03, 0x73, 0x56, 0x42, 0x8f, 0x0a, 0x5a])
  IID_IDataObjectAsyncCapability* = DEFINE_GUID(0x3d8b0590'i32, 0xf691, 0x11d2, [0x8e'u8, 0xa9, 0x00, 0x60, 0x97, 0xdf, 0x5b, 0xd4])
  SID_SInternetExplorer* = IID_IWebBrowserApp
  CLSID_ProgressDialog* = DEFINE_GUID(0xf8383852'i32, 0xfcd3, 0x11d1, [0xa6'u8, 0xb9, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4])
  SID_SProgressUI* = CLSID_ProgressDialog
  CLSID_CUrlHistory* = DEFINE_GUID(0x3c374a40'i32, 0xbae4, 0x11cf, [0xbf'u8, 0x7d, 0x00, 0xaa, 0x00, 0x69, 0x46, 0xee])
  SID_SUrlHistory* = CLSID_CUrlHistory
  SID_SWebBrowserApp* = IID_IWebBrowserApp
  CLSID_CURLSearchHook* = DEFINE_GUID(0xcfbfae00'i32, 0x17a6, 0x11d0, [0x99'u8, 0xcb, 0x00, 0xc0, 0x4f, 0xd6, 0x44, 0x97])
  IID_IObjMgr* = DEFINE_GUID(0x00bb2761'i32, 0x6a77, 0x11d0, [0xa5'u8, 0x35, 0x00, 0xc0, 0x4f, 0xd7, 0xd0, 0x62])
  IID_IACList* = DEFINE_GUID(0x77a130b0'i32, 0x94fd, 0x11d0, [0xa5'u8, 0x44, 0x00, 0xc0, 0x4f, 0xd7, 0xd0, 0x62])
  IID_IACList2* = DEFINE_GUID(0x470141a0'i32, 0x5186, 0x11d2, [0xbb'u8, 0xb6, 0x00, 0x60, 0x97, 0x7b, 0x46, 0x4c])
  IID_ICurrentWorkingDirectory* = DEFINE_GUID(0x91956d21'i32, 0x9276, 0x11d1, [0x92'u8, 0x1a, 0x00, 0x60, 0x97, 0xdf, 0x5b, 0xd4])
  CLSID_AutoComplete* = DEFINE_GUID(0x00bb2763'i32, 0x6a77, 0x11d0, [0xa5'u8, 0x35, 0x00, 0xc0, 0x4f, 0xd7, 0xd0, 0x62])
  CLSID_ACLHistory* = DEFINE_GUID(0x00bb2764'i32, 0x6a77, 0x11d0, [0xa5'u8, 0x35, 0x00, 0xc0, 0x4f, 0xd7, 0xd0, 0x62])
  CLSID_ACListISF* = DEFINE_GUID(0x03c036f1'i32, 0xa186, 0x11d0, [0x82'u8, 0x4a, 0x00, 0xaa, 0x00, 0x5b, 0x43, 0x83])
  CLSID_ACLMRU* = DEFINE_GUID(0x6756a641'i32, 0xde71, 0x11d0, [0x83'u8, 0x1b, 0x0, 0xaa, 0x0, 0x5b, 0x43, 0x83])
  CLSID_ACLMulti* = DEFINE_GUID(0x00bb2765'i32, 0x6a77, 0x11d0, [0xa5'u8, 0x35, 0x00, 0xc0, 0x4f, 0xd7, 0xd0, 0x62])
  CLSID_ACLCustomMRU* = DEFINE_GUID(0x6935db93'i32, 0x21e8, 0x4ccc, [0xbe'u8, 0xb9, 0x9f, 0xe3, 0xc7, 0x7a, 0x29, 0x7a])
  IID_IProgressDialog* = DEFINE_GUID(0xebbc7c04'i32, 0x315e, 0x11d2, [0xb6'u8, 0x2f, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4])
  SID_STopLevelBrowser* = DEFINE_GUID(0x4c96be40'i32, 0x915c, 0x11cf, [0x99'u8, 0xd3, 0x00, 0xaa, 0x00, 0x4a, 0xe8, 0x37])
  PSGUID_SHELLDETAILS* = DEFINE_GUID(0x28636aa6'i32, 0x953d, 0x11d2, [0xb5'u8, 0xd6, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0])
  PID_FINDDATA* = 0
  PID_NETRESOURCE* = 1
  PID_DESCRIPTIONID* = 2
  PID_WHICHFOLDER* = 3
  PID_NETWORKLOCATION* = 4
  PID_COMPUTERNAME* = 5
  PID_DISPLAY_PROPERTIES* = 0
  PID_INTROTEXT* = 1
  PID_SYNC_COPY_IN* = 2
  PIDSI_ARTIST* = 2
  PIDSI_SONGTITLE* = 3
  PIDSI_ALBUM* = 4
  PIDSI_YEAR* = 5
  PIDSI_COMMENT* = 6
  PIDSI_TRACK* = 7
  PIDSI_GENRE* = 11
  PIDSI_LYRICS* = 12
  PID_MISC_STATUS* = 2
  PID_MISC_ACCESSCOUNT* = 3
  PID_MISC_OWNER* = 4
  PID_HTMLINFOTIPFILE* = 5
  PID_MISC_PICS* = 6
  PIDDRSI_PROTECTED* = 2
  PIDDRSI_DESCRIPTION* = 3
  PIDDRSI_PLAYCOUNT* = 4
  PIDDRSI_PLAYSTARTS* = 5
  PIDDRSI_PLAYEXPIRES* = 6
  PID_DISPLACED_FROM* = 2
  PID_DISPLACED_DATE* = 3
  PSGUID_BRIEFCASE* = DEFINE_GUID(0x328d8b21'i32, 0x7729, 0x4bfc, [0x95'u8, 0x4c, 0x90, 0x2b, 0x32, 0x9d, 0x56, 0xb0])
  PSGUID_MISC* = DEFINE_GUID(0x9b174b34'i32, 0x40ff, 0x11d2, [0xa2'u8, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71])
  PSGUID_WEBVIEW* = DEFINE_GUID(0xf2275480'i32, 0xf782, 0x4291, [0xbd'u8, 0x94, 0xf1, 0x36, 0x93, 0x51, 0x3a, 0xec])
  PSGUID_MUSIC* = DEFINE_GUID(0x56a3372e'i32, 0xce9c, 0x11d2, [0x9f'u8, 0xe, 0x0, 0x60, 0x97, 0xc6, 0x86, 0xf6])
  PSGUID_DRM* = DEFINE_GUID(0xaeac19e4'i32, 0x89ae, 0x4508, [0xb9'u8, 0xb7, 0xbb, 0x86, 0x7a, 0xbe, 0xe2, 0xed])
  PSGUID_VIDEO* = DEFINE_GUID(0x64440491'i32, 0x4c8b, 0x11d1, [0x8b'u8, 0x70, 0x8, 0x0, 0x36, 0xb1, 0x1a, 0x3])
  PSGUID_IMAGEPROPERTIES* = DEFINE_GUID(0x14b81da1'i32, 0x0135, 0x4d31, [0x96'u8, 0xd9, 0x6c, 0xbf, 0xc9, 0x67, 0x1a, 0x99])
  PSGUID_CUSTOMIMAGEPROPERTIES* = DEFINE_GUID(0x7ecd8b0e'i32, 0xc136, 0x4a9b, [0x94'u8, 0x11, 0x4e, 0xbd, 0x66, 0x73, 0xcc, 0xc3])
  PSGUID_LIBRARYPROPERTIES* = DEFINE_GUID(0x5d76b67f'i32, 0x9b3d, 0x44bb, [0xb6'u8, 0xae, 0x25, 0xda, 0x4f, 0x63, 0x8a, 0x67])
  PSGUID_DISPLACED* = DEFINE_GUID(0x9b174b33'i32, 0x40ff, 0x11d2, [0xa2'u8, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71])
  CLSID_FileTypes* = DEFINE_GUID(0xb091e540'i32, 0x83e3, 0x11cf, [0xa7'u8, 0x13, 0x00, 0x20, 0xaf, 0xd7, 0x97, 0x62])
  CLSID_ActiveDesktop* = DEFINE_GUID(0x75048700'i32, 0xef1f, 0x11d0, [0x98'u8, 0x88, 0x00, 0x60, 0x97, 0xde, 0xac, 0xf9])
  IID_IActiveDesktop* = DEFINE_GUID(0xf490eb00'i32, 0x1240, 0x11d1, [0x98'u8, 0x88, 0x00, 0x60, 0x97, 0xde, 0xac, 0xf9])
  IID_IActiveDesktopP* = DEFINE_GUID(0x52502ee0'i32, 0xec80, 0x11d0, [0x89'u8, 0xab, 0x00, 0xc0, 0x4f, 0xc2, 0x97, 0x2d])
  IID_IADesktopP2* = DEFINE_GUID(0xb22754e2'i32, 0x4574, 0x11d1, [0x98'u8, 0x88, 0x0, 0x60, 0x97, 0xde, 0xac, 0xf9])
  IID_ISynchronizedCallBack* = DEFINE_GUID(0x74c26041'i32, 0x70d1, 0x11d1, [0xb7'u8, 0x5a, 0x0, 0xa0, 0xc9, 0x5, 0x64, 0xfe])
  IID_IQueryAssociations* = DEFINE_GUID(0xc46ca590'i32, 0x3c3f, 0x11d2, [0xbe'u8, 0xe6, 0x00, 0x00, 0xf8, 0x05, 0xca, 0x57])
  CLSID_QueryAssociations* = DEFINE_GUID(0xa07034fd'i32, 0x6caa, 0x4954, [0xac'u8, 0x3f, 0x97, 0xa2, 0x72, 0x16, 0xf9, 0x8a])
  IID_IColumnProvider* = DEFINE_GUID(0xe8025004'i32, 0x1c42, 0x11d2, [0xbe'u8, 0x2c, 0x0, 0xa0, 0xc9, 0xa8, 0x3d, 0xa1])
  CLSID_LinkColumnProvider* = DEFINE_GUID(0x24f14f02'i32, 0x7b1c, 0x11d1, [0x83'u8, 0x8f, 0x0, 0x0, 0xf8, 0x4, 0x61, 0xcf])
  CGID_ShortCut* = DEFINE_GUID(0x93a68750'i32, 0x951a, 0x11d1, [0x94'u8, 0x6f, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0])
  IID_INamedPropertyBag* = DEFINE_GUID(0xfb700430'i32, 0x952c, 0x11d1, [0x94'u8, 0x6f, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0])
  CLSID_InternetButtons* = DEFINE_GUID(0x1e796980'i32, 0x9cc5, 0x11d1, [0xa8'u8, 0x3f, 0x00, 0xc0, 0x4f, 0xc9, 0x9d, 0x61])
  CLSID_MSOButtons* = DEFINE_GUID(0x178f34b8'i32, 0xa282, 0x11d2, [0x86'u8, 0xc5, 0x0, 0xc0, 0x4f, 0x8e, 0xea, 0x99])
  CLSID_ToolbarExtButtons* = DEFINE_GUID(0x2ce4b5d8'i32, 0xa28f, 0x11d2, [0x86'u8, 0xc5, 0x0, 0xc0, 0x4f, 0x8e, 0xea, 0x99])
  CLSID_DarwinAppPublisher* = DEFINE_GUID(0xcfccc7a0'i32, 0xa282, 0x11d1, [0x90'u8, 0x82, 0x00, 0x60, 0x08, 0x05, 0x93, 0x82])
  CLSID_DocHostUIHandler* = DEFINE_GUID(0x7057e952'i32, 0xbd1b, 0x11d1, [0x89'u8, 0x19, 0x0, 0xc0, 0x4f, 0xc2, 0xc8, 0x36])
  FMTID_ShellDetails* = DEFINE_GUID(0x28636aa6'i32, 0x953d, 0x11d2, [0xb5'u8, 0xd6, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0])
  FMTID_Storage* = DEFINE_GUID(0xb725f130'i32, 0x47ef, 0x101a, [0xa5'u8, 0xf1, 0x02, 0x60, 0x8c, 0x9e, 0xeb, 0xac])
  FMTID_ImageProperties* = DEFINE_GUID(0x14b81da1'i32, 0x0135, 0x4d31, [0x96'u8, 0xd9, 0x6c, 0xbf, 0xc9, 0x67, 0x1a, 0x99])
  FMTID_CustomImageProperties* = DEFINE_GUID(0x7ecd8b0e'i32, 0xc136, 0x4a9b, [0x94'u8, 0x11, 0x4e, 0xbd, 0x66, 0x73, 0xcc, 0xc3])
  FMTID_LibraryProperties* = DEFINE_GUID(0x5d76b67f'i32, 0x9b3d, 0x44bb, [0xb6'u8, 0xae, 0x25, 0xda, 0x4f, 0x63, 0x8a, 0x67])
  FMTID_Displaced* = DEFINE_GUID(0x9b174b33'i32, 0x40ff, 0x11d2, [0xa2'u8, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71])
  FMTID_Briefcase* = DEFINE_GUID(0x328d8b21'i32, 0x7729, 0x4bfc, [0x95'u8, 0x4c, 0x90, 0x2b, 0x32, 0x9d, 0x56, 0xb0])
  FMTID_Misc* = DEFINE_GUID(0x9b174b34'i32, 0x40ff, 0x11d2, [0xa2'u8, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71])
  FMTID_WebView* = DEFINE_GUID(0xf2275480'i32, 0xf782, 0x4291, [0xbd'u8, 0x94, 0xf1, 0x36, 0x93, 0x51, 0x3a, 0xec])
  FMTID_MUSIC* = DEFINE_GUID(0x56a3372e'i32, 0xce9c, 0x11d2, [0x9f'u8, 0xe, 0x0, 0x60, 0x97, 0xc6, 0x86, 0xf6])
  FMTID_DRM* = DEFINE_GUID(0xaeac19e4'i32, 0x89ae, 0x4508, [0xb9'u8, 0xb7, 0xbb, 0x86, 0x7a, 0xbe, 0xe2, 0xed])
  PIDVSI_STREAM_NAME* = 0x00000002
  PIDVSI_FRAME_WIDTH* = 0x00000003
  PIDVSI_FRAME_HEIGHT* = 0x00000004
  PIDVSI_TIMELENGTH* = 0x00000007
  PIDVSI_FRAME_COUNT* = 0x00000005
  PIDVSI_FRAME_RATE* = 0x00000006
  PIDVSI_DATA_RATE* = 0x00000008
  PIDVSI_SAMPLE_SIZE* = 0x00000009
  PIDVSI_COMPRESSION* = 0x0000000a
  PIDVSI_STREAM_NUMBER* = 0x0000000b
  PSGUID_AUDIO* = DEFINE_GUID(0x64440490'i32, 0x4c8b, 0x11d1, [0x8b'u8, 0x70, 0x8, 0x0, 0x36, 0xb1, 0x1a, 0x3])
  PIDASI_FORMAT* = 0x00000002
  PIDASI_TIMELENGTH* = 0x00000003
  PIDASI_AVG_DATA_RATE* = 0x00000004
  PIDASI_SAMPLE_RATE* = 0x00000005
  PIDASI_SAMPLE_SIZE* = 0x00000006
  PIDASI_CHANNEL_COUNT* = 0x00000007
  PIDASI_STREAM_NUMBER* = 0x00000008
  PIDASI_STREAM_NAME* = 0x00000009
  PIDASI_COMPRESSION* = 0x0000000a
  PSGUID_CONTROLPANEL* = DEFINE_GUID(0x305ca226'i32, 0xd286, 0x468e, [0xb8'u8, 0x48, 0x2b, 0x2e, 0x8e, 0x69, 0x7b, 0x74])
  PID_CONTROLPANEL_CATEGORY* = 2
  PSGUID_VOLUME* = DEFINE_GUID(0x9b174b35'i32, 0x40ff, 0x11d2, [0xa2'u8, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71])
  PSGUID_SHARE* = DEFINE_GUID(0xd8c3986f'i32, 0x813b, 0x449c, [0x84'u8, 0x5d, 0x87, 0xb9, 0x5d, 0x67, 0x4a, 0xde])
  PSGUID_LINK* = DEFINE_GUID(0xb9b4b3fc'i32, 0x2b51, 0x4a42, [0xb5'u8, 0xd8, 0x32, 0x41, 0x46, 0xaf, 0xcf, 0x25])
  PSGUID_QUERY_D* = DEFINE_GUID(0x49691c90'i32, 0x7e17, 0x101a, [0xa9'u8, 0x1c, 0x08, 0x00, 0x2b, 0x2e, 0xcd, 0xa9])
  PSGUID_SUMMARYINFORMATION* = DEFINE_GUID(0xf29f85e0'i32, 0x4ff9, 0x1068, [0xab'u8, 0x91, 0x08, 0x00, 0x2b, 0x27, 0xb3, 0xd9])
  PSGUID_DOCUMENTSUMMARYINFORMATION* = DEFINE_GUID(0xd5cdd502'i32, 0x2e9c, 0x101b, [0x93'u8, 0x97, 0x08, 0x00, 0x2b, 0x2c, 0xf9, 0xae])
  PSGUID_MEDIAFILESUMMARYINFORMATION* = DEFINE_GUID(0x64440492'i32, 0x4c8b, 0x11d1, [0x8b'u8, 0x70, 0x08, 0x00, 0x36, 0xb1, 0x1a, 0x03])
  PSGUID_IMAGESUMMARYINFORMATION* = DEFINE_GUID(0x6444048f'i32, 0x4c8b, 0x11d1, [0x8b'u8, 0x70, 0x8, 0x00, 0x36, 0xb1, 0x1a, 0x03])
  PID_VOLUME_FREE* = 2
  PID_VOLUME_CAPACITY* = 3
  PID_VOLUME_FILESYSTEM* = 4
  PID_SHARE_CSC_STATUS* = 2
  PID_LINK_TARGET* = 2
  PID_LINK_TARGET_TYPE* = 3
  PID_QUERY_RANK* = 2
  FMTID_Volume* = DEFINE_GUID(0x9b174b35'i32, 0x40ff, 0x11d2, [0xa2'u8, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71])
  FMTID_Query* = DEFINE_GUID(0x49691c90'i32, 0x7e17, 0x101a, [0xa9'u8, 0x1c, 0x08, 0x00, 0x2b, 0x2e, 0xcd, 0xa9])
  CLSID_HWShellExecute* = DEFINE_GUID(0xffb8655f'i32, 0x81b9, 0x4fce, [0xb8'u8, 0x9c, 0x9a, 0x6b, 0xa7, 0x6d, 0x13, 0xe7])
  CLSID_DragDropHelper* = DEFINE_GUID(0x4657278a'i32, 0x411b, 0x11d2, [0x83'u8, 0x9a, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0])
  CLSID_CAnchorBrowsePropertyPage* = DEFINE_GUID(0x3050f3bb'i32, 0x98b5, 0x11cf, [0xbb'u8, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b])
  CLSID_CImageBrowsePropertyPage* = DEFINE_GUID(0x3050f3b3'i32, 0x98b5, 0x11cf, [0xbb'u8, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b])
  CLSID_CDocBrowsePropertyPage* = DEFINE_GUID(0x3050f3b4'i32, 0x98b5, 0x11cf, [0xbb'u8, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b])
  SID_STopWindow* = DEFINE_GUID(0x49e1b500'i32, 0x4636, 0x11d3, [0x97'u8, 0xf7, 0x0, 0xc0, 0x4f, 0x45, 0xd0, 0xb3])
  SID_SGetViewFromViewDual* = DEFINE_GUID(0x889a935d'i32, 0x971e, 0x4b12, [0xb9'u8, 0x0c, 0x24, 0xdf, 0xc9, 0xe1, 0xe5, 0xe8])
  CLSID_FolderItem* = DEFINE_GUID(0xfef10fa2'i32, 0x355e, 0x4e06, [0x93'u8, 0x81, 0x9b, 0x24, 0xd7, 0xf7, 0xcc, 0x88])
  CLSID_FolderItemsMultiLevel* = DEFINE_GUID(0x53c74826'i32, 0xab99, 0x4d33, [0xac'u8, 0xa4, 0x31, 0x17, 0xf5, 0x1d, 0x37, 0x88])
  CLSID_NewMenu* = DEFINE_GUID(0xd969a300'i32, 0xe7ff, 0x11d0, [0xa9'u8, 0x3b, 0x0, 0xa0, 0xc9, 0xf, 0x27, 0x19])
  BHID_SFObject* = DEFINE_GUID(0x3981e224'i32, 0xf559, 0x11d3, [0x8e'u8, 0x3a, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5])
  BHID_SFUIObject* = DEFINE_GUID(0x3981e225'i32, 0xf559, 0x11d3, [0x8e'u8, 0x3a, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5])
  BHID_SFViewObject* = DEFINE_GUID(0x3981e226'i32, 0xf559, 0x11d3, [0x8e'u8, 0x3a, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5])
  BHID_Storage* = DEFINE_GUID(0x3981e227'i32, 0xf559, 0x11d3, [0x8e'u8, 0x3a, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5])
  BHID_Stream* = DEFINE_GUID(0x1cebb3ab'i32, 0x7c10, 0x499a, [0xa4'u8, 0x17, 0x92, 0xca, 0x16, 0xc4, 0xcb, 0x83])
  BHID_RandomAccessStream* = DEFINE_GUID(0xf16fc93b'i32, 0x77ae, 0x4cfe, [0xbd'u8, 0xa7, 0xa8, 0x66, 0xee, 0xa6, 0x87, 0x8d])
  BHID_LinkTargetItem* = DEFINE_GUID(0x3981e228'i32, 0xf559, 0x11d3, [0x8e'u8, 0x3a, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5])
  BHID_StorageEnum* = DEFINE_GUID(0x4621a4e3'i32, 0xf0d6, 0x4773, [0x8a'u8, 0x9c, 0x46, 0xe7, 0x7b, 0x17, 0x48, 0x40])
  BHID_Transfer* = DEFINE_GUID(0xd5e346a1'i32, 0xf753, 0x4932, [0xb4'u8, 0x3, 0x45, 0x74, 0x80, 0xe, 0x24, 0x98])
  BHID_PropertyStore* = DEFINE_GUID(0x0384e1a4'i32, 0x1523, 0x439c, [0xa4'u8, 0xc8, 0xab, 0x91, 0x10, 0x52, 0xf5, 0x86])
  BHID_ThumbnailHandler* = DEFINE_GUID(0x7b2e650a'i32, 0x8e20, 0x4f4a, [0xb0'u8, 0x9e, 0x65, 0x97, 0xaf, 0xc7, 0x2f, 0xb0])
  BHID_EnumItems* = DEFINE_GUID(0x94f60519'i32, 0x2850, 0x4924, [0xaa'u8, 0x5a, 0xd1, 0x5e, 0x84, 0x86, 0x80, 0x39])
  BHID_DataObject* = DEFINE_GUID(0xb8c0bd9f'i32, 0xed24, 0x455c, [0x83'u8, 0xe6, 0xd5, 0x39, 0xc, 0x4f, 0xe8, 0xc4])
  BHID_AssociationArray* = DEFINE_GUID(0xbea9ef17'i32, 0x82f1, 0x4f60, [0x92'u8, 0x84, 0x4f, 0x8d, 0xb7, 0x5c, 0x3b, 0xe9])
  BHID_Filter* = DEFINE_GUID(0x38d08778'i32, 0xf557, 0x4690, [0x9e'u8, 0xbf, 0xba, 0x54, 0x70, 0x6a, 0xd8, 0xf7])
  BHID_EnumAssocHandlers* = DEFINE_GUID(0xb8ab0b9c'i32, 0xc2ec, 0x4f7a, [0x91'u8, 0x8d, 0x31, 0x49, 0x00, 0xe6, 0x28, 0x0a])
  SID_CtxQueryAssociations* = DEFINE_GUID(0xfaadfc40'i32, 0xb777, 0x4b69, [0xaa'u8, 0x81, 0x77, 0x03, 0x5e, 0xf0, 0xe6, 0xe8])
  IID_IDocViewSite* = DEFINE_GUID(0x87d605e0'i32, 0xc511, 0x11cf, [0x89'u8, 0xa9, 0x00, 0xa0, 0xc9, 0x05, 0x41, 0x29])
  CLSID_QuickLinks* = DEFINE_GUID(0xe5cbf21'i32, 0xd15f, 0x11d0, [0x83'u8, 0x1, 0x0, 0xaa, 0x0, 0x5b, 0x43, 0x83])
  CLSID_ISFBand* = DEFINE_GUID(0xd82be2b0'i32, 0x5764, 0x11d0, [0xa9'u8, 0x6e, 0x00, 0xc0, 0x4f, 0xd7, 0x05, 0xa2])
  IID_CDefView* = DEFINE_GUID(0x4434ff80'i32, 0xef4c, 0x11ce, [0xae'u8, 0x65, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62])
  CLSID_ShellFldSetExt* = DEFINE_GUID(0x6d5313c0'i32, 0x8c62, 0x11d1, [0xb2'u8, 0xcd, 0x00, 0x60, 0x97, 0xdf, 0x8c, 0x11])
  SID_SMenuBandChild* = DEFINE_GUID(0xed9cc020'i32, 0x8b9, 0x11d1, [0x98'u8, 0x23, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72])
  SID_SMenuBandParent* = DEFINE_GUID(0x8c278eec'i32, 0x3eab, 0x11d1, [0x8c'u8, 0xb0, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0])
  SID_SMenuPopup* = DEFINE_GUID(0xd1e7afeb'i32, 0x6a2e, 0x11d0, [0x8c'u8, 0x78, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xb4])
  SID_SMenuBandBottomSelected* = DEFINE_GUID(0x165ebaf4'i32, 0x6d51, 0x11d2, [0x83'u8, 0xad, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0])
  SID_SMenuBandBottom* = DEFINE_GUID(0x743ca664'i32, 0xdeb, 0x11d1, [0x98'u8, 0x25, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72])
  SID_MenuShellFolder* = DEFINE_GUID(0xa6c17eb4'i32, 0x2d65, 0x11d2, [0x83'u8, 0x8f, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0])
  SID_SMenuBandContextMenuModifier* = DEFINE_GUID(0x39545874'i32, 0x7162, 0x465e, [0xb7'u8, 0x83, 0x2a, 0xa1, 0x87, 0x4f, 0xef, 0x81])
  SID_SMenuBandBKContextMenu* = DEFINE_GUID(0x164bbd86'i32, 0x1d0d, 0x4de0, [0x9a'u8, 0x3b, 0xd9, 0x72, 0x96, 0x47, 0xc2, 0xb8])
  CGID_MENUDESKBAR* = DEFINE_GUID(0x5c9f0a12'i32, 0x959e, 0x11d0, [0xa3'u8, 0xa4, 0x0, 0xa0, 0xc9, 0x8, 0x26, 0x36])
  SID_SMenuBandTop* = DEFINE_GUID(0x9493a810'i32, 0xec38, 0x11d0, [0xbc'u8, 0x46, 0x0, 0xaa, 0x0, 0x6c, 0xe2, 0xf5])
  CLSID_MenuToolbarBase* = DEFINE_GUID(0x40b96610'i32, 0xb522, 0x11d1, [0xb3'u8, 0xb4, 0x0, 0xaa, 0x0, 0x6e, 0xfd, 0xe7])
  IID_IBanneredBar* = DEFINE_GUID(0x596a9a94'i32, 0x13e, 0x11d1, [0x8d'u8, 0x34, 0x0, 0xa0, 0xc9, 0xf, 0x27, 0x19])
  CLSID_MenuBandSite* = DEFINE_GUID(0xe13ef4e4'i32, 0xd2f2, 0x11d0, [0x98'u8, 0x16, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72])
  SID_SCommDlgBrowser* = DEFINE_GUID(0x80f30233'i32, 0xb7df, 0x11d2, [0xa3'u8, 0x3b, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4])
  CPFG_LOGON_USERNAME* = DEFINE_GUID(0xda15bbe8'i32, 0x954d, 0x4fd3, [0xb0'u8, 0xf4, 0x1f, 0xb5, 0xb9, 0x0b, 0x17, 0x4b])
  CPFG_LOGON_PASSWORD* = DEFINE_GUID(0x60624cfa'i32, 0xa477, 0x47b1, [0x8a'u8, 0x8e, 0x3a, 0x4a, 0x19, 0x98, 0x18, 0x27])
  CPFG_SMARTCARD_USERNAME* = DEFINE_GUID(0x3e1ecf69'i32, 0x568c, 0x4d96, [0x9d'u8, 0x59, 0x46, 0x44, 0x41, 0x74, 0xe2, 0xd6])
  CPFG_SMARTCARD_PIN* = DEFINE_GUID(0x4fe5263b'i32, 0x9181, 0x46c1, [0xb0'u8, 0xa4, 0x9d, 0xed, 0xd4, 0xdb, 0x7d, 0xea])
  CPFG_CREDENTIAL_PROVIDER_LOGO* = DEFINE_GUID(0x2d837775'i32, 0xf6cd, 0x464e, [0xa7'u8, 0x45, 0x48, 0x2f, 0xd0, 0xb4, 0x74, 0x93])
  CPFG_CREDENTIAL_PROVIDER_LABEL* = DEFINE_GUID(0x286bbff3'i32, 0xbad4, 0x438f, [0xb0'u8, 0x7, 0x79, 0xb7, 0x26, 0x7c, 0x3d, 0x48])
  FOLDERID_AccountPictures* = DEFINE_GUID(0x008ca0b1'i32, 0x55b4, 0x4c56, [0xb8'u8, 0xa8, 0x4d, 0xe4, 0xb2, 0x99, 0xd3, 0xbe])
  FOLDERID_AddNewPrograms* = DEFINE_GUID(0xde61d971'i32, 0x5ebc, 0x4f02, [0xa3'u8, 0xa9, 0x6c, 0x82, 0x89, 0x5e, 0x5c, 0x04])
  FOLDERID_AdminTools* = DEFINE_GUID(0x724ef170'i32, 0xa42d, 0x4fef, [0x9f'u8, 0x26, 0xb6, 0x0e, 0x84, 0x6f, 0xba, 0x4f])
  FOLDERID_AppsFolder* = DEFINE_GUID(0x1e87508d'i32, 0x89c2, 0x42f0, [0x8a'u8, 0x7e, 0x64, 0x5a, 0x0f, 0x50, 0xca, 0x58])
  FOLDERID_ApplicationShortcuts* = DEFINE_GUID(0xa3918781'i32, 0xe5f2, 0x4890, [0xb3'u8, 0xd9, 0xa7, 0xe5, 0x43, 0x32, 0x32, 0x8c])
  FOLDERID_AppUpdates* = DEFINE_GUID(0xa305ce99'i32, 0xf527, 0x492b, [0x8b'u8, 0x1a, 0x7e, 0x76, 0xfa, 0x98, 0xd6, 0xe4])
  FOLDERID_CDBurning* = DEFINE_GUID(0x9e52ab10'i32, 0xf80d, 0x49df, [0xac'u8, 0xb8, 0x43, 0x30, 0xf5, 0x68, 0x78, 0x55])
  FOLDERID_ChangeRemovePrograms* = DEFINE_GUID(0xdf7266ac'i32, 0x9274, 0x4867, [0x8d'u8, 0x55, 0x3b, 0xd6, 0x61, 0xde, 0x87, 0x2d])
  FOLDERID_CommonAdminTools* = DEFINE_GUID(0xd0384e7d'i32, 0xbac3, 0x4797, [0x8f'u8, 0x14, 0xcb, 0xa2, 0x29, 0xb3, 0x92, 0xb5])
  FOLDERID_CommonOEMLinks* = DEFINE_GUID(0xc1bae2d0'i32, 0x10df, 0x4334, [0xbe'u8, 0xdd, 0x7a, 0xa2, 0x0b, 0x22, 0x7a, 0x9d])
  FOLDERID_CommonPrograms* = DEFINE_GUID(0x0139d44e'i32, 0x6afe, 0x49f2, [0x86'u8, 0x90, 0x3d, 0xaf, 0xca, 0xe6, 0xff, 0xb8])
  FOLDERID_CommonStartMenu* = DEFINE_GUID(0xa4115719'i32, 0xd62e, 0x491d, [0xaa'u8, 0x7c, 0xe7, 0x4b, 0x8b, 0xe3, 0xb0, 0x67])
  FOLDERID_CommonStartup* = DEFINE_GUID(0x82a5ea35'i32, 0xd9cd, 0x47c5, [0x96'u8, 0x29, 0xe1, 0x5d, 0x2f, 0x71, 0x4e, 0x6e])
  FOLDERID_CommonTemplates* = DEFINE_GUID(0xb94237e7'i32, 0x57ac, 0x4347, [0x91'u8, 0x51, 0xb0, 0x8c, 0x6c, 0x32, 0xd1, 0xf7])
  FOLDERID_ComputerFolder* = DEFINE_GUID(0x0ac0837c'i32, 0xbbf8, 0x452a, [0x85'u8, 0x0d, 0x79, 0xd0, 0x8e, 0x66, 0x7c, 0xa7])
  FOLDERID_ConflictFolder* = DEFINE_GUID(0x4bfefb45'i32, 0x347d, 0x4006, [0xa5'u8, 0xbe, 0xac, 0x0c, 0xb0, 0x56, 0x71, 0x92])
  FOLDERID_ConnectionsFolder* = DEFINE_GUID(0x6f0cd92b'i32, 0x2e97, 0x45d1, [0x88'u8, 0xff, 0xb0, 0xd1, 0x86, 0xb8, 0xde, 0xdd])
  FOLDERID_Contacts* = DEFINE_GUID(0x56784854'i32, 0xc6cb, 0x462b, [0x81'u8, 0x69, 0x88, 0xe3, 0x50, 0xac, 0xb8, 0x82])
  FOLDERID_ControlPanelFolder* = DEFINE_GUID(0x82a74aeb'i32, 0xaeb4, 0x465c, [0xa0'u8, 0x14, 0xd0, 0x97, 0xee, 0x34, 0x6d, 0x63])
  FOLDERID_Cookies* = DEFINE_GUID(0x2b0f765d'i32, 0xc0e9, 0x4171, [0x90'u8, 0x8e, 0x08, 0xa6, 0x11, 0xb8, 0x4f, 0xf6])
  FOLDERID_Desktop* = DEFINE_GUID(0xb4bfcc3a'i32, 0xdb2c, 0x424c, [0xb0'u8, 0x29, 0x7f, 0xe9, 0x9a, 0x87, 0xc6, 0x41])
  FOLDERID_DeviceMetadataStore* = DEFINE_GUID(0x5ce4a5e9'i32, 0xe4eb, 0x479d, [0xb8'u8, 0x9f, 0x13, 0x0c, 0x02, 0x88, 0x61, 0x55])
  FOLDERID_Documents* = DEFINE_GUID(0xfdd39ad0'i32, 0x238f, 0x46af, [0xad'u8, 0xb4, 0x6c, 0x85, 0x48, 0x03, 0x69, 0xc7])
  FOLDERID_DocumentsLibrary* = DEFINE_GUID(0x7b0db17d'i32, 0x9cd2, 0x4a93, [0x97'u8, 0x33, 0x46, 0xcc, 0x89, 0x02, 0x2e, 0x7c])
  FOLDERID_Downloads* = DEFINE_GUID(0x374de290'i32, 0x123f, 0x4565, [0x91'u8, 0x64, 0x39, 0xc4, 0x92, 0x5e, 0x46, 0x7b])
  FOLDERID_Favorites* = DEFINE_GUID(0x1777f761'i32, 0x68ad, 0x4d8a, [0x87'u8, 0xbd, 0x30, 0xb7, 0x59, 0xfa, 0x33, 0xdd])
  FOLDERID_Fonts* = DEFINE_GUID(0xfd228cb7'i32, 0xae11, 0x4ae3, [0x86'u8, 0x4c, 0x16, 0xf3, 0x91, 0x0a, 0xb8, 0xfe])
  FOLDERID_Games* = DEFINE_GUID(0xcac52c1a'i32, 0xb53d, 0x4edc, [0x92'u8, 0xd7, 0x6b, 0x2e, 0x8a, 0xc1, 0x94, 0x34])
  FOLDERID_GameTasks* = DEFINE_GUID(0x54fae61'i32, 0x4dd8, 0x4787, [0x80'u8, 0xb6, 0x9, 0x2, 0x20, 0xc4, 0xb7, 0x0])
  FOLDERID_History* = DEFINE_GUID(0xd9dc8a3b'i32, 0xb784, 0x432e, [0xa7'u8, 0x81, 0x5a, 0x11, 0x30, 0xa7, 0x59, 0x63])
  FOLDERID_HomeGroup* = DEFINE_GUID(0x52528a6b'i32, 0xb9e3, 0x4add, [0xb6'u8, 0xd, 0x58, 0x8c, 0x2d, 0xba, 0x84, 0x2d])
  FOLDERID_HomeGroupCurrentUser* = DEFINE_GUID(0x9b74b6a3'i32, 0xdfd, 0x4f11, [0x9e'u8, 0x78, 0x5f, 0x78, 0x0, 0xf2, 0xe7, 0x72])
  FOLDERID_ImplicitAppShortcuts* = DEFINE_GUID(0xbcb5256f'i32, 0x79f6, 0x4cee, [0xb7'u8, 0x25, 0xdc, 0x34, 0xe4, 0x2, 0xfd, 0x46])
  FOLDERID_InternetCache* = DEFINE_GUID(0x352481e8'i32, 0x33be, 0x4251, [0xba'u8, 0x85, 0x60, 0x07, 0xca, 0xed, 0xcf, 0x9d])
  FOLDERID_InternetFolder* = DEFINE_GUID(0x4d9f7874'i32, 0x4e0c, 0x4904, [0x96'u8, 0x7b, 0x40, 0xb0, 0xd2, 0x0c, 0x3e, 0x4b])
  FOLDERID_Libraries* = DEFINE_GUID(0x1b3ea5dc'i32, 0xb587, 0x4786, [0xb4'u8, 0xef, 0xbd, 0x1d, 0xc3, 0x32, 0xae, 0xae])
  FOLDERID_Links* = DEFINE_GUID(0xbfb9d5e0'i32, 0xc6a9, 0x404c, [0xb2'u8, 0xb2, 0xae, 0x6d, 0xb6, 0xaf, 0x49, 0x68])
  FOLDERID_LocalAppData* = DEFINE_GUID(0xf1b32785'i32, 0x6fba, 0x4fcf, [0x9d'u8, 0x55, 0x7b, 0x8e, 0x7f, 0x15, 0x70, 0x91])
  FOLDERID_LocalAppDataLow* = DEFINE_GUID(0xa520a1a4'i32, 0x1780, 0x4ff6, [0xbd'u8, 0x18, 0x16, 0x73, 0x43, 0xc5, 0xaf, 0x16])
  FOLDERID_LocalizedResourcesDir* = DEFINE_GUID(0x2a00375e'i32, 0x224c, 0x49de, [0xb8'u8, 0xd1, 0x44, 0x0d, 0xf7, 0xef, 0x3d, 0xdc])
  FOLDERID_Music* = DEFINE_GUID(0x4bd8d571'i32, 0x6d19, 0x48d3, [0xbe'u8, 0x97, 0x42, 0x22, 0x20, 0x08, 0x0e, 0x43])
  FOLDERID_MusicLibrary* = DEFINE_GUID(0x2112ab0a'i32, 0xc86a, 0x4ffe, [0xa3'u8, 0x68, 0xd, 0xe9, 0x6e, 0x47, 0x1, 0x2e])
  FOLDERID_NetHood* = DEFINE_GUID(0xc5abbf53'i32, 0xe17f, 0x4121, [0x89'u8, 0x00, 0x86, 0x62, 0x6f, 0xc2, 0xc9, 0x73])
  FOLDERID_NetworkFolder* = DEFINE_GUID(0xd20beec4'i32, 0x5ca8, 0x4905, [0xae'u8, 0x3b, 0xbf, 0x25, 0x1e, 0xa0, 0x9b, 0x53])
  FOLDERID_OriginalImages* = DEFINE_GUID(0x2c36c0aa'i32, 0x5812, 0x4b87, [0xbf'u8, 0xd0, 0x4c, 0xd0, 0xdf, 0xb1, 0x9b, 0x39])
  FOLDERID_PhotoAlbums* = DEFINE_GUID(0x69d2cf90'i32, 0xfc33, 0x4fb7, [0x9a'u8, 0x0c, 0xeb, 0xb0, 0xf0, 0xfc, 0xb4, 0x3c])
  FOLDERID_Pictures* = DEFINE_GUID(0x33e28130'i32, 0x4e1e, 0x4676, [0x83'u8, 0x5a, 0x98, 0x39, 0x5c, 0x3b, 0xc3, 0xbb])
  FOLDERID_PicturesLibrary* = DEFINE_GUID(0xa990ae9f'i32, 0xa03b, 0x4e80, [0x94'u8, 0xbc, 0x99, 0x12, 0xd7, 0x50, 0x41, 0x4])
  FOLDERID_Playlists* = DEFINE_GUID(0xde92c1c7'i32, 0x837f, 0x4f69, [0xa3'u8, 0xbb, 0x86, 0xe6, 0x31, 0x20, 0x4a, 0x23])
  FOLDERID_PrintHood* = DEFINE_GUID(0x9274bd8d'i32, 0xcfd1, 0x41c3, [0xb3'u8, 0x5e, 0xb1, 0x3f, 0x55, 0xa7, 0x58, 0xf4])
  FOLDERID_PrintersFolder* = DEFINE_GUID(0x76fc4e2d'i32, 0xd6ad, 0x4519, [0xa6'u8, 0x63, 0x37, 0xbd, 0x56, 0x06, 0x81, 0x85])
  FOLDERID_Profile* = DEFINE_GUID(0x5e6c858f'i32, 0x0e22, 0x4760, [0x9a'u8, 0xfe, 0xea, 0x33, 0x17, 0xb6, 0x71, 0x73])
  FOLDERID_ProgramData* = DEFINE_GUID(0x62ab5d82'i32, 0xfdc1, 0x4dc3, [0xa9'u8, 0xdd, 0x07, 0x0d, 0x1d, 0x49, 0x5d, 0x97])
  FOLDERID_ProgramFiles* = DEFINE_GUID(0x905e63b6'i32, 0xc1bf, 0x494e, [0xb2'u8, 0x9c, 0x65, 0xb7, 0x32, 0xd3, 0xd2, 0x1a])
  FOLDERID_ProgramFilesX64* = DEFINE_GUID(0x6d809377'i32, 0x6af0, 0x444b, [0x89'u8, 0x57, 0xa3, 0x77, 0x3f, 0x02, 0x20, 0x0e])
  FOLDERID_ProgramFilesX86* = DEFINE_GUID(0x7c5a40ef'i32, 0xa0fb, 0x4bfc, [0x87'u8, 0x4a, 0xc0, 0xf2, 0xe0, 0xb9, 0xfa, 0x8e])
  FOLDERID_ProgramFilesCommon* = DEFINE_GUID(0xf7f1ed05'i32, 0x9f6d, 0x47a2, [0xaa'u8, 0xae, 0x29, 0xd3, 0x17, 0xc6, 0xf0, 0x66])
  FOLDERID_ProgramFilesCommonX64* = DEFINE_GUID(0x6365d5a7'i32, 0xf0d, 0x45e5, [0x87'u8, 0xf6, 0xd, 0xa5, 0x6b, 0x6a, 0x4f, 0x7d])
  FOLDERID_ProgramFilesCommonX86* = DEFINE_GUID(0xde974d24'i32, 0xd9c6, 0x4d3e, [0xbf'u8, 0x91, 0xf4, 0x45, 0x51, 0x20, 0xb9, 0x17])
  FOLDERID_Programs* = DEFINE_GUID(0xa77f5d77'i32, 0x2e2b, 0x44c3, [0xa6'u8, 0xa2, 0xab, 0xa6, 0x01, 0x05, 0x4a, 0x51])
  FOLDERID_Public* = DEFINE_GUID(0xdfdf76a2'i32, 0xc82a, 0x4d63, [0x90'u8, 0x6a, 0x56, 0x44, 0xac, 0x45, 0x73, 0x85])
  FOLDERID_PublicDesktop* = DEFINE_GUID(0xc4aa340d'i32, 0xf20f, 0x4863, [0xaf'u8, 0xef, 0xf8, 0x7e, 0xf2, 0xe6, 0xba, 0x25])
  FOLDERID_PublicDocuments* = DEFINE_GUID(0xed4824af'i32, 0xdce4, 0x45a8, [0x81'u8, 0xe2, 0xfc, 0x79, 0x65, 0x08, 0x36, 0x34])
  FOLDERID_PublicDownloads* = DEFINE_GUID(0x3d644c9b'i32, 0x1fb8, 0x4f30, [0x9b'u8, 0x45, 0xf6, 0x70, 0x23, 0x5f, 0x79, 0xc0])
  FOLDERID_PublicGameTasks* = DEFINE_GUID(0xdebf2536'i32, 0xe1a8, 0x4c59, [0xb6'u8, 0xa2, 0x41, 0x45, 0x86, 0x47, 0x6a, 0xea])
  FOLDERID_PublicLibraries* = DEFINE_GUID(0x48daf80b'i32, 0xe6cf, 0x4f4e, [0xb8'u8, 0x00, 0x0e, 0x69, 0xd8, 0x4e, 0xe3, 0x84])
  FOLDERID_PublicMusic* = DEFINE_GUID(0x3214fab5'i32, 0x9757, 0x4298, [0xbb'u8, 0x61, 0x92, 0xa9, 0xde, 0xaa, 0x44, 0xff])
  FOLDERID_PublicPictures* = DEFINE_GUID(0xb6ebfb86'i32, 0x6907, 0x413c, [0x9a'u8, 0xf7, 0x4f, 0xc2, 0xab, 0xf0, 0x7c, 0xc5])
  FOLDERID_PublicRingtones* = DEFINE_GUID(0xe555ab60'i32, 0x153b, 0x4d17, [0x9f'u8, 0x04, 0xa5, 0xfe, 0x99, 0xfc, 0x15, 0xec])
  FOLDERID_PublicUserTiles* = DEFINE_GUID(0x0482af6c'i32, 0x08f1, 0x4c34, [0x8c'u8, 0x90, 0xe1, 0x7e, 0xc9, 0x8b, 0x1e, 0x17])
  FOLDERID_PublicVideos* = DEFINE_GUID(0x2400183a'i32, 0x6185, 0x49fb, [0xa2'u8, 0xd8, 0x4a, 0x39, 0x2a, 0x60, 0x2b, 0xa3])
  FOLDERID_QuickLaunch* = DEFINE_GUID(0x52a4f021'i32, 0x7b75, 0x48a9, [0x9f'u8, 0x6b, 0x4b, 0x87, 0xa2, 0x10, 0xbc, 0x8f])
  FOLDERID_Recent* = DEFINE_GUID(0xae50c081'i32, 0xebd2, 0x438a, [0x86'u8, 0x55, 0x8a, 0x09, 0x2e, 0x34, 0x98, 0x7a])
  FOLDERID_RecordedTVLibrary* = DEFINE_GUID(0x1a6fdba2'i32, 0xf42d, 0x4358, [0xa7'u8, 0x98, 0xb7, 0x4d, 0x74, 0x59, 0x26, 0xc5])
  FOLDERID_RecycleBinFolder* = DEFINE_GUID(0xb7534046'i32, 0x3ecb, 0x4c18, [0xbe'u8, 0x4e, 0x64, 0xcd, 0x4c, 0xb7, 0xd6, 0xac])
  FOLDERID_ResourceDir* = DEFINE_GUID(0x8ad10c31'i32, 0x2adb, 0x4296, [0xa8'u8, 0xf7, 0xe4, 0x70, 0x12, 0x32, 0xc9, 0x72])
  FOLDERID_Ringtones* = DEFINE_GUID(0xc870044b'i32, 0xf49e, 0x4126, [0xa9'u8, 0xc3, 0xb5, 0x2a, 0x1f, 0xf4, 0x11, 0xe8])
  FOLDERID_RoamingAppData* = DEFINE_GUID(0x3eb685db'i32, 0x65f9, 0x4cf6, [0xa0'u8, 0x3a, 0xe3, 0xef, 0x65, 0x72, 0x9f, 0x3d])
  FOLDERID_RoamingTiles* = DEFINE_GUID(0xbcfc5a'i32, 0xed94, 0x4e48, [0x96'u8, 0xa1, 0x3f, 0x62, 0x17, 0xf2, 0x19, 0x90])
  FOLDERID_RoamedTileImages* = DEFINE_GUID(0xaaa8d5a5'i32, 0xf1d6, 0x4259, [0xba'u8, 0xa8, 0x78, 0xe7, 0xef, 0x60, 0x83, 0x5e])
  FOLDERID_SampleMusic* = DEFINE_GUID(0xb250c668'i32, 0xf57d, 0x4ee1, [0xa6'u8, 0x3c, 0x29, 0x0e, 0xe7, 0xd1, 0xaa, 0x1f])
  FOLDERID_SamplePictures* = DEFINE_GUID(0xc4900540'i32, 0x2379, 0x4c75, [0x84'u8, 0x4b, 0x64, 0xe6, 0xfa, 0xf8, 0x71, 0x6b])
  FOLDERID_SamplePlaylists* = DEFINE_GUID(0x15ca69b3'i32, 0x30ee, 0x49c1, [0xac'u8, 0xe1, 0x6b, 0x5e, 0xc3, 0x72, 0xaf, 0xb5])
  FOLDERID_SampleVideos* = DEFINE_GUID(0x859ead94'i32, 0x2e85, 0x48ad, [0xa7'u8, 0x1a, 0x09, 0x69, 0xcb, 0x56, 0xa6, 0xcd])
  FOLDERID_SavedGames* = DEFINE_GUID(0x4c5c32ff'i32, 0xbb9d, 0x43b0, [0xb5'u8, 0xb4, 0x2d, 0x72, 0xe5, 0x4e, 0xaa, 0xa4])
  FOLDERID_SavedSearches* = DEFINE_GUID(0x7d1d3a04'i32, 0xdebb, 0x4115, [0x95'u8, 0xcf, 0x2f, 0x29, 0xda, 0x29, 0x20, 0xda])
  FOLDERID_Screenshots* = DEFINE_GUID(0xb7bede81'i32, 0xdf94, 0x4682, [0xa7'u8, 0xd8, 0x57, 0xa5, 0x26, 0x20, 0xb8, 0x6f])
  FOLDERID_SEARCH_MAPI* = DEFINE_GUID(0x98ec0e18'i32, 0x2098, 0x4d44, [0x86'u8, 0x44, 0x66, 0x97, 0x93, 0x15, 0xa2, 0x81])
  FOLDERID_SEARCH_CSC* = DEFINE_GUID(0xee32e446'i32, 0x31ca, 0x4aba, [0x81'u8, 0x4f, 0xa5, 0xeb, 0xd2, 0xfd, 0x6d, 0x5e])
  FOLDERID_SearchHome* = DEFINE_GUID(0x190337d1'i32, 0xb8ca, 0x4121, [0xa6'u8, 0x39, 0x6d, 0x47, 0x2d, 0x16, 0x97, 0x2a])
  FOLDERID_SendTo* = DEFINE_GUID(0x8983036c'i32, 0x27c0, 0x404b, [0x8f'u8, 0x08, 0x10, 0x2d, 0x10, 0xdc, 0xfd, 0x74])
  FOLDERID_SidebarDefaultParts* = DEFINE_GUID(0x7b396e54'i32, 0x9ec5, 0x4300, [0xbe'u8, 0xa, 0x24, 0x82, 0xeb, 0xae, 0x1a, 0x26])
  FOLDERID_SidebarParts* = DEFINE_GUID(0xa75d362e'i32, 0x50fc, 0x4fb7, [0xac'u8, 0x2c, 0xa8, 0xbe, 0xaa, 0x31, 0x44, 0x93])
  FOLDERID_StartMenu* = DEFINE_GUID(0x625b53c3'i32, 0xab48, 0x4ec1, [0xba'u8, 0x1f, 0xa1, 0xef, 0x41, 0x46, 0xfc, 0x19])
  FOLDERID_Startup* = DEFINE_GUID(0xb97d20bb'i32, 0xf46a, 0x4c97, [0xba'u8, 0x10, 0x5e, 0x36, 0x08, 0x43, 0x08, 0x54])
  FOLDERID_SyncManagerFolder* = DEFINE_GUID(0x43668bf8'i32, 0xc14e, 0x49b2, [0x97'u8, 0xc9, 0x74, 0x77, 0x84, 0xd7, 0x84, 0xb7])
  FOLDERID_SyncResultsFolder* = DEFINE_GUID(0x289a9a43'i32, 0xbe44, 0x4057, [0xa4'u8, 0x1b, 0x58, 0x7a, 0x76, 0xd7, 0xe7, 0xf9])
  FOLDERID_SyncSetupFolder* = DEFINE_GUID(0xf214138'i32, 0xb1d3, 0x4a90, [0xbb'u8, 0xa9, 0x27, 0xcb, 0xc0, 0xc5, 0x38, 0x9a])
  FOLDERID_System* = DEFINE_GUID(0x1ac14e77'i32, 0x02e7, 0x4e5d, [0xb7'u8, 0x44, 0x2e, 0xb1, 0xae, 0x51, 0x98, 0xb7])
  FOLDERID_SystemX86* = DEFINE_GUID(0xd65231b0'i32, 0xb2f1, 0x4857, [0xa4'u8, 0xce, 0xa8, 0xe7, 0xc6, 0xea, 0x7d, 0x27])
  FOLDERID_Templates* = DEFINE_GUID(0xa63293e8'i32, 0x664e, 0x48db, [0xa0'u8, 0x79, 0xdf, 0x75, 0x9e, 0x05, 0x09, 0xf7])
  FOLDERID_UserPinned* = DEFINE_GUID(0x9e3995ab'i32, 0x1f9c, 0x4f13, [0xb8'u8, 0x27, 0x48, 0xb2, 0x4b, 0x6c, 0x71, 0x74])
  FOLDERID_UserProfiles* = DEFINE_GUID(0x0762d272'i32, 0xc50a, 0x4bb0, [0xa3'u8, 0x82, 0x69, 0x7d, 0xcd, 0x72, 0x9b, 0x80])
  FOLDERID_UserProgramFiles* = DEFINE_GUID(0x5cd7aee2'i32, 0x2219, 0x4a67, [0xb8'u8, 0x5d, 0x6c, 0x9c, 0xe1, 0x56, 0x60, 0xcb])
  FOLDERID_UserProgramFilesCommon* = DEFINE_GUID(0xbcbd3057'i32, 0xca5c, 0x4622, [0xb4'u8, 0x2d, 0xbc, 0x56, 0xdb, 0x0a, 0xe5, 0x16])
  FOLDERID_UsersFiles* = DEFINE_GUID(0xf3ce0f7c'i32, 0x4901, 0x4acc, [0x86'u8, 0x48, 0xd5, 0xd4, 0x4b, 0x04, 0xef, 0x8f])
  FOLDERID_UsersLibraries* = DEFINE_GUID(0xa302545d'i32, 0xdeff, 0x464b, [0xab'u8, 0xe8, 0x61, 0xc8, 0x64, 0x8d, 0x93, 0x9b])
  FOLDERID_Videos* = DEFINE_GUID(0x18989b1d'i32, 0x99b5, 0x455b, [0x84'u8, 0x1c, 0xab, 0x7c, 0x74, 0xe4, 0xdd, 0xfc])
  FOLDERID_VideosLibrary* = DEFINE_GUID(0x491e922f'i32, 0x5643, 0x4af4, [0xa7'u8, 0xeb, 0x4e, 0x7a, 0x13, 0x8d, 0x81, 0x74])
  FOLDERID_Windows* = DEFINE_GUID(0xf38bf404'i32, 0x1d43, 0x42f2, [0x93'u8, 0x05, 0x67, 0xde, 0x0b, 0x28, 0xfc, 0x23])
  FOLDERTYPEID_Invalid* = DEFINE_GUID(0x57807898'i32, 0x8c4f, 0x4462, [0xbb'u8, 0x63, 0x71, 0x04, 0x23, 0x80, 0xb1, 0x09])
  FOLDERTYPEID_Generic* = DEFINE_GUID(0x5c4f28b5'i32, 0xf869, 0x4e84, [0x8e'u8, 0x60, 0xf1, 0x1d, 0xb9, 0x7c, 0x5c, 0xc7])
  FOLDERTYPEID_GenericSearchResults* = DEFINE_GUID(0x7fde1a1e'i32, 0x8b31, 0x49a5, [0x93'u8, 0xb8, 0x6b, 0xe1, 0x4c, 0xfa, 0x49, 0x43])
  FOLDERTYPEID_GenericLibrary* = DEFINE_GUID(0x5f4eab9a'i32, 0x6833, 0x4f61, [0x89'u8, 0x9d, 0x31, 0xcf, 0x46, 0x97, 0x9d, 0x49])
  FOLDERTYPEID_Documents* = DEFINE_GUID(0x7d49d726'i32, 0x3c21, 0x4f05, [0x99'u8, 0xaa, 0xfd, 0xc2, 0xc9, 0x47, 0x46, 0x56])
  FOLDERTYPEID_Pictures* = DEFINE_GUID(0xb3690e58'i32, 0xe961, 0x423b, [0xb6'u8, 0x87, 0x38, 0x6e, 0xbf, 0xd8, 0x32, 0x39])
  FOLDERTYPEID_Music* = DEFINE_GUID(0x94d6ddcc'i32, 0x4a68, 0x4175, [0xa3'u8, 0x74, 0xbd, 0x58, 0x4a, 0x51, 0x0b, 0x78])
  FOLDERTYPEID_Videos* = DEFINE_GUID(0x5fa96407'i32, 0x7e77, 0x483c, [0xac'u8, 0x93, 0x69, 0x1d, 0x05, 0x85, 0x0d, 0xe8])
  FOLDERTYPEID_UserFiles* = DEFINE_GUID(0xcd0fc69b'i32, 0x71e2, 0x46e5, [0x96'u8, 0x90, 0x5b, 0xcd, 0x9f, 0x57, 0xaa, 0xb3])
  FOLDERTYPEID_UsersLibraries* = DEFINE_GUID(0xc4d98f09'i32, 0x6124, 0x4fe0, [0x99'u8, 0x42, 0x82, 0x64, 0x16, 0x8, 0x2d, 0xa9])
  FOLDERTYPEID_OtherUsers* = DEFINE_GUID(0xb337fd00'i32, 0x9dd5, 0x4635, [0xa6'u8, 0xd4, 0xda, 0x33, 0xfd, 0x10, 0x2b, 0x7a])
  FOLDERTYPEID_PublishedItems* = DEFINE_GUID(0x7f2f5b96'i32, 0xff74, 0x41da, [0xaf'u8, 0xd8, 0x1c, 0x78, 0xa5, 0xf3, 0xae, 0xa2])
  FOLDERTYPEID_Communications* = DEFINE_GUID(0x91475fe5'i32, 0x586b, 0x4eba, [0x8d'u8, 0x75, 0xd1, 0x74, 0x34, 0xb8, 0xcd, 0xf6])
  FOLDERTYPEID_Contacts* = DEFINE_GUID(0xde2b70ec'i32, 0x9bf7, 0x4a93, [0xbd'u8, 0x3d, 0x24, 0x3f, 0x78, 0x81, 0xd4, 0x92])
  FOLDERTYPEID_StartMenu* = DEFINE_GUID(0xef87b4cb'i32, 0xf2ce, 0x4785, [0x86'u8, 0x58, 0x4c, 0xa6, 0xc6, 0x3e, 0x38, 0xc6])
  FOLDERTYPEID_RecordedTV* = DEFINE_GUID(0x5557a28f'i32, 0x5da6, 0x4f83, [0x88'u8, 0x09, 0xc2, 0xc9, 0x8a, 0x11, 0xa6, 0xfa])
  FOLDERTYPEID_SavedGames* = DEFINE_GUID(0xd0363307'i32, 0x28cb, 0x4106, [0x9f'u8, 0x23, 0x29, 0x56, 0xe3, 0xe5, 0xe0, 0xe7])
  FOLDERTYPEID_OpenSearch* = DEFINE_GUID(0x8faf9629'i32, 0x1980, 0x46ff, [0x80'u8, 0x23, 0x9d, 0xce, 0xab, 0x9c, 0x3e, 0xe3])
  FOLDERTYPEID_SearchConnector* = DEFINE_GUID(0x982725ee'i32, 0x6f47, 0x479e, [0xb4'u8, 0x47, 0x81, 0x2b, 0xfa, 0x7d, 0x2e, 0x8f])
  FOLDERTYPEID_AccountPictures* = DEFINE_GUID(0xdb2a5d8f'i32, 0x06e6, 0x4007, [0xab'u8, 0xa6, 0xaf, 0x87, 0x7d, 0x52, 0x6e, 0xa6])
  FOLDERTYPEID_Games* = DEFINE_GUID(0xb689b0d0'i32, 0x76d3, 0x4cbb, [0x87'u8, 0xf7, 0x58, 0x5d, 0x0e, 0x0c, 0xe0, 0x70])
  FOLDERTYPEID_ControlPanelCategory* = DEFINE_GUID(0xde4f0660'i32, 0xfa10, 0x4b8f, [0xa4'u8, 0x94, 0x06, 0x8b, 0x20, 0xb2, 0x23, 0x07])
  FOLDERTYPEID_ControlPanelClassic* = DEFINE_GUID(0x0c3794f3'i32, 0xb545, 0x43aa, [0xa3'u8, 0x29, 0xc3, 0x74, 0x30, 0xc5, 0x8d, 0x2a])
  FOLDERTYPEID_Printers* = DEFINE_GUID(0x2c7bbec6'i32, 0xc844, 0x4a0a, [0x91'u8, 0xfa, 0xce, 0xf6, 0xf5, 0x9c, 0xfd, 0xa1])
  FOLDERTYPEID_RecycleBin* = DEFINE_GUID(0xd6d9e004'i32, 0xcd87, 0x442b, [0x9d'u8, 0x57, 0x5e, 0x0a, 0xeb, 0x4f, 0x6f, 0x72])
  FOLDERTYPEID_SoftwareExplorer* = DEFINE_GUID(0xd674391b'i32, 0x52d9, 0x4e07, [0x83'u8, 0x4e, 0x67, 0xc9, 0x86, 0x10, 0xf3, 0x9d])
  FOLDERTYPEID_CompressedFolder* = DEFINE_GUID(0x80213e82'i32, 0xbcfd, 0x4c4f, [0x88'u8, 0x17, 0xbb, 0x27, 0x60, 0x12, 0x67, 0xa9])
  FOLDERTYPEID_NetworkExplorer* = DEFINE_GUID(0x25cc242b'i32, 0x9a7c, 0x4f51, [0x80'u8, 0xe0, 0x7a, 0x29, 0x28, 0xfe, 0xbe, 0x42])
  FOLDERTYPEID_Searches* = DEFINE_GUID(0x0b0ba2e3'i32, 0x405f, 0x415e, [0xa6'u8, 0xee, 0xca, 0xd6, 0x25, 0x20, 0x78, 0x53])
  FOLDERTYPEID_SearchHome* = DEFINE_GUID(0x834d8a44'i32, 0x0974, 0x4ed6, [0x86'u8, 0x6e, 0xf2, 0x03, 0xd8, 0x0b, 0x38, 0x10])
  SYNCMGR_OBJECTID_Icon* = DEFINE_GUID(0x6dbc85c3'i32, 0x5d07, 0x4c72, [0xa7'u8, 0x77, 0x7f, 0xec, 0x78, 0x7, 0x2c, 0x6])
  SYNCMGR_OBJECTID_EventStore* = DEFINE_GUID(0x4bef34b9'i32, 0xa786, 0x4075, [0xba'u8, 0x88, 0xc, 0x2b, 0x9d, 0x89, 0xa9, 0x8f])
  SYNCMGR_OBJECTID_ConflictStore* = DEFINE_GUID(0xd78181f4'i32, 0x2389, 0x47e4, [0xa9'u8, 0x60, 0x60, 0xbc, 0xc2, 0xed, 0x93, 0xb])
  SYNCMGR_OBJECTID_BrowseContent* = DEFINE_GUID(0x57cbb584'i32, 0xe9b4, 0x47ae, [0xa1'u8, 0x20, 0xc4, 0xdf, 0x33, 0x35, 0xde, 0xe2])
  SYNCMGR_OBJECTID_ShowSchedule* = DEFINE_GUID(0xedc6f3e3'i32, 0x8441, 0x4109, [0xad'u8, 0xf3, 0x6c, 0x1c, 0xa0, 0xb7, 0xde, 0x47])
  SYNCMGR_OBJECTID_QueryBeforeActivate* = DEFINE_GUID(0xd882d80b'i32, 0xe7aa, 0x49ed, [0x86'u8, 0xb7, 0xe6, 0xe1, 0xf7, 0x14, 0xcd, 0xfe])
  SYNCMGR_OBJECTID_QueryBeforeDeactivate* = DEFINE_GUID(0xa0efc282'i32, 0x60e0, 0x460e, [0x93'u8, 0x74, 0xea, 0x88, 0x51, 0x3c, 0xfc, 0x80])
  SYNCMGR_OBJECTID_QueryBeforeEnable* = DEFINE_GUID(0x4cbf7f0'i32, 0x5beb, 0x4de1, [0xbc'u8, 0x90, 0x90, 0x83, 0x45, 0xc4, 0x80, 0xf6])
  SYNCMGR_OBJECTID_QueryBeforeDisable* = DEFINE_GUID(0xbb5f64aa'i32, 0xf004, 0x4eb5, [0x8e'u8, 0x4d, 0x26, 0x75, 0x19, 0x66, 0x34, 0x4c])
  SYNCMGR_OBJECTID_QueryBeforeDelete* = DEFINE_GUID(0xf76c3397'i32, 0xafb3, 0x45d7, [0xa5'u8, 0x9f, 0x5a, 0x49, 0xe9, 0x5, 0x43, 0x7e])
  SYNCMGR_OBJECTID_EventLinkClick* = DEFINE_GUID(0x2203bdc1'i32, 0x1af1, 0x4082, [0x8c'u8, 0x30, 0x28, 0x39, 0x9f, 0x41, 0x38, 0x4c])
  EP_NavPane* = DEFINE_GUID(0xcb316b22'i32, 0x25f7, 0x42b8, [0x8a'u8, 0x09, 0x54, 0x0d, 0x23, 0xa4, 0x3c, 0x2f])
  EP_Commands* = DEFINE_GUID(0xd9745868'i32, 0xca5f, 0x4a76, [0x91'u8, 0xcd, 0xf5, 0xa1, 0x29, 0xfb, 0xb0, 0x76])
  EP_Commands_Organize* = DEFINE_GUID(0x72e81700'i32, 0xe3ec, 0x4660, [0xbf'u8, 0x24, 0x3c, 0x3b, 0x7b, 0x64, 0x88, 0x06])
  EP_Commands_View* = DEFINE_GUID(0x21f7c32d'i32, 0xeeaa, 0x439b, [0xbb'u8, 0x51, 0x37, 0xb9, 0x6f, 0xd6, 0xa9, 0x43])
  EP_DetailsPane* = DEFINE_GUID(0x43abf98b'i32, 0x89b8, 0x472d, [0xb9'u8, 0xce, 0xe6, 0x9b, 0x82, 0x29, 0xf0, 0x19])
  EP_PreviewPane* = DEFINE_GUID(0x893c63d1'i32, 0x45c8, 0x4d17, [0xbe'u8, 0x19, 0x22, 0x3b, 0xe7, 0x1b, 0xe3, 0x65])
  EP_QueryPane* = DEFINE_GUID(0x65bcde4f'i32, 0x4f07, 0x4f27, [0x83'u8, 0xa7, 0x1a, 0xfc, 0xa4, 0xdf, 0x7d, 0xdd])
  EP_AdvQueryPane* = DEFINE_GUID(0xb4e9db8b'i32, 0x34ba, 0x4c39, [0xb5'u8, 0xcc, 0x16, 0xa1, 0xbd, 0x2c, 0x41, 0x1c])
  EP_StatusBar* = DEFINE_GUID(0x65fe56ce'i32, 0x5cfe, 0x4bc4, [0xad'u8, 0x8a, 0x7a, 0xe3, 0xfe, 0x7e, 0x8f, 0x7c])
  EP_Ribbon* = DEFINE_GUID(0xd27524a8'i32, 0xc9f2, 0x4834, [0xa1'u8, 0x6, 0xdf, 0x88, 0x89, 0xfd, 0x4f, 0x37])
  CATID_LocationFactory* = DEFINE_GUID(0x965c4d51'i32, 0x8b76, 0x4e57, [0x80'u8, 0xb7, 0x56, 0x4d, 0x2e, 0xa4, 0xb5, 0x5e])
  CATID_LocationProvider* = DEFINE_GUID(0x1b3ca474'i32, 0x2614, 0x414b, [0xb8'u8, 0x13, 0x1a, 0xce, 0xca, 0x3e, 0x3d, 0xd8])
  ItemCount_Property_GUID* = DEFINE_GUID(0xabbf5c45'i32, 0x5ccc, 0x47b7, [0xbb'u8, 0x4e, 0x87, 0xcb, 0x87, 0xbb, 0xd1, 0x62])
  SelectedItemCount_Property_GUID* = DEFINE_GUID(0x8fe316d2'i32, 0xe52, 0x460a, [0x9c'u8, 0x1e, 0x48, 0xf2, 0x73, 0xd4, 0x70, 0xa3])
  ItemIndex_Property_GUID* = DEFINE_GUID(0x92a053da'i32, 0x2969, 0x4021, [0xbf'u8, 0x27, 0x51, 0x4c, 0xfc, 0x2e, 0x4a, 0x69])
  CATID_SearchableApplication* = DEFINE_GUID(0x366c292a'i32, 0xd9b3, 0x4dbf, [0xbb'u8, 0x70, 0xe6, 0x2e, 0xc3, 0xd0, 0xbb, 0xbf])
  IID_IObjectArray* = DEFINE_GUID(0x92ca9dcd'i32, 0x5622, 0x4bba, [0xa8'u8, 0x05, 0x5e, 0x9f, 0x54, 0x1b, 0xd8, 0xc9])
  IID_IObjectCollection* = DEFINE_GUID(0x5632b1a4'i32, 0xe38a, 0x400a, [0x92'u8, 0x8a, 0xd4, 0xcd, 0x63, 0x23, 0x02, 0x95])
  COPYENGINE_S_YES* = HRESULT 0x00270001
  COPYENGINE_S_NOT_HANDLED* = HRESULT 0x00270003
  COPYENGINE_S_USER_RETRY* = HRESULT 0x00270004
  COPYENGINE_S_USER_IGNORED* = HRESULT 0x00270005
  COPYENGINE_S_MERGE* = HRESULT 0x00270006
  COPYENGINE_S_DONT_PROCESS_CHILDREN* = HRESULT 0x00270008
  COPYENGINE_S_ALREADY_DONE* = HRESULT 0x0027000a
  COPYENGINE_S_PENDING* = HRESULT 0x0027000b
  COPYENGINE_S_KEEP_BOTH* = HRESULT 0x0027000c
  COPYENGINE_S_CLOSE_PROGRAM* = HRESULT 0x0027000d
  COPYENGINE_S_COLLISIONRESOLVED* = HRESULT 0x0027000e
  COPYENGINE_S_PROGRESS_PAUSE* = HRESULT 0x0027000f
  COPYENGINE_E_USER_CANCELLED* = HRESULT 0x80270000'i32
  COPYENGINE_E_CANCELLED* = HRESULT 0x80270001'i32
  COPYENGINE_E_REQUIRES_ELEVATION* = HRESULT 0x80270002'i32
  COPYENGINE_E_SAME_FILE* = HRESULT 0x80270003'i32
  COPYENGINE_E_DIFF_DIR* = HRESULT 0x80270004'i32
  COPYENGINE_E_MANY_SRC_1_DEST* = HRESULT 0x80270005'i32
  COPYENGINE_E_DEST_SUBTREE* = HRESULT 0x80270009'i32
  COPYENGINE_E_DEST_SAME_TREE* = HRESULT 0x8027000a'i32
  COPYENGINE_E_FLD_IS_FILE_DEST* = HRESULT 0x8027000b'i32
  COPYENGINE_E_FILE_IS_FLD_DEST* = HRESULT 0x8027000c'i32
  COPYENGINE_E_FILE_TOO_LARGE* = HRESULT 0x8027000d'i32
  COPYENGINE_E_REMOVABLE_FULL* = HRESULT 0x8027000e'i32
  COPYENGINE_E_DEST_IS_RO_CD* = HRESULT 0x8027000f'i32
  COPYENGINE_E_DEST_IS_RW_CD* = HRESULT 0x80270010'i32
  COPYENGINE_E_DEST_IS_R_CD* = HRESULT 0x80270011'i32
  COPYENGINE_E_DEST_IS_RO_DVD* = HRESULT 0x80270012'i32
  COPYENGINE_E_DEST_IS_RW_DVD* = HRESULT 0x80270013'i32
  COPYENGINE_E_DEST_IS_R_DVD* = HRESULT 0x80270014'i32
  COPYENGINE_E_SRC_IS_RO_CD* = HRESULT 0x80270015'i32
  COPYENGINE_E_SRC_IS_RW_CD* = HRESULT 0x80270016'i32
  COPYENGINE_E_SRC_IS_R_CD* = HRESULT 0x80270017'i32
  COPYENGINE_E_SRC_IS_RO_DVD* = HRESULT 0x80270018'i32
  COPYENGINE_E_SRC_IS_RW_DVD* = HRESULT 0x80270019'i32
  COPYENGINE_E_SRC_IS_R_DVD* = HRESULT 0x8027001a'i32
  COPYENGINE_E_INVALID_FILES_SRC* = HRESULT 0x8027001b'i32
  COPYENGINE_E_INVALID_FILES_DEST* = HRESULT 0x8027001c'i32
  COPYENGINE_E_PATH_TOO_DEEP_SRC* = HRESULT 0x8027001d'i32
  COPYENGINE_E_PATH_TOO_DEEP_DEST* = HRESULT 0x8027001e'i32
  COPYENGINE_E_ROOT_DIR_SRC* = HRESULT 0x8027001f'i32
  COPYENGINE_E_ROOT_DIR_DEST* = HRESULT 0x80270020'i32
  COPYENGINE_E_ACCESS_DENIED_SRC* = HRESULT 0x80270021'i32
  COPYENGINE_E_ACCESS_DENIED_DEST* = HRESULT 0x80270022'i32
  COPYENGINE_E_PATH_NOT_FOUND_SRC* = HRESULT 0x80270023'i32
  COPYENGINE_E_PATH_NOT_FOUND_DEST* = HRESULT 0x80270024'i32
  COPYENGINE_E_NET_DISCONNECT_SRC* = HRESULT 0x80270025'i32
  COPYENGINE_E_NET_DISCONNECT_DEST* = HRESULT 0x80270026'i32
  COPYENGINE_E_SHARING_VIOLATION_SRC* = HRESULT 0x80270027'i32
  COPYENGINE_E_SHARING_VIOLATION_DEST* = HRESULT 0x80270028'i32
  COPYENGINE_E_ALREADY_EXISTS_NORMAL* = HRESULT 0x80270029'i32
  COPYENGINE_E_ALREADY_EXISTS_READONLY* = HRESULT 0x8027002a'i32
  COPYENGINE_E_ALREADY_EXISTS_SYSTEM* = HRESULT 0x8027002b'i32
  COPYENGINE_E_ALREADY_EXISTS_FOLDER* = HRESULT 0x8027002c'i32
  COPYENGINE_E_STREAM_LOSS* = HRESULT 0x8027002d'i32
  COPYENGINE_E_EA_LOSS* = HRESULT 0x8027002e'i32
  COPYENGINE_E_PROPERTY_LOSS* = HRESULT 0x8027002f'i32
  COPYENGINE_E_PROPERTIES_LOSS* = HRESULT 0x80270030'i32
  COPYENGINE_E_ENCRYPTION_LOSS* = HRESULT 0x80270031'i32
  COPYENGINE_E_DISK_FULL* = HRESULT 0x80270032'i32
  COPYENGINE_E_DISK_FULL_CLEAN* = HRESULT 0x80270033'i32
  COPYENGINE_E_EA_NOT_SUPPORTED* = HRESULT 0x80270034'i32
  COPYENGINE_E_CANT_REACH_SOURCE* = HRESULT 0x80270035'i32
  COPYENGINE_E_RECYCLE_UNKNOWN_ERROR* = HRESULT 0x80270035'i32
  COPYENGINE_E_RECYCLE_FORCE_NUKE* = HRESULT 0x80270036'i32
  COPYENGINE_E_RECYCLE_SIZE_TOO_BIG* = HRESULT 0x80270037'i32
  COPYENGINE_E_RECYCLE_PATH_TOO_LONG* = HRESULT 0x80270038'i32
  COPYENGINE_E_RECYCLE_BIN_NOT_FOUND* = HRESULT 0x8027003a'i32
  COPYENGINE_E_NEWFILE_NAME_TOO_LONG* = HRESULT 0x8027003b'i32
  COPYENGINE_E_NEWFOLDER_NAME_TOO_LONG* = HRESULT 0x8027003c'i32
  COPYENGINE_E_DIR_NOT_EMPTY* = HRESULT 0x8027003d'i32
  COPYENGINE_E_FAT_MAX_IN_ROOT* = HRESULT 0x8027003e'i32
  COPYENGINE_E_ACCESSDENIED_READONLY* = HRESULT 0x8027003f'i32
  COPYENGINE_E_REDIRECTED_TO_WEBPAGE* = HRESULT 0x80270040'i32
  COPYENGINE_E_SERVER_BAD_FILE_TYPE* = HRESULT 0x80270041'i32
  NETCACHE_E_NEGATIVE_CACHE* = HRESULT 0x80270100'i32
  EXECUTE_E_LAUNCH_APPLICATION* = HRESULT 0x80270101'i32
  SHELL_E_WRONG_BITDEPTH* = HRESULT 0x80270102'i32
  LINK_E_DELETE* = HRESULT 0x80270103'i32
  STORE_E_NEWER_VERSION_AVAILABLE* = HRESULT 0x80270104'i32
  LIBRARY_E_NO_SAVE_LOCATION* = HRESULT 0x80270200'i32
  LIBRARY_E_NO_ACCESSIBLE_LOCATION* = HRESULT 0x80270201'i32
  E_USERTILE_UNSUPPORTEDFILETYPE* = HRESULT 0x80270210'i32
  E_USERTILE_CHANGEDISABLED* = HRESULT 0x80270211'i32
  E_USERTILE_LARGEORDYNAMIC* = HRESULT 0x80270212'i32
  E_USERTILE_VIDEOFRAMESIZE* = HRESULT 0x80270213'i32
  E_USERTILE_FILESIZE* = HRESULT 0x80270214'i32
  IMM_ACC_DOCKING_E_INSUFFICIENTHEIGHT* = HRESULT 0x80270230'i32
  IMM_ACC_DOCKING_E_DOCKOCCUPIED* = HRESULT 0x80270231'i32
  IMSC_E_SHELL_COMPONENT_STARTUP_FAILURE* = HRESULT 0x80270233'i32
  E_TILE_NOTIFICATIONS_PLATFORM_FAILURE* = HRESULT 0x80270249'i32
  E_SHELL_EXTENSION_BLOCKED* = HRESULT 0x80270301'i32
  CMF_NORMAL* = 0x0
  CMF_DEFAULTONLY* = 0x1
  CMF_VERBSONLY* = 0x2
  CMF_EXPLORE* = 0x4
  CMF_NOVERBS* = 0x8
  CMF_CANRENAME* = 0x10
  CMF_NODEFAULT* = 0x20
  CMF_INCLUDESTATIC* = 0x40
  CMF_ITEMMENU* = 0x80
  CMF_EXTENDEDVERBS* = 0x100
  CMF_DISABLEDVERBS* = 0x200
  CMF_ASYNCVERBSTATE* = 0x400
  CMF_OPTIMIZEFORINVOKE* = 0x800
  CMF_SYNCCASCADEMENU* = 0x1000
  CMF_DONOTPICKDEFAULT* = 0x2000
  CMF_RESERVED* = 0xffff0000'i32
  GCS_VERBA* = 0x0
  GCS_HELPTEXTA* = 0x1
  GCS_VALIDATEA* = 0x2
  GCS_VERBW* = 0x4
  GCS_HELPTEXTW* = 0x5
  GCS_VALIDATEW* = 0x6
  GCS_VERBICONW* = 0x14
  GCS_UNICODE* = 0x4
  CMDSTR_NEWFOLDERA* = "NewFolder"
  CMDSTR_VIEWLISTA* = "ViewList"
  CMDSTR_VIEWDETAILSA* = "ViewDetails"
  CMDSTR_NEWFOLDERW* = "NewFolder"
  CMDSTR_VIEWLISTW* = "ViewList"
  CMDSTR_VIEWDETAILSW* = "ViewDetails"
  CMIC_MASK_HOTKEY* = SEE_MASK_HOTKEY
  CMIC_MASK_ICON* = SEE_MASK_ICON
  CMIC_MASK_FLAG_NO_UI* = SEE_MASK_FLAG_NO_UI
  CMIC_MASK_UNICODE* = SEE_MASK_UNICODE
  CMIC_MASK_NO_CONSOLE* = SEE_MASK_NO_CONSOLE
  CMIC_MASK_ASYNCOK* = SEE_MASK_ASYNCOK
  CMIC_MASK_NOASYNC* = SEE_MASK_NOASYNC
  CMIC_MASK_SHIFT_DOWN* = 0x10000000
  CMIC_MASK_CONTROL_DOWN* = 0x40000000
  CMIC_MASK_FLAG_LOG_USAGE* = SEE_MASK_FLAG_LOG_USAGE
  CMIC_MASK_NOZONECHECKS* = SEE_MASK_NOZONECHECKS
  CMIC_MASK_PTINVOKE* = 0x20000000
  IID_IContextMenu* = DEFINE_GUID(0x000214e4'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  IID_IContextMenu2* = DEFINE_GUID(0x000214f4'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  IID_IContextMenu3* = DEFINE_GUID(0xbcfce0a0'i32, 0xec17, 0x11d0, [0x8d'u8, 0x10, 0x00, 0xa0, 0xc9, 0x0f, 0x27, 0x19])
  IID_IExecuteCommand* = DEFINE_GUID(0x7f9185b0'i32, 0xcb92, 0x43c5, [0x80'u8, 0xa9, 0x92, 0x27, 0x7a, 0x4f, 0x7b, 0x54])
  IID_IPersistFolder* = DEFINE_GUID(0x000214ea'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  IRTIR_TASK_NOT_RUNNING* = 0
  IRTIR_TASK_RUNNING* = 1
  IRTIR_TASK_SUSPENDED* = 2
  IRTIR_TASK_PENDING* = 3
  IRTIR_TASK_FINISHED* = 4
  IID_IRunnableTask* = DEFINE_GUID(0x85788d00'i32, 0x6807, 0x11d0, [0xb8'u8, 0x10, 0x00, 0xc0, 0x4f, 0xd7, 0x06, 0xec])
  TOID_NULL* = GUID_NULL
  ITSAT_DEFAULT_LPARAM* = DWORD_PTR(-1)
  ITSAT_DEFAULT_PRIORITY* = 0x10000000
  ITSAT_MAX_PRIORITY* = 0x7fffffff
  ITSAT_MIN_PRIORITY* = 0x00000000
  ITSSFLAG_COMPLETE_ON_DESTROY* = 0x0
  ITSSFLAG_KILL_ON_DESTROY* = 0x1
  ITSSFLAG_FLAGS_MASK* = 0x3
  ITSS_THREAD_DESTROY_DEFAULT_TIMEOUT* = 10*1000
  ITSS_THREAD_TERMINATE_TIMEOUT* = INFINITE
  ITSS_THREAD_TIMEOUT_NO_CHANGE* = INFINITE-1
  IID_IShellTaskScheduler* = DEFINE_GUID(0x6ccb7be0'i32, 0x6807, 0x11d0, [0xb8'u8, 0x10, 0x00, 0xc0, 0x4f, 0xd7, 0x06, 0xec])
  SID_ShellTaskScheduler* = IID_IShellTaskScheduler
  IID_IQueryCodePage* = DEFINE_GUID(0xc7b236ce'i32, 0xee80, 0x11d0, [0x98'u8, 0x5f, 0x00, 0x60, 0x08, 0x05, 0x93, 0x82])
  IID_IPersistFolder2* = DEFINE_GUID(0x1ac3d9f0'i32, 0x175c, 0x11d1, [0x95'u8, 0xbe, 0x00, 0x60, 0x97, 0x97, 0xea, 0x4f])
  CSIDL_FLAG_DONT_VERIFY* = 0x4000
  CSIDL_FLAG_PFTI_TRACKTARGET* = CSIDL_FLAG_DONT_VERIFY
  IID_IPersistFolder3* = DEFINE_GUID(0xcef04fdf'i32, 0xfe72, 0x11d2, [0x87'u8, 0xa5, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xcf])
  IID_IPersistIDList* = DEFINE_GUID(0x1079acfc'i32, 0x29bd, 0x11d3, [0x8e'u8, 0x0d, 0x00, 0xc0, 0x4f, 0x68, 0x37, 0xd5])
  IID_IEnumIDList* = DEFINE_GUID(0x000214f2'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  IID_IEnumFullIDList* = DEFINE_GUID(0xd0191542'i32, 0x7954, 0x4908, [0xbc'u8, 0x06, 0xb2, 0x36, 0x0b, 0xbe, 0x45, 0xba])
  SHGDN_NORMAL* = 0x0
  SHGDN_INFOLDER* = 0x1
  SHGDN_FOREDITING* = 0x1000
  SHGDN_FORADDRESSBAR* = 0x4000
  SHGDN_FORPARSING* = 0x8000
  SHCONTF_CHECKING_FOR_CHILDREN* = 0x10
  SHCONTF_FOLDERS* = 0x20
  SHCONTF_NONFOLDERS* = 0x40
  SHCONTF_INCLUDEHIDDEN* = 0x80
  SHCONTF_INIT_ON_FIRST_NEXT* = 0x100
  SHCONTF_NETPRINTERSRCH* = 0x200
  SHCONTF_SHAREABLE* = 0x400
  SHCONTF_STORAGE* = 0x800
  SHCONTF_NAVIGATION_ENUM* = 0x1000
  SHCONTF_FASTITEMS* = 0x2000
  SHCONTF_FLATLIST* = 0x4000
  SHCONTF_ENABLE_ASYNC* = 0x8000
  SHCONTF_INCLUDESUPERHIDDEN* = 0x10000
  SHCIDS_ALLFIELDS* = 0x80000000'i32
  SHCIDS_CANONICALONLY* = 0x10000000
  SHCIDS_BITMASK* = 0xffff0000'i32
  SHCIDS_COLUMNMASK* = 0x0000ffff
  SFGAO_CANCOPY* = DROPEFFECT_COPY
  SFGAO_CANMOVE* = DROPEFFECT_MOVE
  SFGAO_CANLINK* = DROPEFFECT_LINK
  SFGAO_STORAGE* = 0x8
  SFGAO_CANRENAME* = 0x10
  SFGAO_CANDELETE* = 0x20
  SFGAO_HASPROPSHEET* = 0x40
  SFGAO_DROPTARGET* = 0x100
  SFGAO_CAPABILITYMASK* = 0x177
  SFGAO_SYSTEM* = 0x1000
  SFGAO_ENCRYPTED* = 0x2000
  SFGAO_ISSLOW* = 0x4000
  SFGAO_GHOSTED* = 0x8000
  SFGAO_LINK* = 0x10000
  SFGAO_SHARE* = 0x20000
  SFGAO_READONLY* = 0x40000
  SFGAO_HIDDEN* = 0x80000
  SFGAO_DISPLAYATTRMASK* = 0xfc000
  SFGAO_FILESYSANCESTOR* = 0x10000000
  SFGAO_FOLDER* = 0x20000000
  SFGAO_FILESYSTEM* = 0x40000000
  SFGAO_HASSUBFOLDER* = 0x80000000'i32
  SFGAO_CONTENTSMASK* = 0x80000000'i32
  SFGAO_VALIDATE* = 0x1000000
  SFGAO_REMOVABLE* = 0x2000000
  SFGAO_COMPRESSED* = 0x4000000
  SFGAO_BROWSABLE* = 0x8000000
  SFGAO_NONENUMERATED* = 0x100000
  SFGAO_NEWCONTENT* = 0x200000
  SFGAO_CANMONIKER* = 0x400000
  SFGAO_HASSTORAGE* = 0x400000
  SFGAO_STREAM* = 0x400000
  SFGAO_STORAGEANCESTOR* = 0x00800000
  SFGAO_STORAGECAPMASK* = 0x70c50008
  SFGAO_PKEYSFGAOMASK* = 0x81044000'i32
  STR_BIND_FORCE_FOLDER_SHORTCUT_RESOLVE* = "Force Folder Shortcut Resolve"
  STR_AVOID_DRIVE_RESTRICTION_POLICY* = "Avoid Drive Restriction Policy"
  STR_SKIP_BINDING_CLSID* = "Skip Binding CLSID"
  STR_PARSE_PREFER_FOLDER_BROWSING* = "Parse Prefer Folder Browsing"
  STR_DONT_PARSE_RELATIVE* = "Don't Parse Relative"
  STR_PARSE_TRANSLATE_ALIASES* = "Parse Translate Aliases"
  STR_PARSE_SKIP_NET_CACHE* = "Skip Net Resource Cache"
  STR_PARSE_SHELL_PROTOCOL_TO_FILE_OBJECTS* = "Parse Shell Protocol To File Objects"
  STR_TRACK_CLSID* = "Track the CLSID"
  STR_INTERNAL_NAVIGATE* = "Internal Navigation"
  STR_PARSE_PROPERTYSTORE* = "DelegateNamedProperties"
  STR_NO_VALIDATE_FILENAME_CHARS* = "NoValidateFilenameChars"
  STR_BIND_DELEGATE_CREATE_OBJECT* = "Delegate Object Creation"
  STR_PARSE_ALLOW_INTERNET_SHELL_FOLDERS* = "Allow binding to Internet shell folder handlers and negate STR_PARSE_PREFER_WEB_BROWSING"
  STR_PARSE_PREFER_WEB_BROWSING* = "Do not bind to Internet shell folder handlers"
  STR_PARSE_SHOW_NET_DIAGNOSTICS_UI* = "Show network diagnostics UI"
  STR_PARSE_DONT_REQUIRE_VALIDATED_URLS* = "Do not require validated URLs"
  STR_INTERNETFOLDER_PARSE_ONLY_URLMON_BINDABLE* = "Validate UR"
  BIND_INTERRUPTABLE* = 0xffffffff'i32
  STR_BIND_FOLDERS_READ_ONLY* = "Folders As Read Only"
  STR_BIND_FOLDER_ENUM_MODE* = "Folder Enum Mode"
  FEM_VIEWRESULT* = 0
  FEM_NAVIGATION* = 1
  IID_IObjectWithFolderEnumMode* = DEFINE_GUID(0x6a9d9026'i32, 0x0e6e, 0x464c, [0xb0'u8, 0x00, 0x42, 0xec, 0xc0, 0x7d, 0xe6, 0x73])
  STR_PARSE_WITH_EXPLICIT_PROGID* = "ExplicitProgid"
  STR_PARSE_WITH_EXPLICIT_ASSOCAPP* = "ExplicitAssociationApp"
  STR_PARSE_EXPLICIT_ASSOCIATION_SUCCESSFUL* = "ExplicitAssociationSuccessful"
  STR_PARSE_AND_CREATE_ITEM* = "ParseAndCreateItem"
  STR_PROPERTYBAG_PARAM* = "SHBindCtxPropertyBag"
  STR_ENUM_ITEMS_FLAGS* = "SHCONTF"
  IID_IParseAndCreateItem* = DEFINE_GUID(0x67efed0e'i32, 0xe827, 0x4408, [0xb4'u8, 0x93, 0x78, 0xf3, 0x98, 0x2b, 0x68, 0x5c])
  STR_ITEM_CACHE_CONTEXT* = "ItemCacheContext"
  IID_IShellFolder* = DEFINE_GUID(0x000214e6'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  IID_IEnumExtraSearch* = DEFINE_GUID(0x0e700be1'i32, 0x9db6, 0x11d1, [0xa1'u8, 0xce, 0x00, 0xc0, 0x4f, 0xd7, 0x5d, 0x13])
  IID_IShellFolder2* = DEFINE_GUID(0x93f2f68c'i32, 0x1d1b, 0x11d3, [0xa3'u8, 0x0e, 0x00, 0xc0, 0x4f, 0x79, 0xab, 0xd1])
  FWF_NONE* = 0x0
  FWF_AUTOARRANGE* = 0x1
  FWF_ABBREVIATEDNAMES* = 0x2
  FWF_SNAPTOGRID* = 0x4
  FWF_OWNERDATA* = 0x8
  FWF_BESTFITWINDOW* = 0x10
  FWF_DESKTOP* = 0x20
  FWF_SINGLESEL* = 0x40
  FWF_NOSUBFOLDERS* = 0x80
  FWF_TRANSPARENT* = 0x100
  FWF_NOCLIENTEDGE* = 0x200
  FWF_NOSCROLL* = 0x400
  FWF_ALIGNLEFT* = 0x800
  FWF_NOICONS* = 0x1000
  FWF_SHOWSELALWAYS* = 0x2000
  FWF_NOVISIBLE* = 0x4000
  FWF_SINGLECLICKACTIVATE* = 0x8000
  FWF_NOWEBVIEW* = 0x10000
  FWF_HIDEFILENAMES* = 0x20000
  FWF_CHECKSELECT* = 0x40000
  FWF_NOENUMREFRESH* = 0x80000
  FWF_NOGROUPING* = 0x100000
  FWF_FULLROWSELECT* = 0x200000
  FWF_NOFILTERS* = 0x400000
  FWF_NOCOLUMNHEADER* = 0x800000
  FWF_NOHEADERINALLVIEWS* = 0x1000000
  FWF_EXTENDEDTILES* = 0x2000000
  FWF_TRICHECKSELECT* = 0x4000000
  FWF_AUTOCHECKSELECT* = 0x8000000
  FWF_NOBROWSERVIEWSTATE* = 0x10000000
  FWF_SUBSETGROUPS* = 0x20000000
  FWF_USESEARCHFOLDER* = 0x40000000
  FWF_ALLOWRTLREADING* = 0x80000000'i32
  FVM_AUTO* = -1
  FVM_FIRST* = 1
  FVM_ICON* = 1
  FVM_SMALLICON* = 2
  FVM_LIST* = 3
  FVM_DETAILS* = 4
  FVM_THUMBNAIL* = 5
  FVM_TILE* = 6
  FVM_THUMBSTRIP* = 7
  FVM_CONTENT* = 8
  FVM_LAST* = 8
  FLVM_UNSPECIFIED* = -1
  FLVM_FIRST* = 1
  FLVM_DETAILS* = 1
  FLVM_TILES* = 2
  FLVM_ICONS* = 3
  FLVM_LIST* = 4
  FLVM_CONTENT* = 5
  FLVM_LAST* = 5
  FVO_DEFAULT* = 0x0
  FVO_VISTALAYOUT* = 0x1
  FVO_CUSTOMPOSITION* = 0x2
  FVO_CUSTOMORDERING* = 0x4
  FVO_SUPPORTHYPERLINKS* = 0x8
  FVO_NOANIMATIONS* = 0x10
  FVO_NOSCROLLTIPS* = 0x20
  IID_IFolderViewOptions* = DEFINE_GUID(0x3cc974d2'i32, 0xb302, 0x4d36, [0xad'u8, 0x3e, 0x06, 0xd9, 0x3f, 0x69, 0x5d, 0x3f])
  SVSI_DESELECT* = 0x0
  SVSI_SELECT* = 0x1
  SVSI_EDIT* = 0x3
  SVSI_DESELECTOTHERS* = 0x4
  SVSI_ENSUREVISIBLE* = 0x8
  SVSI_FOCUSED* = 0x10
  SVSI_TRANSLATEPT* = 0x20
  SVSI_SELECTIONMARK* = 0x40
  SVSI_POSITIONITEM* = 0x80
  SVSI_CHECK* = 0x100
  SVSI_CHECK2* = 0x200
  SVSI_KEYBOARDSELECT* = 0x401
  SVSI_NOTAKEFOCUS* = 0x40000000
  SVSI_NOSTATECHANGE* = UINT 0x80000000'i32
  SVGIO_BACKGROUND* = 0x0
  SVGIO_SELECTION* = 0x1
  SVGIO_ALLVIEW* = 0x2
  SVGIO_CHECKED* = 0x3
  SVGIO_TYPE_MASK* = 0xf
  SVGIO_FLAG_VIEWORDER* = 0x80000000'i32
  SVUIA_DEACTIVATE* = 0
  SVUIA_ACTIVATE_NOFOCUS* = 1
  SVUIA_ACTIVATE_FOCUS* = 2
  SVUIA_INPLACEACTIVATE* = 3
  IID_IShellView* = DEFINE_GUID(0x000214e3'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  SV2GV_CURRENTVIEW* = UINT(-1)
  SV2GV_DEFAULTVIEW* = UINT(-2)
  IID_IShellView2* = DEFINE_GUID(0x88e39e80'i32, 0x3578, 0x11cf, [0xae'u8, 0x69, 0x08, 0x00, 0x2b, 0x2e, 0x12, 0x62])
  SV3CVW3_DEFAULT* = 0x0
  SV3CVW3_NONINTERACTIVE* = 0x1
  SV3CVW3_FORCEVIEWMODE* = 0x2
  SV3CVW3_FORCEFOLDERFLAGS* = 0x4
  IID_IShellView3* = DEFINE_GUID(0xec39fa88'i32, 0xf8af, 0x41c5, [0x84'u8, 0x21, 0x38, 0xbe, 0xd2, 0x8f, 0x46, 0x73])
  IID_IFolderView* = DEFINE_GUID(0xcde725b0'i32, 0xccc9, 0x4519, [0x91'u8, 0x7e, 0x32, 0x5d, 0x72, 0xfa, 0xb4, 0xce])
  SID_SFolderView* = IID_IFolderView
  IID_ISearchBoxInfo* = DEFINE_GUID(0x6af6e03f'i32, 0xd664, 0x4ef4, [0x96'u8, 0x26, 0xf7, 0xe0, 0xed, 0x36, 0x75, 0x5e])
  SORT_DESCENDING* = -1
  SORT_ASCENDING* = 1
  FVST_EMPTYTEXT* = 0
  IID_IFolderView2* = DEFINE_GUID(0x1af3a467'i32, 0x214f, 0x4298, [0x90'u8, 0x8e, 0x06, 0xb0, 0x3e, 0x0b, 0x39, 0xf9])
  IID_IFolderViewSettings* = DEFINE_GUID(0xae8c987d'i32, 0x8797, 0x4ed3, [0xbe'u8, 0x72, 0x2a, 0x47, 0xdd, 0x93, 0x8d, 0xb0])
  IID_IPreviewHandlerVisuals* = DEFINE_GUID(0x196bf9a5'i32, 0xb346, 0x4ef0, [0xaa'u8, 0x1e, 0x5d, 0xcd, 0xb7, 0x67, 0x68, 0xb1])
  VPWF_DEFAULT* = 0x0
  VPWF_ALPHABLEND* = 0x1
  VPCF_TEXT* = 1
  VPCF_BACKGROUND* = 2
  VPCF_SORTCOLUMN* = 3
  VPCF_SUBTEXT* = 4
  VPCF_TEXTBACKGROUND* = 5
  IID_IVisualProperties* = DEFINE_GUID(0xe693cf68'i32, 0xd967, 0x4112, [0x87'u8, 0x63, 0x99, 0x17, 0x2a, 0xee, 0x5e, 0x5a])
  CDBOSC_SETFOCUS* = 0x00000000
  CDBOSC_KILLFOCUS* = 0x00000001
  CDBOSC_SELCHANGE* = 0x00000002
  CDBOSC_RENAME* = 0x00000003
  CDBOSC_STATECHANGE* = 0x00000004
  IID_ICommDlgBrowser* = DEFINE_GUID(0x000214f1'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  SID_SExplorerBrowserFrame* = IID_ICommDlgBrowser
  CDB2N_CONTEXTMENU_DONE* = 0x00000001
  CDB2N_CONTEXTMENU_START* = 0x00000002
  CDB2GVF_SHOWALLFILES* = 0x1
  CDB2GVF_ISFILESAVE* = 0x2
  CDB2GVF_ALLOWPREVIEWPANE* = 0x4
  CDB2GVF_NOSELECTVERB* = 0x8
  CDB2GVF_NOINCLUDEITEM* = 0x10
  CDB2GVF_ISFOLDERPICKER* = 0x20
  CDB2GVF_ADDSHIELD* = 0x40
  IID_ICommDlgBrowser2* = DEFINE_GUID(0x10339516'i32, 0x2894, 0x11d2, [0x90'u8, 0x39, 0x00, 0xc0, 0x4f, 0x8e, 0xeb, 0x3e])
  IID_ICommDlgBrowser3* = DEFINE_GUID(0xc8ad25a1'i32, 0x3294, 0x41ee, [0x81'u8, 0x65, 0x71, 0x17, 0x4b, 0xd0, 0x1c, 0x57])
  CM_MASK_WIDTH* = 0x1
  CM_MASK_DEFAULTWIDTH* = 0x2
  CM_MASK_IDEALWIDTH* = 0x4
  CM_MASK_NAME* = 0x8
  CM_MASK_STATE* = 0x10
  CM_STATE_NONE* = 0x0
  CM_STATE_VISIBLE* = 0x1
  CM_STATE_FIXEDWIDTH* = 0x2
  CM_STATE_NOSORTBYFOLDERNESS* = 0x4
  CM_STATE_ALWAYSVISIBLE* = 0x8
  CM_ENUM_ALL* = 0x1
  CM_ENUM_VISIBLE* = 0x2
  CM_WIDTH_USEDEFAULT* = -1
  CM_WIDTH_AUTOSIZE* = -2
  IID_IColumnManager* = DEFINE_GUID(0xd8ec27bb'i32, 0x3f3b, 0x4042, [0xb1'u8, 0x0a, 0x4a, 0xcf, 0xd9, 0x24, 0xd4, 0x53])
  IID_IFolderFilterSite* = DEFINE_GUID(0xc0a651f5'i32, 0xb48b, 0x11d2, [0xb5'u8, 0xed, 0x00, 0x60, 0x97, 0xc6, 0x86, 0xf6])
  IID_IFolderFilter* = DEFINE_GUID(0x9cc22886'i32, 0xdc8e, 0x11d2, [0xb1'u8, 0xd0, 0x00, 0xc0, 0x4f, 0x8e, 0xeb, 0x3e])
  IID_IInputObjectSite* = DEFINE_GUID(0xf1db8392'i32, 0x7331, 0x11d0, [0x8c'u8, 0x99, 0x00, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8])
  IID_IInputObject* = DEFINE_GUID(0x68284faa'i32, 0x6a48, 0x11d0, [0x8c'u8, 0x78, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0xb4])
  IID_IInputObject2* = DEFINE_GUID(0x6915c085'i32, 0x510b, 0x44cd, [0x94'u8, 0xaf, 0x28, 0xdf, 0xa5, 0x6c, 0xf9, 0x2b])
  IID_IShellIcon* = DEFINE_GUID(0x000214e5'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  SBSP_DEFBROWSER* = 0x0000
  SBSP_SAMEBROWSER* = 0x0001
  SBSP_NEWBROWSER* = 0x0002
  SBSP_DEFMODE* = 0x0000
  SBSP_OPENMODE* = 0x0010
  SBSP_EXPLOREMODE* = 0x0020
  SBSP_HELPMODE* = 0x0040
  SBSP_NOTRANSFERHIST* = 0x0080
  SBSP_ABSOLUTE* = 0x0000
  SBSP_RELATIVE* = 0x1000
  SBSP_PARENT* = 0x2000
  SBSP_NAVIGATEBACK* = 0x4000
  SBSP_NAVIGATEFORWARD* = 0x8000
  SBSP_ALLOW_AUTONAVIGATE* = 0x00010000
  SBSP_KEEPSAMETEMPLATE* = 0x00020000
  SBSP_KEEPWORDWHEELTEXT* = 0x00040000
  SBSP_ACTIVATE_NOFOCUS* = 0x00080000
  SBSP_CREATENOHISTORY* = 0x00100000
  SBSP_PLAYNOSOUND* = 0x00200000
  SBSP_CALLERUNTRUSTED* = 0x00800000
  SBSP_TRUSTFIRSTDOWNLOAD* = 0x01000000
  SBSP_UNTRUSTEDFORDOWNLOAD* = 0x02000000
  SBSP_NOAUTOSELECT* = 0x04000000
  SBSP_WRITENOHISTORY* = 0x08000000
  SBSP_TRUSTEDFORACTIVEX* = 0x10000000
  SBSP_FEEDNAVIGATION* = 0x20000000
  SBSP_REDIRECT* = 0x40000000
  SBSP_INITIATEDBYHLINKFRAME* = 0x80000000'i32
  FCW_STATUS* = 0x0001
  FCW_TOOLBAR* = 0x0002
  FCW_TREE* = 0x0003
  FCW_INTERNETBAR* = 0x0006
  FCW_PROGRESS* = 0x0008
  FCT_MERGE* = 0x0001
  FCT_CONFIGABLE* = 0x0002
  FCT_ADDTOEND* = 0x0004
  IID_IProfferService* = DEFINE_GUID(0xcb728b20'i32, 0xf786, 0x11ce, [0x92'u8, 0xad, 0x00, 0xaa, 0x00, 0xa7, 0x4c, 0xd0])
  SID_SProfferService* = IID_IProfferService
  STR_DONT_RESOLVE_LINK* = "Don't Resolve Link"
  STR_GET_ASYNC_HANDLER* = "GetAsyncHandler"
  SIGDN_NORMALDISPLAY* = 0x0
  SIGDN_PARENTRELATIVEPARSING* = int32 0x80018001'i32
  SIGDN_DESKTOPABSOLUTEPARSING* = int32 0x80028000'i32
  SIGDN_PARENTRELATIVEEDITING* = int32 0x80031001'i32
  SIGDN_DESKTOPABSOLUTEEDITING* = int32 0x8004c000'i32
  SIGDN_FILESYSPATH* = int32 0x80058000'i32
  SIGDN_URL* = int32 0x80068000'i32
  SIGDN_PARENTRELATIVEFORADDRESSBAR* = int32 0x8007c001'i32
  SIGDN_PARENTRELATIVE* = int32 0x80080001'i32
  SIGDN_PARENTRELATIVEFORUI* = int32 0x80094001'i32
  SICHINT_DISPLAY* = 0x0
  SICHINT_ALLFIELDS* = int32 0x80000000'i32
  SICHINT_CANONICAL* = 0x10000000
  SICHINT_TEST_FILESYSPATH_IF_NOT_EQUAL* = 0x20000000
  IID_IShellItem* = DEFINE_GUID(0x43826d1e'i32, 0xe718, 0x42ee, [0xbc'u8, 0x55, 0xa1, 0xe2, 0x61, 0xc3, 0x7b, 0xfe])
  DOGIF_DEFAULT* = 0x0
  DOGIF_TRAVERSE_LINK* = 0x1
  DOGIF_NO_HDROP* = 0x2
  DOGIF_NO_URL* = 0x4
  DOGIF_ONLY_IF_ONE* = 0x8
  STR_GPS_HANDLERPROPERTIESONLY* = "GPS_HANDLERPROPERTIESONLY"
  STR_GPS_FASTPROPERTIESONLY* = "GPS_FASTPROPERTIESONLY"
  STR_GPS_OPENSLOWITEM* = "GPS_OPENSLOWITEM"
  STR_GPS_DELAYCREATION* = "GPS_DELAYCREATION"
  STR_GPS_BESTEFFORT* = "GPS_BESTEFFORT"
  STR_GPS_NO_OPLOCK* = "GPS_NO_OPLOCK"
  IID_IShellItem2* = DEFINE_GUID(0x7e9fb0d3'i32, 0x919f, 0x4307, [0xab'u8, 0x2e, 0x9b, 0x18, 0x60, 0x31, 0x0c, 0x93])
  SIIGBF_RESIZETOFIT* = 0x0
  SIIGBF_BIGGERSIZEOK* = 0x1
  SIIGBF_MEMORYONLY* = 0x2
  SIIGBF_ICONONLY* = 0x4
  SIIGBF_THUMBNAILONLY* = 0x8
  SIIGBF_INCACHEONLY* = 0x10
  SIIGBF_CROPTOSQUARE* = 0x20
  SIIGBF_WIDETHUMBNAILS* = 0x40
  SIIGBF_ICONBACKGROUND* = 0x80
  SIIGBF_SCALEUP* = 0x100
  IID_IShellItemImageFactory* = DEFINE_GUID(0xbcc18b79'i32, 0xba16, 0x442f, [0x80'u8, 0xc4, 0x8a, 0x59, 0xc3, 0x0c, 0x46, 0x3b])
  IID_IUserAccountChangeCallback* = DEFINE_GUID(0xa561e69a'i32, 0xb4b8, 0x4113, [0x91'u8, 0xa5, 0x64, 0xc6, 0xbc, 0xca, 0x34, 0x30])
  IID_IEnumShellItems* = DEFINE_GUID(0x70629033'i32, 0xe363, 0x4a28, [0xa5'u8, 0x67, 0x0d, 0xb7, 0x80, 0x06, 0xe6, 0xd7])
  STGOP_MOVE* = 1
  STGOP_COPY* = 2
  STGOP_SYNC* = 3
  STGOP_REMOVE* = 5
  STGOP_RENAME* = 6
  STGOP_APPLYPROPERTIES* = 8
  STGOP_NEW* = 10
  TSF_NORMAL* = 0x0
  TSF_FAIL_EXIST* = 0x0
  TSF_RENAME_EXIST* = 0x1
  TSF_OVERWRITE_EXIST* = 0x2
  TSF_ALLOW_DECRYPTION* = 0x4
  TSF_NO_SECURITY* = 0x8
  TSF_COPY_CREATION_TIME* = 0x10
  TSF_COPY_WRITE_TIME* = 0x20
  TSF_USE_FULL_ACCESS* = 0x40
  TSF_DELETE_RECYCLE_IF_POSSIBLE* = 0x80
  TSF_COPY_HARD_LINK* = 0x100
  TSF_COPY_LOCALIZED_NAME* = 0x200
  TSF_MOVE_AS_COPY_DELETE* = 0x400
  TSF_SUSPEND_SHELLEVENTS* = 0x800
  TS_NONE* = 0x0
  TS_PERFORMING* = 0x1
  TS_PREPARING* = 0x2
  TS_INDETERMINATE* = 0x4
  IID_ITransferAdviseSink* = DEFINE_GUID(0xd594d0d8'i32, 0x8da7, 0x457b, [0xb3'u8, 0xb4, 0xce, 0x5d, 0xba, 0xac, 0x0b, 0x88])
  IID_ITransferSource* = DEFINE_GUID(0x00adb003'i32, 0xbde9, 0x45c6, [0x8e'u8, 0x29, 0xd0, 0x9f, 0x93, 0x53, 0xe1, 0x08])
  IID_IEnumResources* = DEFINE_GUID(0x2dd81fe3'i32, 0xa83c, 0x4da9, [0xa3'u8, 0x30, 0x47, 0x24, 0x9d, 0x34, 0x5b, 0xa1])
  IID_IShellItemResources* = DEFINE_GUID(0xff5693be'i32, 0x2ce0, 0x4d48, [0xb5'u8, 0xc5, 0x40, 0x81, 0x7d, 0x1a, 0xcd, 0xb9])
  IID_ITransferDestination* = DEFINE_GUID(0x48addd32'i32, 0x3ca5, 0x4124, [0xab'u8, 0xe3, 0xb5, 0xa7, 0x25, 0x31, 0xb2, 0x07])
  IID_IStreamAsync* = DEFINE_GUID(0xfe0b6665'i32, 0xe0ca, 0x49b9, [0xa1'u8, 0x78, 0x2b, 0x5c, 0xb4, 0x8d, 0x92, 0xa5])
  IID_IStreamUnbufferedInfo* = DEFINE_GUID(0x8a68fdda'i32, 0x1fdc, 0x4c20, [0x8c'u8, 0xeb, 0x41, 0x66, 0x43, 0xb5, 0xa6, 0x25])
  IID_IFileOperationProgressSink* = DEFINE_GUID(0x04b0f1a7'i32, 0x9490, 0x44bc, [0x96'u8, 0xe1, 0x42, 0x96, 0xa3, 0x12, 0x52, 0xe2])
  SIATTRIBFLAGS_AND* = 0x1
  SIATTRIBFLAGS_OR* = 0x2
  SIATTRIBFLAGS_APPCOMPAT* = 0x3
  SIATTRIBFLAGS_MASK* = 0x3
  SIATTRIBFLAGS_ALLITEMS* = 0x4000
  IID_IShellItemArray* = DEFINE_GUID(0xb63ea76d'i32, 0x1f85, 0x456f, [0xa1'u8, 0x9c, 0x48, 0x15, 0x9e, 0xfa, 0x85, 0x8b])
  IID_IInitializeWithItem* = DEFINE_GUID(0x7f73be3f'i32, 0xfb79, 0x493c, [0xa6'u8, 0xc7, 0x7e, 0xe1, 0x4e, 0x24, 0x58, 0x41])
  IID_IObjectWithSelection* = DEFINE_GUID(0x1c9cd5bb'i32, 0x98e9, 0x4491, [0xa6'u8, 0x0f, 0x31, 0xaa, 0xcc, 0x72, 0xb8, 0x3c])
  IID_IObjectWithBackReferences* = DEFINE_GUID(0x321a6a6a'i32, 0xd61f, 0x4bf3, [0x97'u8, 0xae, 0x14, 0xbe, 0x29, 0x86, 0xbb, 0x36])
  PUIFNF_DEFAULT* = 0x0
  PUIFNF_MNEMONIC* = 0x1
  PUIF_DEFAULT* = 0x0
  PUIF_RIGHTALIGN* = 0x1
  PUIF_NOLABELININFOTIP* = 0x2
  PUIFFDF_DEFAULT* = 0x0
  PUIFFDF_RIGHTTOLEFT* = 0x1
  PUIFFDF_SHORTFORMAT* = 0x2
  PUIFFDF_NOTIME* = 0x4
  PUIFFDF_FRIENDLYDATE* = 0x8
  IID_IPropertyUI* = DEFINE_GUID(0x757a7d9f'i32, 0x919a, 0x4118, [0x99'u8, 0xd7, 0xdb, 0xb2, 0x08, 0xc8, 0xcc, 0x66])
  IID_ICategoryProvider* = DEFINE_GUID(0x9af64809'i32, 0x5864, 0x4c26, [0xa7'u8, 0x20, 0xc1, 0xf7, 0x8c, 0x08, 0x6e, 0xe3])
  CATINFO_NORMAL* = 0x0
  CATINFO_COLLAPSED* = 0x1
  CATINFO_HIDDEN* = 0x2
  CATINFO_EXPANDED* = 0x4
  CATINFO_NOHEADER* = 0x8
  CATINFO_NOTCOLLAPSIBLE* = 0x10
  CATINFO_NOHEADERCOUNT* = 0x20
  CATINFO_SUBSETTED* = 0x40
  CATSORT_DEFAULT* = 0x0
  CATSORT_NAME* = 0x1
  IID_ICategorizer* = DEFINE_GUID(0xa3b14589'i32, 0x9174, 0x49a8, [0x89'u8, 0xa3, 0x06, 0xa1, 0xae, 0x2b, 0x9b, 0xa7])
  DI_GETDRAGIMAGE* = "ShellGetDragImage"
  IID_IDropTargetHelper* = DEFINE_GUID(0x4657278b'i32, 0x411b, 0x11d2, [0x83'u8, 0x9a, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0xd0])
  IID_IDragSourceHelper* = DEFINE_GUID(0xde5bf786'i32, 0x477a, 0x11d2, [0x83'u8, 0x9d, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0xd0])
  DSH_ALLOWDROPDESCRIPTIONTEXT* = 0x1
  IID_IDragSourceHelper2* = DEFINE_GUID(0x83e07d0d'i32, 0x0c5f, 0x4163, [0xbf'u8, 0x1a, 0x60, 0xb2, 0x74, 0x05, 0x1e, 0x40])
  SLR_NO_UI* = 0x1
  SLR_ANY_MATCH* = 0x2
  SLR_UPDATE* = 0x4
  SLR_NOUPDATE* = 0x8
  SLR_NOSEARCH* = 0x10
  SLR_NOTRACK* = 0x20
  SLR_NOLINKINFO* = 0x40
  SLR_INVOKE_MSI* = 0x80
  SLR_NO_UI_WITH_MSG_PUMP* = 0x101
  SLR_OFFER_DELETE_WITHOUT_FILE* = 0x200
  SLR_KNOWNFOLDER* = 0x400
  SLR_MACHINE_IN_LOCAL_TARGET* = 0x800
  SLR_UPDATE_MACHINE_AND_SID* = 0x1000
  SLGP_SHORTPATH* = 0x1
  SLGP_UNCPRIORITY* = 0x2
  SLGP_RAWPATH* = 0x4
  SLGP_RELATIVEPRIORITY* = 0x8
  IID_IShellLinkA* = DEFINE_GUID(0x000214ee'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  IID_IShellLinkDataList* = DEFINE_GUID(0x45e2b4ae'i32, 0xb1c3, 0x11d0, [0xb9'u8, 0x2f, 0x00, 0xa0, 0xc9, 0x03, 0x12, 0xe1])
  IID_IResolveShellLink* = DEFINE_GUID(0x5cd52983'i32, 0x9449, 0x11d2, [0x96'u8, 0x3a, 0x00, 0xc0, 0x4f, 0x79, 0xad, 0xf0])
  SPINITF_NORMAL* = 0x0
  SPINITF_MODAL* = 0x1
  SPINITF_NOMINIMIZE* = 0x8
  IID_IActionProgressDialog* = DEFINE_GUID(0x49ff1172'i32, 0xeadc, 0x446d, [0x92'u8, 0x85, 0x15, 0x64, 0x53, 0xa6, 0x43, 0x1c])
  IID_IHWEventHandler* = DEFINE_GUID(0xc1fb73d0'i32, 0xec3a, 0x4ba2, [0xb5'u8, 0x12, 0x8c, 0xdb, 0x91, 0x87, 0xb6, 0xd1])
  IID_IHWEventHandler2* = DEFINE_GUID(0xcfcc809f'i32, 0x295d, 0x42e8, [0x9f'u8, 0xfc, 0x42, 0x4b, 0x33, 0xc4, 0x87, 0xe6])
  ARCONTENT_AUTORUNINF* = 0x00000002
  ARCONTENT_AUDIOCD* = 0x00000004
  ARCONTENT_DVDMOVIE* = 0x00000008
  ARCONTENT_BLANKCD* = 0x00000010
  ARCONTENT_BLANKDVD* = 0x00000020
  ARCONTENT_UNKNOWNCONTENT* = 0x00000040
  ARCONTENT_AUTOPLAYPIX* = 0x00000080
  ARCONTENT_AUTOPLAYMUSIC* = 0x00000100
  ARCONTENT_AUTOPLAYVIDEO* = 0x00000200
  ARCONTENT_VCD* = 0x00000400
  ARCONTENT_SVCD* = 0x00000800
  ARCONTENT_DVDAUDIO* = 0x00001000
  ARCONTENT_BLANKBD* = 0x00002000
  ARCONTENT_BLURAY* = 0x00004000
  ARCONTENT_CAMERASTORAGE* = 0x00008000
  ARCONTENT_CUSTOMEVENT* = 0x00010000
  ARCONTENT_NONE* = 0x00000000
  ARCONTENT_MASK* = 0x0001FFFE
  ARCONTENT_PHASE_UNKNOWN* = 0x00000000
  ARCONTENT_PHASE_PRESNIFF* = 0x10000000
  ARCONTENT_PHASE_SNIFFING* = 0x20000000
  ARCONTENT_PHASE_FINAL* = 0x40000000
  ARCONTENT_PHASE_MASK* = 0x70000000
  IID_IQueryCancelAutoPlay* = DEFINE_GUID(0xddefe873'i32, 0x6997, 0x4e68, [0xbe'u8, 0x26, 0x39, 0xb6, 0x33, 0xad, 0xbe, 0x12])
  IID_IDynamicHWHandler* = DEFINE_GUID(0xdc2601d7'i32, 0x059e, 0x42fc, [0xa0'u8, 0x9d, 0x2a, 0xfd, 0x21, 0xb6, 0xd5, 0xf7])
  SPBEGINF_NORMAL* = 0x0
  SPBEGINF_AUTOTIME* = 0x2
  SPBEGINF_NOPROGRESSBAR* = 0x10
  SPBEGINF_MARQUEEPROGRESS* = 0x20
  SPBEGINF_NOCANCELBUTTON* = 0x40
  SPACTION_NONE* = 0
  SPACTION_MOVING* = 1
  SPACTION_COPYING* = 2
  SPACTION_RECYCLING* = 3
  SPACTION_APPLYINGATTRIBS* = 4
  SPACTION_DOWNLOADING* = 5
  SPACTION_SEARCHING_INTERNET* = 6
  SPACTION_CALCULATING* = 7
  SPACTION_UPLOADING* = 8
  SPACTION_SEARCHING_FILES* = 9
  SPACTION_DELETING* = 10
  SPACTION_RENAMING* = 11
  SPACTION_FORMATTING* = 12
  SPACTION_COPY_MOVING* = 13
  SPTEXT_ACTIONDESCRIPTION* = 1
  SPTEXT_ACTIONDETAIL* = 2
  IID_IActionProgress* = DEFINE_GUID(0x49ff1173'i32, 0xeadc, 0x446d, [0x92'u8, 0x85, 0x15, 0x64, 0x53, 0xa6, 0x43, 0x1c])
  IID_IShellExtInit* = DEFINE_GUID(0x000214e8'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  EXPPS_FILETYPES* = 0x1
  IID_IShellPropSheetExt* = DEFINE_GUID(0x000214e9'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  IID_IRemoteComputer* = DEFINE_GUID(0x000214fe'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  IID_IQueryContinue* = DEFINE_GUID(0x7307055c'i32, 0xb24a, 0x486b, [0x9f'u8, 0x25, 0x16, 0x3e, 0x59, 0x7a, 0x28, 0xa9])
  IID_IObjectWithCancelEvent* = DEFINE_GUID(0xf279b885'i32, 0x0ae9, 0x4b85, [0xac'u8, 0x06, 0xdd, 0xec, 0xf9, 0x40, 0x89, 0x41])
  IID_IUserNotification* = DEFINE_GUID(0xba9711ba'i32, 0x5893, 0x4787, [0xa7'u8, 0xe1, 0x41, 0x27, 0x71, 0x51, 0x55, 0x0b])
  IID_IUserNotificationCallback* = DEFINE_GUID(0x19108294'i32, 0x0441, 0x4aff, [0x80'u8, 0x13, 0xfa, 0x0a, 0x73, 0x0b, 0x0b, 0xea])
  IID_IUserNotification2* = DEFINE_GUID(0x215913cc'i32, 0x57eb, 0x4fab, [0xab'u8, 0x5a, 0xe5, 0xfa, 0x7b, 0xea, 0x2a, 0x6c])
  IID_IItemNameLimits* = DEFINE_GUID(0x1df0d7f1'i32, 0xb267, 0x4d28, [0x8b'u8, 0x10, 0x12, 0xe2, 0x32, 0x02, 0xa5, 0xc4])
  IID_ISearchFolderItemFactory* = DEFINE_GUID(0xa0ffbc28'i32, 0x5482, 0x4366, [0xbe'u8, 0x27, 0x3e, 0x81, 0xe7, 0x8e, 0x06, 0xc2])
  IEI_PRIORITY_MAX* = ITSAT_MAX_PRIORITY
  IEI_PRIORITY_MIN* = ITSAT_MIN_PRIORITY
  IEIT_PRIORITY_NORMAL* = ITSAT_DEFAULT_PRIORITY
  IEIFLAG_ASYNC* = 0x0001
  IEIFLAG_CACHE* = 0x0002
  IEIFLAG_ASPECT* = 0x0004
  IEIFLAG_OFFLINE* = 0x0008
  IEIFLAG_GLEAM* = 0x0010
  IEIFLAG_SCREEN* = 0x0020
  IEIFLAG_ORIGSIZE* = 0x0040
  IEIFLAG_NOSTAMP* = 0x0080
  IEIFLAG_NOBORDER* = 0x0100
  IEIFLAG_QUALITY* = 0x0200
  IEIFLAG_REFRESH* = 0x0400
  IID_IExtractImage* = DEFINE_GUID(0xbb2e617c'i32, 0x0920, 0x11d1, [0x9a'u8, 0x0b, 0x00, 0xc0, 0x4f, 0xc2, 0xd6, 0xc1])
  IID_IExtractImage2* = DEFINE_GUID(0x953bb1ee'i32, 0x93b4, 0x11d1, [0x98'u8, 0xa3, 0x00, 0xc0, 0x4f, 0xb6, 0x87, 0xda])
  IID_IThumbnailHandlerFactory* = DEFINE_GUID(0xe35b4b2e'i32, 0x00da, 0x4bc1, [0x9f'u8, 0x13, 0x38, 0xbc, 0x11, 0xf5, 0xd4, 0x17])
  IID_IParentAndItem* = DEFINE_GUID(0xb3a4b685'i32, 0xb685, 0x4805, [0x99'u8, 0xd9, 0x5d, 0xea, 0xd2, 0x87, 0x32, 0x36])
  IID_IDockingWindow* = DEFINE_GUID(0x012dd920'i32, 0x7b26, 0x11d0, [0x8c'u8, 0xa9, 0x00, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8])
  DBIM_MINSIZE* = 0x0001
  DBIM_MAXSIZE* = 0x0002
  DBIM_INTEGRAL* = 0x0004
  DBIM_ACTUAL* = 0x0008
  DBIM_TITLE* = 0x0010
  DBIM_MODEFLAGS* = 0x0020
  DBIM_BKCOLOR* = 0x0040
  DBIMF_NORMAL* = 0x0000
  DBIMF_FIXED* = 0x0001
  DBIMF_FIXEDBMP* = 0x0004
  DBIMF_VARIABLEHEIGHT* = 0x0008
  DBIMF_UNDELETEABLE* = 0x0010
  DBIMF_DEBOSSED* = 0x0020
  DBIMF_BKCOLOR* = 0x0040
  DBIMF_USECHEVRON* = 0x0080
  DBIMF_BREAK* = 0x0100
  DBIMF_ADDTOFRONT* = 0x0200
  DBIMF_TOPALIGN* = 0x0400
  DBIMF_NOGRIPPER* = 0x0800
  DBIMF_ALWAYSGRIPPER* = 0x1000
  DBIMF_NOMARGINS* = 0x2000
  DBIF_VIEWMODE_NORMAL* = 0x0000
  DBIF_VIEWMODE_VERTICAL* = 0x0001
  DBIF_VIEWMODE_FLOATING* = 0x0002
  DBIF_VIEWMODE_TRANSPARENT* = 0x0004
  DBID_BANDINFOCHANGED* = 0
  DBID_SHOWONLY* = 1
  DBID_MAXIMIZEBAND* = 2
  DBID_PUSHCHEVRON* = 3
  DBID_DELAYINIT* = 4
  DBID_FINISHINIT* = 5
  DBID_SETWINDOWTHEME* = 6
  DBID_PERMITAUTOHIDE* = 7
  DBPC_SELECTFIRST* = DWORD(-1)
  DBPC_SELECTLAST* = DWORD(-2)
  IID_IDeskBand* = DEFINE_GUID(0xeb0fe172'i32, 0x1a3a, 0x11d0, [0x89'u8, 0xb3, 0x00, 0xa0, 0xc9, 0x0a, 0x90, 0xac])
  CGID_DeskBand* = IID_IDeskBand
  IID_IDeskBandInfo* = DEFINE_GUID(0x77e425fc'i32, 0xcbf9, 0x4307, [0xba'u8, 0x6a, 0xbb, 0x57, 0x27, 0x74, 0x56, 0x61])
  IID_IDeskBand2* = DEFINE_GUID(0x79d16de4'i32, 0xabee, 0x4021, [0x8d'u8, 0x9d, 0x91, 0x69, 0xb2, 0x61, 0xd6, 0x57])
  IID_ITaskbarList* = DEFINE_GUID(0x56fdf342'i32, 0xfd6d, 0x11d0, [0x95'u8, 0x8a, 0x00, 0x60, 0x97, 0xc9, 0xa0, 0x90])
  IID_ITaskbarList2* = DEFINE_GUID(0x602d4995'i32, 0xb13a, 0x429b, [0xa6'u8, 0x6e, 0x19, 0x35, 0xe4, 0x4f, 0x43, 0x17])
  THBF_ENABLED* = 0x0
  THBF_DISABLED* = 0x1
  THBF_DISMISSONCLICK* = 0x2
  THBF_NOBACKGROUND* = 0x4
  THBF_HIDDEN* = 0x8
  THBF_NONINTERACTIVE* = 0x10
  THB_BITMAP* = 0x1
  THB_ICON* = 0x2
  THB_TOOLTIP* = 0x4
  THB_FLAGS* = 0x8
  THBN_CLICKED* = 0x1800
  TBPF_NOPROGRESS* = 0x0
  TBPF_INDETERMINATE* = 0x1
  TBPF_NORMAL* = 0x2
  TBPF_ERROR* = 0x4
  TBPF_PAUSED* = 0x8
  IID_ITaskbarList3* = DEFINE_GUID(0xea1afb91'i32, 0x9e28, 0x4b86, [0x90'u8, 0xe9, 0x9e, 0x9f, 0x8a, 0x5e, 0xef, 0xaf])
  STPF_NONE* = 0x0
  STPF_USEAPPTHUMBNAILALWAYS* = 0x1
  STPF_USEAPPTHUMBNAILWHENACTIVE* = 0x2
  STPF_USEAPPPEEKALWAYS* = 0x4
  STPF_USEAPPPEEKWHENACTIVE* = 0x8
  IID_ITaskbarList4* = DEFINE_GUID(0xc43dc798'i32, 0x95d1, 0x4bea, [0x90'u8, 0x30, 0xbb, 0x99, 0xe2, 0x98, 0x3a, 0x1a])
  IID_IStartMenuPinnedList* = DEFINE_GUID(0x4cd19ada'i32, 0x25a5, 0x4a32, [0xb3'u8, 0xb7, 0x34, 0x7b, 0xee, 0x5b, 0xe3, 0x6b])
  IID_ICDBurn* = DEFINE_GUID(0x3d73a659'i32, 0xe5d0, 0x4d42, [0xaf'u8, 0xc0, 0x51, 0x21, 0xba, 0x42, 0x5c, 0x8d])
  IDD_WIZEXTN_FIRST* = 0x5000
  IDD_WIZEXTN_LAST* = 0x5100
  IID_IWizardSite* = DEFINE_GUID(0x88960f5b'i32, 0x422f, 0x4e7b, [0x80'u8, 0x13, 0x73, 0x41, 0x53, 0x81, 0xc3, 0xc3])
  SID_WizardSite* = IID_IWizardSite
  IID_IWizardExtension* = DEFINE_GUID(0xc02ea696'i32, 0x86cc, 0x491e, [0x9b'u8, 0x23, 0x74, 0x39, 0x4a, 0x04, 0x44, 0xa8])
  IID_IWebWizardExtension* = DEFINE_GUID(0x0e6b3f66'i32, 0x98d1, 0x48c0, [0xa2'u8, 0x22, 0xfb, 0xde, 0x74, 0xe2, 0xfb, 0xc5])
  SID_WebWizardHost* = IID_IWebWizardExtension
  SHPWHF_NORECOMPRESS* = 0x00000001
  SHPWHF_NONETPLACECREATE* = 0x00000002
  SHPWHF_NOFILESELECTOR* = 0x00000004
  SHPWHF_USEMRU* = 0x00000008
  SHPWHF_ANYLOCATION* = 0x00000100
  SHPWHF_VALIDATEVIAWEBFOLDERS* = 0x00010000
  IID_IPublishingWizard* = DEFINE_GUID(0xaa9198bb'i32, 0xccec, 0x472d, [0xbe'u8, 0xed, 0x19, 0xa4, 0xf6, 0x73, 0x3f, 0x7a])
  IID_IFolderViewHost* = DEFINE_GUID(0x1ea58f02'i32, 0xd55a, 0x411d, [0xb0'u8, 0x9e, 0x9e, 0x65, 0xac, 0x21, 0x60, 0x5b])
  IID_IExplorerBrowserEvents* = DEFINE_GUID(0x361bbdc7'i32, 0xe6ee, 0x4e13, [0xbe'u8, 0x58, 0x58, 0xe2, 0x24, 0x0c, 0x81, 0x0f])
  EBO_NONE* = 0x0
  EBO_NAVIGATEONCE* = 0x1
  EBO_SHOWFRAMES* = 0x2
  EBO_ALWAYSNAVIGATE* = 0x4
  EBO_NOTRAVELLOG* = 0x8
  EBO_NOWRAPPERWINDOW* = 0x10
  EBO_HTMLSHAREPOINTVIEW* = 0x20
  EBO_NOBORDER* = 0x40
  EBO_NOPERSISTVIEWSTATE* = 0x80
  EBF_NONE* = 0x0
  EBF_SELECTFROMDATAOBJECT* = 0x100
  EBF_NODROPTARGET* = 0x200
  IID_IExplorerBrowser* = DEFINE_GUID(0xdfd3b6b5'i32, 0xc10c, 0x4be9, [0x85'u8, 0xf6, 0xa6, 0x69, 0x69, 0xf4, 0x02, 0xf6])
  IID_IAccessibleObject* = DEFINE_GUID(0x95a391c5'i32, 0x9ed4, 0x4c28, [0x84'u8, 0x01, 0xab, 0x9e, 0x06, 0x71, 0x9e, 0x11])
  IID_IResultsFolder* = DEFINE_GUID(0x96e5ae6d'i32, 0x6ae1, 0x4b1c, [0x90'u8, 0x0c, 0xc6, 0x48, 0x0e, 0xaa, 0x88, 0x28])
  IID_IEnumObjects* = DEFINE_GUID(0x2c1c7e2e'i32, 0x2d0e, 0x4059, [0x83'u8, 0x1e, 0x1e, 0x6f, 0x82, 0x33, 0x5c, 0x2e])
  OPPROGDLG_DEFAULT* = 0x0
  OPPROGDLG_ENABLEPAUSE* = 0x80
  OPPROGDLG_ALLOWUNDO* = 0x100
  OPPROGDLG_DONTDISPLAYSOURCEPATH* = 0x200
  OPPROGDLG_DONTDISPLAYDESTPATH* = 0x400
  OPPROGDLG_NOMULTIDAYESTIMATES* = 0x800
  OPPROGDLG_DONTDISPLAYLOCATIONS* = 0x1000
  PDM_DEFAULT* = 0x0
  PDM_RUN* = 0x1
  PDM_PREFLIGHT* = 0x2
  PDM_UNDOING* = 0x4
  PDM_ERRORSBLOCKING* = 0x8
  PDM_INDETERMINATE* = 0x10
  PDOPS_RUNNING* = 1
  PDOPS_PAUSED* = 2
  PDOPS_CANCELLED* = 3
  PDOPS_STOPPED* = 4
  PDOPS_ERRORS* = 5
  IID_IOperationsProgressDialog* = DEFINE_GUID(0x0c9fb851'i32, 0xe5c9, 0x43eb, [0xa3'u8, 0x70, 0xf0, 0x67, 0x7b, 0x13, 0x87, 0x4c])
  IID_IIOCancelInformation* = DEFINE_GUID(0xf5b0bf81'i32, 0x8cb5, 0x4b1b, [0x94'u8, 0x49, 0x1a, 0x15, 0x9e, 0x0c, 0x73, 0x3c])
  FOFX_NOSKIPJUNCTIONS* = 0x00010000
  FOFX_PREFERHARDLINK* = 0x00020000
  FOFX_SHOWELEVATIONPROMPT* = 0x00040000
  FOFX_RECYCLEONDELETE* = 0x00080000
  FOFX_EARLYFAILURE* = 0x00100000
  FOFX_PRESERVEFILEEXTENSIONS* = 0x00200000
  FOFX_KEEPNEWERFILE* = 0x00400000
  FOFX_NOCOPYHOOKS* = 0x00800000
  FOFX_NOMINIMIZEBOX* = 0x01000000
  FOFX_MOVEACLSACROSSVOLUMES* = 0x02000000
  FOFX_DONTDISPLAYSOURCEPATH* = 0x04000000
  FOFX_DONTDISPLAYDESTPATH* = 0x08000000
  FOFX_REQUIREELEVATION* = 0x10000000
  FOFX_ADDUNDORECORD* = 0x20000000
  FOFX_COPYASDOWNLOAD* = 0x40000000
  FOFX_DONTDISPLAYLOCATIONS* = 0x80000000'i32
  IID_IFileOperation* = DEFINE_GUID(0x947aab5f'i32, 0x0a5c, 0x4c13, [0xb4'u8, 0xd6, 0x4b, 0xf7, 0x83, 0x6f, 0xc9, 0xf8])
  IID_IObjectProvider* = DEFINE_GUID(0xa6087428'i32, 0x3be3, 0x4d73, [0xb3'u8, 0x08, 0x7c, 0x04, 0xa5, 0x40, 0xbf, 0x1a])
  IID_INamespaceWalkCB* = DEFINE_GUID(0xd92995f8'i32, 0xcf5e, 0x4a76, [0xbf'u8, 0x59, 0xea, 0xd3, 0x9e, 0xa2, 0xb9, 0x7e])
  IID_INamespaceWalkCB2* = DEFINE_GUID(0x7ac7492b'i32, 0xc38e, 0x438a, [0x87'u8, 0xdb, 0x68, 0x73, 0x78, 0x44, 0xff, 0x70])
  NSWF_DEFAULT* = 0x0
  NSWF_NONE_IMPLIES_ALL* = 0x1
  NSWF_ONE_IMPLIES_ALL* = 0x2
  NSWF_DONT_TRAVERSE_LINKS* = 0x4
  NSWF_DONT_ACCUMULATE_RESULT* = 0x8
  NSWF_TRAVERSE_STREAM_JUNCTIONS* = 0x10
  NSWF_FILESYSTEM_ONLY* = 0x20
  NSWF_SHOW_PROGRESS* = 0x40
  NSWF_FLAG_VIEWORDER* = 0x80
  NSWF_IGNORE_AUTOPLAY_HIDA* = 0x100
  NSWF_ASYNC* = 0x200
  NSWF_DONT_RESOLVE_LINKS* = 0x400
  NSWF_ACCUMULATE_FOLDERS* = 0x800
  NSWF_DONT_SORT* = 0x1000
  NSWF_USE_TRANSFER_MEDIUM* = 0x2000
  NSWF_DONT_TRAVERSE_STREAM_JUNCTIONS* = 0x4000
  NSWF_ANY_IMPLIES_ALL* = 0x8000
  NSWF_ENUMERATE_BEST_EFFORT* = 0x00010000
  NSWF_TRAVERSE_ONLY_STORAGE* = 0x00020000
  IID_INamespaceWalk* = DEFINE_GUID(0x57ced8a7'i32, 0x3f4a, 0x432c, [0x93'u8, 0x50, 0x30, 0xf2, 0x44, 0x83, 0xf7, 0x4f])
  ACDD_VISIBLE* = 0x1
  IID_IAutoCompleteDropDown* = DEFINE_GUID(0x3cd141f4'i32, 0x3c6a, 0x11d2, [0xbc'u8, 0xaa, 0x00, 0xc0, 0x4f, 0xd9, 0x29, 0xdb])
  BSID_BANDADDED* = 0
  BSID_BANDREMOVED* = 1
  BSIM_STATE* = 0x00000001
  BSIM_STYLE* = 0x00000002
  BSSF_VISIBLE* = 0x00000001
  BSSF_NOTITLE* = 0x00000002
  BSSF_UNDELETEABLE* = 0x00001000
  BSIS_AUTOGRIPPER* = 0x00000000
  BSIS_NOGRIPPER* = 0x00000001
  BSIS_ALWAYSGRIPPER* = 0x00000002
  BSIS_LEFTALIGN* = 0x00000004
  BSIS_SINGLECLICK* = 0x00000008
  BSIS_NOCONTEXTMENU* = 0x00000010
  BSIS_NODROPTARGET* = 0x00000020
  BSIS_NOCAPTION* = 0x00000040
  BSIS_PREFERNOLINEBREAK* = 0x00000080
  BSIS_LOCKED* = 0x00000100
  BSIS_PRESERVEORDERDURINGLAYOUT* = 0x00000200
  BSIS_FIXEDORDER* = 0x00000400
  IID_IBandSite* = DEFINE_GUID(0x4cf504b0'i32, 0xde96, 0x11d0, [0x8b'u8, 0x3f, 0x00, 0xa0, 0xc9, 0x11, 0xe8, 0xe5])
  SID_SBandSite* = IID_IBandSite
  CGID_BandSite* = IID_IBandSite
  IID_IModalWindow* = DEFINE_GUID(0xb4db1657'i32, 0x70d7, 0x485e, [0x8e'u8, 0x3e, 0x6f, 0xcb, 0x5a, 0x5c, 0x18, 0x02])
  PROPSTR_EXTENSIONCOMPLETIONSTATE* = "ExtensionCompletionState"
  CDBE_RET_DEFAULT* = 0x0
  CDBE_RET_DONTRUNOTHEREXTS* = 0x1
  CDBE_RET_STOPWIZARD* = 0x2
  IID_ICDBurnExt* = DEFINE_GUID(0x2271dcca'i32, 0x74fc, 0x4414, [0x8f'u8, 0xb7, 0xc5, 0x6b, 0x05, 0xac, 0xe2, 0xd7])
  SID_CDWizardHost* = IID_ICDBurnExt
  CDBE_TYPE_MUSIC* = 0x1
  CDBE_TYPE_DATA* = 0x2
  CDBE_TYPE_ALL* = int32 0xffffffff'i32
  IID_IContextMenuSite* = DEFINE_GUID(0x0811aebe'i32, 0x0b87, 0x4c54, [0x9e'u8, 0x72, 0x54, 0x8c, 0xf6, 0x49, 0x01, 0x6b])
  IID_IEnumReadyCallback* = DEFINE_GUID(0x61e00d45'i32, 0x8fff, 0x4e60, [0x92'u8, 0x4e, 0x65, 0x37, 0xb6, 0x16, 0x12, 0xdd])
  IID_IEnumerableView* = DEFINE_GUID(0x8c8bf236'i32, 0x1aec, 0x495f, [0x98'u8, 0x94, 0x91, 0xd5, 0x7c, 0x3c, 0x68, 0x6f])
  SID_EnumerableView* = IID_IEnumerableView
  IID_IInsertItem* = DEFINE_GUID(0xd2b57227'i32, 0x3d23, 0x4b95, [0x93'u8, 0xc0, 0x49, 0x2b, 0xd4, 0x54, 0xc3, 0x56])
  MBHANDCID_PIDLSELECT* = 0
  IID_IMenuBand* = DEFINE_GUID(0x568804cd'i32, 0xcbd7, 0x11d0, [0x98'u8, 0x16, 0x00, 0xc0, 0x4f, 0xd9, 0x19, 0x72])
  IID_IFolderBandPriv* = DEFINE_GUID(0x47c01f95'i32, 0xe185, 0x412c, [0xb5'u8, 0xc5, 0x4f, 0x27, 0xdf, 0x96, 0x5a, 0xea])
  IID_IRegTreeItem* = DEFINE_GUID(0xa9521922'i32, 0x0812, 0x4d44, [0x9e'u8, 0xc3, 0x7f, 0xd3, 0x8c, 0x72, 0x6f, 0x3d])
  IID_IImageRecompress* = DEFINE_GUID(0x505f1513'i32, 0x6b3e, 0x4892, [0xa2'u8, 0x72, 0x59, 0xf8, 0x88, 0x9a, 0x4d, 0x3e])
  IID_IDeskBar* = DEFINE_GUID(0xeb0fe173'i32, 0x1a3a, 0x11d0, [0x89'u8, 0xb3, 0x00, 0xa0, 0xc9, 0x0a, 0x90, 0xac])
  MPOS_EXECUTE* = 0
  MPOS_FULLCANCEL* = 1
  MPOS_CANCELLEVEL* = 2
  MPOS_SELECTLEFT* = 3
  MPOS_SELECTRIGHT* = 4
  MPOS_CHILDTRACKING* = 5
  MPPF_SETFOCUS* = 0x1
  MPPF_INITIALSELECT* = 0x2
  MPPF_NOANIMATE* = 0x4
  MPPF_KEYBOARD* = 0x10
  MPPF_REPOSITION* = 0x20
  MPPF_FORCEZORDER* = 0x40
  MPPF_FINALSELECT* = 0x80
  MPPF_TOP* = 0x20000000
  MPPF_LEFT* = 0x40000000
  MPPF_RIGHT* = 0x60000000
  MPPF_BOTTOM* = int32 0x80000000'i32
  MPPF_POS_MASK* = int32 0xe0000000'i32
  MPPF_ALIGN_LEFT* = 0x2000000
  MPPF_ALIGN_RIGHT* = 0x4000000
  IID_IMenuPopup* = DEFINE_GUID(0xd1e7afeb'i32, 0x6a2e, 0x11d0, [0x8c'u8, 0x78, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0xb4])
  FUT_PLAYING* = 0
  FUT_EDITING* = 1
  FUT_GENERIC* = 2
  OF_CAP_CANSWITCHTO* = 0x0001
  OF_CAP_CANCLOSE* = 0x0002
  IID_IFileIsInUse* = DEFINE_GUID(0x64a1cbf0'i32, 0x3a1a, 0x4461, [0x91'u8, 0x58, 0x37, 0x69, 0x69, 0x69, 0x39, 0x50])
  FDEOR_DEFAULT* = 0
  FDEOR_ACCEPT* = 1
  FDEOR_REFUSE* = 2
  FDESVR_DEFAULT* = 0
  FDESVR_ACCEPT* = 1
  FDESVR_REFUSE* = 2
  FDAP_BOTTOM* = 0
  FDAP_TOP* = 1
  IID_IFileDialogEvents* = DEFINE_GUID(0x973510db'i32, 0x7d7f, 0x452b, [0x89'u8, 0x75, 0x74, 0xa8, 0x58, 0x28, 0xd3, 0x54])
  FOS_OVERWRITEPROMPT* = 0x2
  FOS_STRICTFILETYPES* = 0x4
  FOS_NOCHANGEDIR* = 0x8
  FOS_PICKFOLDERS* = 0x20
  FOS_FORCEFILESYSTEM* = 0x40
  FOS_ALLNONSTORAGEITEMS* = 0x80
  FOS_NOVALIDATE* = 0x100
  FOS_ALLOWMULTISELECT* = 0x200
  FOS_PATHMUSTEXIST* = 0x800
  FOS_FILEMUSTEXIST* = 0x1000
  FOS_CREATEPROMPT* = 0x2000
  FOS_SHAREAWARE* = 0x4000
  FOS_NOREADONLYRETURN* = 0x8000
  FOS_NOTESTFILECREATE* = 0x10000
  FOS_HIDEMRUPLACES* = 0x20000
  FOS_HIDEPINNEDPLACES* = 0x40000
  FOS_NODEREFERENCELINKS* = 0x100000
  FOS_DONTADDTORECENT* = 0x2000000
  FOS_FORCESHOWHIDDEN* = 0x10000000
  FOS_DEFAULTNOMINIMODE* = 0x20000000
  FOS_FORCEPREVIEWPANEON* = 0x40000000
  IID_IFileDialog* = DEFINE_GUID(0x42f85136'i32, 0xdb7e, 0x439c, [0x85'u8, 0xf1, 0xe4, 0x07, 0x5d, 0x13, 0x5f, 0xc8])
  IID_IFileSaveDialog* = DEFINE_GUID(0x84bccd23'i32, 0x5fde, 0x4cdb, [0xae'u8, 0xa4, 0xaf, 0x64, 0xb8, 0x3d, 0x78, 0xab])
  IID_IFileOpenDialog* = DEFINE_GUID(0xd57c7288'i32, 0xd4ad, 0x4768, [0xbe'u8, 0x02, 0x9d, 0x96, 0x95, 0x32, 0xd9, 0x60])
  CDCS_INACTIVE* = 0x0
  CDCS_ENABLED* = 0x1
  CDCS_VISIBLE* = 0x2
  CDCS_ENABLEDVISIBLE* = 0x3
  IID_IFileDialogCustomize* = DEFINE_GUID(0xe6fdd21a'i32, 0x163f, 0x4975, [0x9c'u8, 0x8c, 0xa6, 0x9f, 0x1b, 0xa3, 0x70, 0x34])
  IID_IFileDialogControlEvents* = DEFINE_GUID(0x36116642'i32, 0xd713, 0x4b97, [0x9b'u8, 0x83, 0x74, 0x84, 0xa9, 0xd0, 0x04, 0x33])
  IID_IFileDialog2* = DEFINE_GUID(0x61744fc7'i32, 0x85b5, 0x4791, [0xa9'u8, 0xb0, 0x27, 0x22, 0x76, 0x30, 0x9b, 0x13])
  AL_MACHINE* = 0
  AL_EFFECTIVE* = 1
  AL_USER* = 2
  AT_FILEEXTENSION* = 0
  AT_URLPROTOCOL* = 1
  AT_STARTMENUCLIENT* = 2
  AT_MIMETYPE* = 3
  IID_IApplicationAssociationRegistration* = DEFINE_GUID(0x4e530b0a'i32, 0xe611, 0x4c77, [0xa3'u8, 0xac, 0x90, 0x31, 0xd0, 0x22, 0x28, 0x1b])
  IID_IApplicationAssociationRegistrationUI* = DEFINE_GUID(0x1f76a169'i32, 0xf994, 0x40ac, [0x8f'u8, 0xc8, 0x09, 0x59, 0xe8, 0x87, 0x47, 0x10])
  IID_IDelegateFolder* = DEFINE_GUID(0xadd8ba80'i32, 0x002b, 0x11d0, [0x8f'u8, 0x0f, 0x00, 0xc0, 0x4f, 0xd7, 0xd0, 0x62])
  BFO_NONE* = 0x0
  BFO_BROWSER_PERSIST_SETTINGS* = 0x1
  BFO_RENAME_FOLDER_OPTIONS_TOINTERNET* = 0x2
  BFO_BOTH_OPTIONS* = 0x4
  BIF_PREFER_INTERNET_SHORTCUT* = 0x8
  BFO_BROWSE_NO_IN_NEW_PROCESS* = 0x10
  BFO_ENABLE_HYPERLINK_TRACKING* = 0x20
  BFO_USE_IE_OFFLINE_SUPPORT* = 0x40
  BFO_SUBSTITUE_INTERNET_START_PAGE* = 0x80
  BFO_USE_IE_LOGOBANDING* = 0x100
  BFO_ADD_IE_TOCAPTIONBAR* = 0x200
  BFO_USE_DIALUP_REF* = 0x400
  BFO_USE_IE_TOOLBAR* = 0x800
  BFO_NO_PARENT_FOLDER_SUPPORT* = 0x1000
  BFO_NO_REOPEN_NEXT_RESTART* = 0x2000
  BFO_GO_HOME_PAGE* = 0x4000
  BFO_PREFER_IEPROCESS* = 0x8000
  BFO_SHOW_NAVIGATION_CANCELLED* = 0x10000
  BFO_USE_IE_STATUSBAR* = 0x20000
  BFO_QUERY_ALL* = int32 0xffffffff'i32
  IID_IBrowserFrameOptions* = DEFINE_GUID(0x10df43c8'i32, 0x1dbe, 0x11d3, [0x8b'u8, 0x34, 0x00, 0x60, 0x97, 0xdf, 0x5b, 0xd4])
  NWMF_UNLOADING* = 0x1
  NWMF_USERINITED* = 0x2
  NWMF_FIRST* = 0x4
  NWMF_OVERRIDEKEY* = 0x8
  NWMF_SHOWHELP* = 0x10
  NWMF_HTMLDIALOG* = 0x20
  NWMF_FROMDIALOGCHILD* = 0x40
  NWMF_USERREQUESTED* = 0x80
  NWMF_USERALLOWED* = 0x100
  NWMF_FORCEWINDOW* = 0x10000
  NWMF_FORCETAB* = 0x20000
  NWMF_SUGGESTWINDOW* = 0x40000
  NWMF_SUGGESTTAB* = 0x80000
  NWMF_INACTIVETAB* = 0x100000
  IID_INewWindowManager* = DEFINE_GUID(0xd2bc4c84'i32, 0x3f72, 0x4a52, [0xa6'u8, 0x04, 0x7b, 0xcb, 0xf3, 0x98, 0x2c, 0xbb])
  SID_SNewWindowManager* = IID_INewWindowManager
  ATTACHMENT_PROMPT_NONE* = 0x0
  ATTACHMENT_PROMPT_SAVE* = 0x1
  ATTACHMENT_PROMPT_EXEC* = 0x2
  ATTACHMENT_PROMPT_EXEC_OR_SAVE* = 0x3
  ATTACHMENT_ACTION_CANCEL* = 0x0
  ATTACHMENT_ACTION_SAVE* = 0x1
  ATTACHMENT_ACTION_EXEC* = 0x2
  IID_IAttachmentExecute* = DEFINE_GUID(0x73db1241'i32, 0x1e85, 0x4581, [0x8e'u8, 0x4f, 0xa8, 0x1e, 0x1d, 0x0f, 0x8c, 0x57])
  SMDM_SHELLFOLDER* = 0x00000001
  SMDM_HMENU* = 0x00000002
  SMDM_TOOLBAR* = 0x00000004
  SMIM_TYPE* = 0x1
  SMIM_FLAGS* = 0x2
  SMIM_ICON* = 0x4
  SMIT_SEPARATOR* = 0x1
  SMIT_STRING* = 0x2
  SMIF_ICON* = 0x1
  SMIF_ACCELERATOR* = 0x2
  SMIF_DROPTARGET* = 0x4
  SMIF_SUBMENU* = 0x8
  SMIF_CHECKED* = 0x20
  SMIF_DROPCASCADE* = 0x40
  SMIF_HIDDEN* = 0x80
  SMIF_DISABLED* = 0x100
  SMIF_TRACKPOPUP* = 0x200
  SMIF_DEMOTED* = 0x400
  SMIF_ALTSTATE* = 0x800
  SMIF_DRAGNDROP* = 0x1000
  SMIF_NEW* = 0x2000
  SMC_INITMENU* = 0x00000001
  SMC_CREATE* = 0x00000002
  SMC_EXITMENU* = 0x00000003
  SMC_GETINFO* = 0x00000005
  SMC_GETSFINFO* = 0x00000006
  SMC_GETOBJECT* = 0x00000007
  SMC_GETSFOBJECT* = 0x00000008
  SMC_SFEXEC* = 0x00000009
  SMC_SFSELECTITEM* = 0x0000000A
  SMC_REFRESH* = 0x00000010
  SMC_DEMOTE* = 0x00000011
  SMC_PROMOTE* = 0x00000012
  SMC_DEFAULTICON* = 0x00000016
  SMC_NEWITEM* = 0x00000017
  SMC_CHEVRONEXPAND* = 0x00000019
  SMC_DISPLAYCHEVRONTIP* = 0x0000002A
  SMC_SETSFOBJECT* = 0x0000002D
  SMC_SHCHANGENOTIFY* = 0x0000002E
  SMC_CHEVRONGETTIP* = 0x0000002F
  SMC_SFDDRESTRICTED* = 0x00000030
  SMC_SFEXEC_MIDDLE* = 0x00000031
  SMC_GETAUTOEXPANDSTATE* = 0x00000041
  SMC_AUTOEXPANDCHANGE* = 0x00000042
  SMC_GETCONTEXTMENUMODIFIER* = 0x00000043
  SMC_GETBKCONTEXTMENU* = 0x00000044
  SMC_OPEN* = 0x00000045
  SMAE_EXPANDED* = 0x00000001
  SMAE_CONTRACTED* = 0x00000002
  SMAE_USER* = 0x00000004
  SMAE_VALID* = 0x00000007
  IID_IShellMenuCallback* = DEFINE_GUID(0x4ca300a1'i32, 0x9b8d, 0x11d1, [0x8b'u8, 0x22, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0xd0])
  SMINIT_DEFAULT* = 0x00000000
  SMINIT_RESTRICT_DRAGDROP* = 0x00000002
  SMINIT_TOPLEVEL* = 0x00000004
  SMINIT_CACHED* = 0x00000010
  SMINIT_AUTOEXPAND* = 0x00000100
  SMINIT_AUTOTOOLTIP* = 0x00000200
  SMINIT_DROPONCONTAINER* = 0x00000400
  SMINIT_VERTICAL* = 0x10000000
  SMINIT_HORIZONTAL* = 0x20000000
  ANCESTORDEFAULT* = UINT(-1)
  SMSET_TOP* = 0x10000000
  SMSET_BOTTOM* = 0x20000000
  SMSET_DONTOWN* = 0x00000001
  SMINV_REFRESH* = 0x00000001
  SMINV_ID* = 0x00000008
  IID_IShellMenu* = DEFINE_GUID(0xee1f7637'i32, 0xe138, 0x11d1, [0x83'u8, 0x79, 0x00, 0xc0, 0x4f, 0xd9, 0x18, 0xd0])
  IID_IShellRunDll* = DEFINE_GUID(0xfce4bde0'i32, 0x4b68, 0x4b80, [0x8e'u8, 0x9c, 0x74, 0x26, 0x31, 0x5a, 0x73, 0x88])
  KF_CATEGORY_VIRTUAL* = 1
  KF_CATEGORY_FIXED* = 2
  KF_CATEGORY_COMMON* = 3
  KF_CATEGORY_PERUSER* = 4
  KFDF_LOCAL_REDIRECT_ONLY* = 0x2
  KFDF_ROAMABLE* = 0x4
  KFDF_PRECREATE* = 0x8
  KFDF_STREAM* = 0x10
  KFDF_PUBLISHEXPANDEDPATH* = 0x20
  KF_REDIRECT_USER_EXCLUSIVE* = 0x1
  KF_REDIRECT_COPY_SOURCE_DACL* = 0x2
  KF_REDIRECT_OWNER_USER* = 0x4
  KF_REDIRECT_SET_OWNER_EXPLICIT* = 0x8
  KF_REDIRECT_CHECK_ONLY* = 0x10
  KF_REDIRECT_WITH_UI* = 0x20
  KF_REDIRECT_UNPIN* = 0x40
  KF_REDIRECT_PIN* = 0x80
  KF_REDIRECT_COPY_CONTENTS* = 0x200
  KF_REDIRECT_DEL_SOURCE_CONTENTS* = 0x400
  KF_REDIRECT_EXCLUDE_ALL_KNOWN_SUBFOLDERS* = 0x800
  KF_REDIRECTION_CAPABILITIES_ALLOW_ALL* = 0xff
  KF_REDIRECTION_CAPABILITIES_REDIRECTABLE* = 0x1
  KF_REDIRECTION_CAPABILITIES_DENY_ALL* = 0xfff00
  KF_REDIRECTION_CAPABILITIES_DENY_POLICY_REDIRECTED* = 0x100
  KF_REDIRECTION_CAPABILITIES_DENY_POLICY* = 0x200
  KF_REDIRECTION_CAPABILITIES_DENY_PERMISSIONS* = 0x400
  IID_IKnownFolder* = DEFINE_GUID(0x3aa7af7e'i32, 0x9b36, 0x420c, [0xa8'u8, 0xe3, 0xf7, 0x7d, 0x46, 0x74, 0xa4, 0x88])
  FFFP_EXACTMATCH* = 0
  FFFP_NEARESTPARENTMATCH* = 1
  IID_IKnownFolderManager* = DEFINE_GUID(0x8be2d872'i32, 0x86aa, 0x4d47, [0xb7'u8, 0x76, 0x32, 0xcc, 0xa4, 0x0c, 0x70, 0x18])
  SHARE_ROLE_INVALID* = -1
  SHARE_ROLE_READER* = 0
  SHARE_ROLE_CONTRIBUTOR* = 1
  SHARE_ROLE_CO_OWNER* = 2
  SHARE_ROLE_OWNER* = 3
  SHARE_ROLE_CUSTOM* = 4
  SHARE_ROLE_MIXED* = 5
  DEFSHAREID_USERS* = 1
  DEFSHAREID_PUBLIC* = 2
  IID_ISharingConfigurationManager* = DEFINE_GUID(0xb4cd448a'i32, 0x9c86, 0x4466, [0x92'u8, 0x01, 0x2e, 0x62, 0x10, 0x5b, 0x87, 0xae])
  IID_IPreviousVersionsInfo* = DEFINE_GUID(0x76e54780'i32, 0xad74, 0x48e3, [0xa6'u8, 0x95, 0x3b, 0xa9, 0xa0, 0xaf, 0xf1, 0x0d])
  IID_IRelatedItem* = DEFINE_GUID(0xa73ce67a'i32, 0x8ab1, 0x44f1, [0x8d'u8, 0x43, 0xd2, 0xfc, 0xbf, 0x6b, 0x1c, 0xd0])
  IID_IIdentityName* = DEFINE_GUID(0x7d903fca'i32, 0xd6f9, 0x4810, [0x83'u8, 0x32, 0x94, 0x6c, 0x01, 0x77, 0xe2, 0x47])
  IID_IDelegateItem* = DEFINE_GUID(0x3c5a1c94'i32, 0xc951, 0x4cb7, [0xbb'u8, 0x6d, 0x3b, 0x93, 0xf3, 0x0c, 0xce, 0x93])
  IID_ICurrentItem* = DEFINE_GUID(0x240a7174'i32, 0xd653, 0x4a1d, [0xa6'u8, 0xd3, 0xd4, 0x94, 0x3c, 0xfb, 0xfe, 0x3d])
  IID_ITransferMediumItem* = DEFINE_GUID(0x77f295d5'i32, 0x2d6f, 0x4e19, [0xb8'u8, 0xae, 0x32, 0x2f, 0x3e, 0x72, 0x1a, 0xb5])
  IID_IUseToBrowseItem* = DEFINE_GUID(0x05edda5c'i32, 0x98a3, 0x4717, [0x8a'u8, 0xdb, 0xc5, 0xe7, 0xda, 0x99, 0x1e, 0xb1])
  IID_IDisplayItem* = DEFINE_GUID(0xc6fd5997'i32, 0x9f6b, 0x4888, [0x87'u8, 0x03, 0x94, 0xe8, 0x0e, 0x8c, 0xde, 0x3f])
  IID_IViewStateIdentityItem* = DEFINE_GUID(0x9d264146'i32, 0xa94f, 0x4195, [0x9f'u8, 0x9f, 0x3b, 0xb1, 0x2c, 0xe0, 0xc9, 0x55])
  IID_IPreviewItem* = DEFINE_GUID(0x36149969'i32, 0x0a8f, 0x49c8, [0x8b'u8, 0x00, 0x4a, 0xec, 0xb2, 0x02, 0x22, 0xfb])
  IID_IDestinationStreamFactory* = DEFINE_GUID(0x8a87781b'i32, 0x39a7, 0x4a1f, [0xaa'u8, 0xb3, 0xa3, 0x9b, 0x9c, 0x34, 0xa7, 0xd9])
  NMCII_NONE* = 0x0
  NMCII_ITEMS* = 0x1
  NMCII_FOLDERS* = 0x2
  NMCSAEI_SELECT* = 0x0
  NMCSAEI_EDIT* = 0x1
  IID_INewMenuClient* = DEFINE_GUID(0xdcb07fdc'i32, 0x3bb5, 0x451c, [0x90'u8, 0xbe, 0x96, 0x66, 0x44, 0xfe, 0xd7, 0xb0])
  SID_SNewMenuClient* = IID_INewMenuClient
  SID_SCommandBarState* = DEFINE_GUID(0xB99EAA5C'i32, 0x3850, 0x4400, [0xBC'u8, 0x33, 0x2C, 0xE5, 0x34, 0x04, 0x8B, 0xF8])
  IID_IInitializeWithBindCtx* = DEFINE_GUID(0x71c0d2bc'i32, 0x726d, 0x45cc, [0xa6'u8, 0xc0, 0x2e, 0x31, 0xc1, 0xdb, 0x21, 0x59])
  IID_IShellItemFilter* = DEFINE_GUID(0x2659b475'i32, 0xeeb8, 0x48b7, [0x8f'u8, 0x07, 0xb3, 0x78, 0x81, 0x0f, 0x48, 0xcf])
  NSTCS_HASEXPANDOS* = 0x1
  NSTCS_HASLINES* = 0x2
  NSTCS_SINGLECLICKEXPAND* = 0x4
  NSTCS_FULLROWSELECT* = 0x8
  NSTCS_SPRINGEXPAND* = 0x10
  NSTCS_HORIZONTALSCROLL* = 0x20
  NSTCS_ROOTHASEXPANDO* = 0x40
  NSTCS_SHOWSELECTIONALWAYS* = 0x80
  NSTCS_NOINFOTIP* = 0x200
  NSTCS_EVENHEIGHT* = 0x400
  NSTCS_NOREPLACEOPEN* = 0x800
  NSTCS_DISABLEDRAGDROP* = 0x1000
  NSTCS_NOORDERSTREAM* = 0x2000
  NSTCS_RICHTOOLTIP* = 0x4000
  NSTCS_BORDER* = 0x8000
  NSTCS_NOEDITLABELS* = 0x10000
  NSTCS_TABSTOP* = 0x20000
  NSTCS_FAVORITESMODE* = 0x80000
  NSTCS_AUTOHSCROLL* = 0x100000
  NSTCS_FADEINOUTEXPANDOS* = 0x200000
  NSTCS_EMPTYTEXT* = 0x400000
  NSTCS_CHECKBOXES* = 0x800000
  NSTCS_PARTIALCHECKBOXES* = 0x1000000
  NSTCS_EXCLUSIONCHECKBOXES* = 0x2000000
  NSTCS_DIMMEDCHECKBOXES* = 0x4000000
  NSTCS_NOINDENTCHECKS* = 0x8000000
  NSTCS_ALLOWJUNCTIONS* = 0x10000000
  NSTCS_SHOWTABSBUTTON* = 0x20000000
  NSTCS_SHOWDELETEBUTTON* = 0x40000000
  NSTCS_SHOWREFRESHBUTTON* = int32 0x80000000'i32
  NSTCRS_VISIBLE* = 0x0
  NSTCRS_HIDDEN* = 0x1
  NSTCRS_EXPANDED* = 0x2
  NSTCIS_NONE* = 0x0
  NSTCIS_SELECTED* = 0x1
  NSTCIS_EXPANDED* = 0x2
  NSTCIS_BOLD* = 0x4
  NSTCIS_DISABLED* = 0x8
  NSTCIS_SELECTEDNOEXPAND* = 0x10
  NSTCGNI_NEXT* = 0
  NSTCGNI_NEXTVISIBLE* = 1
  NSTCGNI_PREV* = 2
  NSTCGNI_PREVVISIBLE* = 3
  NSTCGNI_PARENT* = 4
  NSTCGNI_CHILD* = 5
  NSTCGNI_FIRSTVISIBLE* = 6
  NSTCGNI_LASTVISIBLE* = 7
  IID_INameSpaceTreeControl* = DEFINE_GUID(0x028212a3'i32, 0xb627, 0x47e9, [0x88'u8, 0x56, 0xc1, 0x42, 0x65, 0x55, 0x4e, 0x4f])
  NSTCS2_DEFAULT* = 0x0
  NSTCS2_INTERRUPTNOTIFICATIONS* = 0x1
  NSTCS2_SHOWNULLSPACEMENU* = 0x2
  NSTCS2_DISPLAYPADDING* = 0x4
  NSTCS2_DISPLAYPINNEDONLY* = 0x8
  NTSCS2_NOSINGLETONAUTOEXPAND* = 0x10
  NTSCS2_NEVERINSERTNONENUMERATED* = 0x20
  IID_INameSpaceTreeControl2* = DEFINE_GUID(0x7cc7aed8'i32, 0x290e, 0x49bc, [0x89'u8, 0x45, 0xc1, 0x40, 0x1c, 0xc9, 0x30, 0x6c])
  NSTCS2_ALLMASK* = NSTCS2_INTERRUPTNOTIFICATIONS or NSTCS2_SHOWNULLSPACEMENU or NSTCS2_DISPLAYPADDING
  SID_SNavigationPane* = IID_INameSpaceTreeControl
  NSTCEHT_NOWHERE* = 0x1
  NSTCEHT_ONITEMICON* = 0x2
  NSTCEHT_ONITEMLABEL* = 0x4
  NSTCEHT_ONITEMINDENT* = 0x8
  NSTCEHT_ONITEMBUTTON* = 0x10
  NSTCEHT_ONITEMRIGHT* = 0x20
  NSTCEHT_ONITEMSTATEICON* = 0x40
  NSTCEHT_ONITEM* = 0x46
  NSTCEHT_ONITEMTABBUTTON* = 0x1000
  NSTCECT_LBUTTON* = 0x1
  NSTCECT_MBUTTON* = 0x2
  NSTCECT_RBUTTON* = 0x3
  NSTCECT_BUTTON* = 0x3
  NSTCECT_DBLCLICK* = 0x4
  IID_INameSpaceTreeControlEvents* = DEFINE_GUID(0x93d77985'i32, 0xb3d8, 0x4484, [0x83'u8, 0x18, 0x67, 0x2c, 0xdd, 0xa0, 0x02, 0xce])
  NSTCDHPOS_ONTOP* = -1
  IID_INameSpaceTreeControlDropHandler* = DEFINE_GUID(0xf9c665d6'i32, 0xc2f2, 0x4c19, [0xbf'u8, 0x33, 0x83, 0x22, 0xd7, 0x35, 0x2f, 0x51])
  IID_INameSpaceTreeAccessible* = DEFINE_GUID(0x71f312de'i32, 0x43ed, 0x4190, [0x84'u8, 0x77, 0xe9, 0x53, 0x6b, 0x82, 0x35, 0x0b])
  IID_INameSpaceTreeControlCustomDraw* = DEFINE_GUID(0x2d3ba758'i32, 0x33ee, 0x42d5, [0xbb'u8, 0x7b, 0x5f, 0x34, 0x31, 0xd8, 0x6c, 0x78])
  NSTCFC_NONE* = 0x0
  NSTCFC_PINNEDITEMFILTERING* = 0x1
  NSTCFC_DELAY_REGISTER_NOTIFY* = 0x2
  IID_INameSpaceTreeControlFolderCapabilities* = DEFINE_GUID(0xe9701183'i32, 0xe6b3, 0x4ff2, [0x85'u8, 0x68, 0x81, 0x36, 0x15, 0xfe, 0xc7, 0xbe])
  E_PREVIEWHANDLER_DRM_FAIL* = HRESULT 0x86420001'i32
  E_PREVIEWHANDLER_NOAUTH* = HRESULT 0x86420002'i32
  E_PREVIEWHANDLER_NOTFOUND* = HRESULT 0x86420003'i32
  E_PREVIEWHANDLER_CORRUPT* = HRESULT 0x86420004'i32
  IID_IPreviewHandler* = DEFINE_GUID(0x8895b1c6'i32, 0xb41f, 0x4c1c, [0xa5'u8, 0x62, 0x0d, 0x56, 0x42, 0x50, 0x83, 0x6f])
  IID_IPreviewHandlerFrame* = DEFINE_GUID(0xfec87aaf'i32, 0x35f9, 0x447a, [0xad'u8, 0xb7, 0x20, 0x23, 0x44, 0x91, 0x40, 0x1a])
  IID_ITrayDeskBand* = DEFINE_GUID(0x6d67e846'i32, 0x5b9c, 0x4db8, [0x9c'u8, 0xbc, 0xdd, 0xe1, 0x2f, 0x42, 0x54, 0xf1])
  IID_IBandHost* = DEFINE_GUID(0xb9075c7c'i32, 0xd48e, 0x403f, [0xab'u8, 0x99, 0xd6, 0xc7, 0x7a, 0x10, 0x84, 0xac])
  SID_SBandHost* = IID_IBandHost
  EPS_DONTCARE* = 0x0
  EPS_DEFAULT_ON* = 0x1
  EPS_DEFAULT_OFF* = 0x2
  EPS_STATEMASK* = 0xffff
  EPS_INITIALSTATE* = 0x10000
  EPS_FORCE* = 0x20000
  IID_IExplorerPaneVisibility* = DEFINE_GUID(0xe07010ec'i32, 0xbc17, 0x44c0, [0x97'u8, 0xb0, 0x46, 0xc7, 0xc9, 0x5b, 0x9e, 0xdc])
  SID_ExplorerPaneVisibility* = IID_IExplorerPaneVisibility
  IID_IContextMenuCB* = DEFINE_GUID(0x3409e930'i32, 0x5a39, 0x11d1, [0x83'u8, 0xfa, 0x00, 0xa0, 0xc9, 0x0d, 0xc8, 0x49])
  IID_IDefaultExtractIconInit* = DEFINE_GUID(0x41ded17d'i32, 0xd6b3, 0x4261, [0x99'u8, 0x7d, 0x88, 0xc6, 0x0e, 0x4b, 0x1d, 0x58])
  ECS_ENABLED* = 0x0
  ECS_DISABLED* = 0x1
  ECS_HIDDEN* = 0x2
  ECS_CHECKBOX* = 0x4
  ECS_CHECKED* = 0x8
  ECS_RADIOCHECK* = 0x10
  ECF_DEFAULT* = 0x0
  ECF_HASSUBCOMMANDS* = 0x1
  ECF_HASSPLITBUTTON* = 0x2
  ECF_HIDELABEL* = 0x4
  ECF_ISSEPARATOR* = 0x8
  ECF_HASLUASHIELD* = 0x10
  ECF_SEPARATORBEFORE* = 0x20
  ECF_SEPARATORAFTER* = 0x40
  ECF_ISDROPDOWN* = 0x80
  ECF_TOGGLEABLE* = 0x100
  ECF_AUTOMENUICONS* = 0x200
  IID_IExplorerCommand* = DEFINE_GUID(0xa08ce4d0'i32, 0xfa25, 0x44ab, [0xb5'u8, 0x7c, 0xc7, 0xb1, 0xc3, 0x23, 0xe0, 0xb9])
  IID_IExplorerCommandState* = DEFINE_GUID(0xbddacb60'i32, 0x7657, 0x47ae, [0x84'u8, 0x45, 0xd2, 0x3e, 0x1a, 0xcf, 0x82, 0xae])
  IID_IInitializeCommand* = DEFINE_GUID(0x85075acf'i32, 0x231f, 0x40ea, [0x96'u8, 0x10, 0xd2, 0x6b, 0x7b, 0x58, 0xf6, 0x38])
  IID_IEnumExplorerCommand* = DEFINE_GUID(0xa88826f8'i32, 0x186f, 0x4987, [0xaa'u8, 0xde, 0xea, 0x0c, 0xef, 0x8f, 0xbf, 0xe8])
  IID_IExplorerCommandProvider* = DEFINE_GUID(0x64961751'i32, 0x0835, 0x43c0, [0x8f'u8, 0xfe, 0xd5, 0x76, 0x86, 0x53, 0x0e, 0x64])
  IID_IInitializeNetworkFolder* = DEFINE_GUID(0x6e0f9881'i32, 0x42a8, 0x4f2a, [0x97'u8, 0xf8, 0x8a, 0xf4, 0xe0, 0x26, 0xd9, 0x2d])
  CPVIEW_CLASSIC* = 0
  CPVIEW_ALLITEMS* = CPVIEW_CLASSIC
  CPVIEW_CATEGORY* = 1
  CPVIEW_HOME* = CPVIEW_CATEGORY
  IID_IOpenControlPanel* = DEFINE_GUID(0xd11ad862'i32, 0x66de, 0x4df4, [0xbf'u8, 0x6c, 0x1f, 0x56, 0x21, 0x99, 0x6a, 0xf1])
  IID_IComputerInfoChangeNotify* = DEFINE_GUID(0x0df60d92'i32, 0x6818, 0x46d6, [0xb3'u8, 0x58, 0xd6, 0x61, 0x70, 0xdd, 0xe4, 0x66])
  STR_FILE_SYS_BIND_DATA* = "File System Bind Data"
  IID_IFileSystemBindData* = DEFINE_GUID(0x01e18d10'i32, 0x4d8b, 0x11d2, [0x85'u8, 0x5d, 0x00, 0x60, 0x08, 0x05, 0x93, 0x67])
  IID_IFileSystemBindData2* = DEFINE_GUID(0x3acf075f'i32, 0x71db, 0x4afa, [0x81'u8, 0xf0, 0x3f, 0xc4, 0xfd, 0xf2, 0xa5, 0xb8])
  KDC_FREQUENT* = 1
  KDC_RECENT* = 2
  IID_ICustomDestinationList* = DEFINE_GUID(0x6332debf'i32, 0x87b5, 0x4670, [0x90'u8, 0xc0, 0x5e, 0x57, 0xb4, 0x08, 0xa4, 0x9e])
  IID_IApplicationDestinations* = DEFINE_GUID(0x12337d35'i32, 0x94c6, 0x48a0, [0xbc'u8, 0xe7, 0x6a, 0x9c, 0x69, 0xd4, 0xd6, 0x00])
  ADLT_RECENT* = 0
  ADLT_FREQUENT* = 1
  IID_IApplicationDocumentLists* = DEFINE_GUID(0x3c594f9f'i32, 0x9f30, 0x47a1, [0x97'u8, 0x9a, 0xc9, 0xe8, 0x3d, 0x3d, 0x0a, 0x06])
  IID_IObjectWithAppUserModelID* = DEFINE_GUID(0x36db0196'i32, 0x9665, 0x46d1, [0x9b'u8, 0xa7, 0xd3, 0x70, 0x9e, 0xec, 0xf9, 0xed])
  IID_IObjectWithProgID* = DEFINE_GUID(0x71e806fb'i32, 0x8dee, 0x46fc, [0xbf'u8, 0x8c, 0x77, 0x48, 0xa8, 0xa1, 0xae, 0x13])
  IID_IUpdateIDList* = DEFINE_GUID(0x6589b6d2'i32, 0x5f8d, 0x4b9e, [0xb7'u8, 0xe0, 0x23, 0xcd, 0xd9, 0x71, 0x7d, 0x8c])
  IID_IDesktopGadget* = DEFINE_GUID(0xc1646bc4'i32, 0xf298, 0x4f91, [0xa2'u8, 0x04, 0xeb, 0x2d, 0xd1, 0x70, 0x9d, 0x1a])
  DSO_SHUFFLEIMAGES* = 0x1
  DSS_ENABLED* = 0x1
  DSS_SLIDESHOW* = 0x2
  DSS_DISABLED_BY_REMOTE_SESSION* = 0x4
  DSD_FORWARD* = 0
  DSD_BACKWARD* = 1
  DWPOS_CENTER* = 0
  DWPOS_TILE* = 1
  DWPOS_STRETCH* = 2
  DWPOS_FIT* = 3
  DWPOS_FILL* = 4
  DWPOS_SPAN* = 5
  IID_IDesktopWallpaper* = DEFINE_GUID(0xb92b56a9'i32, 0x8b55, 0x4e14, [0x9a'u8, 0x89, 0x01, 0x99, 0xbb, 0xb6, 0xf9, 0x3b])
  HOMEGROUP_SECURITY_GROUP_MULTI* = "HUG"
  HOMEGROUP_SECURITY_GROUP* = "HomeUsers"
  HGSC_NONE* = 0x0
  HGSC_MUSICLIBRARY* = 0x1
  HGSC_PICTURESLIBRARY* = 0x2
  HGSC_VIDEOSLIBRARY* = 0x4
  HGSC_DOCUMENTSLIBRARY* = 0x8
  HGSC_PRINTERS* = 0x10
  IID_IHomeGroup* = DEFINE_GUID(0x7a3bd1d9'i32, 0x35a9, 0x4fb3, [0xa4'u8, 0x67, 0xf4, 0x8c, 0xac, 0x35, 0xe2, 0xd0])
  IID_IInitializeWithPropertyStore* = DEFINE_GUID(0xc3e12eb5'i32, 0x7d8d, 0x44f8, [0xb6'u8, 0xdd, 0x0e, 0x77, 0xb3, 0x4d, 0x6d, 0xe4])
  IID_IOpenSearchSource* = DEFINE_GUID(0xf0ee7333'i32, 0xe6fc, 0x479b, [0x9f'u8, 0x25, 0xa8, 0x60, 0xc2, 0x34, 0xa3, 0x8e])
  LFF_FORCEFILESYSTEM* = 1
  LFF_STORAGEITEMS* = 2
  LFF_ALLITEMS* = 3
  LOF_DEFAULT* = 0x0
  LOF_PINNEDTONAVPANE* = 0x1
  LOF_MASK_ALL* = 0x1
  DSFT_DETECT* = 1
  DSFT_PRIVATE* = 2
  DSFT_PUBLIC* = 3
  LSF_FAILIFTHERE* = 0x0
  LSF_OVERRIDEEXISTING* = 0x1
  LSF_MAKEUNIQUENAME* = 0x2
  IID_IShellLibrary* = DEFINE_GUID(0x11a66efa'i32, 0x382e, 0x451a, [0x92'u8, 0x34, 0x1e, 0x0e, 0x12, 0xef, 0x30, 0x85])
  PE_DUCKSESSION* = 1
  PE_UNDUCKSESSION* = 2
  IID_IPlaybackManagerEvents* = DEFINE_GUID(0x385cfb7d'i32, 0x4e0c, 0x4106, [0x91'u8, 0x2e, 0x8c, 0xfb, 0x4c, 0x19, 0x1f, 0x45])
  ST_COMMUNICATION* = 1
  ST_MEDIA* = 2
  PS_PLAYING* = 1
  PS_PAUSED* = 2
  PS_STOPPED* = 3
  MS_MUTED* = 1
  MS_UNMUTED* = 2
  IID_IPlaybackManager* = DEFINE_GUID(0x0f3c1b01'i32, 0x8199, 0x4173, [0xba'u8, 0x78, 0x98, 0x58, 0x82, 0x26, 0x6f, 0x7a])
  DFMR_DEFAULT* = 0x0
  DFMR_NO_STATIC_VERBS* = 0x8
  DFMR_STATIC_VERBS_ONLY* = 0x10
  DFMR_NO_RESOURCE_VERBS* = 0x20
  DFMR_OPTIN_HANDLERS_ONLY* = 0x40
  DFMR_RESOURCE_AND_FOLDER_VERBS_ONLY* = 0x80
  DFMR_USE_SPECIFIED_HANDLERS* = 0x100
  DFMR_USE_SPECIFIED_VERBS* = 0x200
  DFMR_NO_ASYNC_VERBS* = 0x400
  IID_IDefaultFolderMenuInitialize* = DEFINE_GUID(0x7690aa79'i32, 0xf8fc, 0x4615, [0xa3'u8, 0x27, 0x36, 0xf7, 0xd1, 0x8f, 0x5d, 0x91])
  AO_NONE* = 0x0
  AO_DESIGNMODE* = 0x1
  AO_NOERRORUI* = 0x2
  AO_NOSPLASHSCREEN* = 0x4
  IID_IApplicationActivationManager* = DEFINE_GUID(0x2e941141'i32, 0x7f97, 0x4756, [0xba'u8, 0x1d, 0x9d, 0xec, 0xde, 0x89, 0x4a, 0x3d])
  LIBID_ShellObjects* = DEFINE_GUID(0x50a7e9b1'i32, 0x70ef, 0x11d1, [0xb7'u8, 0x5a, 0x00, 0xa0, 0xc9, 0x05, 0x64, 0xfe])
  CLSID_DesktopWallpaper* = DEFINE_GUID(0xc2cf3110'i32, 0x460e, 0x4fc1, [0xb9'u8, 0xd0, 0x8a, 0x1c, 0x0c, 0x9c, 0xc4, 0xbd])
  CLSID_ShellFSFolder* = DEFINE_GUID(0xf3364ba0'i32, 0x65b9, 0x11ce, [0xa9'u8, 0xba, 0x00, 0xaa, 0x00, 0x4a, 0xe8, 0x37])
  CLSID_NetworkPlaces* = DEFINE_GUID(0x208d2c60'i32, 0x3aea, 0x1069, [0xa2'u8, 0xd7, 0x08, 0x00, 0x2b, 0x30, 0x30, 0x9d])
  CLSID_ShellLink* = DEFINE_GUID(0x00021401'i32, 0x0000, 0x0000, [0xc0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])
  CLSID_QueryCancelAutoPlay* = DEFINE_GUID(0x331f1768'i32, 0x05a9, 0x4ddd, [0xb8'u8, 0x6e, 0xda, 0xe3, 0x4d, 0xdc, 0x99, 0x8a])
  CLSID_DriveSizeCategorizer* = DEFINE_GUID(0x94357b53'i32, 0xca29, 0x4b78, [0x83'u8, 0xae, 0xe8, 0xfe, 0x74, 0x09, 0x13, 0x4f])
  CLSID_DriveTypeCategorizer* = DEFINE_GUID(0xb0a8f3cf'i32, 0x4333, 0x4bab, [0x88'u8, 0x73, 0x1c, 0xcb, 0x1c, 0xad, 0xa4, 0x8b])
  CLSID_FreeSpaceCategorizer* = DEFINE_GUID(0xb5607793'i32, 0x24ac, 0x44c7, [0x82'u8, 0xe2, 0x83, 0x17, 0x26, 0xaa, 0x6c, 0xb7])
  CLSID_TimeCategorizer* = DEFINE_GUID(0x3bb4118f'i32, 0xddfd, 0x4d30, [0xa3'u8, 0x48, 0x9f, 0xb5, 0xd6, 0xbf, 0x1a, 0xfe])
  CLSID_SizeCategorizer* = DEFINE_GUID(0x55d7b852'i32, 0xf6d1, 0x42f2, [0xaa'u8, 0x75, 0x87, 0x28, 0xa1, 0xb2, 0xd2, 0x64])
  CLSID_AlphabeticalCategorizer* = DEFINE_GUID(0x3c2654c6'i32, 0x7372, 0x4f6b, [0xb3'u8, 0x10, 0x55, 0xd6, 0x12, 0x8f, 0x49, 0xd2])
  CLSID_MergedCategorizer* = DEFINE_GUID(0x8e827c11'i32, 0x33e7, 0x4bc1, [0xb2'u8, 0x42, 0x8c, 0xd9, 0xa1, 0xc2, 0xb3, 0x04])
  CLSID_ImageProperties* = DEFINE_GUID(0x7ab770c7'i32, 0x0e23, 0x4d7a, [0x8a'u8, 0xa2, 0x19, 0xbf, 0xad, 0x47, 0x98, 0x29])
  CLSID_PropertiesUI* = DEFINE_GUID(0xd912f8cf'i32, 0x0396, 0x4915, [0x88'u8, 0x4e, 0xfb, 0x42, 0x5d, 0x32, 0x94, 0x3b])
  CLSID_UserNotification* = DEFINE_GUID(0x0010890e'i32, 0x8789, 0x413c, [0xad'u8, 0xbc, 0x48, 0xf5, 0xb5, 0x11, 0xb3, 0xaf])
  CLSID_CDBurn* = DEFINE_GUID(0xfbeb8a05'i32, 0xbeee, 0x4442, [0x80'u8, 0x4e, 0x40, 0x9d, 0x6c, 0x45, 0x15, 0xe9])
  CLSID_TaskbarList* = DEFINE_GUID(0x56fdf344'i32, 0xfd6d, 0x11d0, [0x95'u8, 0x8a, 0x00, 0x60, 0x97, 0xc9, 0xa0, 0x90])
  CLSID_StartMenuPin* = DEFINE_GUID(0xa2a9545d'i32, 0xa0c2, 0x42b4, [0x97'u8, 0x08, 0xa0, 0xb2, 0xba, 0xdd, 0x77, 0xc8])
  CLSID_WebWizardHost* = DEFINE_GUID(0xc827f149'i32, 0x55c1, 0x4d28, [0x93'u8, 0x5e, 0x57, 0xe4, 0x7c, 0xae, 0xd9, 0x73])
  CLSID_PublishDropTarget* = DEFINE_GUID(0xcc6eeffb'i32, 0x43f6, 0x46c5, [0x96'u8, 0x19, 0x51, 0xd5, 0x71, 0x96, 0x7f, 0x7d])
  CLSID_PublishingWizard* = DEFINE_GUID(0x6b33163c'i32, 0x76a5, 0x4b6c, [0xbf'u8, 0x21, 0x45, 0xde, 0x9c, 0xd5, 0x03, 0xa1])
  SID_PublishingWizard* = CLSID_PublishingWizard
  CLSID_InternetPrintOrdering* = DEFINE_GUID(0xadd36aa8'i32, 0x751a, 0x4579, [0xa2'u8, 0x66, 0xd6, 0x6f, 0x52, 0x02, 0xcc, 0xbb])
  CLSID_FolderViewHost* = DEFINE_GUID(0x20b1cb23'i32, 0x6968, 0x4eb9, [0xb7'u8, 0xd4, 0xa6, 0x6d, 0x00, 0xd0, 0x7c, 0xee])
  CLSID_ExplorerBrowser* = DEFINE_GUID(0x71f96385'i32, 0xddd6, 0x48d3, [0xa0'u8, 0xc1, 0xae, 0x06, 0xe8, 0xb0, 0x55, 0xfb])
  CLSID_ImageRecompress* = DEFINE_GUID(0x6e33091c'i32, 0xd2f8, 0x4740, [0xb5'u8, 0x5e, 0x2e, 0x11, 0xd1, 0x47, 0x7a, 0x2c])
  CLSID_TrayBandSiteService* = DEFINE_GUID(0xf60ad0a0'i32, 0xe5e1, 0x45cb, [0xb5'u8, 0x1a, 0xe1, 0x5b, 0x9f, 0x8b, 0x29, 0x34])
  CLSID_TrayDeskBand* = DEFINE_GUID(0xe6442437'i32, 0x6c68, 0x4f52, [0x94'u8, 0xdd, 0x2c, 0xfe, 0xd2, 0x67, 0xef, 0xb9])
  CLSID_AttachmentServices* = DEFINE_GUID(0x4125dd96'i32, 0xe03a, 0x4103, [0x8f'u8, 0x70, 0xe0, 0x59, 0x7d, 0x80, 0x3b, 0x9c])
  CLSID_DocPropShellExtension* = DEFINE_GUID(0x883373c3'i32, 0xbf89, 0x11d1, [0xbe'u8, 0x35, 0x08, 0x00, 0x36, 0xb1, 0x1a, 0x03])
  CLSID_ShellItem* = DEFINE_GUID(0x9ac9fbe1'i32, 0xe0a2, 0x4ad6, [0xb4'u8, 0xee, 0xe2, 0x12, 0x01, 0x3e, 0xa9, 0x17])
  CLSID_NamespaceWalker* = DEFINE_GUID(0x72eb61e0'i32, 0x8672, 0x4303, [0x91'u8, 0x75, 0xf2, 0xe4, 0xc6, 0x8b, 0x2e, 0x7c])
  CLSID_FileOperation* = DEFINE_GUID(0x3ad05575'i32, 0x8857, 0x4850, [0x92'u8, 0x77, 0x11, 0xb8, 0x5b, 0xdb, 0x8e, 0x09])
  CLSID_FileOpenDialog* = DEFINE_GUID(0xdc1c5a9c'i32, 0xe88a, 0x4dde, [0xa5'u8, 0xa1, 0x60, 0xf8, 0x2a, 0x20, 0xae, 0xf7])
  CLSID_FileSaveDialog* = DEFINE_GUID(0xc0b4e2f3'i32, 0xba21, 0x4773, [0x8d'u8, 0xba, 0x33, 0x5e, 0xc9, 0x46, 0xeb, 0x8b])
  CLSID_KnownFolderManager* = DEFINE_GUID(0x4df0c730'i32, 0xdf9d, 0x4ae3, [0x91'u8, 0x53, 0xaa, 0x6b, 0x82, 0xe9, 0x79, 0x5a])
  CLSID_FSCopyHandler* = DEFINE_GUID(0xd197380a'i32, 0x0a79, 0x4dc8, [0xa0'u8, 0x33, 0xed, 0x88, 0x2c, 0x2f, 0xa1, 0x4b])
  CLSID_SharingConfigurationManager* = DEFINE_GUID(0x49f371e1'i32, 0x8c5c, 0x4d9c, [0x9a'u8, 0x3b, 0x54, 0xa6, 0x82, 0x7f, 0x51, 0x3c])
  CLSID_PreviousVersions* = DEFINE_GUID(0x596ab062'i32, 0xb4d2, 0x4215, [0x9f'u8, 0x74, 0xe9, 0x10, 0x9b, 0x0a, 0x81, 0x53])
  CLSID_NetworkConnections* = DEFINE_GUID(0x7007acc7'i32, 0x3202, 0x11d1, [0xaa'u8, 0xd2, 0x00, 0x80, 0x5f, 0xc1, 0x27, 0x0e])
  CLSID_NamespaceTreeControl* = DEFINE_GUID(0xae054212'i32, 0x3535, 0x4430, [0x83'u8, 0xed, 0xd5, 0x01, 0xaa, 0x66, 0x80, 0xe6])
  CLSID_IENamespaceTreeControl* = DEFINE_GUID(0xace52d03'i32, 0xe5cd, 0x4b20, [0x82'u8, 0xff, 0xe7, 0x1b, 0x11, 0xbe, 0xae, 0x1d])
  CLSID_ScheduledTasks* = DEFINE_GUID(0xd6277990'i32, 0x4c6a, 0x11cf, [0x8d'u8, 0x87, 0x00, 0xaa, 0x00, 0x60, 0xf5, 0xbf])
  CLSID_ApplicationAssociationRegistration* = DEFINE_GUID(0x591209c7'i32, 0x767b, 0x42b2, [0x9f'u8, 0xba, 0x44, 0xee, 0x46, 0x15, 0xf2, 0xc7])
  CLSID_ApplicationAssociationRegistrationUI* = DEFINE_GUID(0x1968106d'i32, 0xf3b5, 0x44cf, [0x89'u8, 0x0e, 0x11, 0x6f, 0xcb, 0x9e, 0xce, 0xf1])
  CLSID_SearchFolderItemFactory* = DEFINE_GUID(0x14010e02'i32, 0xbbbd, 0x41f0, [0x88'u8, 0xe3, 0xed, 0xa3, 0x71, 0x21, 0x65, 0x84])
  CLSID_OpenControlPanel* = DEFINE_GUID(0x06622d85'i32, 0x6856, 0x4460, [0x8d'u8, 0xe1, 0xa8, 0x19, 0x21, 0xb4, 0x1c, 0x4b])
  CLSID_MailRecipient* = DEFINE_GUID(0x9e56be60'i32, 0xc50f, 0x11cf, [0x9a'u8, 0x2c, 0x00, 0xa0, 0xc9, 0x0a, 0x90, 0xce])
  CLSID_NetworkExplorerFolder* = DEFINE_GUID(0xf02c1a0d'i32, 0xbe21, 0x4350, [0x88'u8, 0xb0, 0x73, 0x67, 0xfc, 0x96, 0xef, 0x3c])
  CLSID_DestinationList* = DEFINE_GUID(0x77f10cf0'i32, 0x3db5, 0x4966, [0xb5'u8, 0x20, 0xb7, 0xc5, 0x4f, 0xd3, 0x5e, 0xd6])
  CLSID_ApplicationDestinations* = DEFINE_GUID(0x86c14003'i32, 0x4d6b, 0x4ef3, [0xa7'u8, 0xb4, 0x05, 0x06, 0x66, 0x3b, 0x2e, 0x68])
  CLSID_ApplicationDocumentLists* = DEFINE_GUID(0x86bec222'i32, 0x30f2, 0x47e0, [0x9f'u8, 0x25, 0x60, 0xd1, 0x1c, 0xd7, 0x5c, 0x28])
  CLSID_HomeGroup* = DEFINE_GUID(0xde77ba04'i32, 0x3c92, 0x4d11, [0xa1'u8, 0xa5, 0x42, 0x35, 0x2a, 0x53, 0xe0, 0xe3])
  CLSID_ShellLibrary* = DEFINE_GUID(0xd9b3211d'i32, 0xe57f, 0x4426, [0xaa'u8, 0xef, 0x30, 0xa8, 0x06, 0xad, 0xd3, 0x97])
  CLSID_AppStartupLink* = DEFINE_GUID(0x273eb5e7'i32, 0x88b0, 0x4843, [0xbf'u8, 0xef, 0xe2, 0xc8, 0x1d, 0x43, 0xaa, 0xe5])
  CLSID_EnumerableObjectCollection* = DEFINE_GUID(0x2d3468c1'i32, 0x36a7, 0x43b6, [0xac'u8, 0x24, 0xd3, 0xf0, 0x2f, 0xd9, 0x60, 0x7a])
  CLSID_DesktopGadget* = DEFINE_GUID(0x924ccc1b'i32, 0x6562, 0x4c85, [0x86'u8, 0x57, 0xd1, 0x77, 0x92, 0x52, 0x22, 0xb6])
  CLSID_PlaybackManager* = DEFINE_GUID(0x29dfa654'i32, 0xa97f, 0x47f0, [0xbf'u8, 0x26, 0x9e, 0x41, 0xfb, 0x94, 0x88, 0xd9])
  CLSID_AccessibilityDockingService* = DEFINE_GUID(0x29ce1d46'i32, 0xb481, 0x4aa0, [0xa0'u8, 0x8a, 0xd3, 0xeb, 0xc8, 0xac, 0xa4, 0x02])
  CLSID_FrameworkInputPane* = DEFINE_GUID(0xd5120aa3'i32, 0x46ba, 0x44c5, [0x82'u8, 0x2d, 0xca, 0x80, 0x92, 0xc1, 0xfc, 0x72])
  CLSID_DefFolderMenu* = DEFINE_GUID(0xc63382be'i32, 0x7933, 0x48d0, [0x9a'u8, 0xc8, 0x85, 0xfb, 0x46, 0xbe, 0x2f, 0xdd])
  CLSID_AppVisibility* = DEFINE_GUID(0x7e5fe3d9'i32, 0x985f, 0x4908, [0x91'u8, 0xf9, 0xee, 0x19, 0xf9, 0xfd, 0x15, 0x14])
  CLSID_AppShellVerbHandler* = DEFINE_GUID(0x4ed3a719'i32, 0xcea8, 0x4bd9, [0x91'u8, 0x0d, 0xe2, 0x52, 0xf9, 0x97, 0xaf, 0xc2])
  CLSID_ExecuteUnknown* = DEFINE_GUID(0xe44e9428'i32, 0xbdbc, 0x4987, [0xa0'u8, 0x99, 0x40, 0xdc, 0x8f, 0xd2, 0x55, 0xe7])
  CLSID_PackageDebugSettings* = DEFINE_GUID(0xb1aec16f'i32, 0x2383, 0x4852, [0xb0'u8, 0xe9, 0x8f, 0x0b, 0x1d, 0xc6, 0x6b, 0x4d])
  CLSID_ApplicationActivationManager* = DEFINE_GUID(0x45ba127d'i32, 0x10a8, 0x46ea, [0x8a'u8, 0xb7, 0x56, 0xea, 0x90, 0x78, 0x94, 0x3c])
  CLSID_ApplicationDesignModeSettings* = DEFINE_GUID(0x958a6fb5'i32, 0xdcb2, 0x4faf, [0xaa'u8, 0xfd, 0x7f, 0xb0, 0x54, 0xad, 0x1a, 0x3b])
  CLSID_ExecuteFolder* = DEFINE_GUID(0x11dbb47c'i32, 0xa525, 0x400b, [0x9e'u8, 0x80, 0xa5, 0x46, 0x15, 0xa0, 0x90, 0xc0])
  LMD_DEFAULT* = 0x0
  LMD_ALLOWUNINDEXABLENETWORKLOCATIONS* = 0x1
  IID_IAssocHandlerInvoker* = DEFINE_GUID(0x92218cab'i32, 0xecaa, 0x4335, [0x81'u8, 0x33, 0x80, 0x7f, 0xd2, 0x34, 0xc2, 0xee])
  IID_IAssocHandler* = DEFINE_GUID(0xf04061ac'i32, 0x1659, 0x4a3f, [0xa9'u8, 0x54, 0x77, 0x5a, 0xa5, 0x7f, 0xc0, 0x83])
  IID_IEnumAssocHandlers* = DEFINE_GUID(0x973810ae'i32, 0x9599, 0x4b88, [0x9e'u8, 0x4d, 0x6e, 0xe9, 0x8c, 0x95, 0x52, 0xda])
  ASSOC_FILTER_NONE* = 0x0
  ASSOC_FILTER_RECOMMENDED* = 0x1
  IID_IDataObjectProvider* = DEFINE_GUID(0x3d25f6d6'i32, 0x4b2a, 0x433c, [0x91'u8, 0x84, 0x7c, 0x33, 0xad, 0x35, 0xd0, 0x01])
  IID_IDataTransferManagerInterop* = DEFINE_GUID(0x3a3dcd6c'i32, 0x3eab, 0x43dc, [0xbc'u8, 0xde, 0x45, 0x67, 0x1c, 0xe8, 0x00, 0xc8])
  IID_IFrameworkInputPaneHandler* = DEFINE_GUID(0x226c537b'i32, 0x1e76, 0x4d9e, [0xa7'u8, 0x60, 0x33, 0xdb, 0x29, 0x92, 0x2f, 0x18])
  IID_IFrameworkInputPane* = DEFINE_GUID(0x5752238b'i32, 0x24f0, 0x495a, [0x82'u8, 0xf1, 0x2f, 0xd5, 0x93, 0x05, 0x67, 0x96])
  PROP_CONTRACT_DELEGATE* = "ContractDelegate"
  IID_ISearchableApplication* = DEFINE_GUID(0x08922f8d'i32, 0x243a, 0x49e3, [0xa4'u8, 0x95, 0xbd, 0x4f, 0x9c, 0xf8, 0xab, 0x9e])
  UR_RESOLUTION_CHANGE* = 0
  UR_MONITOR_DISCONNECT* = 1
  IID_IAccessibilityDockingServiceCallback* = DEFINE_GUID(0x157733fd'i32, 0xa592, 0x42e5, [0xb5'u8, 0x94, 0x24, 0x84, 0x68, 0xc5, 0xa8, 0x1b])
  IID_IAccessibilityDockingService* = DEFINE_GUID(0x8849dc22'i32, 0xcedf, 0x4c95, [0x99'u8, 0x8d, 0x05, 0x14, 0x19, 0xdd, 0x3f, 0x76])
  MAV_UNKNOWN* = 0
  MAV_NO_APP_VISIBLE* = 1
  MAV_APP_VISIBLE* = 2
  IID_IAppVisibilityEvents* = DEFINE_GUID(0x6584ce6b'i32, 0x7d82, 0x49c2, [0x89'u8, 0xc9, 0xc6, 0xbc, 0x02, 0xba, 0x8c, 0x38])
  IID_IAppVisibility* = DEFINE_GUID(0x2246ea2d'i32, 0xcaea, 0x4444, [0xa3'u8, 0xc4, 0x6d, 0xe8, 0x27, 0xe4, 0x43, 0x13])
  PES_UNKNOWN* = 0
  PES_RUNNING* = 1
  PES_SUSPENDING* = 2
  PES_SUSPENDED* = 3
  PES_TERMINATED* = 4
  IID_IPackageExecutionStateChangeNotification* = DEFINE_GUID(0x1bb12a62'i32, 0x2ad8, 0x432b, [0x8c'u8, 0xcf, 0x0c, 0x2c, 0x52, 0xaf, 0xcd, 0x5b])
  IID_IPackageDebugSettings* = DEFINE_GUID(0xf27c3930'i32, 0x8029, 0x4ad1, [0x94'u8, 0xe3, 0x3d, 0xba, 0x41, 0x78, 0x10, 0xc1])
  AHE_DESKTOP* = 0
  AHE_IMMERSIVE* = 1
  IID_IExecuteCommandApplicationHostEnvironment* = DEFINE_GUID(0x18b21aa9'i32, 0xe184, 0x4ff0, [0x9f'u8, 0x5e, 0xf8, 0x82, 0xd0, 0x37, 0x71, 0xb3])
  ECHUIM_DESKTOP* = 0
  ECHUIM_IMMERSIVE* = 1
  ECHUIM_SYSTEM_LAUNCHER* = 2
  IID_IExecuteCommandHost* = DEFINE_GUID(0x4b6832a2'i32, 0x5f04, 0x4c9d, [0xb8'u8, 0x9d, 0x72, 0x7a, 0x15, 0xd1, 0x03, 0xe7])
  SID_ExecuteCommandHost* = IID_IExecuteCommandHost
  AVS_FULLSCREEN_LANDSCAPE* = 0
  AVS_FILLED* = 1
  AVS_SNAPPED* = 2
  AVS_FULLSCREEN_PORTRAIT* = 3
  EGK_TOUCH* = 0
  EGK_KEYBOARD* = 1
  EGK_MOUSE* = 2
  IID_IApplicationDesignModeSettings* = DEFINE_GUID(0x2a3dee9a'i32, 0xe31d, 0x46d6, [0x85'u8, 0x08, 0xbc, 0xc5, 0x97, 0xdb, 0x35, 0x57])
  IID_IInitializeWithWindow* = DEFINE_GUID(0x3e68d4bd'i32, 0x7135, 0x4d10, [0x80'u8, 0x18, 0x9f, 0xb6, 0xd9, 0xf3, 0x3f, 0xa1])
  IID_IHandlerInfo* = DEFINE_GUID(0x997706ef'i32, 0xf880, 0x453b, [0x81'u8, 0x18, 0x39, 0xe1, 0xa2, 0xd2, 0x65, 0x5a])
  IID_IHandlerActivationHost* = DEFINE_GUID(0x35094a87'i32, 0x8bb1, 0x4237, [0x96'u8, 0xc6, 0xc4, 0x17, 0xee, 0xbd, 0xb0, 0x78])
  SID_SHandlerActivationHost* = IID_IHandlerActivationHost
  SID_ShellExecuteNamedPropertyStore* = DEFINE_GUID(0xeb84ada2'i32, 0x00ff, 0x4992, [0x83'u8, 0x24, 0xed, 0x5c, 0xe0, 0x61, 0xcb, 0x29])
  GIL_OPENICON* = 0x1
  GIL_FORSHELL* = 0x2
  GIL_ASYNC* = 0x20
  GIL_DEFAULTICON* = 0x40
  GIL_FORSHORTCUT* = 0x80
  GIL_CHECKSHIELD* = 0x200
  GIL_SIMULATEDOC* = 0x1
  GIL_PERINSTANCE* = 0x2
  GIL_PERCLASS* = 0x4
  GIL_NOTFILENAME* = 0x8
  GIL_DONTCACHE* = 0x10
  GIL_SHIELD* = 0x200
  GIL_FORCENOSHIELD* = 0x400
  ISIOI_ICONFILE* = 0x1
  ISIOI_ICONINDEX* = 0x2
  SIOM_OVERLAYINDEX* = 1
  SIOM_ICONINDEX* = 2
  SIOM_RESERVED_SHARED* = 0
  SIOM_RESERVED_LINK* = 1
  SIOM_RESERVED_SLOWFILE* = 2
  SIOM_RESERVED_DEFAULT* = 3
  OI_DEFAULT* = 0x0
  OI_ASYNC* = 0xffffeeee'i32
  IDO_SHGIOI_SHARE* = 0x0fffffff
  IDO_SHGIOI_LINK* = 0x0ffffffe
  IDO_SHGIOI_SLOWFILE* = 0x0fffffffd'i32
  IDO_SHGIOI_DEFAULT* = 0x0fffffffc'i32
  SLDF_DEFAULT* = 0x00000000
  SLDF_HAS_ID_LIST* = 0x00000001
  SLDF_HAS_LINK_INFO* = 0x00000002
  SLDF_HAS_NAME* = 0x00000004
  SLDF_HAS_RELPATH* = 0x00000008
  SLDF_HAS_WORKINGDIR* = 0x00000010
  SLDF_HAS_ARGS* = 0x00000020
  SLDF_HAS_ICONLOCATION* = 0x00000040
  SLDF_UNICODE* = 0x00000080
  SLDF_FORCE_NO_LINKINFO* = 0x00000100
  SLDF_HAS_EXP_SZ* = 0x00000200
  SLDF_RUN_IN_SEPARATE* = 0x00000400
  SLDF_HAS_LOGO3ID* = 0x00000800
  SLDF_HAS_DARWINID* = 0x00001000
  SLDF_RUNAS_USER* = 0x00002000
  SLDF_HAS_EXP_ICON_SZ* = 0x00004000
  SLDF_NO_PIDL_ALIAS* = 0x00008000
  SLDF_FORCE_UNCNAME* = 0x00010000
  SLDF_RUN_WITH_SHIMLAYER* = 0x00020000
  SLDF_FORCE_NO_LINKTRACK* = 0x00040000
  SLDF_ENABLE_TARGET_METADATA* = 0x00080000
  SLDF_DISABLE_LINK_PATH_TRACKING* = 0x00100000
  SLDF_DISABLE_KNOWNFOLDER_RELATIVE_TRACKING* = 0x00200000
  SLDF_NO_KF_ALIAS* = 0x00400000
  SLDF_ALLOW_LINK_TO_LINK* = 0x00800000
  SLDF_UNALIAS_ON_SAVE* = 0x01000000
  SLDF_PREFER_ENVIRONMENT_PATH* = 0x02000000
  SLDF_KEEP_LOCAL_IDLIST_FOR_UNC_TARGET* = 0x04000000
  SLDF_PERSIST_VOLUME_ID_RELATIVE* = 0x08000000
  SLDF_VALID* = 0x0ffff7ff
  SLDF_RESERVED* = int32 0x80000000'i32
  NT_CONSOLE_PROPS_SIG* = 0xa0000002'i32
  NT_FE_CONSOLE_PROPS_SIG* = 0xa0000004'i32
  EXP_DARWIN_ID_SIG* = 0xa0000006'i32
  EXP_SPECIAL_FOLDER_SIG* = 0xa0000005'i32
  EXP_SZ_LINK_SIG* = 0xa0000001'i32
  EXP_SZ_ICON_SIG* = 0xa0000007'i32
  EXP_PROPERTYSTORAGE_SIG* = 0xa0000009'i32
  FVSIF_RECT* = 0x00000001
  FVSIF_PINNED* = 0x00000002
  FVSIF_NEWFAILED* = 0x08000000
  FVSIF_NEWFILE* = 0x80000000'i32
  FVSIF_CANVIEWIT* = 0x40000000
  FCIDM_SHVIEWFIRST* = 0x0000
  FCIDM_SHVIEWLAST* = 0x7fff
  FCIDM_BROWSERFIRST* = 0xa000
  FCIDM_BROWSERLAST* = 0xbf00
  FCIDM_GLOBALFIRST* = 0x8000
  FCIDM_GLOBALLAST* = 0x9fff
  FCIDM_MENU_FILE* = FCIDM_GLOBALFIRST+0x0000
  FCIDM_MENU_EDIT* = FCIDM_GLOBALFIRST+0x0040
  FCIDM_MENU_VIEW* = FCIDM_GLOBALFIRST+0x0080
  FCIDM_MENU_VIEW_SEP_OPTIONS* = FCIDM_GLOBALFIRST+0x0081
  FCIDM_MENU_TOOLS* = FCIDM_GLOBALFIRST+0x00c0
  FCIDM_MENU_TOOLS_SEP_GOTO* = FCIDM_GLOBALFIRST+0x00c1
  FCIDM_MENU_HELP* = FCIDM_GLOBALFIRST+0x0100
  FCIDM_MENU_FIND* = FCIDM_GLOBALFIRST+0x0140
  FCIDM_MENU_EXPLORE* = FCIDM_GLOBALFIRST+0x0150
  FCIDM_MENU_FAVORITES* = FCIDM_GLOBALFIRST+0x0170
  FCIDM_TOOLBAR* = FCIDM_BROWSERFIRST+0
  FCIDM_STATUS* = FCIDM_BROWSERFIRST+1
  IDC_OFFLINE_HAND* = 103
  IDC_PANTOOL_HAND_OPEN* = 104
  IDC_PANTOOL_HAND_CLOSED* = 105
  PANE_NONE* = DWORD(-1)
  PANE_ZONE* = 1
  PANE_OFFLINE* = 2
  PANE_PRINTER* = 3
  PANE_SSL* = 4
  PANE_NAVIGATION* = 5
  PANE_PROGRESS* = 6
  PANE_PRIVACY* = 7
  GPFIDL_DEFAULT* = 0x0
  GPFIDL_ALTNAME* = 0x1
  GPFIDL_UNCPRINTER* = 0x2
  OFASI_EDIT* = 0x0001
  OFASI_OPENDESKTOP* = 0x0002
type
  Shell* {.pure.} = object
const
  REGSTR_PATH_SPECIAL_FOLDERS* = REGSTR_PATH_EXPLORER & "\\Shell Folders"
  CSIDL_DESKTOP* = 0x0000
  CSIDL_INTERNET* = 0x0001
  CSIDL_PROGRAMS* = 0x0002
  CSIDL_CONTROLS* = 0x0003
  CSIDL_PRINTERS* = 0x0004
  CSIDL_FAVORITES* = 0x0006
  CSIDL_STARTUP* = 0x0007
  CSIDL_RECENT* = 0x0008
  CSIDL_SENDTO* = 0x0009
  CSIDL_BITBUCKET* = 0x000a
  CSIDL_STARTMENU* = 0x000b
  CSIDL_MYDOCUMENTS* = CSIDL_PERSONAL
  CSIDL_DESKTOPDIRECTORY* = 0x0010
  CSIDL_DRIVES* = 0x0011
  CSIDL_NETWORK* = 0x0012
  CSIDL_NETHOOD* = 0x0013
  CSIDL_FONTS* = 0x0014
  CSIDL_TEMPLATES* = 0x0015
  CSIDL_COMMON_STARTMENU* = 0x0016
  CSIDL_COMMON_PROGRAMS* = 0x0017
  CSIDL_COMMON_STARTUP* = 0x0018
  CSIDL_COMMON_DESKTOPDIRECTORY* = 0x0019
  CSIDL_PRINTHOOD* = 0x001b
  CSIDL_LOCAL_APPDATA* = 0x001c
  CSIDL_ALTSTARTUP* = 0x001d
  CSIDL_COMMON_ALTSTARTUP* = 0x001e
  CSIDL_COMMON_FAVORITES* = 0x001f
  CSIDL_INTERNET_CACHE* = 0x0020
  CSIDL_COOKIES* = 0x0021
  CSIDL_HISTORY* = 0x0022
  CSIDL_COMMON_APPDATA* = 0x0023
  CSIDL_WINDOWS* = 0x0024
  CSIDL_SYSTEM* = 0x0025
  CSIDL_PROGRAM_FILES* = 0x0026
  CSIDL_PROFILE* = 0x0028
  CSIDL_SYSTEMX86* = 0x0029
  CSIDL_PROGRAM_FILESX86* = 0x002a
  CSIDL_PROGRAM_FILES_COMMON* = 0x002b
  CSIDL_PROGRAM_FILES_COMMONX86* = 0x002c
  CSIDL_COMMON_TEMPLATES* = 0x002d
  CSIDL_COMMON_DOCUMENTS* = 0x002e
  CSIDL_COMMON_ADMINTOOLS* = 0x002f
  CSIDL_ADMINTOOLS* = 0x0030
  CSIDL_CONNECTIONS* = 0x0031
  CSIDL_COMMON_MUSIC* = 0x0035
  CSIDL_COMMON_PICTURES* = 0x0036
  CSIDL_COMMON_VIDEO* = 0x0037
  CSIDL_RESOURCES* = 0x0038
  CSIDL_RESOURCES_LOCALIZED* = 0x0039
  CSIDL_COMMON_OEM_LINKS* = 0x003a
  CSIDL_CDBURN_AREA* = 0x003b
  CSIDL_COMPUTERSNEARME* = 0x003d
  CSIDL_FLAG_DONT_UNEXPAND* = 0x2000
  CSIDL_FLAG_NO_ALIAS* = 0x1000
  CSIDL_FLAG_PER_USER_INIT* = 0x0800
  CSIDL_FLAG_MASK* = 0xff00
  KF_FLAG_DEFAULT* = 0x00000000
  KF_FLAG_NO_APPCONTAINER_REDIRECTION* = 0x00010000
  KF_FLAG_CREATE* = 0x00008000
  KF_FLAG_DONT_VERIFY* = 0x00004000
  KF_FLAG_DONT_UNEXPAND* = 0x00002000
  KF_FLAG_NO_ALIAS* = 0x00001000
  KF_FLAG_INIT* = 0x00000800
  KF_FLAG_DEFAULT_PATH* = 0x00000400
  KF_FLAG_NOT_PARENT_RELATIVE* = 0x00000200
  KF_FLAG_SIMPLE_IDLIST* = 0x00000100
  KF_FLAG_ALIAS_ONLY* = 0x80000000'i32
  FCS_READ* = 0x00000001
  FCS_FORCEWRITE* = 0x00000002
  FCS_WRITE* = FCS_READ or FCS_FORCEWRITE
  FCS_FLAG_DRAGDROP* = 2
  FCSM_VIEWID* = 0x00000001
  FCSM_WEBVIEWTEMPLATE* = 0x00000002
  FCSM_INFOTIP* = 0x00000004
  FCSM_CLSID* = 0x00000008
  FCSM_ICONFILE* = 0x00000010
  FCSM_LOGO* = 0x00000020
  FCSM_FLAGS* = 0x00000040
  BIF_RETURNONLYFSDIRS* = 0x00000001
  BIF_DONTGOBELOWDOMAIN* = 0x00000002
  BIF_STATUSTEXT* = 0x00000004
  BIF_RETURNFSANCESTORS* = 0x00000008
  BIF_EDITBOX* = 0x00000010
  BIF_VALIDATE* = 0x00000020
  BIF_NEWDIALOGSTYLE* = 0x00000040
  BIF_USENEWUI* = BIF_NEWDIALOGSTYLE or BIF_EDITBOX
  BIF_BROWSEINCLUDEURLS* = 0x00000080
  BIF_UAHINT* = 0x00000100
  BIF_NONEWFOLDERBUTTON* = 0x00000200
  BIF_NOTRANSLATETARGETS* = 0x00000400
  BIF_BROWSEFORCOMPUTER* = 0x00001000
  BIF_BROWSEFORPRINTER* = 0x00002000
  BIF_BROWSEINCLUDEFILES* = 0x00004000
  BIF_SHAREABLE* = 0x00008000
  BIF_BROWSEFILEJUNCTIONS* = 0x00010000
  BFFM_INITIALIZED* = 1
  BFFM_SELCHANGED* = 2
  BFFM_VALIDATEFAILEDA* = 3
  BFFM_VALIDATEFAILEDW* = 4
  BFFM_IUNKNOWN* = 5
  BFFM_SETSTATUSTEXTA* = WM_USER+100
  BFFM_ENABLEOK* = WM_USER+101
  BFFM_SETSELECTIONA* = WM_USER+102
  BFFM_SETSELECTIONW* = WM_USER+103
  BFFM_SETSTATUSTEXTW* = WM_USER+104
  BFFM_SETOKTEXT* = WM_USER+105
  BFFM_SETEXPANDED* = WM_USER+106
  ISHCUTCMDID_DOWNLOADICON* = 0
  ISHCUTCMDID_INTSHORTCUTCREATE* = 1
  ISHCUTCMDID_COMMITHISTORY* = 2
  ISHCUTCMDID_SETUSERAWURL* = 3
  CMDID_INTSHORTCUTCREATE* = ISHCUTCMDID_INTSHORTCUTCREATE
  STR_PARSE_WITH_PROPERTIES* = "ParseWithProperties"
  STR_PARSE_PARTIAL_IDLIST* = "ParseOriginalItem"
  ACLO_NONE* = 0
  ACLO_CURRENTDIR* = 1
  ACLO_MYCOMPUTER* = 2
  ACLO_DESKTOP* = 4
  ACLO_FAVORITES* = 8
  ACLO_FILESYSONLY* = 16
  ACLO_FILESYSDIRS* = 32
  ACLO_VIRTUALNAMESPACE* = 64
  PROGDLG_NORMAL* = 0x00000000
  PROGDLG_MODAL* = 0x00000001
  PROGDLG_AUTOTIME* = 0x00000002
  PROGDLG_NOTIME* = 0x00000004
  PROGDLG_NOMINIMIZE* = 0x00000008
  PROGDLG_NOPROGRESSBAR* = 0x00000010
  PROGDLG_MARQUEEPROGRESS* = 0x00000020
  PROGDLG_NOCANCEL* = 0x00000040
  PDTIMER_RESET* = 0x00000001
  PDTIMER_PAUSE* = 0x00000002
  PDTIMER_RESUME* = 0x00000003
  DWFRF_NORMAL* = 0x0000
  DWFRF_DELETECONFIGDATA* = 0x0001
  DWFAF_HIDDEN* = 0x1
  DWFAF_GROUP1* = 0x2
  DWFAF_GROUP2* = 0x4
  DWFAF_AUTOHIDE* = 0x10
  IID_IEnumShellImageStore* = DEFINE_GUID(0x6DFD582B'i32, 0x92E3, 0x11D1, [0x98'u8, 0xA3, 0x00, 0xC0, 0x4F, 0xB6, 0x87, 0xDA])
  SHIMSTCAPFLAG_LOCKABLE* = 0x0001
  SHIMSTCAPFLAG_PURGEABLE* = 0x0002
  ISFB_MASK_STATE* = 0x00000001
  ISFB_MASK_BKCOLOR* = 0x00000002
  ISFB_MASK_VIEWMODE* = 0x00000004
  ISFB_MASK_SHELLFOLDER* = 0x00000008
  ISFB_MASK_IDLIST* = 0x00000010
  ISFB_MASK_COLORS* = 0x00000020
  ISFB_STATE_DEFAULT* = 0x00000000
  ISFB_STATE_DEBOSSED* = 0x00000001
  ISFB_STATE_ALLOWRENAME* = 0x00000002
  ISFB_STATE_NOSHOWTEXT* = 0x00000004
  ISFB_STATE_CHANNELBAR* = 0x00000010
  ISFB_STATE_QLINKSMODE* = 0x00000020
  ISFB_STATE_FULLOPEN* = 0x00000040
  ISFB_STATE_NONAMESORT* = 0x00000080
  ISFB_STATE_BTNMINSIZE* = 0x00000100
  ISFBVIEWMODE_SMALLICONS* = 0x0001
  ISFBVIEWMODE_LARGEICONS* = 0x0002
  ISFBVIEWMODE_LOGOS* = 0x0003
  SFBID_PIDLCHANGED* = 0
  IID_IDeskBarClient* = DEFINE_GUID(0xEB0FE175'i32, 0x1A3A, 0x11D0, [0x89'u8, 0xB3, 0x00, 0xA0, 0xC9, 0x0A, 0x90, 0xAC])
  DBC_GS_IDEAL* = 0
  DBC_GS_SIZEDOWN* = 1
  DBC_HIDE* = 0
  DBC_SHOW* = 1
  DBC_SHOWOBSCURE* = 2
  DBCID_EMPTY* = 0
  DBCID_ONDRAG* = 1
  DBCID_CLSIDOFBAR* = 2
  DBCID_RESIZE* = 3
  DBCID_GETBAR* = 4
  COMPONENT_TOP* = 0x3fffffff
  COMP_TYPE_HTMLDOC* = 0
  COMP_TYPE_PICTURE* = 1
  COMP_TYPE_WEBSITE* = 2
  COMP_TYPE_CONTROL* = 3
  COMP_TYPE_CFHTML* = 4
  COMP_TYPE_MAX* = 4
  IS_NORMAL* = 0x00000001
  IS_FULLSCREEN* = 0x00000002
  IS_SPLIT* = 0x00000004
  IS_VALIDSIZESTATEBITS* = IS_NORMAL or IS_SPLIT or IS_FULLSCREEN
  IS_VALIDSTATEBITS* = IS_NORMAL or IS_SPLIT or IS_FULLSCREEN or 0x80000000'i32 or 0x40000000
  AD_APPLY_SAVE* = 0x00000001
  AD_APPLY_HTMLGEN* = 0x00000002
  AD_APPLY_REFRESH* = 0x00000004
  AD_APPLY_ALL* = AD_APPLY_SAVE or AD_APPLY_HTMLGEN or AD_APPLY_REFRESH
  AD_APPLY_FORCE* = 0x00000008
  AD_APPLY_BUFFERED_REFRESH* = 0x00000010
  AD_APPLY_DYNAMICREFRESH* = 0x00000020
  AD_GETWP_BMP* = 0x00000000
  AD_GETWP_IMAGE* = 0x00000001
  AD_GETWP_LAST_APPLIED* = 0x00000002
  WPSTYLE_CENTER* = 0
  WPSTYLE_TILE* = 1
  WPSTYLE_STRETCH* = 2
  WPSTYLE_KEEPASPECT* = 3
  WPSTYLE_CROPTOFIT* = 4
  WPSTYLE_SPAN* = 5
  WPSTYLE_MAX* = 6
  COMP_ELEM_TYPE* = 0x00000001
  COMP_ELEM_CHECKED* = 0x00000002
  COMP_ELEM_DIRTY* = 0x00000004
  COMP_ELEM_NOSCROLL* = 0x00000008
  COMP_ELEM_POS_LEFT* = 0x00000010
  COMP_ELEM_POS_TOP* = 0x00000020
  COMP_ELEM_SIZE_WIDTH* = 0x00000040
  COMP_ELEM_SIZE_HEIGHT* = 0x00000080
  COMP_ELEM_POS_ZINDEX* = 0x00000100
  COMP_ELEM_SOURCE* = 0x00000200
  COMP_ELEM_FRIENDLYNAME* = 0x00000400
  COMP_ELEM_SUBSCRIBEDURL* = 0x00000800
  COMP_ELEM_ORIGINAL_CSI* = 0x00001000
  COMP_ELEM_RESTORED_CSI* = 0x00002000
  COMP_ELEM_CURITEMSTATE* = 0x00004000
  COMP_ELEM_ALL* = COMP_ELEM_TYPE or COMP_ELEM_CHECKED or COMP_ELEM_DIRTY or COMP_ELEM_NOSCROLL or COMP_ELEM_POS_LEFT or COMP_ELEM_SIZE_WIDTH or COMP_ELEM_SIZE_HEIGHT or COMP_ELEM_POS_ZINDEX or COMP_ELEM_SOURCE or COMP_ELEM_FRIENDLYNAME or COMP_ELEM_POS_TOP or COMP_ELEM_SUBSCRIBEDURL or COMP_ELEM_ORIGINAL_CSI or COMP_ELEM_RESTORED_CSI or COMP_ELEM_CURITEMSTATE
  DTI_ADDUI_DEFAULT* = 0x0
  DTI_ADDUI_DISPSUBWIZARD* = 0x1
  DTI_ADDUI_POSITIONITEM* = 0x2
  ADDURL_SILENT* = 0x1
  COMPONENT_DEFAULT_LEFT* = 0xffff
  COMPONENT_DEFAULT_TOP* = 0xffff
  SSM_CLEAR* = 0x0000
  SSM_SET* = 0x0001
  SSM_REFRESH* = 0x0002
  SSM_UPDATE* = 0x0004
  SCHEME_DISPLAY* = 0x0001
  SCHEME_EDIT* = 0x0002
  SCHEME_LOCAL* = 0x0004
  SCHEME_GLOBAL* = 0x0008
  SCHEME_REFRESH* = 0x0010
  SCHEME_UPDATE* = 0x0020
  SCHEME_DONOTUSE* = 0x0040
  SCHEME_CREATE* = 0x0080
  GADOF_DIRTY* = 0x00000001
  SHCDF_UPDATEITEM* = 0x00000001
  CFSTR_SHELLIDLIST* = "Shell IDList Array"
  CFSTR_SHELLIDLISTOFFSET* = "Shell Object Offsets"
  CFSTR_NETRESOURCES* = "Net Resource"
  CFSTR_FILEDESCRIPTORA* = "FileGroupDescriptor"
  CFSTR_FILEDESCRIPTORW* = "FileGroupDescriptorW"
  CFSTR_FILECONTENTS* = "FileContents"
  CFSTR_FILENAMEA* = "FileName"
  CFSTR_FILENAMEW* = "FileNameW"
  CFSTR_PRINTERGROUP* = "PrinterFriendlyName"
  CFSTR_FILENAMEMAPA* = "FileNameMap"
  CFSTR_FILENAMEMAPW* = "FileNameMapW"
  CFSTR_SHELLURL* = "UniformResourceLocator"
  CFSTR_INETURLA* = CFSTR_SHELLURL
  CFSTR_INETURLW* = "UniformResourceLocatorW"
  CFSTR_PREFERREDDROPEFFECT* = "Preferred DropEffect"
  CFSTR_PERFORMEDDROPEFFECT* = "Performed DropEffect"
  CFSTR_PASTESUCCEEDED* = "Paste Succeeded"
  CFSTR_INDRAGLOOP* = "InShellDragLoop"
  CFSTR_MOUNTEDVOLUME* = "MountedVolume"
  CFSTR_PERSISTEDDATAOBJECT* = "PersistedDataObject"
  CFSTR_TARGETCLSID* = "TargetCLSID"
  CFSTR_LOGICALPERFORMEDDROPEFFECT* = "Logical Performed DropEffect"
  CFSTR_AUTOPLAY_SHELLIDLISTS* = "Autoplay Enumerated IDList Array"
  CFSTR_UNTRUSTEDDRAGDROP* = "UntrustedDragDrop"
  CFSTR_FILE_ATTRIBUTES_ARRAY* = "File Attributes Array"
  CFSTR_INVOKECOMMAND_DROPPARAM* = "InvokeCommand DropParam"
  CFSTR_SHELLDROPHANDLER* = "DropHandlerCLSID"
  CFSTR_DROPDESCRIPTION* = "DropDescription"
  CFSTR_ZONEIDENTIFIER* = "ZoneIdentifier"
  DVASPECT_SHORTNAME* = 2
  DVASPECT_COPY* = 3
  DVASPECT_LINK* = 4
  FD_CLSID* = 0x1
  FD_SIZEPOINT* = 0x2
  FD_ATTRIBUTES* = 0x4
  FD_CREATETIME* = 0x8
  FD_ACCESSTIME* = 0x10
  FD_WRITESTIME* = 0x20
  FD_FILESIZE* = 0x40
  FD_PROGRESSUI* = 0x4000
  FD_LINKUI* = 0x8000
  FD_UNICODE* = int32 0x80000000'i32
  DROPIMAGE_INVALID* = -1
  DROPIMAGE_NONE* = 0
  DROPIMAGE_COPY* = DROPEFFECT_COPY
  DROPIMAGE_MOVE* = DROPEFFECT_MOVE
  DROPIMAGE_LINK* = DROPEFFECT_LINK
  DROPIMAGE_LABEL* = 6
  DROPIMAGE_WARNING* = 7
  DROPIMAGE_NOIMAGE* = 8
  SHCNRF_InterruptLevel* = 0x0001
  SHCNRF_ShellLevel* = 0x0002
  SHCNRF_RecursiveInterrupt* = 0x1000
  SHCNRF_NewDelivery* = 0x8000
  SHCNE_RENAMEITEM* = 0x00000001
  SHCNE_CREATE* = 0x00000002
  SHCNE_DELETE* = 0x00000004
  SHCNE_MKDIR* = 0x00000008
  SHCNE_RMDIR* = 0x00000010
  SHCNE_MEDIAINSERTED* = 0x00000020
  SHCNE_MEDIAREMOVED* = 0x00000040
  SHCNE_DRIVEREMOVED* = 0x00000080
  SHCNE_DRIVEADD* = 0x00000100
  SHCNE_NETSHARE* = 0x00000200
  SHCNE_NETUNSHARE* = 0x00000400
  SHCNE_ATTRIBUTES* = 0x00000800
  SHCNE_UPDATEDIR* = 0x00001000
  SHCNE_UPDATEITEM* = 0x00002000
  SHCNE_SERVERDISCONNECT* = 0x00004000
  SHCNE_UPDATEIMAGE* = 0x00008000
  SHCNE_DRIVEADDGUI* = 0x00010000
  SHCNE_RENAMEFOLDER* = 0x00020000
  SHCNE_FREESPACE* = 0x00040000
  SHCNE_EXTENDED_EVENT* = 0x04000000
  SHCNE_ASSOCCHANGED* = 0x08000000
  SHCNE_DISKEVENTS* = 0x0002381f
  SHCNE_GLOBALEVENTS* = 0x0c0581e0
  SHCNE_ALLEVENTS* = 0x7fffffff
  SHCNE_INTERRUPT* = 0x80000000'i32
  SHCNEE_ORDERCHANGED* = 2
  SHCNEE_MSI_CHANGE* = 4
  SHCNEE_MSI_UNINSTALL* = 5
  SHCNF_IDLIST* = 0x0000
  SHCNF_PATHA* = 0x0001
  SHCNF_PRINTERA* = 0x0002
  SHCNF_DWORD* = 0x0003
  SHCNF_PATHW* = 0x0005
  SHCNF_PRINTERW* = 0x0006
  SHCNF_TYPE* = 0x00ff
  SHCNF_FLUSH* = 0x1000
  SHCNF_FLUSHNOWAIT* = 0x3000
  SHCNF_NOTIFYRECURSIVE* = 0x10000
  QITIPF_DEFAULT* = 0x00000000
  QITIPF_USENAME* = 0x00000001
  QITIPF_LINKNOTARGET* = 0x00000002
  QITIPF_LINKUSETARGET* = 0x00000004
  QITIPF_USESLOWTIP* = 0x00000008
  QITIPF_SINGLELINE* = 0x00000010
  QIF_CACHED* = 0x00000001
  QIF_DONTEXPANDFOLDER* = 0x00000002
  SHARD_PIDL* = 0x00000001
  SHARD_PATHA* = 0x00000002
  SHARD_PATHW* = 0x00000003
  SHARD_APPIDINFO* = 0x00000004
  SHARD_APPIDINFOIDLIST* = 0x00000005
  SHARD_LINK* = 0x00000006
  SHARD_APPIDINFOLINK* = 0x00000007
  SHARD_SHELLITEM* = 0x00000008
  SCNRT_ENABLE* = 0
  SCNRT_DISABLE* = 1
  SHGDFIL_FINDDATA* = 1
  SHGDFIL_NETRESOURCE* = 2
  SHGDFIL_DESCRIPTIONID* = 3
  SHDID_ROOT_REGITEM* = 1
  SHDID_FS_FILE* = 2
  SHDID_FS_DIRECTORY* = 3
  SHDID_FS_OTHER* = 4
  SHDID_COMPUTER_DRIVE35* = 5
  SHDID_COMPUTER_DRIVE525* = 6
  SHDID_COMPUTER_REMOVABLE* = 7
  SHDID_COMPUTER_FIXED* = 8
  SHDID_COMPUTER_NETDRIVE* = 9
  SHDID_COMPUTER_CDROM* = 10
  SHDID_COMPUTER_RAMDISK* = 11
  SHDID_COMPUTER_OTHER* = 12
  SHDID_NET_DOMAIN* = 13
  SHDID_NET_SERVER* = 14
  SHDID_NET_SHARE* = 15
  SHDID_NET_RESTOFNET* = 16
  SHDID_NET_OTHER* = 17
  SHDID_COMPUTER_IMAGING* = 18
  SHDID_COMPUTER_AUDIO* = 19
  SHDID_COMPUTER_SHAREDDOCS* = 20
  SHDID_MOBILE_DEVICE* = 21
  PRF_VERIFYEXISTS* = 0x1
  PRF_TRYPROGRAMEXTENSIONS* = 0x2 or PRF_VERIFYEXISTS
  PRF_FIRSTDIRDEF* = 0x4
  PRF_DONTFINDLNK* = 0x8
  PRF_REQUIREABSOLUTE* = 0x10
  NUM_POINTS* = 3
  CABINETSTATE_VERSION* = 2
  PCS_FATAL* = 0x80000000'i32
  PCS_REPLACEDCHAR* = 0x00000001
  PCS_REMOVEDCHAR* = 0x00000002
  PCS_TRUNCATED* = 0x00000004
  PCS_PATHTOOLONG* = 0x00000008
  MM_ADDSEPARATOR* = 0x00000001
  MM_SUBMENUSHAVEIDS* = 0x00000002
  MM_DONTREMOVESEPS* = 0x00000004
  SHOP_PRINTERNAME* = 0x00000001
  SHOP_FILEPATH* = 0x00000002
  SHOP_VOLUMEGUID* = 0x00000004
  SHFMT_ID_DEFAULT* = 0xffff
  SHFMT_OPT_FULL* = 0x0001
  SHFMT_OPT_SYSONLY* = 0x0002
  SHFMT_ERROR* = 0xffffffff'i32
  SHFMT_CANCEL* = 0xfffffffe'i32
  SHFMT_NOFORMAT* = 0xfffffffd'i32
  REST_NONE* = 0x00000000
  REST_NORUN* = 0x00000001
  REST_NOCLOSE* = 0x00000002
  REST_NOSAVESET* = 0x00000004
  REST_NOFILEMENU* = 0x00000008
  REST_NOSETFOLDERS* = 0x00000010
  REST_NOSETTASKBAR* = 0x00000020
  REST_NODESKTOP* = 0x00000040
  REST_NOFIND* = 0x00000080
  REST_NODRIVES* = 0x00000100
  REST_NODRIVEAUTORUN* = 0x00000200
  REST_NODRIVETYPEAUTORUN* = 0x00000400
  REST_NONETHOOD* = 0x00000800
  REST_STARTBANNER* = 0x00001000
  REST_RESTRICTRUN* = 0x00002000
  REST_NOPRINTERTABS* = 0x00004000
  REST_NOPRINTERDELETE* = 0x00008000
  REST_NOPRINTERADD* = 0x00010000
  REST_NOSTARTMENUSUBFOLDERS* = 0x00020000
  REST_MYDOCSONNET* = 0x00040000
  REST_NOEXITTODOS* = 0x00080000
  REST_ENFORCESHELLEXTSECURITY* = 0x00100000
  REST_LINKRESOLVEIGNORELINKINFO* = 0x00200000
  REST_NOCOMMONGROUPS* = 0x00400000
  REST_SEPARATEDESKTOPPROCESS* = 0x00800000
  REST_NOWEB* = 0x01000000
  REST_NOTRAYCONTEXTMENU* = 0x02000000
  REST_NOVIEWCONTEXTMENU* = 0x04000000
  REST_NONETCONNECTDISCONNECT* = 0x08000000
  REST_STARTMENULOGOFF* = 0x10000000
  REST_NOSETTINGSASSIST* = 0x20000000
  REST_NOINTERNETICON* = 0x40000001
  REST_NORECENTDOCSHISTORY* = 0x40000002
  REST_NORECENTDOCSMENU* = 0x40000003
  REST_NOACTIVEDESKTOP* = 0x40000004
  REST_NOACTIVEDESKTOPCHANGES* = 0x40000005
  REST_NOFAVORITESMENU* = 0x40000006
  REST_CLEARRECENTDOCSONEXIT* = 0x40000007
  REST_CLASSICSHELL* = 0x40000008
  REST_NOCUSTOMIZEWEBVIEW* = 0x40000009
  REST_NOHTMLWALLPAPER* = 0x40000010
  REST_NOCHANGINGWALLPAPER* = 0x40000011
  REST_NODESKCOMP* = 0x40000012
  REST_NOADDDESKCOMP* = 0x40000013
  REST_NODELDESKCOMP* = 0x40000014
  REST_NOCLOSEDESKCOMP* = 0x40000015
  REST_NOCLOSE_DRAGDROPBAND* = 0x40000016
  REST_NOMOVINGBAND* = 0x40000017
  REST_NOEDITDESKCOMP* = 0x40000018
  REST_NORESOLVESEARCH* = 0x40000019
  REST_NORESOLVETRACK* = 0x4000001a
  REST_FORCECOPYACLWITHFILE* = 0x4000001b
  REST_NOLOGO3CHANNELNOTIFY* = 0x4000001c
  REST_NOFORGETSOFTWAREUPDATE* = 0x4000001d
  REST_NOSETACTIVEDESKTOP* = 0x4000001e
  REST_NOUPDATEWINDOWS* = 0x4000001f
  REST_NOCHANGESTARMENU* = 0x40000020
  REST_NOFOLDEROPTIONS* = 0x40000021
  REST_HASFINDCOMPUTERS* = 0x40000022
  REST_INTELLIMENUS* = 0x40000023
  REST_RUNDLGMEMCHECKBOX* = 0x40000024
  REST_ARP_ShowPostSetup* = 0x40000025
  REST_NOCSC* = 0x40000026
  REST_NOCONTROLPANEL* = 0x40000027
  REST_ENUMWORKGROUP* = 0x40000028
  REST_ARP_NOARP* = 0x40000029
  REST_ARP_NOREMOVEPAGE* = 0x4000002a
  REST_ARP_NOADDPAGE* = 0x4000002b
  REST_ARP_NOWINSETUPPAGE* = 0x4000002c
  REST_GREYMSIADS* = 0x4000002d
  REST_NOCHANGEMAPPEDDRIVELABEL* = 0x4000002e
  REST_NOCHANGEMAPPEDDRIVECOMMENT* = 0x4000002f
  REST_MaxRecentDocs* = 0x40000030
  REST_NONETWORKCONNECTIONS* = 0x40000031
  REST_FORCESTARTMENULOGOFF* = 0x40000032
  REST_NOWEBVIEW* = 0x40000033
  REST_NOCUSTOMIZETHISFOLDER* = 0x40000034
  REST_NOENCRYPTION* = 0x40000035
  REST_DONTSHOWSUPERHIDDEN* = 0x40000037
  REST_NOSHELLSEARCHBUTTON* = 0x40000038
  REST_NOHARDWARETAB* = 0x40000039
  REST_NORUNASINSTALLPROMPT* = 0x4000003a
  REST_PROMPTRUNASINSTALLNETPATH* = 0x4000003b
  REST_NOMANAGEMYCOMPUTERVERB* = 0x4000003c
  REST_DISALLOWRUN* = 0x4000003e
  REST_NOWELCOMESCREEN* = 0x4000003f
  REST_RESTRICTCPL* = 0x40000040
  REST_DISALLOWCPL* = 0x40000041
  REST_NOSMBALLOONTIP* = 0x40000042
  REST_NOSMHELP* = 0x40000043
  REST_NOWINKEYS* = 0x40000044
  REST_NOENCRYPTONMOVE* = 0x40000045
  REST_NOLOCALMACHINERUN* = 0x40000046
  REST_NOCURRENTUSERRUN* = 0x40000047
  REST_NOLOCALMACHINERUNONCE* = 0x40000048
  REST_NOCURRENTUSERRUNONCE* = 0x40000049
  REST_FORCEACTIVEDESKTOPON* = 0x4000004a
  REST_NOVIEWONDRIVE* = 0x4000004c
  REST_NONETCRAWL* = 0x4000004d
  REST_NOSHAREDDOCUMENTS* = 0x4000004e
  REST_NOSMMYDOCS* = 0x4000004f
  REST_NOSMMYPICS* = 0x40000050
  REST_ALLOWBITBUCKDRIVES* = 0x40000051
  REST_NONLEGACYSHELLMODE* = 0x40000052
  REST_NOCONTROLPANELBARRICADE* = 0x40000053
  REST_NOSTARTPAGE* = 0x40000054
  REST_NOAUTOTRAYNOTIFY* = 0x40000055
  REST_NOTASKGROUPING* = 0x40000056
  REST_NOCDBURNING* = 0x40000057
  REST_MYCOMPNOPROP* = 0x40000058
  REST_MYDOCSNOPROP* = 0x40000059
  REST_NOSTARTPANEL* = 0x4000005a
  REST_NODISPLAYAPPEARANCEPAGE* = 0x4000005b
  REST_NOTHEMESTAB* = 0x4000005c
  REST_NOVISUALSTYLECHOICE* = 0x4000005d
  REST_NOSIZECHOICE* = 0x4000005e
  REST_NOCOLORCHOICE* = 0x4000005f
  REST_SETVISUALSTYLE* = 0x40000060
  REST_STARTRUNNOHOMEPATH* = 0x40000061
  REST_NOUSERNAMEINSTARTPANEL* = 0x40000062
  REST_NOMYCOMPUTERICON* = 0x40000063
  REST_NOSMNETWORKPLACES* = 0x40000064
  REST_NOSMPINNEDLIST* = 0x40000065
  REST_NOSMMYMUSIC* = 0x40000066
  REST_NOSMEJECTPC* = 0x40000067
  REST_NOSMMOREPROGRAMS* = 0x40000068
  REST_NOSMMFUPROGRAMS* = 0x40000069
  REST_NOTRAYITEMSDISPLAY* = 0x4000006a
  REST_NOTOOLBARSONTASKBAR* = 0x4000006b
  REST_NOSMCONFIGUREPROGRAMS* = 0x4000006f
  REST_HIDECLOCK* = 0x40000070
  REST_NOLOWDISKSPACECHECKS* = 0x40000071
  REST_NOENTIRENETWORK* = 0x40000072
  REST_NODESKTOPCLEANUP* = 0x40000073
  REST_BITBUCKNUKEONDELETE* = 0x40000074
  REST_BITBUCKCONFIRMDELETE* = 0x40000075
  REST_BITBUCKNOPROP* = 0x40000076
  REST_NODISPBACKGROUND* = 0x40000077
  REST_NODISPSCREENSAVEPG* = 0x40000078
  REST_NODISPSETTINGSPG* = 0x40000079
  REST_NODISPSCREENSAVEPREVIEW* = 0x4000007a
  REST_NODISPLAYCPL* = 0x4000007b
  REST_HIDERUNASVERB* = 0x4000007c
  REST_NOTHUMBNAILCACHE* = 0x4000007d
  REST_NOSTRCMPLOGICAL* = 0x4000007e
  REST_NOPUBLISHWIZARD* = 0x4000007f
  REST_NOONLINEPRINTSWIZARD* = 0x40000080
  REST_NOWEBSERVICES* = 0x40000081
  REST_ALLOWUNHASHEDWEBVIEW* = 0x40000082
  REST_ALLOWLEGACYWEBVIEW* = 0x40000083
  REST_REVERTWEBVIEWSECURITY* = 0x40000084
  REST_INHERITCONSOLEHANDLES* = 0x40000086
  REST_SORTMAXITEMCOUNT* = 0x40000087
  REST_NOREMOTERECURSIVEEVENTS* = 0x40000089
  REST_NOREMOTECHANGENOTIFY* = 0x40000091
  REST_NOSIMPLENETIDLIST* = 0x40000092
  REST_NOENUMENTIRENETWORK* = 0x40000093
  REST_NODETAILSTHUMBNAILONNETWORK* = 0x40000094
  REST_NOINTERNETOPENWITH* = 0x40000095
  REST_DONTRETRYBADNETNAME* = 0x4000009b
  REST_ALLOWFILECLSIDJUNCTIONS* = 0x4000009c
  REST_NOUPNPINSTALL* = 0x4000009d
  REST_ARP_DONTGROUPPATCHES* = 0x400000ac
  REST_ARP_NOCHOOSEPROGRAMSPAGE* = 0x400000ad
  REST_NODISCONNECT* = 0x41000001
  REST_NOSECURITY* = 0x41000002
  REST_NOFILEASSOCIATE* = 0x41000003
  REST_ALLOWCOMMENTTOGGLE* = 0x41000004
  REST_USEDESKTOPINICACHE* = 0x41000005
  PPCF_ADDQUOTES* = 0x00000001
  PPCF_ADDARGUMENTS* = 0x00000003
  PPCF_NODIRECTORIES* = 0x00000010
  PPCF_FORCEQUALIFY* = 0x00000040
  PPCF_LONGESTPOSSIBLE* = 0x00000080
  OAIF_ALLOW_REGISTRATION* = 0x1
  OAIF_REGISTER_EXT* = 0x2
  OAIF_EXEC* = 0x4
  OAIF_FORCE_REGISTRATION* = 0x8
  OAIF_HIDE_REGISTRATION* = 0x20
  OAIF_URL_PROTOCOL* = 0x40
  OAIF_FILE_IS_URI* = 0x80
  VALIDATEUNC_CONNECT* = 0x0001
  VALIDATEUNC_NOUI* = 0x0002
  VALIDATEUNC_PRINT* = 0x0004
  VALIDATEUNC_PERSIST* = 0x0008
  VALIDATEUNC_VALID* = 0x000f
  OPENPROPS_NONE* = 0x0000
  OPENPROPS_INHIBITPIF* = 0x8000
  GETPROPS_NONE* = 0x0000
  SETPROPS_NONE* = 0x0000
  CLOSEPROPS_NONE* = 0x0000
  CLOSEPROPS_DISCARD* = 0x0001
  PIFSHPROGSIZE* = 64
  PIFSHDATASIZE* = 64
  IID_IInitializeObject* = DEFINE_GUID(0x4622AD16'i32, 0xFF23, 0x11d0, [0x8D'u8, 0x34, 0x00, 0xA0, 0xC9, 0x0F, 0x27, 0x19])
  BMICON_LARGE* = 0
  BMICON_SMALL* = 1
  QCMINFO_PLACE_BEFORE* = 0
  QCMINFO_PLACE_AFTER* = 1
  TBIF_APPEND* = 0
  TBIF_PREPEND* = 1
  TBIF_REPLACE* = 2
  TBIF_DEFAULT* = 0x00000000
  TBIF_INTERNETBAR* = 0x00010000
  TBIF_STANDARDTOOLBAR* = 0x00020000
  TBIF_NOTOOLBAR* = 0x00030000
  SFVM_MERGEMENU* = 1
  SFVM_INVOKECOMMAND* = 2
  SFVM_GETHELPTEXT* = 3
  SFVM_GETTOOLTIPTEXT* = 4
  SFVM_GETBUTTONINFO* = 5
  SFVM_GETBUTTONS* = 6
  SFVM_INITMENUPOPUP* = 7
  SFVM_FSNOTIFY* = 14
  SFVM_WINDOWCREATED* = 15
  SFVM_GETDETAILSOF* = 23
  SFVM_COLUMNCLICK* = 24
  SFVM_QUERYFSNOTIFY* = 25
  SFVM_DEFITEMCOUNT* = 26
  SFVM_DEFVIEWMODE* = 27
  SFVM_UNMERGEMENU* = 28
  SFVM_UPDATESTATUSBAR* = 31
  SFVM_BACKGROUNDENUM* = 32
  SFVM_DIDDRAGDROP* = 36
  SFVM_SETISFV* = 39
  SFVM_THISIDLIST* = 41
  SFVM_ADDPROPERTYPAGES* = 47
  SFVM_BACKGROUNDENUMDONE* = 48
  SFVM_GETNOTIFY* = 49
  SFVM_GETSORTDEFAULTS* = 53
  SFVM_SIZE* = 57
  SFVM_GETZONE* = 58
  SFVM_GETPANE* = 59
  SFVM_GETHELPTOPIC* = 63
  SFVM_GETANIMATION* = 68
  SFVSOC_INVALIDATE_ALL* = 0x00000001
  SFVSOC_NOSCROLL* = LVSICF_NOSCROLL
  SFVS_SELECT_NONE* = 0x0
  SFVS_SELECT_ALLITEMS* = 0x1
  SFVS_SELECT_INVERT* = 0x2
  IID_IShellFolderView* = DEFINE_GUID(0x37A378C0'i32, 0xF82D, 0x11CE, [0xAE'u8, 0x65, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62])
  DFM_MERGECONTEXTMENU* = 1
  DFM_INVOKECOMMAND* = 2
  DFM_GETHELPTEXT* = 5
  DFM_WM_MEASUREITEM* = 6
  DFM_WM_DRAWITEM* = 7
  DFM_WM_INITMENUPOPUP* = 8
  DFM_VALIDATECMD* = 9
  DFM_MERGECONTEXTMENU_TOP* = 10
  DFM_GETHELPTEXTW* = 11
  DFM_INVOKECOMMANDEX* = 12
  DFM_MAPCOMMANDNAME* = 13
  DFM_GETDEFSTATICID* = 14
  DFM_GETVERBW* = 15
  DFM_GETVERBA* = 16
  DFM_MERGECONTEXTMENU_BOTTOM* = 17
  DFM_MODIFYQCMFLAGS* = 18
  DFM_CMD_DELETE* = UINT(-1)
  DFM_CMD_MOVE* = UINT(-2)
  DFM_CMD_COPY* = UINT(-3)
  DFM_CMD_LINK* = UINT(-4)
  DFM_CMD_PROPERTIES* = UINT(-5)
  DFM_CMD_NEWFOLDER* = UINT(-6)
  DFM_CMD_PASTE* = UINT(-7)
  DFM_CMD_VIEWLIST* = UINT(-8)
  DFM_CMD_VIEWDETAILS* = UINT(-9)
  DFM_CMD_PASTELINK* = UINT(-10)
  DFM_CMD_PASTESPECIAL* = UINT(-11)
  DFM_CMD_MODALPROP* = UINT(-12)
  DFM_CMD_RENAME* = UINT(-13)
  SFVM_REARRANGE* = 0x00000001
  SFVM_ADDOBJECT* = 0x00000003
  SFVM_REMOVEOBJECT* = 0x00000006
  SFVM_UPDATEOBJECT* = 0x00000007
  SFVM_GETSELECTEDOBJECTS* = 0x00000009
  SFVM_SETITEMPOS* = 0x0000000e
  SFVM_SETCLIPBOARD* = 0x00000010
  SFVM_SETPOINTS* = 0x00000017
  PID_IS_URL* = 2
  PID_IS_NAME* = 4
  PID_IS_WORKINGDIR* = 5
  PID_IS_HOTKEY* = 6
  PID_IS_SHOWCMD* = 7
  PID_IS_ICONINDEX* = 8
  PID_IS_ICONFILE* = 9
  PID_IS_WHATSNEW* = 10
  PID_IS_AUTHOR* = 11
  PID_IS_DESCRIPTION* = 12
  PID_IS_COMMENT* = 13
  PID_IS_ROAMED* = 15
  PID_INTSITE_WHATSNEW* = 2
  PID_INTSITE_AUTHOR* = 3
  PID_INTSITE_LASTVISIT* = 4
  PID_INTSITE_LASTMOD* = 5
  PID_INTSITE_VISITCOUNT* = 6
  PID_INTSITE_DESCRIPTION* = 7
  PID_INTSITE_COMMENT* = 8
  PID_INTSITE_FLAGS* = 9
  PID_INTSITE_CONTENTLEN* = 10
  PID_INTSITE_CONTENTCODE* = 11
  PID_INTSITE_RECURSE* = 12
  PID_INTSITE_WATCH* = 13
  PID_INTSITE_SUBSCRIPTION* = 14
  PID_INTSITE_URL* = 15
  PID_INTSITE_TITLE* = 16
  PID_INTSITE_CODEPAGE* = 18
  PID_INTSITE_TRACKING* = 19
  PID_INTSITE_ICONINDEX* = 20
  PID_INTSITE_ICONFILE* = 21
  PID_INTSITE_ROAMED* = 34
  PIDISF_RECENTLYCHANGED* = 0x00000001
  PIDISF_CACHEDSTICKY* = 0x00000002
  PIDISF_CACHEIMAGES* = 0x00000010
  PIDISF_FOLLOWALLLINKS* = 0x00000020
  PIDISM_GLOBAL* = 0
  PIDISM_WATCH* = 1
  PIDISM_DONTWATCH* = 2
  PIDISR_UP_TO_DATE* = 0
  PIDISR_NEEDS_ADD* = 1
  PIDISR_NEEDS_UPDATE* = 2
  PIDISR_NEEDS_DELETE* = 3
  SHELLSTATEVERSION_IE4* = 9
  SHELLSTATEVERSION_WIN2K* = 10
when winimUnicode:
  type
    SHELLSTATE* = SHELLSTATEW
when winimAnsi:
  type
    SHELLSTATE* = SHELLSTATEA
const
  SSF_SHOWALLOBJECTS* = 0x00000001
  SSF_SHOWEXTENSIONS* = 0x00000002
  SSF_HIDDENFILEEXTS* = 0x00000004
  SSF_SERVERADMINUI* = 0x00000004
  SSF_SHOWCOMPCOLOR* = 0x00000008
  SSF_SORTCOLUMNS* = 0x00000010
  SSF_SHOWSYSFILES* = 0x00000020
  SSF_DOUBLECLICKINWEBVIEW* = 0x00000080
  SSF_SHOWATTRIBCOL* = 0x00000100
  SSF_DESKTOPHTML* = 0x00000200
  SSF_WIN95CLASSIC* = 0x00000400
  SSF_DONTPRETTYPATH* = 0x00000800
  SSF_SHOWINFOTIP* = 0x00002000
  SSF_MAPNETDRVBUTTON* = 0x00001000
  SSF_NOCONFIRMRECYCLE* = 0x00008000
  SSF_HIDEICONS* = 0x00004000
  SSF_FILTER* = 0x00010000
  SSF_WEBVIEW* = 0x00020000
  SSF_SHOWSUPERHIDDEN* = 0x00040000
  SSF_SEPPROCESS* = 0x00080000
  SSF_NONETCRAWLING* = 0x00100000
  SSF_STARTPANELON* = 0x00200000
  SSF_SHOWSTARTPAGE* = 0x00400000
  SSF_AUTOCHECKSELECT* = 0x00800000
  SSF_ICONSONLY* = 0x01000000
  SSF_SHOWTYPEOVERLAY* = 0x02000000
  SSF_SHOWSTATUSBAR* = 0x04000000
  SHPPFW_NONE* = 0x00000000
  SHPPFW_DIRCREATE* = 0x00000001
  SHPPFW_DEFAULT* = SHPPFW_DIRCREATE
  SHPPFW_ASKDIRCREATE* = 0x00000002
  SHPPFW_IGNOREFILENAME* = 0x00000004
  SHPPFW_NOWRITECHECK* = 0x00000008
  SHPPFW_MEDIACHECKONLY* = 0x00000010
  IESHORTCUT_NEWBROWSER* = 0x01
  IESHORTCUT_OPENNEWTAB* = 0x02
  IESHORTCUT_FORCENAVIGATE* = 0x04
  IESHORTCUT_BACKGROUNDTAB* = 0x08
  CMIC_MASK_HASLINKNAME* = 0x00010000
  CMIC_MASK_FLAG_SEP_VDM* = 0x00040000
  CMIC_MASK_HASTITLE* = 0x00020000
  SHELLSTATE_SIZE_WIN2K* = 32
type
  PFNCANSHAREFOLDERW* = proc (pszPath: PCWSTR): HRESULT {.stdcall.}
  PFNSHOWSHAREFOLDERUIW* = proc (hwndParent: HWND, pszPath: PCWSTR): HRESULT {.stdcall.}
  DLLVERSIONINFO* {.pure.} = object
    cbSize*: DWORD
    dwMajorVersion*: DWORD
    dwMinorVersion*: DWORD
    dwBuildNumber*: DWORD
    dwPlatformID*: DWORD
  DLLGETVERSIONPROC* = proc (P1: ptr DLLVERSIONINFO): HRESULT {.stdcall.}
  LPFNDFMCALLBACK* = proc (psf: ptr IShellFolder, hwnd: HWND, pdtobj: ptr IDataObject, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.stdcall.}
  ASSOCIATIONELEMENT* {.pure.} = object
    ac*: ASSOCCLASS
    hkClass*: HKEY
    pszClass*: PCWSTR
  SHFILEINFOA* {.pure.} = object
    hIcon*: HICON
    iIcon*: int32
    dwAttributes*: DWORD
    szDisplayName*: array[MAX_PATH, CHAR]
    szTypeName*: array[80, CHAR]
  SHFILEINFOW* {.pure.} = object
    hIcon*: HICON
    iIcon*: int32
    dwAttributes*: DWORD
    szDisplayName*: array[MAX_PATH, WCHAR]
    szTypeName*: array[80, WCHAR]
  SHSTOCKICONINFO* {.pure.} = object
    cbSize*: DWORD
    hIcon*: HICON
    iSysImageIndex*: int32
    iIcon*: int32
    szPath*: array[MAX_PATH, WCHAR]
  DLLVERSIONINFO2* {.pure.} = object
    info1*: DLLVERSIONINFO
    dwFlags*: DWORD
    ullVersion*: ULONGLONG
  ShellFolderViewOC* {.pure.} = object
  ShellFolderItem* {.pure.} = object
  ShellLinkObject* {.pure.} = object
  ShellFolderView* {.pure.} = object
  ShellDispatchInproc* {.pure.} = object
  FileSearchBand* {.pure.} = object
  DesktopWallpaper* {.pure.} = object
  ShellDesktop* {.pure.} = object
  ShellFSFolder* {.pure.} = object
  NetworkPlaces* {.pure.} = object
  ShellLink* {.pure.} = object
  QueryCancelAutoPlay* {.pure.} = object
  DriveSizeCategorizer* {.pure.} = object
  DriveTypeCategorizer* {.pure.} = object
  FreeSpaceCategorizer* {.pure.} = object
  TimeCategorizer* {.pure.} = object
  SizeCategorizer* {.pure.} = object
  AlphabeticalCategorizer* {.pure.} = object
  MergedCategorizer* {.pure.} = object
  ImageProperties* {.pure.} = object
  PropertiesUI* {.pure.} = object
  UserNotification* {.pure.} = object
  CDBurn* {.pure.} = object
  TaskbarList* {.pure.} = object
  StartMenuPin* {.pure.} = object
  WebWizardHost* {.pure.} = object
  PublishDropTarget* {.pure.} = object
  PublishingWizard* {.pure.} = object
  InternetPrintOrdering* {.pure.} = object
  FolderViewHost* {.pure.} = object
  ExplorerBrowser* {.pure.} = object
  ImageRecompress* {.pure.} = object
  TrayBandSiteService* {.pure.} = object
  TrayDeskBand* {.pure.} = object
  AttachmentServices* {.pure.} = object
  DocPropShellExtension* {.pure.} = object
  ShellItem* {.pure.} = object
  NamespaceWalker* {.pure.} = object
  FileOperation* {.pure.} = object
  FileOpenDialog* {.pure.} = object
  FileSaveDialog* {.pure.} = object
  KnownFolderManager* {.pure.} = object
  FSCopyHandler* {.pure.} = object
  SharingConfigurationManager* {.pure.} = object
  PreviousVersions* {.pure.} = object
  NetworkConnections* {.pure.} = object
  NamespaceTreeControl* {.pure.} = object
  IENamespaceTreeControl* {.pure.} = object
  ScheduledTasks* {.pure.} = object
  ApplicationAssociationRegistration* {.pure.} = object
  ApplicationAssociationRegistrationUI* {.pure.} = object
  SearchFolderItemFactory* {.pure.} = object
  OpenControlPanel* {.pure.} = object
  MailRecipient* {.pure.} = object
  NetworkExplorerFolder* {.pure.} = object
  DestinationList* {.pure.} = object
  ApplicationDestinations* {.pure.} = object
  ApplicationDocumentLists* {.pure.} = object
  HomeGroup* {.pure.} = object
  ShellLibrary* {.pure.} = object
  AppStartupLink* {.pure.} = object
  EnumerableObjectCollection* {.pure.} = object
  DesktopGadget* {.pure.} = object
  PlaybackManager* {.pure.} = object
  AccessibilityDockingService* {.pure.} = object
  FrameworkInputPane* {.pure.} = object
  DefFolderMenu* {.pure.} = object
  AppVisibility* {.pure.} = object
  AppShellVerbHandler* {.pure.} = object
  ExecuteUnknown* {.pure.} = object
  PackageDebugSettings* {.pure.} = object
  ApplicationActivationManager* {.pure.} = object
  ApplicationDesignModeSettings* {.pure.} = object
  ExecuteFolder* {.pure.} = object
  PERSIST_FOLDER_TARGET_INFO* {.pure.} = object
    pidlTargetFolder*: PIDLIST_ABSOLUTE
    szTargetParsingName*: array[260, WCHAR]
    szNetworkProvider*: array[260, WCHAR]
    dwAttributes*: DWORD
    csidl*: int32
  SORTCOLUMN* {.pure.} = object
    propkey*: PROPERTYKEY
    direction*: SORTDIRECTION
  CM_COLUMNINFO* {.pure.} = object
    cbSize*: DWORD
    dwMask*: DWORD
    dwState*: DWORD
    uWidth*: UINT
    uDefaultWidth*: UINT
    uIdealWidth*: UINT
    wszName*: array[80, WCHAR]
  SHELL_ITEM_RESOURCE* {.pure.} = object
    guidType*: GUID
    szName*: array[260, WCHAR]
  TCATEGORY_INFO* {.pure.} = object
    cif*: CATEGORYINFO_FLAGS
    wszName*: array[260, WCHAR]
  DESKBANDINFO* {.pure.} = object
    dwMask*: DWORD
    ptMinSize*: POINTL
    ptMaxSize*: POINTL
    ptIntegral*: POINTL
    ptActual*: POINTL
    wszTitle*: array[256, WCHAR]
    dwModeFlags*: DWORD
    crBkgnd*: COLORREF
  BANDSITEINFO* {.pure.} = object
    dwMask*: DWORD
    dwState*: DWORD
    dwStyle*: DWORD
  KNOWNFOLDER_DEFINITION* {.pure.} = object
    category*: KF_CATEGORY
    pszName*: LPWSTR
    pszDescription*: LPWSTR
    fidParent*: KNOWNFOLDERID
    pszRelativePath*: LPWSTR
    pszParsingName*: LPWSTR
    pszTooltip*: LPWSTR
    pszLocalizedName*: LPWSTR
    pszIcon*: LPWSTR
    pszSecurity*: LPWSTR
    dwAttributes*: DWORD
    kfdFlags*: KF_DEFINITION_FLAGS
    ftidType*: FOLDERTYPEID
  IShellItem* {.pure.} = object
    lpVtbl*: ptr IShellItemVtbl
  IShellItemVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    BindToHandler*: proc(self: ptr IShellItem, pbc: ptr IBindCtx, bhid: REFGUID, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetParent*: proc(self: ptr IShellItem, ppsi: ptr ptr IShellItem): HRESULT {.stdcall.}
    GetDisplayName*: proc(self: ptr IShellItem, sigdnName: SIGDN, ppszName: ptr LPWSTR): HRESULT {.stdcall.}
    GetAttributes*: proc(self: ptr IShellItem, sfgaoMask: SFGAOF, psfgaoAttribs: ptr SFGAOF): HRESULT {.stdcall.}
    Compare*: proc(self: ptr IShellItem, psi: ptr IShellItem, hint: SICHINTF, piOrder: ptr int32): HRESULT {.stdcall.}
  NSTCCUSTOMDRAW* {.pure.} = object
    psi*: ptr IShellItem
    uItemState*: UINT
    nstcis*: NSTCITEMSTATE
    pszText*: LPCWSTR
    iImage*: int32
    himl*: HIMAGELIST
    iLevel*: int32
    iIndent*: int32
  PREVIEWHANDLERFRAMEINFO* {.pure.} = object
    haccel*: HACCEL
    cAccelEntries*: UINT
  EXP_PROPERTYSTORAGE* {.pure.} = object
    cbSize*: DWORD
    dwSignature*: DWORD
    abPropertyStorage*: array[1, BYTE]
  FILE_ATTRIBUTES_ARRAY* {.pure.} = object
    cItems*: UINT
    dwSumFileAttributes*: DWORD
    dwProductFileAttributes*: DWORD
    rgdwFileAttributes*: array[1, DWORD]
  DROPDESCRIPTION* {.pure.} = object
    `type`*: DROPIMAGETYPE
    szMessage*: array[MAX_PATH, WCHAR]
    szInsert*: array[MAX_PATH, WCHAR]
  SHChangeNotifyEntry* {.pure.} = object
    pidl*: PCIDLIST_ABSOLUTE
    fRecursive*: WINBOOL
  TSHARDAPPIDINFO* {.pure.} = object
    psi*: ptr IShellItem
    pszAppID*: PCWSTR
  TSHARD_APPIDINFOIDLIST* {.pure.} = object
    pidl*: PCIDLIST_ABSOLUTE
    pszAppID*: PCWSTR
  IShellLinkW* {.pure.} = object
    lpVtbl*: ptr IShellLinkWVtbl
  IShellLinkWVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetPath*: proc(self: ptr IShellLinkW, pszFile: LPWSTR, cch: int32, pfd: ptr WIN32_FIND_DATAW, fFlags: DWORD): HRESULT {.stdcall.}
    GetIDList*: proc(self: ptr IShellLinkW, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    SetIDList*: proc(self: ptr IShellLinkW, pidl: PCIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    GetDescription*: proc(self: ptr IShellLinkW, pszName: LPWSTR, cch: int32): HRESULT {.stdcall.}
    SetDescription*: proc(self: ptr IShellLinkW, pszName: LPCWSTR): HRESULT {.stdcall.}
    GetWorkingDirectory*: proc(self: ptr IShellLinkW, pszDir: LPWSTR, cch: int32): HRESULT {.stdcall.}
    SetWorkingDirectory*: proc(self: ptr IShellLinkW, pszDir: LPCWSTR): HRESULT {.stdcall.}
    GetArguments*: proc(self: ptr IShellLinkW, pszArgs: LPWSTR, cch: int32): HRESULT {.stdcall.}
    SetArguments*: proc(self: ptr IShellLinkW, pszArgs: LPCWSTR): HRESULT {.stdcall.}
    GetHotkey*: proc(self: ptr IShellLinkW, pwHotkey: ptr WORD): HRESULT {.stdcall.}
    SetHotkey*: proc(self: ptr IShellLinkW, wHotkey: WORD): HRESULT {.stdcall.}
    GetShowCmd*: proc(self: ptr IShellLinkW, piShowCmd: ptr int32): HRESULT {.stdcall.}
    SetShowCmd*: proc(self: ptr IShellLinkW, iShowCmd: int32): HRESULT {.stdcall.}
    GetIconLocation*: proc(self: ptr IShellLinkW, pszIconPath: LPWSTR, cch: int32, piIcon: ptr int32): HRESULT {.stdcall.}
    SetIconLocation*: proc(self: ptr IShellLinkW, pszIconPath: LPCWSTR, iIcon: int32): HRESULT {.stdcall.}
    SetRelativePath*: proc(self: ptr IShellLinkW, pszPathRel: LPCWSTR, dwReserved: DWORD): HRESULT {.stdcall.}
    Resolve*: proc(self: ptr IShellLinkW, hwnd: HWND, fFlags: DWORD): HRESULT {.stdcall.}
    SetPath*: proc(self: ptr IShellLinkW, pszFile: LPCWSTR): HRESULT {.stdcall.}
when winimUnicode:
  type
    IShellLink* = IShellLinkW
type
  IShellLinkA* {.pure.} = object
    lpVtbl*: ptr IShellLinkAVtbl
  IShellLinkAVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetPath*: proc(self: ptr IShellLinkA, pszFile: LPSTR, cch: int32, pfd: ptr WIN32_FIND_DATAA, fFlags: DWORD): HRESULT {.stdcall.}
    GetIDList*: proc(self: ptr IShellLinkA, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    SetIDList*: proc(self: ptr IShellLinkA, pidl: PCIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    GetDescription*: proc(self: ptr IShellLinkA, pszName: LPSTR, cch: int32): HRESULT {.stdcall.}
    SetDescription*: proc(self: ptr IShellLinkA, pszName: LPCSTR): HRESULT {.stdcall.}
    GetWorkingDirectory*: proc(self: ptr IShellLinkA, pszDir: LPSTR, cch: int32): HRESULT {.stdcall.}
    SetWorkingDirectory*: proc(self: ptr IShellLinkA, pszDir: LPCSTR): HRESULT {.stdcall.}
    GetArguments*: proc(self: ptr IShellLinkA, pszArgs: LPSTR, cch: int32): HRESULT {.stdcall.}
    SetArguments*: proc(self: ptr IShellLinkA, pszArgs: LPCSTR): HRESULT {.stdcall.}
    GetHotkey*: proc(self: ptr IShellLinkA, pwHotkey: ptr WORD): HRESULT {.stdcall.}
    SetHotkey*: proc(self: ptr IShellLinkA, wHotkey: WORD): HRESULT {.stdcall.}
    GetShowCmd*: proc(self: ptr IShellLinkA, piShowCmd: ptr int32): HRESULT {.stdcall.}
    SetShowCmd*: proc(self: ptr IShellLinkA, iShowCmd: int32): HRESULT {.stdcall.}
    GetIconLocation*: proc(self: ptr IShellLinkA, pszIconPath: LPSTR, cch: int32, piIcon: ptr int32): HRESULT {.stdcall.}
    SetIconLocation*: proc(self: ptr IShellLinkA, pszIconPath: LPCSTR, iIcon: int32): HRESULT {.stdcall.}
    SetRelativePath*: proc(self: ptr IShellLinkA, pszPathRel: LPCSTR, dwReserved: DWORD): HRESULT {.stdcall.}
    Resolve*: proc(self: ptr IShellLinkA, hwnd: HWND, fFlags: DWORD): HRESULT {.stdcall.}
    SetPath*: proc(self: ptr IShellLinkA, pszFile: LPCSTR): HRESULT {.stdcall.}
when winimAnsi:
  type
    IShellLink* = IShellLinkA
type
  TSHARDAPPIDINFOLINK* {.pure.} = object
    psl*: ptr IShellLink
    pszAppID*: PCWSTR
  AUTO_SCROLL_DATA* {.pure.} = object
    iNextSample*: int32
    dwLastScroll*: DWORD
    bFull*: WINBOOL
    pts*: array[NUM_POINTS, POINT]
    dwTimes*: array[NUM_POINTS, DWORD]
  SFVM_PROPPAGE_DATA* {.pure.} = object
    dwReserved*: DWORD
    pfn*: LPFNADDPROPSHEETPAGE
    lParam*: LPARAM
  SFVM_HELPTOPIC_DATA* {.pure.} = object
    wszHelpFile*: array[MAX_PATH, WCHAR]
    wszHelpTopic*: array[MAX_PATH, WCHAR]
  ITEMSPACING* {.pure.} = object
    cxSmall*: int32
    cySmall*: int32
    cxLarge*: int32
    cyLarge*: int32
  IShellFolderViewCB* {.pure.} = object
    lpVtbl*: ptr IShellFolderViewCBVtbl
  IShellFolderViewCBVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    MessageSFVCB*: proc(self: ptr IShellFolderViewCB, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.stdcall.}
  SFV_CREATE* {.pure.} = object
    cbSize*: UINT
    pshf*: ptr IShellFolder
    psvOuter*: ptr IShellView
    psfvcb*: ptr IShellFolderViewCB
  IContextMenuCB* {.pure.} = object
    lpVtbl*: ptr IContextMenuCBVtbl
  IContextMenuCBVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    CallBack*: proc(self: ptr IContextMenuCB, psf: ptr IShellFolder, hwndOwner: HWND, pdtobj: ptr IDataObject, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.stdcall.}
  DEFCONTEXTMENU* {.pure.} = object
    hwnd*: HWND
    pcmcb*: ptr IContextMenuCB
    pidlFolder*: PCIDLIST_ABSOLUTE
    psf*: ptr IShellFolder
    cidl*: UINT
    apidl*: PCUITEMID_CHILD_ARRAY
    punkAssociationInfo*: ptr IUnknown
    cKeys*: UINT
    aKeys*: ptr HKEY
  IQueryAssociations* {.pure.} = object
    lpVtbl*: ptr IQueryAssociationsVtbl
  IQueryAssociationsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Init*: proc(self: ptr IQueryAssociations, flags: ASSOCF, pszAssoc: LPCWSTR, hkProgid: HKEY, hwnd: HWND): HRESULT {.stdcall.}
    GetString*: proc(self: ptr IQueryAssociations, flags: ASSOCF, str: ASSOCSTR, pszExtra: LPCWSTR, pszOut: LPWSTR, pcchOut: ptr DWORD): HRESULT {.stdcall.}
    GetKey*: proc(self: ptr IQueryAssociations, flags: ASSOCF, key: ASSOCKEY, pszExtra: LPCWSTR, phkeyOut: ptr HKEY): HRESULT {.stdcall.}
    GetData*: proc(self: ptr IQueryAssociations, flags: ASSOCF, data: ASSOCDATA, pszExtra: LPCWSTR, pvOut: LPVOID, pcbOut: ptr DWORD): HRESULT {.stdcall.}
    GetEnum*: proc(self: ptr IQueryAssociations, flags: ASSOCF, assocenum: ASSOCENUM, pszExtra: LPCWSTR, riid: REFIID, ppvOut: ptr LPVOID): HRESULT {.stdcall.}
  IFolderViewOC* {.pure.} = object
    lpVtbl*: ptr IFolderViewOCVtbl
  IFolderViewOCVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    SetFolderView*: proc(self: ptr IFolderViewOC, pdisp: ptr IDispatch): HRESULT {.stdcall.}
  DShellFolderViewEvents* {.pure.} = object
    lpVtbl*: ptr DShellFolderViewEventsVtbl
  DShellFolderViewEventsVtbl* {.pure, inheritable.} = object of IDispatchVtbl
  DFConstraint* {.pure.} = object
    lpVtbl*: ptr DFConstraintVtbl
  DFConstraintVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    get_Name*: proc(self: ptr DFConstraint, pbs: ptr BSTR): HRESULT {.stdcall.}
    get_Value*: proc(self: ptr DFConstraint, pv: ptr VARIANT): HRESULT {.stdcall.}
  FolderItems* {.pure.} = object
    lpVtbl*: ptr FolderItemsVtbl
  FolderItemsVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    get_Count*: proc(self: ptr FolderItems, plCount: ptr LONG): HRESULT {.stdcall.}
    get_Application*: proc(self: ptr FolderItems, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_Parent*: proc(self: ptr FolderItems, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    Item*: proc(self: ptr FolderItems, index: VARIANT, ppid: ptr ptr FolderItem): HRESULT {.stdcall.}
    NewEnum*: proc(self: ptr FolderItems, ppunk: ptr ptr IUnknown): HRESULT {.stdcall.}
  Folder* {.pure.} = object
    lpVtbl*: ptr FolderVtbl
  FolderVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    get_Title*: proc(self: ptr Folder, pbs: ptr BSTR): HRESULT {.stdcall.}
    get_Application*: proc(self: ptr Folder, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_Parent*: proc(self: ptr Folder, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_ParentFolder*: proc(self: ptr Folder, ppsf: ptr ptr Folder): HRESULT {.stdcall.}
    Items*: proc(self: ptr Folder, ppid: ptr ptr FolderItems): HRESULT {.stdcall.}
    ParseName*: proc(self: ptr Folder, bName: BSTR, ppid: ptr ptr FolderItem): HRESULT {.stdcall.}
    NewFolder*: proc(self: ptr Folder, bName: BSTR, vOptions: VARIANT): HRESULT {.stdcall.}
    MoveHere*: proc(self: ptr Folder, vItem: VARIANT, vOptions: VARIANT): HRESULT {.stdcall.}
    CopyHere*: proc(self: ptr Folder, vItem: VARIANT, vOptions: VARIANT): HRESULT {.stdcall.}
    GetDetailsOf*: proc(self: ptr Folder, vItem: VARIANT, iColumn: int32, pbs: ptr BSTR): HRESULT {.stdcall.}
  Folder2* {.pure.} = object
    lpVtbl*: ptr Folder2Vtbl
  Folder2Vtbl* {.pure, inheritable.} = object of FolderVtbl
    get_Self*: proc(self: ptr Folder2, ppfi: ptr ptr FolderItem): HRESULT {.stdcall.}
    get_OfflineStatus*: proc(self: ptr Folder2, pul: ptr LONG): HRESULT {.stdcall.}
    Synchronize*: proc(self: ptr Folder2): HRESULT {.stdcall.}
    get_HaveToShowWebViewBarricade*: proc(self: ptr Folder2, pbHaveToShowWebViewBarricade: ptr VARIANT_BOOL): HRESULT {.stdcall.}
    DismissedWebViewBarricade*: proc(self: ptr Folder2): HRESULT {.stdcall.}
  Folder3* {.pure.} = object
    lpVtbl*: ptr Folder3Vtbl
  Folder3Vtbl* {.pure, inheritable.} = object of Folder2Vtbl
    get_ShowWebViewBarricade*: proc(self: ptr Folder3, pbShowWebViewBarricade: ptr VARIANT_BOOL): HRESULT {.stdcall.}
    put_ShowWebViewBarricade*: proc(self: ptr Folder3, bShowWebViewBarricade: VARIANT_BOOL): HRESULT {.stdcall.}
  FolderItem2* {.pure.} = object
    lpVtbl*: ptr FolderItem2Vtbl
  FolderItem2Vtbl* {.pure, inheritable.} = object of FolderItemVtbl
    InvokeVerbEx*: proc(self: ptr FolderItem2, vVerb: VARIANT, vArgs: VARIANT): HRESULT {.stdcall.}
    ExtendedProperty*: proc(self: ptr FolderItem2, bstrPropName: BSTR, pvRet: ptr VARIANT): HRESULT {.stdcall.}
  FolderItems2* {.pure.} = object
    lpVtbl*: ptr FolderItems2Vtbl
  FolderItems2Vtbl* {.pure, inheritable.} = object of FolderItemsVtbl
    InvokeVerbEx*: proc(self: ptr FolderItems2, vVerb: VARIANT, vArgs: VARIANT): HRESULT {.stdcall.}
  FolderItems3* {.pure.} = object
    lpVtbl*: ptr FolderItems3Vtbl
  FolderItems3Vtbl* {.pure, inheritable.} = object of FolderItems2Vtbl
    Filter*: proc(self: ptr FolderItems3, grfFlags: LONG, bstrFileSpec: BSTR): HRESULT {.stdcall.}
    get_Verbs*: proc(self: ptr FolderItems3, ppfic: ptr ptr FolderItemVerbs): HRESULT {.stdcall.}
  IShellLinkDual* {.pure.} = object
    lpVtbl*: ptr IShellLinkDualVtbl
  IShellLinkDualVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    get_Path*: proc(self: ptr IShellLinkDual, pbs: ptr BSTR): HRESULT {.stdcall.}
    put_Path*: proc(self: ptr IShellLinkDual, bs: BSTR): HRESULT {.stdcall.}
    get_Description*: proc(self: ptr IShellLinkDual, pbs: ptr BSTR): HRESULT {.stdcall.}
    put_Description*: proc(self: ptr IShellLinkDual, bs: BSTR): HRESULT {.stdcall.}
    get_WorkingDirectory*: proc(self: ptr IShellLinkDual, pbs: ptr BSTR): HRESULT {.stdcall.}
    put_WorkingDirectory*: proc(self: ptr IShellLinkDual, bs: BSTR): HRESULT {.stdcall.}
    get_Arguments*: proc(self: ptr IShellLinkDual, pbs: ptr BSTR): HRESULT {.stdcall.}
    put_Arguments*: proc(self: ptr IShellLinkDual, bs: BSTR): HRESULT {.stdcall.}
    get_Hotkey*: proc(self: ptr IShellLinkDual, piHK: ptr int32): HRESULT {.stdcall.}
    put_Hotkey*: proc(self: ptr IShellLinkDual, iHK: int32): HRESULT {.stdcall.}
    get_ShowCommand*: proc(self: ptr IShellLinkDual, piShowCommand: ptr int32): HRESULT {.stdcall.}
    put_ShowCommand*: proc(self: ptr IShellLinkDual, iShowCommand: int32): HRESULT {.stdcall.}
    Resolve*: proc(self: ptr IShellLinkDual, fFlags: int32): HRESULT {.stdcall.}
    GetIconLocation*: proc(self: ptr IShellLinkDual, pbs: ptr BSTR, piIcon: ptr int32): HRESULT {.stdcall.}
    SetIconLocation*: proc(self: ptr IShellLinkDual, bs: BSTR, iIcon: int32): HRESULT {.stdcall.}
    Save*: proc(self: ptr IShellLinkDual, vWhere: VARIANT): HRESULT {.stdcall.}
  IShellLinkDual2* {.pure.} = object
    lpVtbl*: ptr IShellLinkDual2Vtbl
  IShellLinkDual2Vtbl* {.pure, inheritable.} = object of IShellLinkDualVtbl
    get_Target*: proc(self: ptr IShellLinkDual2, ppfi: ptr ptr FolderItem): HRESULT {.stdcall.}
  IShellFolderViewDual* {.pure.} = object
    lpVtbl*: ptr IShellFolderViewDualVtbl
  IShellFolderViewDualVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    get_Application*: proc(self: ptr IShellFolderViewDual, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_Parent*: proc(self: ptr IShellFolderViewDual, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_Folder*: proc(self: ptr IShellFolderViewDual, ppid: ptr ptr Folder): HRESULT {.stdcall.}
    SelectedItems*: proc(self: ptr IShellFolderViewDual, ppid: ptr ptr FolderItems): HRESULT {.stdcall.}
    get_FocusedItem*: proc(self: ptr IShellFolderViewDual, ppid: ptr ptr FolderItem): HRESULT {.stdcall.}
    SelectItem*: proc(self: ptr IShellFolderViewDual, pvfi: ptr VARIANT, dwFlags: int32): HRESULT {.stdcall.}
    PopupItemMenu*: proc(self: ptr IShellFolderViewDual, pfi: ptr FolderItem, vx: VARIANT, vy: VARIANT, pbs: ptr BSTR): HRESULT {.stdcall.}
    get_Script*: proc(self: ptr IShellFolderViewDual, ppDisp: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_ViewOptions*: proc(self: ptr IShellFolderViewDual, plViewOptions: ptr LONG): HRESULT {.stdcall.}
  IShellFolderViewDual2* {.pure.} = object
    lpVtbl*: ptr IShellFolderViewDual2Vtbl
  IShellFolderViewDual2Vtbl* {.pure, inheritable.} = object of IShellFolderViewDualVtbl
    get_CurrentViewMode*: proc(self: ptr IShellFolderViewDual2, pViewMode: ptr UINT): HRESULT {.stdcall.}
    put_CurrentViewMode*: proc(self: ptr IShellFolderViewDual2, ViewMode: UINT): HRESULT {.stdcall.}
    SelectItemRelative*: proc(self: ptr IShellFolderViewDual2, iRelative: int32): HRESULT {.stdcall.}
  IShellFolderViewDual3* {.pure.} = object
    lpVtbl*: ptr IShellFolderViewDual3Vtbl
  IShellFolderViewDual3Vtbl* {.pure, inheritable.} = object of IShellFolderViewDual2Vtbl
    get_GroupBy*: proc(self: ptr IShellFolderViewDual3, pbstrGroupBy: ptr BSTR): HRESULT {.stdcall.}
    put_GroupBy*: proc(self: ptr IShellFolderViewDual3, bstrGroupBy: BSTR): HRESULT {.stdcall.}
    get_FolderFlags*: proc(self: ptr IShellFolderViewDual3, pdwFlags: ptr DWORD): HRESULT {.stdcall.}
    put_FolderFlags*: proc(self: ptr IShellFolderViewDual3, dwFlags: DWORD): HRESULT {.stdcall.}
    get_SortColumns*: proc(self: ptr IShellFolderViewDual3, pbstrSortColumns: ptr BSTR): HRESULT {.stdcall.}
    put_SortColumns*: proc(self: ptr IShellFolderViewDual3, bstrSortColumns: BSTR): HRESULT {.stdcall.}
    put_IconSize*: proc(self: ptr IShellFolderViewDual3, iIconSize: int32): HRESULT {.stdcall.}
    get_IconSize*: proc(self: ptr IShellFolderViewDual3, piIconSize: ptr int32): HRESULT {.stdcall.}
    FilterView*: proc(self: ptr IShellFolderViewDual3, bstrFilterText: BSTR): HRESULT {.stdcall.}
  IShellDispatch* {.pure.} = object
    lpVtbl*: ptr IShellDispatchVtbl
  IShellDispatchVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    get_Application*: proc(self: ptr IShellDispatch, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    get_Parent*: proc(self: ptr IShellDispatch, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    NameSpace*: proc(self: ptr IShellDispatch, vDir: VARIANT, ppsdf: ptr ptr Folder): HRESULT {.stdcall.}
    BrowseForFolder*: proc(self: ptr IShellDispatch, Hwnd: LONG, Title: BSTR, Options: LONG, RootFolder: VARIANT, ppsdf: ptr ptr Folder): HRESULT {.stdcall.}
    Windows*: proc(self: ptr IShellDispatch, ppid: ptr ptr IDispatch): HRESULT {.stdcall.}
    Open*: proc(self: ptr IShellDispatch, vDir: VARIANT): HRESULT {.stdcall.}
    Explore*: proc(self: ptr IShellDispatch, vDir: VARIANT): HRESULT {.stdcall.}
    MinimizeAll*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    UndoMinimizeALL*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    FileRun*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    CascadeWindows*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    TileVertically*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    TileHorizontally*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    ShutdownWindows*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    Suspend*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    EjectPC*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    SetTime*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    TrayProperties*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    Help*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    FindFiles*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    FindComputer*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    RefreshMenu*: proc(self: ptr IShellDispatch): HRESULT {.stdcall.}
    ControlPanelItem*: proc(self: ptr IShellDispatch, bstrDir: BSTR): HRESULT {.stdcall.}
  IShellDispatch2* {.pure.} = object
    lpVtbl*: ptr IShellDispatch2Vtbl
  IShellDispatch2Vtbl* {.pure, inheritable.} = object of IShellDispatchVtbl
    IsRestricted*: proc(self: ptr IShellDispatch2, Group: BSTR, Restriction: BSTR, plRestrictValue: ptr LONG): HRESULT {.stdcall.}
    ShellExecute*: proc(self: ptr IShellDispatch2, File: BSTR, vArgs: VARIANT, vDir: VARIANT, vOperation: VARIANT, vShow: VARIANT): HRESULT {.stdcall.}
    FindPrinter*: proc(self: ptr IShellDispatch2, name: BSTR, location: BSTR, model: BSTR): HRESULT {.stdcall.}
    GetSystemInformation*: proc(self: ptr IShellDispatch2, name: BSTR, pv: ptr VARIANT): HRESULT {.stdcall.}
    ServiceStart*: proc(self: ptr IShellDispatch2, ServiceName: BSTR, Persistent: VARIANT, pSuccess: ptr VARIANT): HRESULT {.stdcall.}
    ServiceStop*: proc(self: ptr IShellDispatch2, ServiceName: BSTR, Persistent: VARIANT, pSuccess: ptr VARIANT): HRESULT {.stdcall.}
    IsServiceRunning*: proc(self: ptr IShellDispatch2, ServiceName: BSTR, pRunning: ptr VARIANT): HRESULT {.stdcall.}
    CanStartStopService*: proc(self: ptr IShellDispatch2, ServiceName: BSTR, pCanStartStop: ptr VARIANT): HRESULT {.stdcall.}
    ShowBrowserBar*: proc(self: ptr IShellDispatch2, bstrClsid: BSTR, bShow: VARIANT, pSuccess: ptr VARIANT): HRESULT {.stdcall.}
  IShellDispatch3* {.pure.} = object
    lpVtbl*: ptr IShellDispatch3Vtbl
  IShellDispatch3Vtbl* {.pure, inheritable.} = object of IShellDispatch2Vtbl
    AddToRecent*: proc(self: ptr IShellDispatch3, varFile: VARIANT, bstrCategory: BSTR): HRESULT {.stdcall.}
  IShellDispatch4* {.pure.} = object
    lpVtbl*: ptr IShellDispatch4Vtbl
  IShellDispatch4Vtbl* {.pure, inheritable.} = object of IShellDispatch3Vtbl
    WindowsSecurity*: proc(self: ptr IShellDispatch4): HRESULT {.stdcall.}
    ToggleDesktop*: proc(self: ptr IShellDispatch4): HRESULT {.stdcall.}
    ExplorerPolicy*: proc(self: ptr IShellDispatch4, bstrPolicyName: BSTR, pValue: ptr VARIANT): HRESULT {.stdcall.}
    GetSetting*: proc(self: ptr IShellDispatch4, lSetting: LONG, pResult: ptr VARIANT_BOOL): HRESULT {.stdcall.}
  IShellDispatch5* {.pure.} = object
    lpVtbl*: ptr IShellDispatch5Vtbl
  IShellDispatch5Vtbl* {.pure, inheritable.} = object of IShellDispatch4Vtbl
    WindowSwitcher*: proc(self: ptr IShellDispatch5): HRESULT {.stdcall.}
  IShellDispatch6* {.pure.} = object
    lpVtbl*: ptr IShellDispatch6Vtbl
  IShellDispatch6Vtbl* {.pure, inheritable.} = object of IShellDispatch5Vtbl
    SearchCommand*: proc(self: ptr IShellDispatch6): HRESULT {.stdcall.}
  IFileSearchBand* {.pure.} = object
    lpVtbl*: ptr IFileSearchBandVtbl
  IFileSearchBandVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    SetFocus*: proc(self: ptr IFileSearchBand): HRESULT {.stdcall.}
    SetSearchParameters*: proc(self: ptr IFileSearchBand, pbstrSearchID: ptr BSTR, bNavToResults: VARIANT_BOOL, pvarScope: ptr VARIANT, pvarQueryFile: ptr VARIANT): HRESULT {.stdcall.}
    get_SearchID*: proc(self: ptr IFileSearchBand, pbstrSearchID: ptr BSTR): HRESULT {.stdcall.}
    get_Scope*: proc(self: ptr IFileSearchBand, pvarScope: ptr VARIANT): HRESULT {.stdcall.}
    get_QueryFile*: proc(self: ptr IFileSearchBand, pvarFile: ptr VARIANT): HRESULT {.stdcall.}
  IWebWizardHost* {.pure.} = object
    lpVtbl*: ptr IWebWizardHostVtbl
  IWebWizardHostVtbl* {.pure, inheritable.} = object of IDispatchVtbl
    FinalBack*: proc(self: ptr IWebWizardHost): HRESULT {.stdcall.}
    FinalNext*: proc(self: ptr IWebWizardHost): HRESULT {.stdcall.}
    Cancel*: proc(self: ptr IWebWizardHost): HRESULT {.stdcall.}
    put_Caption*: proc(self: ptr IWebWizardHost, bstrCaption: BSTR): HRESULT {.stdcall.}
    get_Caption*: proc(self: ptr IWebWizardHost, pbstrCaption: ptr BSTR): HRESULT {.stdcall.}
    put_Property*: proc(self: ptr IWebWizardHost, bstrPropertyName: BSTR, pvProperty: ptr VARIANT): HRESULT {.stdcall.}
    get_Property*: proc(self: ptr IWebWizardHost, bstrPropertyName: BSTR, pvProperty: ptr VARIANT): HRESULT {.stdcall.}
    SetWizardButtons*: proc(self: ptr IWebWizardHost, vfEnableBack: VARIANT_BOOL, vfEnableNext: VARIANT_BOOL, vfLastPage: VARIANT_BOOL): HRESULT {.stdcall.}
    SetHeaderText*: proc(self: ptr IWebWizardHost, bstrHeaderTitle: BSTR, bstrHeaderSubtitle: BSTR): HRESULT {.stdcall.}
  INewWDEvents* {.pure.} = object
    lpVtbl*: ptr INewWDEventsVtbl
  INewWDEventsVtbl* {.pure, inheritable.} = object of IWebWizardHostVtbl
    PassportAuthenticate*: proc(self: ptr INewWDEvents, bstrSignInUrl: BSTR, pvfAuthenitcated: ptr VARIANT_BOOL): HRESULT {.stdcall.}
  IDataObjectAsyncCapability* {.pure.} = object
    lpVtbl*: ptr IDataObjectAsyncCapabilityVtbl
  IDataObjectAsyncCapabilityVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetAsyncMode*: proc(self: ptr IDataObjectAsyncCapability, fDoOpAsync: WINBOOL): HRESULT {.stdcall.}
    GetAsyncMode*: proc(self: ptr IDataObjectAsyncCapability, pfIsOpAsync: ptr WINBOOL): HRESULT {.stdcall.}
    StartOperation*: proc(self: ptr IDataObjectAsyncCapability, pbcReserved: ptr IBindCtx): HRESULT {.stdcall.}
    InOperation*: proc(self: ptr IDataObjectAsyncCapability, pfInAsyncOp: ptr WINBOOL): HRESULT {.stdcall.}
    EndOperation*: proc(self: ptr IDataObjectAsyncCapability, hResult: HRESULT, pbcReserved: ptr IBindCtx, dwEffects: DWORD): HRESULT {.stdcall.}
  IObjectArray* {.pure.} = object
    lpVtbl*: ptr IObjectArrayVtbl
  IObjectArrayVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetCount*: proc(self: ptr IObjectArray, pcObjects: ptr UINT): HRESULT {.stdcall.}
    GetAt*: proc(self: ptr IObjectArray, uiIndex: UINT, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  IObjectCollection* {.pure.} = object
    lpVtbl*: ptr IObjectCollectionVtbl
  IObjectCollectionVtbl* {.pure, inheritable.} = object of IObjectArrayVtbl
    AddObject*: proc(self: ptr IObjectCollection, punk: ptr IUnknown): HRESULT {.stdcall.}
    AddFromArray*: proc(self: ptr IObjectCollection, poaSource: ptr IObjectArray): HRESULT {.stdcall.}
    RemoveObjectAt*: proc(self: ptr IObjectCollection, uiIndex: UINT): HRESULT {.stdcall.}
    Clear*: proc(self: ptr IObjectCollection): HRESULT {.stdcall.}
  IExecuteCommand* {.pure.} = object
    lpVtbl*: ptr IExecuteCommandVtbl
  IExecuteCommandVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetKeyState*: proc(self: ptr IExecuteCommand, grfKeyState: DWORD): HRESULT {.stdcall.}
    SetParameters*: proc(self: ptr IExecuteCommand, pszParameters: LPCWSTR): HRESULT {.stdcall.}
    SetPosition*: proc(self: ptr IExecuteCommand, pt: POINT): HRESULT {.stdcall.}
    SetShowWindow*: proc(self: ptr IExecuteCommand, nShow: int32): HRESULT {.stdcall.}
    SetNoShowUI*: proc(self: ptr IExecuteCommand, fNoShowUI: WINBOOL): HRESULT {.stdcall.}
    SetDirectory*: proc(self: ptr IExecuteCommand, pszDirectory: LPCWSTR): HRESULT {.stdcall.}
    Execute*: proc(self: ptr IExecuteCommand): HRESULT {.stdcall.}
  IRunnableTask* {.pure.} = object
    lpVtbl*: ptr IRunnableTaskVtbl
  IRunnableTaskVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Run*: proc(self: ptr IRunnableTask): HRESULT {.stdcall.}
    Kill*: proc(self: ptr IRunnableTask, bWait: WINBOOL): HRESULT {.stdcall.}
    Suspend*: proc(self: ptr IRunnableTask): HRESULT {.stdcall.}
    Resume*: proc(self: ptr IRunnableTask): HRESULT {.stdcall.}
    IsRunning*: proc(self: ptr IRunnableTask): ULONG {.stdcall.}
  IShellTaskScheduler* {.pure.} = object
    lpVtbl*: ptr IShellTaskSchedulerVtbl
  IShellTaskSchedulerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    AddTask*: proc(self: ptr IShellTaskScheduler, prt: ptr IRunnableTask, rtoid: REFTASKOWNERID, lParam: DWORD_PTR, dwPriority: DWORD): HRESULT {.stdcall.}
    RemoveTasks*: proc(self: ptr IShellTaskScheduler, rtoid: REFTASKOWNERID, lParam: DWORD_PTR, bWaitIfRunning: WINBOOL): HRESULT {.stdcall.}
    CountTasks*: proc(self: ptr IShellTaskScheduler, rtoid: REFTASKOWNERID): UINT {.stdcall.}
    Status*: proc(self: ptr IShellTaskScheduler, dwReleaseStatus: DWORD, dwThreadTimeout: DWORD): HRESULT {.stdcall.}
  IQueryCodePage* {.pure.} = object
    lpVtbl*: ptr IQueryCodePageVtbl
  IQueryCodePageVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetCodePage*: proc(self: ptr IQueryCodePage, puiCodePage: ptr UINT): HRESULT {.stdcall.}
    SetCodePage*: proc(self: ptr IQueryCodePage, uiCodePage: UINT): HRESULT {.stdcall.}
  IPersistFolder2* {.pure.} = object
    lpVtbl*: ptr IPersistFolder2Vtbl
  IPersistFolder2Vtbl* {.pure, inheritable.} = object of IPersistFolderVtbl
    GetCurFolder*: proc(self: ptr IPersistFolder2, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.stdcall.}
  IPersistFolder3* {.pure.} = object
    lpVtbl*: ptr IPersistFolder3Vtbl
  IPersistFolder3Vtbl* {.pure, inheritable.} = object of IPersistFolder2Vtbl
    InitializeEx*: proc(self: ptr IPersistFolder3, pbc: ptr IBindCtx, pidlRoot: PCIDLIST_ABSOLUTE, ppfti: ptr PERSIST_FOLDER_TARGET_INFO): HRESULT {.stdcall.}
    GetFolderTargetInfo*: proc(self: ptr IPersistFolder3, ppfti: ptr PERSIST_FOLDER_TARGET_INFO): HRESULT {.stdcall.}
  IPersistIDList* {.pure.} = object
    lpVtbl*: ptr IPersistIDListVtbl
  IPersistIDListVtbl* {.pure, inheritable.} = object of IPersistVtbl
    SetIDList*: proc(self: ptr IPersistIDList, pidl: PCIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    GetIDList*: proc(self: ptr IPersistIDList, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.stdcall.}
  IEnumFullIDList* {.pure.} = object
    lpVtbl*: ptr IEnumFullIDListVtbl
  IEnumFullIDListVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Next*: proc(self: ptr IEnumFullIDList, celt: ULONG, rgelt: ptr PIDLIST_ABSOLUTE, pceltFetched: ptr ULONG): HRESULT {.stdcall.}
    Skip*: proc(self: ptr IEnumFullIDList, celt: ULONG): HRESULT {.stdcall.}
    Reset*: proc(self: ptr IEnumFullIDList): HRESULT {.stdcall.}
    Clone*: proc(self: ptr IEnumFullIDList, ppenum: ptr ptr IEnumFullIDList): HRESULT {.stdcall.}
  IObjectWithFolderEnumMode* {.pure.} = object
    lpVtbl*: ptr IObjectWithFolderEnumModeVtbl
  IObjectWithFolderEnumModeVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetMode*: proc(self: ptr IObjectWithFolderEnumMode, feMode: FOLDER_ENUM_MODE): HRESULT {.stdcall.}
    GetMode*: proc(self: ptr IObjectWithFolderEnumMode, pfeMode: ptr FOLDER_ENUM_MODE): HRESULT {.stdcall.}
  IParseAndCreateItem* {.pure.} = object
    lpVtbl*: ptr IParseAndCreateItemVtbl
  IParseAndCreateItemVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetItem*: proc(self: ptr IParseAndCreateItem, psi: ptr IShellItem): HRESULT {.stdcall.}
    GetItem*: proc(self: ptr IParseAndCreateItem, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  IShellFolder2* {.pure.} = object
    lpVtbl*: ptr IShellFolder2Vtbl
  IShellFolder2Vtbl* {.pure, inheritable.} = object of IShellFolderVtbl
    GetDefaultSearchGUID*: proc(self: ptr IShellFolder2, pguid: ptr GUID): HRESULT {.stdcall.}
    EnumSearches*: proc(self: ptr IShellFolder2, ppenum: ptr ptr IEnumExtraSearch): HRESULT {.stdcall.}
    GetDefaultColumn*: proc(self: ptr IShellFolder2, dwRes: DWORD, pSort: ptr ULONG, pDisplay: ptr ULONG): HRESULT {.stdcall.}
    GetDefaultColumnState*: proc(self: ptr IShellFolder2, iColumn: UINT, pcsFlags: ptr SHCOLSTATEF): HRESULT {.stdcall.}
    GetDetailsEx*: proc(self: ptr IShellFolder2, pidl: PCUITEMID_CHILD, pscid: ptr SHCOLUMNID, pv: ptr VARIANT): HRESULT {.stdcall.}
    GetDetailsOf*: proc(self: ptr IShellFolder2, pidl: PCUITEMID_CHILD, iColumn: UINT, psd: ptr SHELLDETAILS): HRESULT {.stdcall.}
    MapColumnToSCID*: proc(self: ptr IShellFolder2, iColumn: UINT, pscid: ptr SHCOLUMNID): HRESULT {.stdcall.}
  IFolderViewOptions* {.pure.} = object
    lpVtbl*: ptr IFolderViewOptionsVtbl
  IFolderViewOptionsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetFolderViewOptions*: proc(self: ptr IFolderViewOptions, fvoMask: FOLDERVIEWOPTIONS, fvoFlags: FOLDERVIEWOPTIONS): HRESULT {.stdcall.}
    GetFolderViewOptions*: proc(self: ptr IFolderViewOptions, pfvoFlags: ptr FOLDERVIEWOPTIONS): HRESULT {.stdcall.}
  IShellView2* {.pure.} = object
    lpVtbl*: ptr IShellView2Vtbl
  IShellView2Vtbl* {.pure, inheritable.} = object of IShellViewVtbl
    GetView*: proc(self: ptr IShellView2, pvid: ptr SHELLVIEWID, uView: ULONG): HRESULT {.stdcall.}
    CreateViewWindow2*: proc(self: ptr IShellView2, lpParams: LPSV2CVW2_PARAMS): HRESULT {.stdcall.}
    HandleRename*: proc(self: ptr IShellView2, pidlNew: PCUITEMID_CHILD): HRESULT {.stdcall.}
    SelectAndPositionItem*: proc(self: ptr IShellView2, pidlItem: PCUITEMID_CHILD, uFlags: UINT, ppt: ptr POINT): HRESULT {.stdcall.}
  IShellView3* {.pure.} = object
    lpVtbl*: ptr IShellView3Vtbl
  IShellView3Vtbl* {.pure, inheritable.} = object of IShellView2Vtbl
    CreateViewWindow3*: proc(self: ptr IShellView3, psbOwner: ptr IShellBrowser, psvPrev: ptr IShellView, dwViewFlags: SV3CVW3_FLAGS, dwMask: FOLDERFLAGS, dwFlags: FOLDERFLAGS, fvMode: FOLDERVIEWMODE, pvid: ptr SHELLVIEWID, prcView: ptr RECT, phwndView: ptr HWND): HRESULT {.stdcall.}
  IFolderView* {.pure.} = object
    lpVtbl*: ptr IFolderViewVtbl
  IFolderViewVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetCurrentViewMode*: proc(self: ptr IFolderView, pViewMode: ptr UINT): HRESULT {.stdcall.}
    SetCurrentViewMode*: proc(self: ptr IFolderView, ViewMode: UINT): HRESULT {.stdcall.}
    GetFolder*: proc(self: ptr IFolderView, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    Item*: proc(self: ptr IFolderView, iItemIndex: int32, ppidl: ptr PITEMID_CHILD): HRESULT {.stdcall.}
    ItemCount*: proc(self: ptr IFolderView, uFlags: UINT, pcItems: ptr int32): HRESULT {.stdcall.}
    Items*: proc(self: ptr IFolderView, uFlags: UINT, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetSelectionMarkedItem*: proc(self: ptr IFolderView, piItem: ptr int32): HRESULT {.stdcall.}
    GetFocusedItem*: proc(self: ptr IFolderView, piItem: ptr int32): HRESULT {.stdcall.}
    GetItemPosition*: proc(self: ptr IFolderView, pidl: PCUITEMID_CHILD, ppt: ptr POINT): HRESULT {.stdcall.}
    GetSpacing*: proc(self: ptr IFolderView, ppt: ptr POINT): HRESULT {.stdcall.}
    GetDefaultSpacing*: proc(self: ptr IFolderView, ppt: ptr POINT): HRESULT {.stdcall.}
    GetAutoArrange*: proc(self: ptr IFolderView): HRESULT {.stdcall.}
    SelectItem*: proc(self: ptr IFolderView, iItem: int32, dwFlags: DWORD): HRESULT {.stdcall.}
    SelectAndPositionItems*: proc(self: ptr IFolderView, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, apt: ptr POINT, dwFlags: DWORD): HRESULT {.stdcall.}
  ISearchBoxInfo* {.pure.} = object
    lpVtbl*: ptr ISearchBoxInfoVtbl
  ISearchBoxInfoVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetCondition*: proc(self: ptr ISearchBoxInfo, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetText*: proc(self: ptr ISearchBoxInfo, ppsz: ptr LPWSTR): HRESULT {.stdcall.}
  IEnumShellItems* {.pure.} = object
    lpVtbl*: ptr IEnumShellItemsVtbl
  IEnumShellItemsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Next*: proc(self: ptr IEnumShellItems, celt: ULONG, rgelt: ptr ptr IShellItem, pceltFetched: ptr ULONG): HRESULT {.stdcall.}
    Skip*: proc(self: ptr IEnumShellItems, celt: ULONG): HRESULT {.stdcall.}
    Reset*: proc(self: ptr IEnumShellItems): HRESULT {.stdcall.}
    Clone*: proc(self: ptr IEnumShellItems, ppenum: ptr ptr IEnumShellItems): HRESULT {.stdcall.}
  IShellItemArray* {.pure.} = object
    lpVtbl*: ptr IShellItemArrayVtbl
  IShellItemArrayVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    BindToHandler*: proc(self: ptr IShellItemArray, pbc: ptr IBindCtx, bhid: REFGUID, riid: REFIID, ppvOut: ptr pointer): HRESULT {.stdcall.}
    GetPropertyStore*: proc(self: ptr IShellItemArray, flags: GETPROPERTYSTOREFLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetPropertyDescriptionList*: proc(self: ptr IShellItemArray, keyType: REFPROPERTYKEY, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetAttributes*: proc(self: ptr IShellItemArray, AttribFlags: SIATTRIBFLAGS, sfgaoMask: SFGAOF, psfgaoAttribs: ptr SFGAOF): HRESULT {.stdcall.}
    GetCount*: proc(self: ptr IShellItemArray, pdwNumItems: ptr DWORD): HRESULT {.stdcall.}
    GetItemAt*: proc(self: ptr IShellItemArray, dwIndex: DWORD, ppsi: ptr ptr IShellItem): HRESULT {.stdcall.}
    EnumItems*: proc(self: ptr IShellItemArray, ppenumShellItems: ptr ptr IEnumShellItems): HRESULT {.stdcall.}
  IFolderView2* {.pure.} = object
    lpVtbl*: ptr IFolderView2Vtbl
  IFolderView2Vtbl* {.pure, inheritable.} = object of IFolderViewVtbl
    SetGroupBy*: proc(self: ptr IFolderView2, key: REFPROPERTYKEY, fAscending: WINBOOL): HRESULT {.stdcall.}
    GetGroupBy*: proc(self: ptr IFolderView2, pkey: ptr PROPERTYKEY, pfAscending: ptr WINBOOL): HRESULT {.stdcall.}
    SetViewProperty*: proc(self: ptr IFolderView2, pidl: PCUITEMID_CHILD, propkey: REFPROPERTYKEY, propvar: REFPROPVARIANT): HRESULT {.stdcall.}
    GetViewProperty*: proc(self: ptr IFolderView2, pidl: PCUITEMID_CHILD, propkey: REFPROPERTYKEY, ppropvar: ptr PROPVARIANT): HRESULT {.stdcall.}
    SetTileViewProperties*: proc(self: ptr IFolderView2, pidl: PCUITEMID_CHILD, pszPropList: LPCWSTR): HRESULT {.stdcall.}
    SetExtendedTileViewProperties*: proc(self: ptr IFolderView2, pidl: PCUITEMID_CHILD, pszPropList: LPCWSTR): HRESULT {.stdcall.}
    SetText*: proc(self: ptr IFolderView2, iType: FVTEXTTYPE, pwszText: LPCWSTR): HRESULT {.stdcall.}
    SetCurrentFolderFlags*: proc(self: ptr IFolderView2, dwMask: DWORD, dwFlags: DWORD): HRESULT {.stdcall.}
    GetCurrentFolderFlags*: proc(self: ptr IFolderView2, pdwFlags: ptr DWORD): HRESULT {.stdcall.}
    GetSortColumnCount*: proc(self: ptr IFolderView2, pcColumns: ptr int32): HRESULT {.stdcall.}
    SetSortColumns*: proc(self: ptr IFolderView2, rgSortColumns: ptr SORTCOLUMN, cColumns: int32): HRESULT {.stdcall.}
    GetSortColumns*: proc(self: ptr IFolderView2, rgSortColumns: ptr SORTCOLUMN, cColumns: int32): HRESULT {.stdcall.}
    GetItem*: proc(self: ptr IFolderView2, iItem: int32, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetVisibleItem*: proc(self: ptr IFolderView2, iStart: int32, fPrevious: WINBOOL, piItem: ptr int32): HRESULT {.stdcall.}
    GetSelectedItem*: proc(self: ptr IFolderView2, iStart: int32, piItem: ptr int32): HRESULT {.stdcall.}
    GetSelection*: proc(self: ptr IFolderView2, fNoneImpliesFolder: WINBOOL, ppsia: ptr ptr IShellItemArray): HRESULT {.stdcall.}
    GetSelectionState*: proc(self: ptr IFolderView2, pidl: PCUITEMID_CHILD, pdwFlags: ptr DWORD): HRESULT {.stdcall.}
    InvokeVerbOnSelection*: proc(self: ptr IFolderView2, pszVerb: LPCSTR): HRESULT {.stdcall.}
    SetViewModeAndIconSize*: proc(self: ptr IFolderView2, uViewMode: FOLDERVIEWMODE, iImageSize: int32): HRESULT {.stdcall.}
    GetViewModeAndIconSize*: proc(self: ptr IFolderView2, puViewMode: ptr FOLDERVIEWMODE, piImageSize: ptr int32): HRESULT {.stdcall.}
    SetGroupSubsetCount*: proc(self: ptr IFolderView2, cVisibleRows: UINT): HRESULT {.stdcall.}
    GetGroupSubsetCount*: proc(self: ptr IFolderView2, pcVisibleRows: ptr UINT): HRESULT {.stdcall.}
    SetRedraw*: proc(self: ptr IFolderView2, fRedrawOn: WINBOOL): HRESULT {.stdcall.}
    IsMoveInSameFolder*: proc(self: ptr IFolderView2): HRESULT {.stdcall.}
    DoRename*: proc(self: ptr IFolderView2): HRESULT {.stdcall.}
  IFolderViewSettings* {.pure.} = object
    lpVtbl*: ptr IFolderViewSettingsVtbl
  IFolderViewSettingsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetColumnPropertyList*: proc(self: ptr IFolderViewSettings, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetGroupByProperty*: proc(self: ptr IFolderViewSettings, pkey: ptr PROPERTYKEY, pfGroupAscending: ptr WINBOOL): HRESULT {.stdcall.}
    GetViewMode*: proc(self: ptr IFolderViewSettings, plvm: ptr FOLDERLOGICALVIEWMODE): HRESULT {.stdcall.}
    GetIconSize*: proc(self: ptr IFolderViewSettings, puIconSize: ptr UINT): HRESULT {.stdcall.}
    GetFolderFlags*: proc(self: ptr IFolderViewSettings, pfolderMask: ptr FOLDERFLAGS, pfolderFlags: ptr FOLDERFLAGS): HRESULT {.stdcall.}
    GetSortColumns*: proc(self: ptr IFolderViewSettings, rgSortColumns: ptr SORTCOLUMN, cColumnsIn: UINT, pcColumnsOut: ptr UINT): HRESULT {.stdcall.}
    GetGroupSubsetCount*: proc(self: ptr IFolderViewSettings, pcVisibleRows: ptr UINT): HRESULT {.stdcall.}
  IPreviewHandlerVisuals* {.pure.} = object
    lpVtbl*: ptr IPreviewHandlerVisualsVtbl
  IPreviewHandlerVisualsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetBackgroundColor*: proc(self: ptr IPreviewHandlerVisuals, color: COLORREF): HRESULT {.stdcall.}
    SetFont*: proc(self: ptr IPreviewHandlerVisuals, plf: ptr LOGFONTW): HRESULT {.stdcall.}
    SetTextColor*: proc(self: ptr IPreviewHandlerVisuals, color: COLORREF): HRESULT {.stdcall.}
  IVisualProperties* {.pure.} = object
    lpVtbl*: ptr IVisualPropertiesVtbl
  IVisualPropertiesVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetWatermark*: proc(self: ptr IVisualProperties, hbmp: HBITMAP, vpwf: VPWATERMARKFLAGS): HRESULT {.stdcall.}
    SetColor*: proc(self: ptr IVisualProperties, vpcf: VPCOLORFLAGS, cr: COLORREF): HRESULT {.stdcall.}
    GetColor*: proc(self: ptr IVisualProperties, vpcf: VPCOLORFLAGS, pcr: ptr COLORREF): HRESULT {.stdcall.}
    SetItemHeight*: proc(self: ptr IVisualProperties, cyItemInPixels: int32): HRESULT {.stdcall.}
    GetItemHeight*: proc(self: ptr IVisualProperties, cyItemInPixels: ptr int32): HRESULT {.stdcall.}
    SetFont*: proc(self: ptr IVisualProperties, plf: ptr LOGFONTW, bRedraw: WINBOOL): HRESULT {.stdcall.}
    GetFont*: proc(self: ptr IVisualProperties, plf: ptr LOGFONTW): HRESULT {.stdcall.}
    SetTheme*: proc(self: ptr IVisualProperties, pszSubAppName: LPCWSTR, pszSubIdList: LPCWSTR): HRESULT {.stdcall.}
  ICommDlgBrowser3* {.pure.} = object
    lpVtbl*: ptr ICommDlgBrowser3Vtbl
  ICommDlgBrowser3Vtbl* {.pure, inheritable.} = object of ICommDlgBrowser2Vtbl
    OnColumnClicked*: proc(self: ptr ICommDlgBrowser3, ppshv: ptr IShellView, iColumn: int32): HRESULT {.stdcall.}
    GetCurrentFilter*: proc(self: ptr ICommDlgBrowser3, pszFileSpec: LPWSTR, cchFileSpec: int32): HRESULT {.stdcall.}
    OnPreViewCreated*: proc(self: ptr ICommDlgBrowser3, ppshv: ptr IShellView): HRESULT {.stdcall.}
  IColumnManager* {.pure.} = object
    lpVtbl*: ptr IColumnManagerVtbl
  IColumnManagerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetColumnInfo*: proc(self: ptr IColumnManager, propkey: REFPROPERTYKEY, pcmci: ptr CM_COLUMNINFO): HRESULT {.stdcall.}
    GetColumnInfo*: proc(self: ptr IColumnManager, propkey: REFPROPERTYKEY, pcmci: ptr CM_COLUMNINFO): HRESULT {.stdcall.}
    GetColumnCount*: proc(self: ptr IColumnManager, dwFlags: CM_ENUM_FLAGS, puCount: ptr UINT): HRESULT {.stdcall.}
    GetColumns*: proc(self: ptr IColumnManager, dwFlags: CM_ENUM_FLAGS, rgkeyOrder: ptr PROPERTYKEY, cColumns: UINT): HRESULT {.stdcall.}
    SetColumns*: proc(self: ptr IColumnManager, rgkeyOrder: ptr PROPERTYKEY, cVisible: UINT): HRESULT {.stdcall.}
  IFolderFilterSite* {.pure.} = object
    lpVtbl*: ptr IFolderFilterSiteVtbl
  IFolderFilterSiteVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetFilter*: proc(self: ptr IFolderFilterSite, punk: ptr IUnknown): HRESULT {.stdcall.}
  IFolderFilter* {.pure.} = object
    lpVtbl*: ptr IFolderFilterVtbl
  IFolderFilterVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ShouldShow*: proc(self: ptr IFolderFilter, psf: ptr IShellFolder, pidlFolder: PCIDLIST_ABSOLUTE, pidlItem: PCUITEMID_CHILD): HRESULT {.stdcall.}
    GetEnumFlags*: proc(self: ptr IFolderFilter, psf: ptr IShellFolder, pidlFolder: PCIDLIST_ABSOLUTE, phwnd: ptr HWND, pgrfFlags: ptr DWORD): HRESULT {.stdcall.}
  IInputObjectSite* {.pure.} = object
    lpVtbl*: ptr IInputObjectSiteVtbl
  IInputObjectSiteVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnFocusChangeIS*: proc(self: ptr IInputObjectSite, punkObj: ptr IUnknown, fSetFocus: WINBOOL): HRESULT {.stdcall.}
  IInputObject* {.pure.} = object
    lpVtbl*: ptr IInputObjectVtbl
  IInputObjectVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    UIActivateIO*: proc(self: ptr IInputObject, fActivate: WINBOOL, pMsg: ptr MSG): HRESULT {.stdcall.}
    HasFocusIO*: proc(self: ptr IInputObject): HRESULT {.stdcall.}
    TranslateAcceleratorIO*: proc(self: ptr IInputObject, pMsg: ptr MSG): HRESULT {.stdcall.}
  IInputObject2* {.pure.} = object
    lpVtbl*: ptr IInputObject2Vtbl
  IInputObject2Vtbl* {.pure, inheritable.} = object of IInputObjectVtbl
    TranslateAcceleratorGlobal*: proc(self: ptr IInputObject2, pMsg: ptr MSG): HRESULT {.stdcall.}
  IShellIcon* {.pure.} = object
    lpVtbl*: ptr IShellIconVtbl
  IShellIconVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetIconOf*: proc(self: ptr IShellIcon, pidl: PCUITEMID_CHILD, flags: UINT, pIconIndex: ptr int32): HRESULT {.stdcall.}
  IProfferService* {.pure.} = object
    lpVtbl*: ptr IProfferServiceVtbl
  IProfferServiceVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ProfferService*: proc(self: ptr IProfferService, guidService: REFGUID, psp: ptr IServiceProvider, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    RevokeService*: proc(self: ptr IProfferService, dwCookie: DWORD): HRESULT {.stdcall.}
  IShellItem2* {.pure.} = object
    lpVtbl*: ptr IShellItem2Vtbl
  IShellItem2Vtbl* {.pure, inheritable.} = object of IShellItemVtbl
    GetPropertyStore*: proc(self: ptr IShellItem2, flags: GETPROPERTYSTOREFLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetPropertyStoreWithCreateObject*: proc(self: ptr IShellItem2, flags: GETPROPERTYSTOREFLAGS, punkCreateObject: ptr IUnknown, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetPropertyStoreForKeys*: proc(self: ptr IShellItem2, rgKeys: ptr PROPERTYKEY, cKeys: UINT, flags: GETPROPERTYSTOREFLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetPropertyDescriptionList*: proc(self: ptr IShellItem2, keyType: REFPROPERTYKEY, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    Update*: proc(self: ptr IShellItem2, pbc: ptr IBindCtx): HRESULT {.stdcall.}
    GetProperty*: proc(self: ptr IShellItem2, key: REFPROPERTYKEY, ppropvar: ptr PROPVARIANT): HRESULT {.stdcall.}
    GetCLSID*: proc(self: ptr IShellItem2, key: REFPROPERTYKEY, pclsid: ptr CLSID): HRESULT {.stdcall.}
    GetFileTime*: proc(self: ptr IShellItem2, key: REFPROPERTYKEY, pft: ptr FILETIME): HRESULT {.stdcall.}
    GetInt32*: proc(self: ptr IShellItem2, key: REFPROPERTYKEY, pi: ptr int32): HRESULT {.stdcall.}
    GetString*: proc(self: ptr IShellItem2, key: REFPROPERTYKEY, ppsz: ptr LPWSTR): HRESULT {.stdcall.}
    GetUInt32*: proc(self: ptr IShellItem2, key: REFPROPERTYKEY, pui: ptr ULONG): HRESULT {.stdcall.}
    GetUInt64*: proc(self: ptr IShellItem2, key: REFPROPERTYKEY, pull: ptr ULONGLONG): HRESULT {.stdcall.}
    GetBool*: proc(self: ptr IShellItem2, key: REFPROPERTYKEY, pf: ptr WINBOOL): HRESULT {.stdcall.}
  IShellItemImageFactory* {.pure.} = object
    lpVtbl*: ptr IShellItemImageFactoryVtbl
  IShellItemImageFactoryVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetImage*: proc(self: ptr IShellItemImageFactory, size: SIZE, flags: SIIGBF, phbm: ptr HBITMAP): HRESULT {.stdcall.}
  IUserAccountChangeCallback* {.pure.} = object
    lpVtbl*: ptr IUserAccountChangeCallbackVtbl
  IUserAccountChangeCallbackVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnPictureChange*: proc(self: ptr IUserAccountChangeCallback, pszUserName: LPCWSTR): HRESULT {.stdcall.}
  ITransferAdviseSink* {.pure.} = object
    lpVtbl*: ptr ITransferAdviseSinkVtbl
  ITransferAdviseSinkVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    UpdateProgress*: proc(self: ptr ITransferAdviseSink, ullSizeCurrent: ULONGLONG, ullSizeTotal: ULONGLONG, nFilesCurrent: int32, nFilesTotal: int32, nFoldersCurrent: int32, nFoldersTotal: int32): HRESULT {.stdcall.}
    UpdateTransferState*: proc(self: ptr ITransferAdviseSink, ts: TRANSFER_ADVISE_STATE): HRESULT {.stdcall.}
    ConfirmOverwrite*: proc(self: ptr ITransferAdviseSink, psiSource: ptr IShellItem, psiDestParent: ptr IShellItem, pszName: LPCWSTR): HRESULT {.stdcall.}
    ConfirmEncryptionLoss*: proc(self: ptr ITransferAdviseSink, psiSource: ptr IShellItem): HRESULT {.stdcall.}
    FileFailure*: proc(self: ptr ITransferAdviseSink, psi: ptr IShellItem, pszItem: LPCWSTR, hrError: HRESULT, pszRename: LPWSTR, cchRename: ULONG): HRESULT {.stdcall.}
    SubStreamFailure*: proc(self: ptr ITransferAdviseSink, psi: ptr IShellItem, pszStreamName: LPCWSTR, hrError: HRESULT): HRESULT {.stdcall.}
    PropertyFailure*: proc(self: ptr ITransferAdviseSink, psi: ptr IShellItem, pkey: ptr PROPERTYKEY, hrError: HRESULT): HRESULT {.stdcall.}
  ITransferSource* {.pure.} = object
    lpVtbl*: ptr ITransferSourceVtbl
  ITransferSourceVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Advise*: proc(self: ptr ITransferSource, psink: ptr ITransferAdviseSink, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    Unadvise*: proc(self: ptr ITransferSource, dwCookie: DWORD): HRESULT {.stdcall.}
    SetProperties*: proc(self: ptr ITransferSource, pproparray: ptr IPropertyChangeArray): HRESULT {.stdcall.}
    OpenItem*: proc(self: ptr ITransferSource, psi: ptr IShellItem, flags: TRANSFER_SOURCE_FLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    MoveItem*: proc(self: ptr ITransferSource, psi: ptr IShellItem, psiParentDst: ptr IShellItem, pszNameDst: LPCWSTR, flags: TRANSFER_SOURCE_FLAGS, ppsiNew: ptr ptr IShellItem): HRESULT {.stdcall.}
    RecycleItem*: proc(self: ptr ITransferSource, psiSource: ptr IShellItem, psiParentDest: ptr IShellItem, flags: TRANSFER_SOURCE_FLAGS, ppsiNewDest: ptr ptr IShellItem): HRESULT {.stdcall.}
    RemoveItem*: proc(self: ptr ITransferSource, psiSource: ptr IShellItem, flags: TRANSFER_SOURCE_FLAGS): HRESULT {.stdcall.}
    RenameItem*: proc(self: ptr ITransferSource, psiSource: ptr IShellItem, pszNewName: LPCWSTR, flags: TRANSFER_SOURCE_FLAGS, ppsiNewDest: ptr ptr IShellItem): HRESULT {.stdcall.}
    LinkItem*: proc(self: ptr ITransferSource, psiSource: ptr IShellItem, psiParentDest: ptr IShellItem, pszNewName: LPCWSTR, flags: TRANSFER_SOURCE_FLAGS, ppsiNewDest: ptr ptr IShellItem): HRESULT {.stdcall.}
    ApplyPropertiesToItem*: proc(self: ptr ITransferSource, psiSource: ptr IShellItem, ppsiNew: ptr ptr IShellItem): HRESULT {.stdcall.}
    GetDefaultDestinationName*: proc(self: ptr ITransferSource, psiSource: ptr IShellItem, psiParentDest: ptr IShellItem, ppszDestinationName: ptr LPWSTR): HRESULT {.stdcall.}
    EnterFolder*: proc(self: ptr ITransferSource, psiChildFolderDest: ptr IShellItem): HRESULT {.stdcall.}
    LeaveFolder*: proc(self: ptr ITransferSource, psiChildFolderDest: ptr IShellItem): HRESULT {.stdcall.}
  IEnumResources* {.pure.} = object
    lpVtbl*: ptr IEnumResourcesVtbl
  IEnumResourcesVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Next*: proc(self: ptr IEnumResources, celt: ULONG, psir: ptr SHELL_ITEM_RESOURCE, pceltFetched: ptr ULONG): HRESULT {.stdcall.}
    Skip*: proc(self: ptr IEnumResources, celt: ULONG): HRESULT {.stdcall.}
    Reset*: proc(self: ptr IEnumResources): HRESULT {.stdcall.}
    Clone*: proc(self: ptr IEnumResources, ppenumr: ptr ptr IEnumResources): HRESULT {.stdcall.}
  IShellItemResources* {.pure.} = object
    lpVtbl*: ptr IShellItemResourcesVtbl
  IShellItemResourcesVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetAttributes*: proc(self: ptr IShellItemResources, pdwAttributes: ptr DWORD): HRESULT {.stdcall.}
    GetSize*: proc(self: ptr IShellItemResources, pullSize: ptr ULONGLONG): HRESULT {.stdcall.}
    GetTimes*: proc(self: ptr IShellItemResources, pftCreation: ptr FILETIME, pftWrite: ptr FILETIME, pftAccess: ptr FILETIME): HRESULT {.stdcall.}
    SetTimes*: proc(self: ptr IShellItemResources, pftCreation: ptr FILETIME, pftWrite: ptr FILETIME, pftAccess: ptr FILETIME): HRESULT {.stdcall.}
    GetResourceDescription*: proc(self: ptr IShellItemResources, pcsir: ptr SHELL_ITEM_RESOURCE, ppszDescription: ptr LPWSTR): HRESULT {.stdcall.}
    EnumResources*: proc(self: ptr IShellItemResources, ppenumr: ptr ptr IEnumResources): HRESULT {.stdcall.}
    SupportsResource*: proc(self: ptr IShellItemResources, pcsir: ptr SHELL_ITEM_RESOURCE): HRESULT {.stdcall.}
    OpenResource*: proc(self: ptr IShellItemResources, pcsir: ptr SHELL_ITEM_RESOURCE, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    CreateResource*: proc(self: ptr IShellItemResources, pcsir: ptr SHELL_ITEM_RESOURCE, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    MarkForDelete*: proc(self: ptr IShellItemResources): HRESULT {.stdcall.}
  ITransferDestination* {.pure.} = object
    lpVtbl*: ptr ITransferDestinationVtbl
  ITransferDestinationVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Advise*: proc(self: ptr ITransferDestination, psink: ptr ITransferAdviseSink, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    Unadvise*: proc(self: ptr ITransferDestination, dwCookie: DWORD): HRESULT {.stdcall.}
    CreateItem*: proc(self: ptr ITransferDestination, pszName: LPCWSTR, dwAttributes: DWORD, ullSize: ULONGLONG, flags: TRANSFER_SOURCE_FLAGS, riidItem: REFIID, ppvItem: ptr pointer, riidResources: REFIID, ppvResources: ptr pointer): HRESULT {.stdcall.}
  IStreamAsync* {.pure.} = object
    lpVtbl*: ptr IStreamAsyncVtbl
  IStreamAsyncVtbl* {.pure, inheritable.} = object of IStreamVtbl
    ReadAsync*: proc(self: ptr IStreamAsync, pv: pointer, cb: DWORD, pcbRead: LPDWORD, lpOverlapped: LPOVERLAPPED): HRESULT {.stdcall.}
    WriteAsync*: proc(self: ptr IStreamAsync, lpBuffer: pointer, cb: DWORD, pcbWritten: LPDWORD, lpOverlapped: LPOVERLAPPED): HRESULT {.stdcall.}
    OverlappedResult*: proc(self: ptr IStreamAsync, lpOverlapped: LPOVERLAPPED, lpNumberOfBytesTransferred: LPDWORD, bWait: WINBOOL): HRESULT {.stdcall.}
    CancelIo*: proc(self: ptr IStreamAsync): HRESULT {.stdcall.}
  IStreamUnbufferedInfo* {.pure.} = object
    lpVtbl*: ptr IStreamUnbufferedInfoVtbl
  IStreamUnbufferedInfoVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetSectorSize*: proc(self: ptr IStreamUnbufferedInfo, pcbSectorSize: ptr ULONG): HRESULT {.stdcall.}
  IFileOperationProgressSink* {.pure.} = object
    lpVtbl*: ptr IFileOperationProgressSinkVtbl
  IFileOperationProgressSinkVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    StartOperations*: proc(self: ptr IFileOperationProgressSink): HRESULT {.stdcall.}
    FinishOperations*: proc(self: ptr IFileOperationProgressSink, hrResult: HRESULT): HRESULT {.stdcall.}
    PreRenameItem*: proc(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, pszNewName: LPCWSTR): HRESULT {.stdcall.}
    PostRenameItem*: proc(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, pszNewName: LPCWSTR, hrRename: HRESULT, psiNewlyCreated: ptr IShellItem): HRESULT {.stdcall.}
    PreMoveItem*: proc(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR): HRESULT {.stdcall.}
    PostMoveItem*: proc(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR, hrMove: HRESULT, psiNewlyCreated: ptr IShellItem): HRESULT {.stdcall.}
    PreCopyItem*: proc(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR): HRESULT {.stdcall.}
    PostCopyItem*: proc(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR, hrCopy: HRESULT, psiNewlyCreated: ptr IShellItem): HRESULT {.stdcall.}
    PreDeleteItem*: proc(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem): HRESULT {.stdcall.}
    PostDeleteItem*: proc(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, hrDelete: HRESULT, psiNewlyCreated: ptr IShellItem): HRESULT {.stdcall.}
    PreNewItem*: proc(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR): HRESULT {.stdcall.}
    PostNewItem*: proc(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR, pszTemplateName: LPCWSTR, dwFileAttributes: DWORD, hrNew: HRESULT, psiNewItem: ptr IShellItem): HRESULT {.stdcall.}
    UpdateProgress*: proc(self: ptr IFileOperationProgressSink, iWorkTotal: UINT, iWorkSoFar: UINT): HRESULT {.stdcall.}
    ResetTimer*: proc(self: ptr IFileOperationProgressSink): HRESULT {.stdcall.}
    PauseTimer*: proc(self: ptr IFileOperationProgressSink): HRESULT {.stdcall.}
    ResumeTimer*: proc(self: ptr IFileOperationProgressSink): HRESULT {.stdcall.}
  IInitializeWithItem* {.pure.} = object
    lpVtbl*: ptr IInitializeWithItemVtbl
  IInitializeWithItemVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IInitializeWithItem, psi: ptr IShellItem, grfMode: DWORD): HRESULT {.stdcall.}
  IObjectWithSelection* {.pure.} = object
    lpVtbl*: ptr IObjectWithSelectionVtbl
  IObjectWithSelectionVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetSelection*: proc(self: ptr IObjectWithSelection, psia: ptr IShellItemArray): HRESULT {.stdcall.}
    GetSelection*: proc(self: ptr IObjectWithSelection, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  IObjectWithBackReferences* {.pure.} = object
    lpVtbl*: ptr IObjectWithBackReferencesVtbl
  IObjectWithBackReferencesVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    RemoveBackReferences*: proc(self: ptr IObjectWithBackReferences): HRESULT {.stdcall.}
  IPropertyUI* {.pure.} = object
    lpVtbl*: ptr IPropertyUIVtbl
  IPropertyUIVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ParsePropertyName*: proc(self: ptr IPropertyUI, pszName: LPCWSTR, pfmtid: ptr FMTID, ppid: ptr PROPID, pchEaten: ptr ULONG): HRESULT {.stdcall.}
    GetCannonicalName*: proc(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, pwszText: LPWSTR, cchText: DWORD): HRESULT {.stdcall.}
    GetDisplayName*: proc(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, flags: PROPERTYUI_NAME_FLAGS, pwszText: LPWSTR, cchText: DWORD): HRESULT {.stdcall.}
    GetPropertyDescription*: proc(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, pwszText: LPWSTR, cchText: DWORD): HRESULT {.stdcall.}
    GetDefaultWidth*: proc(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, pcxChars: ptr ULONG): HRESULT {.stdcall.}
    GetFlags*: proc(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, pflags: ptr PROPERTYUI_FLAGS): HRESULT {.stdcall.}
    FormatForDisplay*: proc(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, ppropvar: ptr PROPVARIANT, puiff: PROPERTYUI_FORMAT_FLAGS, pwszText: LPWSTR, cchText: DWORD): HRESULT {.stdcall.}
    GetHelpInfo*: proc(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, pwszHelpFile: LPWSTR, cch: DWORD, puHelpID: ptr UINT): HRESULT {.stdcall.}
  ICategoryProvider* {.pure.} = object
    lpVtbl*: ptr ICategoryProviderVtbl
  ICategoryProviderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    CanCategorizeOnSCID*: proc(self: ptr ICategoryProvider, pscid: ptr SHCOLUMNID): HRESULT {.stdcall.}
    GetDefaultCategory*: proc(self: ptr ICategoryProvider, pguid: ptr GUID, pscid: ptr SHCOLUMNID): HRESULT {.stdcall.}
    GetCategoryForSCID*: proc(self: ptr ICategoryProvider, pscid: ptr SHCOLUMNID, pguid: ptr GUID): HRESULT {.stdcall.}
    EnumCategories*: proc(self: ptr ICategoryProvider, penum: ptr ptr IEnumGUID): HRESULT {.stdcall.}
    GetCategoryName*: proc(self: ptr ICategoryProvider, pguid: ptr GUID, pszName: LPWSTR, cch: UINT): HRESULT {.stdcall.}
    CreateCategory*: proc(self: ptr ICategoryProvider, pguid: ptr GUID, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  ICategorizer* {.pure.} = object
    lpVtbl*: ptr ICategorizerVtbl
  ICategorizerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetDescription*: proc(self: ptr ICategorizer, pszDesc: LPWSTR, cch: UINT): HRESULT {.stdcall.}
    GetCategory*: proc(self: ptr ICategorizer, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, rgCategoryIds: ptr DWORD): HRESULT {.stdcall.}
    GetCategoryInfo*: proc(self: ptr ICategorizer, dwCategoryId: DWORD, pci: ptr TCATEGORY_INFO): HRESULT {.stdcall.}
    CompareCategory*: proc(self: ptr ICategorizer, csfFlags: CATSORT_FLAGS, dwCategoryId1: DWORD, dwCategoryId2: DWORD): HRESULT {.stdcall.}
  IDropTargetHelper* {.pure.} = object
    lpVtbl*: ptr IDropTargetHelperVtbl
  IDropTargetHelperVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    DragEnter*: proc(self: ptr IDropTargetHelper, hwndTarget: HWND, pDataObject: ptr IDataObject, ppt: ptr POINT, dwEffect: DWORD): HRESULT {.stdcall.}
    DragLeave*: proc(self: ptr IDropTargetHelper): HRESULT {.stdcall.}
    DragOver*: proc(self: ptr IDropTargetHelper, ppt: ptr POINT, dwEffect: DWORD): HRESULT {.stdcall.}
    Drop*: proc(self: ptr IDropTargetHelper, pDataObject: ptr IDataObject, ppt: ptr POINT, dwEffect: DWORD): HRESULT {.stdcall.}
    Show*: proc(self: ptr IDropTargetHelper, fShow: WINBOOL): HRESULT {.stdcall.}
  IDragSourceHelper* {.pure.} = object
    lpVtbl*: ptr IDragSourceHelperVtbl
  IDragSourceHelperVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    InitializeFromBitmap*: proc(self: ptr IDragSourceHelper, pshdi: LPSHDRAGIMAGE, pDataObject: ptr IDataObject): HRESULT {.stdcall.}
    InitializeFromWindow*: proc(self: ptr IDragSourceHelper, hwnd: HWND, ppt: ptr POINT, pDataObject: ptr IDataObject): HRESULT {.stdcall.}
  IDragSourceHelper2* {.pure.} = object
    lpVtbl*: ptr IDragSourceHelper2Vtbl
  IDragSourceHelper2Vtbl* {.pure, inheritable.} = object of IDragSourceHelperVtbl
    SetFlags*: proc(self: ptr IDragSourceHelper2, dwFlags: DWORD): HRESULT {.stdcall.}
  IShellLinkDataList* {.pure.} = object
    lpVtbl*: ptr IShellLinkDataListVtbl
  IShellLinkDataListVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    AddDataBlock*: proc(self: ptr IShellLinkDataList, pDataBlock: pointer): HRESULT {.stdcall.}
    CopyDataBlock*: proc(self: ptr IShellLinkDataList, dwSig: DWORD, ppDataBlock: ptr pointer): HRESULT {.stdcall.}
    RemoveDataBlock*: proc(self: ptr IShellLinkDataList, dwSig: DWORD): HRESULT {.stdcall.}
    GetFlags*: proc(self: ptr IShellLinkDataList, pdwFlags: ptr DWORD): HRESULT {.stdcall.}
    SetFlags*: proc(self: ptr IShellLinkDataList, dwFlags: DWORD): HRESULT {.stdcall.}
  IResolveShellLink* {.pure.} = object
    lpVtbl*: ptr IResolveShellLinkVtbl
  IResolveShellLinkVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ResolveShellLink*: proc(self: ptr IResolveShellLink, punkLink: ptr IUnknown, hwnd: HWND, fFlags: DWORD): HRESULT {.stdcall.}
  IActionProgressDialog* {.pure.} = object
    lpVtbl*: ptr IActionProgressDialogVtbl
  IActionProgressDialogVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IActionProgressDialog, flags: SPINITF, pszTitle: LPCWSTR, pszCancel: LPCWSTR): HRESULT {.stdcall.}
    Stop*: proc(self: ptr IActionProgressDialog): HRESULT {.stdcall.}
  IHWEventHandler* {.pure.} = object
    lpVtbl*: ptr IHWEventHandlerVtbl
  IHWEventHandlerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IHWEventHandler, pszParams: LPCWSTR): HRESULT {.stdcall.}
    HandleEvent*: proc(self: ptr IHWEventHandler, pszDeviceID: LPCWSTR, pszAltDeviceID: LPCWSTR, pszEventType: LPCWSTR): HRESULT {.stdcall.}
    HandleEventWithContent*: proc(self: ptr IHWEventHandler, pszDeviceID: LPCWSTR, pszAltDeviceID: LPCWSTR, pszEventType: LPCWSTR, pszContentTypeHandler: LPCWSTR, pdataobject: ptr IDataObject): HRESULT {.stdcall.}
  IHWEventHandler2* {.pure.} = object
    lpVtbl*: ptr IHWEventHandler2Vtbl
  IHWEventHandler2Vtbl* {.pure, inheritable.} = object of IHWEventHandlerVtbl
    HandleEventWithHWND*: proc(self: ptr IHWEventHandler2, pszDeviceID: LPCWSTR, pszAltDeviceID: LPCWSTR, pszEventType: LPCWSTR, hwndOwner: HWND): HRESULT {.stdcall.}
  IQueryCancelAutoPlay* {.pure.} = object
    lpVtbl*: ptr IQueryCancelAutoPlayVtbl
  IQueryCancelAutoPlayVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    AllowAutoPlay*: proc(self: ptr IQueryCancelAutoPlay, pszPath: LPCWSTR, dwContentType: DWORD, pszLabel: LPCWSTR, dwSerialNumber: DWORD): HRESULT {.stdcall.}
  IDynamicHWHandler* {.pure.} = object
    lpVtbl*: ptr IDynamicHWHandlerVtbl
  IDynamicHWHandlerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetDynamicInfo*: proc(self: ptr IDynamicHWHandler, pszDeviceID: LPCWSTR, dwContentType: DWORD, ppszAction: ptr LPWSTR): HRESULT {.stdcall.}
  IActionProgress* {.pure.} = object
    lpVtbl*: ptr IActionProgressVtbl
  IActionProgressVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Begin*: proc(self: ptr IActionProgress, action: SPACTION, flags: SPBEGINF): HRESULT {.stdcall.}
    UpdateProgress*: proc(self: ptr IActionProgress, ulCompleted: ULONGLONG, ulTotal: ULONGLONG): HRESULT {.stdcall.}
    UpdateText*: proc(self: ptr IActionProgress, sptext: SPTEXT, pszText: LPCWSTR, fMayCompact: WINBOOL): HRESULT {.stdcall.}
    QueryCancel*: proc(self: ptr IActionProgress, pfCancelled: ptr WINBOOL): HRESULT {.stdcall.}
    ResetCancel*: proc(self: ptr IActionProgress): HRESULT {.stdcall.}
    End*: proc(self: ptr IActionProgress): HRESULT {.stdcall.}
  IRemoteComputer* {.pure.} = object
    lpVtbl*: ptr IRemoteComputerVtbl
  IRemoteComputerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IRemoteComputer, pszMachine: LPCWSTR, bEnumerating: WINBOOL): HRESULT {.stdcall.}
  IQueryContinue* {.pure.} = object
    lpVtbl*: ptr IQueryContinueVtbl
  IQueryContinueVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    QueryContinue*: proc(self: ptr IQueryContinue): HRESULT {.stdcall.}
  IObjectWithCancelEvent* {.pure.} = object
    lpVtbl*: ptr IObjectWithCancelEventVtbl
  IObjectWithCancelEventVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetCancelEvent*: proc(self: ptr IObjectWithCancelEvent, phEvent: ptr HANDLE): HRESULT {.stdcall.}
  IUserNotification* {.pure.} = object
    lpVtbl*: ptr IUserNotificationVtbl
  IUserNotificationVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetBalloonInfo*: proc(self: ptr IUserNotification, pszTitle: LPCWSTR, pszText: LPCWSTR, dwInfoFlags: DWORD): HRESULT {.stdcall.}
    SetBalloonRetry*: proc(self: ptr IUserNotification, dwShowTime: DWORD, dwInterval: DWORD, cRetryCount: UINT): HRESULT {.stdcall.}
    SetIconInfo*: proc(self: ptr IUserNotification, hIcon: HICON, pszToolTip: LPCWSTR): HRESULT {.stdcall.}
    Show*: proc(self: ptr IUserNotification, pqc: ptr IQueryContinue, dwContinuePollInterval: DWORD): HRESULT {.stdcall.}
    PlaySound*: proc(self: ptr IUserNotification, pszSoundName: LPCWSTR): HRESULT {.stdcall.}
  IUserNotificationCallback* {.pure.} = object
    lpVtbl*: ptr IUserNotificationCallbackVtbl
  IUserNotificationCallbackVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnBalloonUserClick*: proc(self: ptr IUserNotificationCallback, pt: ptr POINT): HRESULT {.stdcall.}
    OnLeftClick*: proc(self: ptr IUserNotificationCallback, pt: ptr POINT): HRESULT {.stdcall.}
    OnContextMenu*: proc(self: ptr IUserNotificationCallback, pt: ptr POINT): HRESULT {.stdcall.}
  IUserNotification2* {.pure.} = object
    lpVtbl*: ptr IUserNotification2Vtbl
  IUserNotification2Vtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetBalloonInfo*: proc(self: ptr IUserNotification2, pszTitle: LPCWSTR, pszText: LPCWSTR, dwInfoFlags: DWORD): HRESULT {.stdcall.}
    SetBalloonRetry*: proc(self: ptr IUserNotification2, dwShowTime: DWORD, dwInterval: DWORD, cRetryCount: UINT): HRESULT {.stdcall.}
    SetIconInfo*: proc(self: ptr IUserNotification2, hIcon: HICON, pszToolTip: LPCWSTR): HRESULT {.stdcall.}
    Show*: proc(self: ptr IUserNotification2, pqc: ptr IQueryContinue, dwContinuePollInterval: DWORD, pSink: ptr IUserNotificationCallback): HRESULT {.stdcall.}
    PlaySound*: proc(self: ptr IUserNotification2, pszSoundName: LPCWSTR): HRESULT {.stdcall.}
  IItemNameLimits* {.pure.} = object
    lpVtbl*: ptr IItemNameLimitsVtbl
  IItemNameLimitsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetValidCharacters*: proc(self: ptr IItemNameLimits, ppwszValidChars: ptr LPWSTR, ppwszInvalidChars: ptr LPWSTR): HRESULT {.stdcall.}
    GetMaxLength*: proc(self: ptr IItemNameLimits, pszName: LPCWSTR, piMaxNameLen: ptr int32): HRESULT {.stdcall.}
  ISearchFolderItemFactory* {.pure.} = object
    lpVtbl*: ptr ISearchFolderItemFactoryVtbl
  ISearchFolderItemFactoryVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetDisplayName*: proc(self: ptr ISearchFolderItemFactory, pszDisplayName: LPCWSTR): HRESULT {.stdcall.}
    SetFolderTypeID*: proc(self: ptr ISearchFolderItemFactory, ftid: FOLDERTYPEID): HRESULT {.stdcall.}
    SetFolderLogicalViewMode*: proc(self: ptr ISearchFolderItemFactory, flvm: FOLDERLOGICALVIEWMODE): HRESULT {.stdcall.}
    SetIconSize*: proc(self: ptr ISearchFolderItemFactory, iIconSize: int32): HRESULT {.stdcall.}
    SetVisibleColumns*: proc(self: ptr ISearchFolderItemFactory, cVisibleColumns: UINT, rgKey: ptr PROPERTYKEY): HRESULT {.stdcall.}
    SetSortColumns*: proc(self: ptr ISearchFolderItemFactory, cSortColumns: UINT, rgSortColumns: ptr SORTCOLUMN): HRESULT {.stdcall.}
    SetGroupColumn*: proc(self: ptr ISearchFolderItemFactory, keyGroup: REFPROPERTYKEY): HRESULT {.stdcall.}
    SetStacks*: proc(self: ptr ISearchFolderItemFactory, cStackKeys: UINT, rgStackKeys: ptr PROPERTYKEY): HRESULT {.stdcall.}
    SetScope*: proc(self: ptr ISearchFolderItemFactory, psiaScope: ptr IShellItemArray): HRESULT {.stdcall.}
    SetCondition*: proc(self: ptr ISearchFolderItemFactory, pCondition: ptr ICondition): HRESULT {.stdcall.}
    GetShellItem*: proc(self: ptr ISearchFolderItemFactory, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetIDList*: proc(self: ptr ISearchFolderItemFactory, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.stdcall.}
  IThumbnailHandlerFactory* {.pure.} = object
    lpVtbl*: ptr IThumbnailHandlerFactoryVtbl
  IThumbnailHandlerFactoryVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetThumbnailHandler*: proc(self: ptr IThumbnailHandlerFactory, pidlChild: PCUITEMID_CHILD, pbc: ptr IBindCtx, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  IParentAndItem* {.pure.} = object
    lpVtbl*: ptr IParentAndItemVtbl
  IParentAndItemVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetParentAndItem*: proc(self: ptr IParentAndItem, pidlParent: PCIDLIST_ABSOLUTE, psf: ptr IShellFolder, pidlChild: PCUITEMID_CHILD): HRESULT {.stdcall.}
    GetParentAndItem*: proc(self: ptr IParentAndItem, ppidlParent: ptr PIDLIST_ABSOLUTE, ppsf: ptr ptr IShellFolder, ppidlChild: ptr PITEMID_CHILD): HRESULT {.stdcall.}
  IDockingWindow* {.pure.} = object
    lpVtbl*: ptr IDockingWindowVtbl
  IDockingWindowVtbl* {.pure, inheritable.} = object of IOleWindowVtbl
    ShowDW*: proc(self: ptr IDockingWindow, fShow: WINBOOL): HRESULT {.stdcall.}
    CloseDW*: proc(self: ptr IDockingWindow, dwReserved: DWORD): HRESULT {.stdcall.}
    ResizeBorderDW*: proc(self: ptr IDockingWindow, prcBorder: LPCRECT, punkToolbarSite: ptr IUnknown, fReserved: WINBOOL): HRESULT {.stdcall.}
  IDeskBand* {.pure.} = object
    lpVtbl*: ptr IDeskBandVtbl
  IDeskBandVtbl* {.pure, inheritable.} = object of IDockingWindowVtbl
    GetBandInfo*: proc(self: ptr IDeskBand, dwBandID: DWORD, dwViewMode: DWORD, pdbi: ptr DESKBANDINFO): HRESULT {.stdcall.}
  IDeskBandInfo* {.pure.} = object
    lpVtbl*: ptr IDeskBandInfoVtbl
  IDeskBandInfoVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetDefaultBandWidth*: proc(self: ptr IDeskBandInfo, dwBandID: DWORD, dwViewMode: DWORD, pnWidth: ptr int32): HRESULT {.stdcall.}
  IDeskBand2* {.pure.} = object
    lpVtbl*: ptr IDeskBand2Vtbl
  IDeskBand2Vtbl* {.pure, inheritable.} = object of IDeskBandVtbl
    CanRenderComposited*: proc(self: ptr IDeskBand2, pfCanRenderComposited: ptr WINBOOL): HRESULT {.stdcall.}
    SetCompositionState*: proc(self: ptr IDeskBand2, fCompositionEnabled: WINBOOL): HRESULT {.stdcall.}
    GetCompositionState*: proc(self: ptr IDeskBand2, pfCompositionEnabled: ptr WINBOOL): HRESULT {.stdcall.}
  ITaskbarList* {.pure.} = object
    lpVtbl*: ptr ITaskbarListVtbl
  ITaskbarListVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    HrInit*: proc(self: ptr ITaskbarList): HRESULT {.stdcall.}
    AddTab*: proc(self: ptr ITaskbarList, hwnd: HWND): HRESULT {.stdcall.}
    DeleteTab*: proc(self: ptr ITaskbarList, hwnd: HWND): HRESULT {.stdcall.}
    ActivateTab*: proc(self: ptr ITaskbarList, hwnd: HWND): HRESULT {.stdcall.}
    SetActiveAlt*: proc(self: ptr ITaskbarList, hwnd: HWND): HRESULT {.stdcall.}
  ITaskbarList2* {.pure.} = object
    lpVtbl*: ptr ITaskbarList2Vtbl
  ITaskbarList2Vtbl* {.pure, inheritable.} = object of ITaskbarListVtbl
    MarkFullscreenWindow*: proc(self: ptr ITaskbarList2, hwnd: HWND, fFullscreen: WINBOOL): HRESULT {.stdcall.}
  ITaskbarList3* {.pure.} = object
    lpVtbl*: ptr ITaskbarList3Vtbl
  ITaskbarList3Vtbl* {.pure, inheritable.} = object of ITaskbarList2Vtbl
    SetProgressValue*: proc(self: ptr ITaskbarList3, hwnd: HWND, ullCompleted: ULONGLONG, ullTotal: ULONGLONG): HRESULT {.stdcall.}
    SetProgressState*: proc(self: ptr ITaskbarList3, hwnd: HWND, tbpFlags: TBPFLAG): HRESULT {.stdcall.}
    RegisterTab*: proc(self: ptr ITaskbarList3, hwndTab: HWND, hwndMDI: HWND): HRESULT {.stdcall.}
    UnregisterTab*: proc(self: ptr ITaskbarList3, hwndTab: HWND): HRESULT {.stdcall.}
    SetTabOrder*: proc(self: ptr ITaskbarList3, hwndTab: HWND, hwndInsertBefore: HWND): HRESULT {.stdcall.}
    SetTabActive*: proc(self: ptr ITaskbarList3, hwndTab: HWND, hwndMDI: HWND, dwReserved: DWORD): HRESULT {.stdcall.}
    ThumbBarAddButtons*: proc(self: ptr ITaskbarList3, hwnd: HWND, cButtons: UINT, pButton: LPTHUMBBUTTON): HRESULT {.stdcall.}
    ThumbBarUpdateButtons*: proc(self: ptr ITaskbarList3, hwnd: HWND, cButtons: UINT, pButton: LPTHUMBBUTTON): HRESULT {.stdcall.}
    ThumbBarSetImageList*: proc(self: ptr ITaskbarList3, hwnd: HWND, himl: HIMAGELIST): HRESULT {.stdcall.}
    SetOverlayIcon*: proc(self: ptr ITaskbarList3, hwnd: HWND, hIcon: HICON, pszDescription: LPCWSTR): HRESULT {.stdcall.}
    SetThumbnailTooltip*: proc(self: ptr ITaskbarList3, hwnd: HWND, pszTip: LPCWSTR): HRESULT {.stdcall.}
    SetThumbnailClip*: proc(self: ptr ITaskbarList3, hwnd: HWND, prcClip: ptr RECT): HRESULT {.stdcall.}
  ITaskbarList4* {.pure.} = object
    lpVtbl*: ptr ITaskbarList4Vtbl
  ITaskbarList4Vtbl* {.pure, inheritable.} = object of ITaskbarList3Vtbl
    SetTabProperties*: proc(self: ptr ITaskbarList4, hwndTab: HWND, stpFlags: STPFLAG): HRESULT {.stdcall.}
  IStartMenuPinnedList* {.pure.} = object
    lpVtbl*: ptr IStartMenuPinnedListVtbl
  IStartMenuPinnedListVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    RemoveFromList*: proc(self: ptr IStartMenuPinnedList, pitem: ptr IShellItem): HRESULT {.stdcall.}
  ICDBurn* {.pure.} = object
    lpVtbl*: ptr ICDBurnVtbl
  ICDBurnVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetRecorderDriveLetter*: proc(self: ptr ICDBurn, pszDrive: LPWSTR, cch: UINT): HRESULT {.stdcall.}
    Burn*: proc(self: ptr ICDBurn, hwnd: HWND): HRESULT {.stdcall.}
    HasRecordableDrive*: proc(self: ptr ICDBurn, pfHasRecorder: ptr WINBOOL): HRESULT {.stdcall.}
  IWizardSite* {.pure.} = object
    lpVtbl*: ptr IWizardSiteVtbl
  IWizardSiteVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetPreviousPage*: proc(self: ptr IWizardSite, phpage: ptr HPROPSHEETPAGE): HRESULT {.stdcall.}
    GetNextPage*: proc(self: ptr IWizardSite, phpage: ptr HPROPSHEETPAGE): HRESULT {.stdcall.}
    GetCancelledPage*: proc(self: ptr IWizardSite, phpage: ptr HPROPSHEETPAGE): HRESULT {.stdcall.}
  IWizardExtension* {.pure.} = object
    lpVtbl*: ptr IWizardExtensionVtbl
  IWizardExtensionVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    AddPages*: proc(self: ptr IWizardExtension, aPages: ptr HPROPSHEETPAGE, cPages: UINT, pnPagesAdded: ptr UINT): HRESULT {.stdcall.}
    GetFirstPage*: proc(self: ptr IWizardExtension, phpage: ptr HPROPSHEETPAGE): HRESULT {.stdcall.}
    GetLastPage*: proc(self: ptr IWizardExtension, phpage: ptr HPROPSHEETPAGE): HRESULT {.stdcall.}
  IWebWizardExtension* {.pure.} = object
    lpVtbl*: ptr IWebWizardExtensionVtbl
  IWebWizardExtensionVtbl* {.pure, inheritable.} = object of IWizardExtensionVtbl
    SetInitialURL*: proc(self: ptr IWebWizardExtension, pszURL: LPCWSTR): HRESULT {.stdcall.}
    SetErrorURL*: proc(self: ptr IWebWizardExtension, pszErrorURL: LPCWSTR): HRESULT {.stdcall.}
  IPublishingWizard* {.pure.} = object
    lpVtbl*: ptr IPublishingWizardVtbl
  IPublishingWizardVtbl* {.pure, inheritable.} = object of IWizardExtensionVtbl
    Initialize*: proc(self: ptr IPublishingWizard, pdo: ptr IDataObject, dwOptions: DWORD, pszServiceScope: LPCWSTR): HRESULT {.stdcall.}
    GetTransferManifest*: proc(self: ptr IPublishingWizard, phrFromTransfer: ptr HRESULT, pdocManifest: ptr ptr IXMLDOMDocument): HRESULT {.stdcall.}
  IFolderViewHost* {.pure.} = object
    lpVtbl*: ptr IFolderViewHostVtbl
  IFolderViewHostVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IFolderViewHost, hwndParent: HWND, pdo: ptr IDataObject, prc: ptr RECT): HRESULT {.stdcall.}
  IExplorerBrowserEvents* {.pure.} = object
    lpVtbl*: ptr IExplorerBrowserEventsVtbl
  IExplorerBrowserEventsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnNavigationPending*: proc(self: ptr IExplorerBrowserEvents, pidlFolder: PCIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    OnViewCreated*: proc(self: ptr IExplorerBrowserEvents, psv: ptr IShellView): HRESULT {.stdcall.}
    OnNavigationComplete*: proc(self: ptr IExplorerBrowserEvents, pidlFolder: PCIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    OnNavigationFailed*: proc(self: ptr IExplorerBrowserEvents, pidlFolder: PCIDLIST_ABSOLUTE): HRESULT {.stdcall.}
  IExplorerBrowser* {.pure.} = object
    lpVtbl*: ptr IExplorerBrowserVtbl
  IExplorerBrowserVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IExplorerBrowser, hwndParent: HWND, prc: ptr RECT, pfs: ptr FOLDERSETTINGS): HRESULT {.stdcall.}
    Destroy*: proc(self: ptr IExplorerBrowser): HRESULT {.stdcall.}
    SetRect*: proc(self: ptr IExplorerBrowser, phdwp: ptr HDWP, rcBrowser: RECT): HRESULT {.stdcall.}
    SetPropertyBag*: proc(self: ptr IExplorerBrowser, pszPropertyBag: LPCWSTR): HRESULT {.stdcall.}
    SetEmptyText*: proc(self: ptr IExplorerBrowser, pszEmptyText: LPCWSTR): HRESULT {.stdcall.}
    SetFolderSettings*: proc(self: ptr IExplorerBrowser, pfs: ptr FOLDERSETTINGS): HRESULT {.stdcall.}
    Advise*: proc(self: ptr IExplorerBrowser, psbe: ptr IExplorerBrowserEvents, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    Unadvise*: proc(self: ptr IExplorerBrowser, dwCookie: DWORD): HRESULT {.stdcall.}
    SetOptions*: proc(self: ptr IExplorerBrowser, dwFlag: EXPLORER_BROWSER_OPTIONS): HRESULT {.stdcall.}
    GetOptions*: proc(self: ptr IExplorerBrowser, pdwFlag: ptr EXPLORER_BROWSER_OPTIONS): HRESULT {.stdcall.}
    BrowseToIDList*: proc(self: ptr IExplorerBrowser, pidl: PCUIDLIST_RELATIVE, uFlags: UINT): HRESULT {.stdcall.}
    BrowseToObject*: proc(self: ptr IExplorerBrowser, punk: ptr IUnknown, uFlags: UINT): HRESULT {.stdcall.}
    FillFromObject*: proc(self: ptr IExplorerBrowser, punk: ptr IUnknown, dwFlags: EXPLORER_BROWSER_FILL_FLAGS): HRESULT {.stdcall.}
    RemoveAll*: proc(self: ptr IExplorerBrowser): HRESULT {.stdcall.}
    GetCurrentView*: proc(self: ptr IExplorerBrowser, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  IAccessibleObject* {.pure.} = object
    lpVtbl*: ptr IAccessibleObjectVtbl
  IAccessibleObjectVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetAccessibleName*: proc(self: ptr IAccessibleObject, pszName: LPCWSTR): HRESULT {.stdcall.}
  IResultsFolder* {.pure.} = object
    lpVtbl*: ptr IResultsFolderVtbl
  IResultsFolderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    AddItem*: proc(self: ptr IResultsFolder, psi: ptr IShellItem): HRESULT {.stdcall.}
    AddIDList*: proc(self: ptr IResultsFolder, pidl: PCIDLIST_ABSOLUTE, ppidlAdded: ptr PITEMID_CHILD): HRESULT {.stdcall.}
    RemoveItem*: proc(self: ptr IResultsFolder, psi: ptr IShellItem): HRESULT {.stdcall.}
    RemoveIDList*: proc(self: ptr IResultsFolder, pidl: PCIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    RemoveAll*: proc(self: ptr IResultsFolder): HRESULT {.stdcall.}
  IEnumObjects* {.pure.} = object
    lpVtbl*: ptr IEnumObjectsVtbl
  IEnumObjectsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Next*: proc(self: ptr IEnumObjects, celt: ULONG, riid: REFIID, rgelt: ptr pointer, pceltFetched: ptr ULONG): HRESULT {.stdcall.}
    Skip*: proc(self: ptr IEnumObjects, celt: ULONG): HRESULT {.stdcall.}
    Reset*: proc(self: ptr IEnumObjects): HRESULT {.stdcall.}
    Clone*: proc(self: ptr IEnumObjects, ppenum: ptr ptr IEnumObjects): HRESULT {.stdcall.}
  IOperationsProgressDialog* {.pure.} = object
    lpVtbl*: ptr IOperationsProgressDialogVtbl
  IOperationsProgressDialogVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    StartProgressDialog*: proc(self: ptr IOperationsProgressDialog, hwndOwner: HWND, flags: OPPROGDLGF): HRESULT {.stdcall.}
    StopProgressDialog*: proc(self: ptr IOperationsProgressDialog): HRESULT {.stdcall.}
    SetOperation*: proc(self: ptr IOperationsProgressDialog, action: SPACTION): HRESULT {.stdcall.}
    SetMode*: proc(self: ptr IOperationsProgressDialog, mode: PDMODE): HRESULT {.stdcall.}
    UpdateProgress*: proc(self: ptr IOperationsProgressDialog, ullPointsCurrent: ULONGLONG, ullPointsTotal: ULONGLONG, ullSizeCurrent: ULONGLONG, ullSizeTotal: ULONGLONG, ullItemsCurrent: ULONGLONG, ullItemsTotal: ULONGLONG): HRESULT {.stdcall.}
    UpdateLocations*: proc(self: ptr IOperationsProgressDialog, psiSource: ptr IShellItem, psiTarget: ptr IShellItem, psiItem: ptr IShellItem): HRESULT {.stdcall.}
    ResetTimer*: proc(self: ptr IOperationsProgressDialog): HRESULT {.stdcall.}
    PauseTimer*: proc(self: ptr IOperationsProgressDialog): HRESULT {.stdcall.}
    ResumeTimer*: proc(self: ptr IOperationsProgressDialog): HRESULT {.stdcall.}
    GetMilliseconds*: proc(self: ptr IOperationsProgressDialog, pullElapsed: ptr ULONGLONG, pullRemaining: ptr ULONGLONG): HRESULT {.stdcall.}
    GetOperationStatus*: proc(self: ptr IOperationsProgressDialog, popstatus: ptr PDOPSTATUS): HRESULT {.stdcall.}
  IIOCancelInformation* {.pure.} = object
    lpVtbl*: ptr IIOCancelInformationVtbl
  IIOCancelInformationVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetCancelInformation*: proc(self: ptr IIOCancelInformation, dwThreadID: DWORD, uMsgCancel: UINT): HRESULT {.stdcall.}
    GetCancelInformation*: proc(self: ptr IIOCancelInformation, pdwThreadID: ptr DWORD, puMsgCancel: ptr UINT): HRESULT {.stdcall.}
  IFileOperation* {.pure.} = object
    lpVtbl*: ptr IFileOperationVtbl
  IFileOperationVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Advise*: proc(self: ptr IFileOperation, pfops: ptr IFileOperationProgressSink, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    Unadvise*: proc(self: ptr IFileOperation, dwCookie: DWORD): HRESULT {.stdcall.}
    SetOperationFlags*: proc(self: ptr IFileOperation, dwOperationFlags: DWORD): HRESULT {.stdcall.}
    SetProgressMessage*: proc(self: ptr IFileOperation, pszMessage: LPCWSTR): HRESULT {.stdcall.}
    SetProgressDialog*: proc(self: ptr IFileOperation, popd: ptr IOperationsProgressDialog): HRESULT {.stdcall.}
    SetProperties*: proc(self: ptr IFileOperation, pproparray: ptr IPropertyChangeArray): HRESULT {.stdcall.}
    SetOwnerWindow*: proc(self: ptr IFileOperation, hwndOwner: HWND): HRESULT {.stdcall.}
    ApplyPropertiesToItem*: proc(self: ptr IFileOperation, psiItem: ptr IShellItem): HRESULT {.stdcall.}
    ApplyPropertiesToItems*: proc(self: ptr IFileOperation, punkItems: ptr IUnknown): HRESULT {.stdcall.}
    RenameItem*: proc(self: ptr IFileOperation, psiItem: ptr IShellItem, pszNewName: LPCWSTR, pfopsItem: ptr IFileOperationProgressSink): HRESULT {.stdcall.}
    RenameItems*: proc(self: ptr IFileOperation, pUnkItems: ptr IUnknown, pszNewName: LPCWSTR): HRESULT {.stdcall.}
    MoveItem*: proc(self: ptr IFileOperation, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR, pfopsItem: ptr IFileOperationProgressSink): HRESULT {.stdcall.}
    MoveItems*: proc(self: ptr IFileOperation, punkItems: ptr IUnknown, psiDestinationFolder: ptr IShellItem): HRESULT {.stdcall.}
    CopyItem*: proc(self: ptr IFileOperation, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszCopyName: LPCWSTR, pfopsItem: ptr IFileOperationProgressSink): HRESULT {.stdcall.}
    CopyItems*: proc(self: ptr IFileOperation, punkItems: ptr IUnknown, psiDestinationFolder: ptr IShellItem): HRESULT {.stdcall.}
    DeleteItem*: proc(self: ptr IFileOperation, psiItem: ptr IShellItem, pfopsItem: ptr IFileOperationProgressSink): HRESULT {.stdcall.}
    DeleteItems*: proc(self: ptr IFileOperation, punkItems: ptr IUnknown): HRESULT {.stdcall.}
    NewItem*: proc(self: ptr IFileOperation, psiDestinationFolder: ptr IShellItem, dwFileAttributes: DWORD, pszName: LPCWSTR, pszTemplateName: LPCWSTR, pfopsItem: ptr IFileOperationProgressSink): HRESULT {.stdcall.}
    PerformOperations*: proc(self: ptr IFileOperation): HRESULT {.stdcall.}
    GetAnyOperationsAborted*: proc(self: ptr IFileOperation, pfAnyOperationsAborted: ptr WINBOOL): HRESULT {.stdcall.}
  IObjectProvider* {.pure.} = object
    lpVtbl*: ptr IObjectProviderVtbl
  IObjectProviderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    QueryObject*: proc(self: ptr IObjectProvider, guidObject: REFGUID, riid: REFIID, ppvOut: ptr pointer): HRESULT {.stdcall.}
  INamespaceWalkCB* {.pure.} = object
    lpVtbl*: ptr INamespaceWalkCBVtbl
  INamespaceWalkCBVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    FoundItem*: proc(self: ptr INamespaceWalkCB, psf: ptr IShellFolder, pidl: PCUITEMID_CHILD): HRESULT {.stdcall.}
    EnterFolder*: proc(self: ptr INamespaceWalkCB, psf: ptr IShellFolder, pidl: PCUITEMID_CHILD): HRESULT {.stdcall.}
    LeaveFolder*: proc(self: ptr INamespaceWalkCB, psf: ptr IShellFolder, pidl: PCUITEMID_CHILD): HRESULT {.stdcall.}
    InitializeProgressDialog*: proc(self: ptr INamespaceWalkCB, ppszTitle: ptr LPWSTR, ppszCancel: ptr LPWSTR): HRESULT {.stdcall.}
  INamespaceWalkCB2* {.pure.} = object
    lpVtbl*: ptr INamespaceWalkCB2Vtbl
  INamespaceWalkCB2Vtbl* {.pure, inheritable.} = object of INamespaceWalkCBVtbl
    WalkComplete*: proc(self: ptr INamespaceWalkCB2, hr: HRESULT): HRESULT {.stdcall.}
  INamespaceWalk* {.pure.} = object
    lpVtbl*: ptr INamespaceWalkVtbl
  INamespaceWalkVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Walk*: proc(self: ptr INamespaceWalk, punkToWalk: ptr IUnknown, dwFlags: DWORD, cDepth: int32, pnswcb: ptr INamespaceWalkCB): HRESULT {.stdcall.}
    GetIDArrayResult*: proc(self: ptr INamespaceWalk, pcItems: ptr UINT, prgpidl: ptr ptr PIDLIST_ABSOLUTE): HRESULT {.stdcall.}
  IAutoCompleteDropDown* {.pure.} = object
    lpVtbl*: ptr IAutoCompleteDropDownVtbl
  IAutoCompleteDropDownVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetDropDownStatus*: proc(self: ptr IAutoCompleteDropDown, pdwFlags: ptr DWORD, ppwszString: ptr LPWSTR): HRESULT {.stdcall.}
    ResetEnumerator*: proc(self: ptr IAutoCompleteDropDown): HRESULT {.stdcall.}
  IBandSite* {.pure.} = object
    lpVtbl*: ptr IBandSiteVtbl
  IBandSiteVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    AddBand*: proc(self: ptr IBandSite, punk: ptr IUnknown): HRESULT {.stdcall.}
    EnumBands*: proc(self: ptr IBandSite, uBand: UINT, pdwBandID: ptr DWORD): HRESULT {.stdcall.}
    QueryBand*: proc(self: ptr IBandSite, dwBandID: DWORD, ppstb: ptr ptr IDeskBand, pdwState: ptr DWORD, pszName: LPWSTR, cchName: int32): HRESULT {.stdcall.}
    SetBandState*: proc(self: ptr IBandSite, dwBandID: DWORD, dwMask: DWORD, dwState: DWORD): HRESULT {.stdcall.}
    RemoveBand*: proc(self: ptr IBandSite, dwBandID: DWORD): HRESULT {.stdcall.}
    GetBandObject*: proc(self: ptr IBandSite, dwBandID: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    SetBandSiteInfo*: proc(self: ptr IBandSite, pbsinfo: ptr BANDSITEINFO): HRESULT {.stdcall.}
    GetBandSiteInfo*: proc(self: ptr IBandSite, pbsinfo: ptr BANDSITEINFO): HRESULT {.stdcall.}
  IModalWindow* {.pure.} = object
    lpVtbl*: ptr IModalWindowVtbl
  IModalWindowVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Show*: proc(self: ptr IModalWindow, hwndOwner: HWND): HRESULT {.stdcall.}
  ICDBurnExt* {.pure.} = object
    lpVtbl*: ptr ICDBurnExtVtbl
  ICDBurnExtVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetSupportedActionTypes*: proc(self: ptr ICDBurnExt, pdwActions: ptr CDBE_ACTIONS): HRESULT {.stdcall.}
  IContextMenuSite* {.pure.} = object
    lpVtbl*: ptr IContextMenuSiteVtbl
  IContextMenuSiteVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    DoContextMenuPopup*: proc(self: ptr IContextMenuSite, punkContextMenu: ptr IUnknown, fFlags: UINT, pt: POINT): HRESULT {.stdcall.}
  IEnumReadyCallback* {.pure.} = object
    lpVtbl*: ptr IEnumReadyCallbackVtbl
  IEnumReadyCallbackVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    EnumReady*: proc(self: ptr IEnumReadyCallback): HRESULT {.stdcall.}
  IEnumerableView* {.pure.} = object
    lpVtbl*: ptr IEnumerableViewVtbl
  IEnumerableViewVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetEnumReadyCallback*: proc(self: ptr IEnumerableView, percb: ptr IEnumReadyCallback): HRESULT {.stdcall.}
    CreateEnumIDListFromContents*: proc(self: ptr IEnumerableView, pidlFolder: PCIDLIST_ABSOLUTE, dwEnumFlags: DWORD, ppEnumIDList: ptr ptr IEnumIDList): HRESULT {.stdcall.}
  IInsertItem* {.pure.} = object
    lpVtbl*: ptr IInsertItemVtbl
  IInsertItemVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    InsertItem*: proc(self: ptr IInsertItem, pidl: PCUIDLIST_RELATIVE): HRESULT {.stdcall.}
  IMenuBand* {.pure.} = object
    lpVtbl*: ptr IMenuBandVtbl
  IMenuBandVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    IsMenuMessage*: proc(self: ptr IMenuBand, pmsg: ptr MSG): HRESULT {.stdcall.}
    TranslateMenuMessage*: proc(self: ptr IMenuBand, pmsg: ptr MSG, plRet: ptr LRESULT): HRESULT {.stdcall.}
  IFolderBandPriv* {.pure.} = object
    lpVtbl*: ptr IFolderBandPrivVtbl
  IFolderBandPrivVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetCascade*: proc(self: ptr IFolderBandPriv, fCascade: WINBOOL): HRESULT {.stdcall.}
    SetAccelerators*: proc(self: ptr IFolderBandPriv, fAccelerators: WINBOOL): HRESULT {.stdcall.}
    SetNoIcons*: proc(self: ptr IFolderBandPriv, fNoIcons: WINBOOL): HRESULT {.stdcall.}
    SetNoText*: proc(self: ptr IFolderBandPriv, fNoText: WINBOOL): HRESULT {.stdcall.}
  IRegTreeItem* {.pure.} = object
    lpVtbl*: ptr IRegTreeItemVtbl
  IRegTreeItemVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetCheckState*: proc(self: ptr IRegTreeItem, pbCheck: ptr WINBOOL): HRESULT {.stdcall.}
    SetCheckState*: proc(self: ptr IRegTreeItem, bCheck: WINBOOL): HRESULT {.stdcall.}
  IImageRecompress* {.pure.} = object
    lpVtbl*: ptr IImageRecompressVtbl
  IImageRecompressVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    RecompressImage*: proc(self: ptr IImageRecompress, psi: ptr IShellItem, cx: int32, cy: int32, iQuality: int32, pstg: ptr IStorage, ppstrmOut: ptr ptr IStream): HRESULT {.stdcall.}
  IDeskBar* {.pure.} = object
    lpVtbl*: ptr IDeskBarVtbl
  IDeskBarVtbl* {.pure, inheritable.} = object of IOleWindowVtbl
    SetClient*: proc(self: ptr IDeskBar, punkClient: ptr IUnknown): HRESULT {.stdcall.}
    GetClient*: proc(self: ptr IDeskBar, ppunkClient: ptr ptr IUnknown): HRESULT {.stdcall.}
    OnPosRectChangeDB*: proc(self: ptr IDeskBar, prc: ptr RECT): HRESULT {.stdcall.}
  IMenuPopup* {.pure.} = object
    lpVtbl*: ptr IMenuPopupVtbl
  IMenuPopupVtbl* {.pure, inheritable.} = object of IDeskBarVtbl
    Popup*: proc(self: ptr IMenuPopup, ppt: ptr POINTL, prcExclude: ptr RECTL, dwFlags: MP_POPUPFLAGS): HRESULT {.stdcall.}
    OnSelect*: proc(self: ptr IMenuPopup, dwSelectType: DWORD): HRESULT {.stdcall.}
    SetSubMenu*: proc(self: ptr IMenuPopup, pmp: ptr IMenuPopup, fSet: WINBOOL): HRESULT {.stdcall.}
  IFileIsInUse* {.pure.} = object
    lpVtbl*: ptr IFileIsInUseVtbl
  IFileIsInUseVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetAppName*: proc(self: ptr IFileIsInUse, ppszName: ptr LPWSTR): HRESULT {.stdcall.}
    GetUsage*: proc(self: ptr IFileIsInUse, pfut: ptr FILE_USAGE_TYPE): HRESULT {.stdcall.}
    GetCapabilities*: proc(self: ptr IFileIsInUse, pdwCapFlags: ptr DWORD): HRESULT {.stdcall.}
    GetSwitchToHWND*: proc(self: ptr IFileIsInUse, phwnd: ptr HWND): HRESULT {.stdcall.}
    CloseFile*: proc(self: ptr IFileIsInUse): HRESULT {.stdcall.}
  IShellItemFilter* {.pure.} = object
    lpVtbl*: ptr IShellItemFilterVtbl
  IShellItemFilterVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    IncludeItem*: proc(self: ptr IShellItemFilter, psi: ptr IShellItem): HRESULT {.stdcall.}
    GetEnumFlagsForItem*: proc(self: ptr IShellItemFilter, psi: ptr IShellItem, pgrfFlags: ptr SHCONTF): HRESULT {.stdcall.}
  IFileDialog* {.pure.} = object
    lpVtbl*: ptr IFileDialogVtbl
  IFileDialogVtbl* {.pure, inheritable.} = object of IModalWindowVtbl
    SetFileTypes*: proc(self: ptr IFileDialog, cFileTypes: UINT, rgFilterSpec: ptr COMDLG_FILTERSPEC): HRESULT {.stdcall.}
    SetFileTypeIndex*: proc(self: ptr IFileDialog, iFileType: UINT): HRESULT {.stdcall.}
    GetFileTypeIndex*: proc(self: ptr IFileDialog, piFileType: ptr UINT): HRESULT {.stdcall.}
    Advise*: proc(self: ptr IFileDialog, pfde: ptr IFileDialogEvents, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    Unadvise*: proc(self: ptr IFileDialog, dwCookie: DWORD): HRESULT {.stdcall.}
    SetOptions*: proc(self: ptr IFileDialog, fos: FILEOPENDIALOGOPTIONS): HRESULT {.stdcall.}
    GetOptions*: proc(self: ptr IFileDialog, pfos: ptr FILEOPENDIALOGOPTIONS): HRESULT {.stdcall.}
    SetDefaultFolder*: proc(self: ptr IFileDialog, psi: ptr IShellItem): HRESULT {.stdcall.}
    SetFolder*: proc(self: ptr IFileDialog, psi: ptr IShellItem): HRESULT {.stdcall.}
    GetFolder*: proc(self: ptr IFileDialog, ppsi: ptr ptr IShellItem): HRESULT {.stdcall.}
    GetCurrentSelection*: proc(self: ptr IFileDialog, ppsi: ptr ptr IShellItem): HRESULT {.stdcall.}
    SetFileName*: proc(self: ptr IFileDialog, pszName: LPCWSTR): HRESULT {.stdcall.}
    GetFileName*: proc(self: ptr IFileDialog, pszName: ptr LPWSTR): HRESULT {.stdcall.}
    SetTitle*: proc(self: ptr IFileDialog, pszTitle: LPCWSTR): HRESULT {.stdcall.}
    SetOkButtonLabel*: proc(self: ptr IFileDialog, pszText: LPCWSTR): HRESULT {.stdcall.}
    SetFileNameLabel*: proc(self: ptr IFileDialog, pszLabel: LPCWSTR): HRESULT {.stdcall.}
    GetResult*: proc(self: ptr IFileDialog, ppsi: ptr ptr IShellItem): HRESULT {.stdcall.}
    AddPlace*: proc(self: ptr IFileDialog, psi: ptr IShellItem, fdap: FDAP): HRESULT {.stdcall.}
    SetDefaultExtension*: proc(self: ptr IFileDialog, pszDefaultExtension: LPCWSTR): HRESULT {.stdcall.}
    Close*: proc(self: ptr IFileDialog, hr: HRESULT): HRESULT {.stdcall.}
    SetClientGuid*: proc(self: ptr IFileDialog, guid: REFGUID): HRESULT {.stdcall.}
    ClearClientData*: proc(self: ptr IFileDialog): HRESULT {.stdcall.}
    SetFilter*: proc(self: ptr IFileDialog, pFilter: ptr IShellItemFilter): HRESULT {.stdcall.}
  IFileDialogEvents* {.pure.} = object
    lpVtbl*: ptr IFileDialogEventsVtbl
  IFileDialogEventsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnFileOk*: proc(self: ptr IFileDialogEvents, pfd: ptr IFileDialog): HRESULT {.stdcall.}
    OnFolderChanging*: proc(self: ptr IFileDialogEvents, pfd: ptr IFileDialog, psiFolder: ptr IShellItem): HRESULT {.stdcall.}
    OnFolderChange*: proc(self: ptr IFileDialogEvents, pfd: ptr IFileDialog): HRESULT {.stdcall.}
    OnSelectionChange*: proc(self: ptr IFileDialogEvents, pfd: ptr IFileDialog): HRESULT {.stdcall.}
    OnShareViolation*: proc(self: ptr IFileDialogEvents, pfd: ptr IFileDialog, psi: ptr IShellItem, pResponse: ptr FDE_SHAREVIOLATION_RESPONSE): HRESULT {.stdcall.}
    OnTypeChange*: proc(self: ptr IFileDialogEvents, pfd: ptr IFileDialog): HRESULT {.stdcall.}
    OnOverwrite*: proc(self: ptr IFileDialogEvents, pfd: ptr IFileDialog, psi: ptr IShellItem, pResponse: ptr FDE_OVERWRITE_RESPONSE): HRESULT {.stdcall.}
  IFileSaveDialog* {.pure.} = object
    lpVtbl*: ptr IFileSaveDialogVtbl
  IFileSaveDialogVtbl* {.pure, inheritable.} = object of IFileDialogVtbl
    SetSaveAsItem*: proc(self: ptr IFileSaveDialog, psi: ptr IShellItem): HRESULT {.stdcall.}
    SetProperties*: proc(self: ptr IFileSaveDialog, pStore: ptr IPropertyStore): HRESULT {.stdcall.}
    SetCollectedProperties*: proc(self: ptr IFileSaveDialog, pList: ptr IPropertyDescriptionList, fAppendDefault: WINBOOL): HRESULT {.stdcall.}
    GetProperties*: proc(self: ptr IFileSaveDialog, ppStore: ptr ptr IPropertyStore): HRESULT {.stdcall.}
    ApplyProperties*: proc(self: ptr IFileSaveDialog, psi: ptr IShellItem, pStore: ptr IPropertyStore, hwnd: HWND, pSink: ptr IFileOperationProgressSink): HRESULT {.stdcall.}
  IFileOpenDialog* {.pure.} = object
    lpVtbl*: ptr IFileOpenDialogVtbl
  IFileOpenDialogVtbl* {.pure, inheritable.} = object of IFileDialogVtbl
    GetResults*: proc(self: ptr IFileOpenDialog, ppenum: ptr ptr IShellItemArray): HRESULT {.stdcall.}
    GetSelectedItems*: proc(self: ptr IFileOpenDialog, ppsai: ptr ptr IShellItemArray): HRESULT {.stdcall.}
  IFileDialogCustomize* {.pure.} = object
    lpVtbl*: ptr IFileDialogCustomizeVtbl
  IFileDialogCustomizeVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    EnableOpenDropDown*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.stdcall.}
    AddMenu*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszLabel: LPCWSTR): HRESULT {.stdcall.}
    AddPushButton*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszLabel: LPCWSTR): HRESULT {.stdcall.}
    AddComboBox*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.stdcall.}
    AddRadioButtonList*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.stdcall.}
    AddCheckButton*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszLabel: LPCWSTR, bChecked: WINBOOL): HRESULT {.stdcall.}
    AddEditBox*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszText: LPCWSTR): HRESULT {.stdcall.}
    AddSeparator*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.stdcall.}
    AddText*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszText: LPCWSTR): HRESULT {.stdcall.}
    SetControlLabel*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszLabel: LPCWSTR): HRESULT {.stdcall.}
    GetControlState*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pdwState: ptr CDCONTROLSTATEF): HRESULT {.stdcall.}
    SetControlState*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwState: CDCONTROLSTATEF): HRESULT {.stdcall.}
    GetEditBoxText*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, ppszText: ptr ptr WCHAR): HRESULT {.stdcall.}
    SetEditBoxText*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszText: LPCWSTR): HRESULT {.stdcall.}
    GetCheckButtonState*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pbChecked: ptr WINBOOL): HRESULT {.stdcall.}
    SetCheckButtonState*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, bChecked: WINBOOL): HRESULT {.stdcall.}
    AddControlItem*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD, pszLabel: LPCWSTR): HRESULT {.stdcall.}
    RemoveControlItem*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD): HRESULT {.stdcall.}
    RemoveAllControlItems*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.stdcall.}
    GetControlItemState*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD, pdwState: ptr CDCONTROLSTATEF): HRESULT {.stdcall.}
    SetControlItemState*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD, dwState: CDCONTROLSTATEF): HRESULT {.stdcall.}
    GetSelectedControlItem*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pdwIDItem: ptr DWORD): HRESULT {.stdcall.}
    SetSelectedControlItem*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD): HRESULT {.stdcall.}
    StartVisualGroup*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszLabel: LPCWSTR): HRESULT {.stdcall.}
    EndVisualGroup*: proc(self: ptr IFileDialogCustomize): HRESULT {.stdcall.}
    MakeProminent*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.stdcall.}
    SetControlItemText*: proc(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD, pszLabel: LPCWSTR): HRESULT {.stdcall.}
  IFileDialogControlEvents* {.pure.} = object
    lpVtbl*: ptr IFileDialogControlEventsVtbl
  IFileDialogControlEventsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnItemSelected*: proc(self: ptr IFileDialogControlEvents, pfdc: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD): HRESULT {.stdcall.}
    OnButtonClicked*: proc(self: ptr IFileDialogControlEvents, pfdc: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.stdcall.}
    OnCheckButtonToggled*: proc(self: ptr IFileDialogControlEvents, pfdc: ptr IFileDialogCustomize, dwIDCtl: DWORD, bChecked: WINBOOL): HRESULT {.stdcall.}
    OnControlActivating*: proc(self: ptr IFileDialogControlEvents, pfdc: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.stdcall.}
  IFileDialog2* {.pure.} = object
    lpVtbl*: ptr IFileDialog2Vtbl
  IFileDialog2Vtbl* {.pure, inheritable.} = object of IFileDialogVtbl
    SetCancelButtonLabel*: proc(self: ptr IFileDialog2, pszLabel: LPCWSTR): HRESULT {.stdcall.}
    SetNavigationRoot*: proc(self: ptr IFileDialog2, psi: ptr IShellItem): HRESULT {.stdcall.}
  IApplicationAssociationRegistration* {.pure.} = object
    lpVtbl*: ptr IApplicationAssociationRegistrationVtbl
  IApplicationAssociationRegistrationVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    QueryCurrentDefault*: proc(self: ptr IApplicationAssociationRegistration, pszQuery: LPCWSTR, atQueryType: ASSOCIATIONTYPE, alQueryLevel: ASSOCIATIONLEVEL, ppszAssociation: ptr LPWSTR): HRESULT {.stdcall.}
    QueryAppIsDefault*: proc(self: ptr IApplicationAssociationRegistration, pszQuery: LPCWSTR, atQueryType: ASSOCIATIONTYPE, alQueryLevel: ASSOCIATIONLEVEL, pszAppRegistryName: LPCWSTR, pfDefault: ptr WINBOOL): HRESULT {.stdcall.}
    QueryAppIsDefaultAll*: proc(self: ptr IApplicationAssociationRegistration, alQueryLevel: ASSOCIATIONLEVEL, pszAppRegistryName: LPCWSTR, pfDefault: ptr WINBOOL): HRESULT {.stdcall.}
    SetAppAsDefault*: proc(self: ptr IApplicationAssociationRegistration, pszAppRegistryName: LPCWSTR, pszSet: LPCWSTR, atSetType: ASSOCIATIONTYPE): HRESULT {.stdcall.}
    SetAppAsDefaultAll*: proc(self: ptr IApplicationAssociationRegistration, pszAppRegistryName: LPCWSTR): HRESULT {.stdcall.}
    ClearUserAssociations*: proc(self: ptr IApplicationAssociationRegistration): HRESULT {.stdcall.}
  IApplicationAssociationRegistrationUI* {.pure.} = object
    lpVtbl*: ptr IApplicationAssociationRegistrationUIVtbl
  IApplicationAssociationRegistrationUIVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    LaunchAdvancedAssociationUI*: proc(self: ptr IApplicationAssociationRegistrationUI, pszAppRegistryName: LPCWSTR): HRESULT {.stdcall.}
  IDelegateFolder* {.pure.} = object
    lpVtbl*: ptr IDelegateFolderVtbl
  IDelegateFolderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetItemAlloc*: proc(self: ptr IDelegateFolder, pmalloc: ptr IMalloc): HRESULT {.stdcall.}
  INewWindowManager* {.pure.} = object
    lpVtbl*: ptr INewWindowManagerVtbl
  INewWindowManagerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    EvaluateNewWindow*: proc(self: ptr INewWindowManager, pszUrl: LPCWSTR, pszName: LPCWSTR, pszUrlContext: LPCWSTR, pszFeatures: LPCWSTR, fReplace: WINBOOL, dwFlags: DWORD, dwUserActionTime: DWORD): HRESULT {.stdcall.}
  IAttachmentExecute* {.pure.} = object
    lpVtbl*: ptr IAttachmentExecuteVtbl
  IAttachmentExecuteVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetClientTitle*: proc(self: ptr IAttachmentExecute, pszTitle: LPCWSTR): HRESULT {.stdcall.}
    SetClientGuid*: proc(self: ptr IAttachmentExecute, guid: REFGUID): HRESULT {.stdcall.}
    SetLocalPath*: proc(self: ptr IAttachmentExecute, pszLocalPath: LPCWSTR): HRESULT {.stdcall.}
    SetFileName*: proc(self: ptr IAttachmentExecute, pszFileName: LPCWSTR): HRESULT {.stdcall.}
    SetSource*: proc(self: ptr IAttachmentExecute, pszSource: LPCWSTR): HRESULT {.stdcall.}
    SetReferrer*: proc(self: ptr IAttachmentExecute, pszReferrer: LPCWSTR): HRESULT {.stdcall.}
    CheckPolicy*: proc(self: ptr IAttachmentExecute): HRESULT {.stdcall.}
    Prompt*: proc(self: ptr IAttachmentExecute, hwnd: HWND, prompt: ATTACHMENT_PROMPT, paction: ptr ATTACHMENT_ACTION): HRESULT {.stdcall.}
    Save*: proc(self: ptr IAttachmentExecute): HRESULT {.stdcall.}
    Execute*: proc(self: ptr IAttachmentExecute, hwnd: HWND, pszVerb: LPCWSTR, phProcess: ptr HANDLE): HRESULT {.stdcall.}
    SaveWithUI*: proc(self: ptr IAttachmentExecute, hwnd: HWND): HRESULT {.stdcall.}
    ClearClientState*: proc(self: ptr IAttachmentExecute): HRESULT {.stdcall.}
  IShellMenuCallback* {.pure.} = object
    lpVtbl*: ptr IShellMenuCallbackVtbl
  IShellMenuCallbackVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    CallbackSM*: proc(self: ptr IShellMenuCallback, psmd: LPSMDATA, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.stdcall.}
  IShellMenu* {.pure.} = object
    lpVtbl*: ptr IShellMenuVtbl
  IShellMenuVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IShellMenu, psmc: ptr IShellMenuCallback, uId: UINT, uIdAncestor: UINT, dwFlags: DWORD): HRESULT {.stdcall.}
    GetMenuInfo*: proc(self: ptr IShellMenu, ppsmc: ptr ptr IShellMenuCallback, puId: ptr UINT, puIdAncestor: ptr UINT, pdwFlags: ptr DWORD): HRESULT {.stdcall.}
    SetShellFolder*: proc(self: ptr IShellMenu, psf: ptr IShellFolder, pidlFolder: PCIDLIST_ABSOLUTE, hKey: HKEY, dwFlags: DWORD): HRESULT {.stdcall.}
    GetShellFolder*: proc(self: ptr IShellMenu, pdwFlags: ptr DWORD, ppidl: ptr PIDLIST_ABSOLUTE, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    SetMenu*: proc(self: ptr IShellMenu, hmenu: HMENU, hwnd: HWND, dwFlags: DWORD): HRESULT {.stdcall.}
    GetMenu*: proc(self: ptr IShellMenu, phmenu: ptr HMENU, phwnd: ptr HWND, pdwFlags: ptr DWORD): HRESULT {.stdcall.}
    InvalidateItem*: proc(self: ptr IShellMenu, psmd: LPSMDATA, dwFlags: DWORD): HRESULT {.stdcall.}
    GetState*: proc(self: ptr IShellMenu, psmd: LPSMDATA): HRESULT {.stdcall.}
    SetMenuToolbar*: proc(self: ptr IShellMenu, punk: ptr IUnknown, dwFlags: DWORD): HRESULT {.stdcall.}
  IShellRunDll* {.pure.} = object
    lpVtbl*: ptr IShellRunDllVtbl
  IShellRunDllVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Run*: proc(self: ptr IShellRunDll, pszArgs: LPCWSTR): HRESULT {.stdcall.}
  IKnownFolder* {.pure.} = object
    lpVtbl*: ptr IKnownFolderVtbl
  IKnownFolderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetId*: proc(self: ptr IKnownFolder, pkfid: ptr KNOWNFOLDERID): HRESULT {.stdcall.}
    GetCategory*: proc(self: ptr IKnownFolder, pCategory: ptr KF_CATEGORY): HRESULT {.stdcall.}
    GetShellItem*: proc(self: ptr IKnownFolder, dwFlags: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetPath*: proc(self: ptr IKnownFolder, dwFlags: DWORD, ppszPath: ptr LPWSTR): HRESULT {.stdcall.}
    SetPath*: proc(self: ptr IKnownFolder, dwFlags: DWORD, pszPath: LPCWSTR): HRESULT {.stdcall.}
    GetIDList*: proc(self: ptr IKnownFolder, dwFlags: DWORD, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    GetFolderType*: proc(self: ptr IKnownFolder, pftid: ptr FOLDERTYPEID): HRESULT {.stdcall.}
    GetRedirectionCapabilities*: proc(self: ptr IKnownFolder, pCapabilities: ptr KF_REDIRECTION_CAPABILITIES): HRESULT {.stdcall.}
    GetFolderDefinition*: proc(self: ptr IKnownFolder, pKFD: ptr KNOWNFOLDER_DEFINITION): HRESULT {.stdcall.}
  IKnownFolderManager* {.pure.} = object
    lpVtbl*: ptr IKnownFolderManagerVtbl
  IKnownFolderManagerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    FolderIdFromCsidl*: proc(self: ptr IKnownFolderManager, nCsidl: int32, pfid: ptr KNOWNFOLDERID): HRESULT {.stdcall.}
    FolderIdToCsidl*: proc(self: ptr IKnownFolderManager, rfid: REFKNOWNFOLDERID, pnCsidl: ptr int32): HRESULT {.stdcall.}
    GetFolderIds*: proc(self: ptr IKnownFolderManager, ppKFId: ptr ptr KNOWNFOLDERID, pCount: ptr UINT): HRESULT {.stdcall.}
    GetFolder*: proc(self: ptr IKnownFolderManager, rfid: REFKNOWNFOLDERID, ppkf: ptr ptr IKnownFolder): HRESULT {.stdcall.}
    GetFolderByName*: proc(self: ptr IKnownFolderManager, pszCanonicalName: LPCWSTR, ppkf: ptr ptr IKnownFolder): HRESULT {.stdcall.}
    RegisterFolder*: proc(self: ptr IKnownFolderManager, rfid: REFKNOWNFOLDERID, pKFD: ptr KNOWNFOLDER_DEFINITION): HRESULT {.stdcall.}
    UnregisterFolder*: proc(self: ptr IKnownFolderManager, rfid: REFKNOWNFOLDERID): HRESULT {.stdcall.}
    FindFolderFromPath*: proc(self: ptr IKnownFolderManager, pszPath: LPCWSTR, mode: FFFP_MODE, ppkf: ptr ptr IKnownFolder): HRESULT {.stdcall.}
    FindFolderFromIDList*: proc(self: ptr IKnownFolderManager, pidl: PCIDLIST_ABSOLUTE, ppkf: ptr ptr IKnownFolder): HRESULT {.stdcall.}
    Redirect*: proc(self: ptr IKnownFolderManager, rfid: REFKNOWNFOLDERID, hwnd: HWND, flags: KF_REDIRECT_FLAGS, pszTargetPath: LPCWSTR, cFolders: UINT, pExclusion: ptr KNOWNFOLDERID, ppszError: ptr LPWSTR): HRESULT {.stdcall.}
  ISharingConfigurationManager* {.pure.} = object
    lpVtbl*: ptr ISharingConfigurationManagerVtbl
  ISharingConfigurationManagerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    CreateShare*: proc(self: ptr ISharingConfigurationManager, dsid: DEF_SHARE_ID, role: SHARE_ROLE): HRESULT {.stdcall.}
    DeleteShare*: proc(self: ptr ISharingConfigurationManager, dsid: DEF_SHARE_ID): HRESULT {.stdcall.}
    ShareExists*: proc(self: ptr ISharingConfigurationManager, dsid: DEF_SHARE_ID): HRESULT {.stdcall.}
    GetSharePermissions*: proc(self: ptr ISharingConfigurationManager, dsid: DEF_SHARE_ID, pRole: ptr SHARE_ROLE): HRESULT {.stdcall.}
    SharePrinters*: proc(self: ptr ISharingConfigurationManager): HRESULT {.stdcall.}
    StopSharingPrinters*: proc(self: ptr ISharingConfigurationManager): HRESULT {.stdcall.}
    ArePrintersShared*: proc(self: ptr ISharingConfigurationManager): HRESULT {.stdcall.}
  IPreviousVersionsInfo* {.pure.} = object
    lpVtbl*: ptr IPreviousVersionsInfoVtbl
  IPreviousVersionsInfoVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    AreSnapshotsAvailable*: proc(self: ptr IPreviousVersionsInfo, pszPath: LPCWSTR, fOkToBeSlow: WINBOOL, pfAvailable: ptr WINBOOL): HRESULT {.stdcall.}
  IRelatedItem* {.pure.} = object
    lpVtbl*: ptr IRelatedItemVtbl
  IRelatedItemVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetItemIDList*: proc(self: ptr IRelatedItem, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    GetItem*: proc(self: ptr IRelatedItem, ppsi: ptr ptr IShellItem): HRESULT {.stdcall.}
  IIdentityName* {.pure.} = object
    lpVtbl*: ptr IIdentityNameVtbl
  IIdentityNameVtbl* {.pure, inheritable.} = object of IRelatedItemVtbl
  IDelegateItem* {.pure.} = object
    lpVtbl*: ptr IDelegateItemVtbl
  IDelegateItemVtbl* {.pure, inheritable.} = object of IRelatedItemVtbl
  ICurrentItem* {.pure.} = object
    lpVtbl*: ptr ICurrentItemVtbl
  ICurrentItemVtbl* {.pure, inheritable.} = object of IRelatedItemVtbl
  ITransferMediumItem* {.pure.} = object
    lpVtbl*: ptr ITransferMediumItemVtbl
  ITransferMediumItemVtbl* {.pure, inheritable.} = object of IRelatedItemVtbl
  IUseToBrowseItem* {.pure.} = object
    lpVtbl*: ptr IUseToBrowseItemVtbl
  IUseToBrowseItemVtbl* {.pure, inheritable.} = object of IRelatedItemVtbl
  IDisplayItem* {.pure.} = object
    lpVtbl*: ptr IDisplayItemVtbl
  IDisplayItemVtbl* {.pure, inheritable.} = object of IRelatedItemVtbl
  IViewStateIdentityItem* {.pure.} = object
    lpVtbl*: ptr IViewStateIdentityItemVtbl
  IViewStateIdentityItemVtbl* {.pure, inheritable.} = object of IRelatedItemVtbl
  IPreviewItem* {.pure.} = object
    lpVtbl*: ptr IPreviewItemVtbl
  IPreviewItemVtbl* {.pure, inheritable.} = object of IRelatedItemVtbl
  IDestinationStreamFactory* {.pure.} = object
    lpVtbl*: ptr IDestinationStreamFactoryVtbl
  IDestinationStreamFactoryVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetDestinationStream*: proc(self: ptr IDestinationStreamFactory, ppstm: ptr ptr IStream): HRESULT {.stdcall.}
  INewMenuClient* {.pure.} = object
    lpVtbl*: ptr INewMenuClientVtbl
  INewMenuClientVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    IncludeItems*: proc(self: ptr INewMenuClient, pflags: ptr NMCII_FLAGS): HRESULT {.stdcall.}
    SelectAndEditItem*: proc(self: ptr INewMenuClient, pidlItem: PCIDLIST_ABSOLUTE, flags: NMCSAEI_FLAGS): HRESULT {.stdcall.}
  IInitializeWithBindCtx* {.pure.} = object
    lpVtbl*: ptr IInitializeWithBindCtxVtbl
  IInitializeWithBindCtxVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IInitializeWithBindCtx, pbc: ptr IBindCtx): HRESULT {.stdcall.}
  INameSpaceTreeControl* {.pure.} = object
    lpVtbl*: ptr INameSpaceTreeControlVtbl
  INameSpaceTreeControlVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr INameSpaceTreeControl, hwndParent: HWND, prc: ptr RECT, nsctsFlags: NSTCSTYLE): HRESULT {.stdcall.}
    TreeAdvise*: proc(self: ptr INameSpaceTreeControl, punk: ptr IUnknown, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    TreeUnadvise*: proc(self: ptr INameSpaceTreeControl, dwCookie: DWORD): HRESULT {.stdcall.}
    AppendRoot*: proc(self: ptr INameSpaceTreeControl, psiRoot: ptr IShellItem, grfEnumFlags: SHCONTF, grfRootStyle: NSTCROOTSTYLE, pif: ptr IShellItemFilter): HRESULT {.stdcall.}
    InsertRoot*: proc(self: ptr INameSpaceTreeControl, iIndex: int32, psiRoot: ptr IShellItem, grfEnumFlags: SHCONTF, grfRootStyle: NSTCROOTSTYLE, pif: ptr IShellItemFilter): HRESULT {.stdcall.}
    RemoveRoot*: proc(self: ptr INameSpaceTreeControl, psiRoot: ptr IShellItem): HRESULT {.stdcall.}
    RemoveAllRoots*: proc(self: ptr INameSpaceTreeControl): HRESULT {.stdcall.}
    GetRootItems*: proc(self: ptr INameSpaceTreeControl, ppsiaRootItems: ptr ptr IShellItemArray): HRESULT {.stdcall.}
    SetItemState*: proc(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, nstcisMask: NSTCITEMSTATE, nstcisFlags: NSTCITEMSTATE): HRESULT {.stdcall.}
    GetItemState*: proc(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, nstcisMask: NSTCITEMSTATE, pnstcisFlags: ptr NSTCITEMSTATE): HRESULT {.stdcall.}
    GetSelectedItems*: proc(self: ptr INameSpaceTreeControl, psiaItems: ptr ptr IShellItemArray): HRESULT {.stdcall.}
    GetItemCustomState*: proc(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, piStateNumber: ptr int32): HRESULT {.stdcall.}
    SetItemCustomState*: proc(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, iStateNumber: int32): HRESULT {.stdcall.}
    EnsureItemVisible*: proc(self: ptr INameSpaceTreeControl, psi: ptr IShellItem): HRESULT {.stdcall.}
    SetTheme*: proc(self: ptr INameSpaceTreeControl, pszTheme: LPCWSTR): HRESULT {.stdcall.}
    GetNextItem*: proc(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, nstcgi: NSTCGNI, ppsiNext: ptr ptr IShellItem): HRESULT {.stdcall.}
    HitTest*: proc(self: ptr INameSpaceTreeControl, ppt: ptr POINT, ppsiOut: ptr ptr IShellItem): HRESULT {.stdcall.}
    GetItemRect*: proc(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, prect: ptr RECT): HRESULT {.stdcall.}
    CollapseAll*: proc(self: ptr INameSpaceTreeControl): HRESULT {.stdcall.}
  INameSpaceTreeControl2* {.pure.} = object
    lpVtbl*: ptr INameSpaceTreeControl2Vtbl
  INameSpaceTreeControl2Vtbl* {.pure, inheritable.} = object of INameSpaceTreeControlVtbl
    SetControlStyle*: proc(self: ptr INameSpaceTreeControl2, nstcsMask: NSTCSTYLE, nstcsStyle: NSTCSTYLE): HRESULT {.stdcall.}
    GetControlStyle*: proc(self: ptr INameSpaceTreeControl2, nstcsMask: NSTCSTYLE, pnstcsStyle: ptr NSTCSTYLE): HRESULT {.stdcall.}
    SetControlStyle2*: proc(self: ptr INameSpaceTreeControl2, nstcsMask: NSTCSTYLE2, nstcsStyle: NSTCSTYLE2): HRESULT {.stdcall.}
    GetControlStyle2*: proc(self: ptr INameSpaceTreeControl2, nstcsMask: NSTCSTYLE2, pnstcsStyle: ptr NSTCSTYLE2): HRESULT {.stdcall.}
  INameSpaceTreeControlEvents* {.pure.} = object
    lpVtbl*: ptr INameSpaceTreeControlEventsVtbl
  INameSpaceTreeControlEventsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnItemClick*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, nstceHitTest: NSTCEHITTEST, nstceClickType: NSTCECLICKTYPE): HRESULT {.stdcall.}
    OnPropertyItemCommit*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.stdcall.}
    OnItemStateChanging*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, nstcisMask: NSTCITEMSTATE, nstcisState: NSTCITEMSTATE): HRESULT {.stdcall.}
    OnItemStateChanged*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, nstcisMask: NSTCITEMSTATE, nstcisState: NSTCITEMSTATE): HRESULT {.stdcall.}
    OnSelectionChanged*: proc(self: ptr INameSpaceTreeControlEvents, psiaSelection: ptr IShellItemArray): HRESULT {.stdcall.}
    OnKeyboardInput*: proc(self: ptr INameSpaceTreeControlEvents, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.stdcall.}
    OnBeforeExpand*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.stdcall.}
    OnAfterExpand*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.stdcall.}
    OnBeginLabelEdit*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.stdcall.}
    OnEndLabelEdit*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.stdcall.}
    OnGetToolTip*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, pszTip: LPWSTR, cchTip: int32): HRESULT {.stdcall.}
    OnBeforeItemDelete*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.stdcall.}
    OnItemAdded*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, fIsRoot: WINBOOL): HRESULT {.stdcall.}
    OnItemDeleted*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, fIsRoot: WINBOOL): HRESULT {.stdcall.}
    OnBeforeContextMenu*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    OnAfterContextMenu*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, pcmIn: ptr IContextMenu, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    OnBeforeStateImageChange*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.stdcall.}
    OnGetDefaultIconIndex*: proc(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, piDefaultIcon: ptr int32, piOpenIcon: ptr int32): HRESULT {.stdcall.}
  INameSpaceTreeControlDropHandler* {.pure.} = object
    lpVtbl*: ptr INameSpaceTreeControlDropHandlerVtbl
  INameSpaceTreeControlDropHandlerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnDragEnter*: proc(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem, psiaData: ptr IShellItemArray, fOutsideSource: WINBOOL, grfKeyState: DWORD, pdwEffect: ptr DWORD): HRESULT {.stdcall.}
    OnDragOver*: proc(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem, psiaData: ptr IShellItemArray, grfKeyState: DWORD, pdwEffect: ptr DWORD): HRESULT {.stdcall.}
    OnDragPosition*: proc(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem, psiaData: ptr IShellItemArray, iNewPosition: int32, iOldPosition: int32): HRESULT {.stdcall.}
    OnDrop*: proc(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem, psiaData: ptr IShellItemArray, iPosition: int32, grfKeyState: DWORD, pdwEffect: ptr DWORD): HRESULT {.stdcall.}
    OnDropPosition*: proc(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem, psiaData: ptr IShellItemArray, iNewPosition: int32, iOldPosition: int32): HRESULT {.stdcall.}
    OnDragLeave*: proc(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem): HRESULT {.stdcall.}
  INameSpaceTreeAccessible* {.pure.} = object
    lpVtbl*: ptr INameSpaceTreeAccessibleVtbl
  INameSpaceTreeAccessibleVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnGetDefaultAccessibilityAction*: proc(self: ptr INameSpaceTreeAccessible, psi: ptr IShellItem, pbstrDefaultAction: ptr BSTR): HRESULT {.stdcall.}
    OnDoDefaultAccessibilityAction*: proc(self: ptr INameSpaceTreeAccessible, psi: ptr IShellItem): HRESULT {.stdcall.}
    OnGetAccessibilityRole*: proc(self: ptr INameSpaceTreeAccessible, psi: ptr IShellItem, pvarRole: ptr VARIANT): HRESULT {.stdcall.}
  INameSpaceTreeControlCustomDraw* {.pure.} = object
    lpVtbl*: ptr INameSpaceTreeControlCustomDrawVtbl
  INameSpaceTreeControlCustomDrawVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    PrePaint*: proc(self: ptr INameSpaceTreeControlCustomDraw, hdc: HDC, prc: ptr RECT, plres: ptr LRESULT): HRESULT {.stdcall.}
    PostPaint*: proc(self: ptr INameSpaceTreeControlCustomDraw, hdc: HDC, prc: ptr RECT): HRESULT {.stdcall.}
    ItemPrePaint*: proc(self: ptr INameSpaceTreeControlCustomDraw, hdc: HDC, prc: ptr RECT, pnstccdItem: ptr NSTCCUSTOMDRAW, pclrText: ptr COLORREF, pclrTextBk: ptr COLORREF, plres: ptr LRESULT): HRESULT {.stdcall.}
    ItemPostPaint*: proc(self: ptr INameSpaceTreeControlCustomDraw, hdc: HDC, prc: ptr RECT, pnstccdItem: ptr NSTCCUSTOMDRAW): HRESULT {.stdcall.}
  INameSpaceTreeControlFolderCapabilities* {.pure.} = object
    lpVtbl*: ptr INameSpaceTreeControlFolderCapabilitiesVtbl
  INameSpaceTreeControlFolderCapabilitiesVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetFolderCapabilities*: proc(self: ptr INameSpaceTreeControlFolderCapabilities, nfcMask: NSTCFOLDERCAPABILITIES, pnfcValue: ptr NSTCFOLDERCAPABILITIES): HRESULT {.stdcall.}
  IPreviewHandler* {.pure.} = object
    lpVtbl*: ptr IPreviewHandlerVtbl
  IPreviewHandlerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetWindow*: proc(self: ptr IPreviewHandler, hwnd: HWND, prc: ptr RECT): HRESULT {.stdcall.}
    SetRect*: proc(self: ptr IPreviewHandler, prc: ptr RECT): HRESULT {.stdcall.}
    DoPreview*: proc(self: ptr IPreviewHandler): HRESULT {.stdcall.}
    Unload*: proc(self: ptr IPreviewHandler): HRESULT {.stdcall.}
    SetFocus*: proc(self: ptr IPreviewHandler): HRESULT {.stdcall.}
    QueryFocus*: proc(self: ptr IPreviewHandler, phwnd: ptr HWND): HRESULT {.stdcall.}
    TranslateAccelerator*: proc(self: ptr IPreviewHandler, pmsg: ptr MSG): HRESULT {.stdcall.}
  IPreviewHandlerFrame* {.pure.} = object
    lpVtbl*: ptr IPreviewHandlerFrameVtbl
  IPreviewHandlerFrameVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetWindowContext*: proc(self: ptr IPreviewHandlerFrame, pinfo: ptr PREVIEWHANDLERFRAMEINFO): HRESULT {.stdcall.}
    TranslateAccelerator*: proc(self: ptr IPreviewHandlerFrame, pmsg: ptr MSG): HRESULT {.stdcall.}
  ITrayDeskBand* {.pure.} = object
    lpVtbl*: ptr ITrayDeskBandVtbl
  ITrayDeskBandVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ShowDeskBand*: proc(self: ptr ITrayDeskBand, clsid: REFCLSID): HRESULT {.stdcall.}
    HideDeskBand*: proc(self: ptr ITrayDeskBand, clsid: REFCLSID): HRESULT {.stdcall.}
    IsDeskBandShown*: proc(self: ptr ITrayDeskBand, clsid: REFCLSID): HRESULT {.stdcall.}
    DeskBandRegistrationChanged*: proc(self: ptr ITrayDeskBand): HRESULT {.stdcall.}
  IBandHost* {.pure.} = object
    lpVtbl*: ptr IBandHostVtbl
  IBandHostVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    CreateBand*: proc(self: ptr IBandHost, rclsidBand: REFCLSID, fAvailable: WINBOOL, fVisible: WINBOOL, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    SetBandAvailability*: proc(self: ptr IBandHost, rclsidBand: REFCLSID, fAvailable: WINBOOL): HRESULT {.stdcall.}
    DestroyBand*: proc(self: ptr IBandHost, rclsidBand: REFCLSID): HRESULT {.stdcall.}
  IExplorerPaneVisibility* {.pure.} = object
    lpVtbl*: ptr IExplorerPaneVisibilityVtbl
  IExplorerPaneVisibilityVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetPaneState*: proc(self: ptr IExplorerPaneVisibility, ep: REFEXPLORERPANE, peps: ptr EXPLORERPANESTATE): HRESULT {.stdcall.}
  IDefaultExtractIconInit* {.pure.} = object
    lpVtbl*: ptr IDefaultExtractIconInitVtbl
  IDefaultExtractIconInitVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetFlags*: proc(self: ptr IDefaultExtractIconInit, uFlags: UINT): HRESULT {.stdcall.}
    SetKey*: proc(self: ptr IDefaultExtractIconInit, hkey: HKEY): HRESULT {.stdcall.}
    SetNormalIcon*: proc(self: ptr IDefaultExtractIconInit, pszFile: LPCWSTR, iIcon: int32): HRESULT {.stdcall.}
    SetOpenIcon*: proc(self: ptr IDefaultExtractIconInit, pszFile: LPCWSTR, iIcon: int32): HRESULT {.stdcall.}
    SetShortcutIcon*: proc(self: ptr IDefaultExtractIconInit, pszFile: LPCWSTR, iIcon: int32): HRESULT {.stdcall.}
    SetDefaultIcon*: proc(self: ptr IDefaultExtractIconInit, pszFile: LPCWSTR, iIcon: int32): HRESULT {.stdcall.}
  IEnumExplorerCommand* {.pure.} = object
    lpVtbl*: ptr IEnumExplorerCommandVtbl
  IEnumExplorerCommandVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Next*: proc(self: ptr IEnumExplorerCommand, celt: ULONG, pUICommand: ptr ptr IExplorerCommand, pceltFetched: ptr ULONG): HRESULT {.stdcall.}
    Skip*: proc(self: ptr IEnumExplorerCommand, celt: ULONG): HRESULT {.stdcall.}
    Reset*: proc(self: ptr IEnumExplorerCommand): HRESULT {.stdcall.}
    Clone*: proc(self: ptr IEnumExplorerCommand, ppenum: ptr ptr IEnumExplorerCommand): HRESULT {.stdcall.}
  IExplorerCommand* {.pure.} = object
    lpVtbl*: ptr IExplorerCommandVtbl
  IExplorerCommandVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetTitle*: proc(self: ptr IExplorerCommand, psiItemArray: ptr IShellItemArray, ppszName: ptr LPWSTR): HRESULT {.stdcall.}
    GetIcon*: proc(self: ptr IExplorerCommand, psiItemArray: ptr IShellItemArray, ppszIcon: ptr LPWSTR): HRESULT {.stdcall.}
    GetToolTip*: proc(self: ptr IExplorerCommand, psiItemArray: ptr IShellItemArray, ppszInfotip: ptr LPWSTR): HRESULT {.stdcall.}
    GetCanonicalName*: proc(self: ptr IExplorerCommand, pguidCommandName: ptr GUID): HRESULT {.stdcall.}
    GetState*: proc(self: ptr IExplorerCommand, psiItemArray: ptr IShellItemArray, fOkToBeSlow: WINBOOL, pCmdState: ptr EXPCMDSTATE): HRESULT {.stdcall.}
    Invoke*: proc(self: ptr IExplorerCommand, psiItemArray: ptr IShellItemArray, pbc: ptr IBindCtx): HRESULT {.stdcall.}
    GetFlags*: proc(self: ptr IExplorerCommand, pFlags: ptr EXPCMDFLAGS): HRESULT {.stdcall.}
    EnumSubCommands*: proc(self: ptr IExplorerCommand, ppEnum: ptr ptr IEnumExplorerCommand): HRESULT {.stdcall.}
  IExplorerCommandState* {.pure.} = object
    lpVtbl*: ptr IExplorerCommandStateVtbl
  IExplorerCommandStateVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetState*: proc(self: ptr IExplorerCommandState, psiItemArray: ptr IShellItemArray, fOkToBeSlow: WINBOOL, pCmdState: ptr EXPCMDSTATE): HRESULT {.stdcall.}
  IInitializeCommand* {.pure.} = object
    lpVtbl*: ptr IInitializeCommandVtbl
  IInitializeCommandVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IInitializeCommand, pszCommandName: LPCWSTR, ppb: ptr IPropertyBag): HRESULT {.stdcall.}
  IExplorerCommandProvider* {.pure.} = object
    lpVtbl*: ptr IExplorerCommandProviderVtbl
  IExplorerCommandProviderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetCommands*: proc(self: ptr IExplorerCommandProvider, punkSite: ptr IUnknown, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetCommand*: proc(self: ptr IExplorerCommandProvider, rguidCommandId: REFGUID, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  IInitializeNetworkFolder* {.pure.} = object
    lpVtbl*: ptr IInitializeNetworkFolderVtbl
  IInitializeNetworkFolderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IInitializeNetworkFolder, pidl: PCIDLIST_ABSOLUTE, pidlTarget: PCIDLIST_ABSOLUTE, uDisplayType: UINT, pszResName: LPCWSTR, pszProvider: LPCWSTR): HRESULT {.stdcall.}
  IOpenControlPanel* {.pure.} = object
    lpVtbl*: ptr IOpenControlPanelVtbl
  IOpenControlPanelVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Open*: proc(self: ptr IOpenControlPanel, pszName: LPCWSTR, pszPage: LPCWSTR, punkSite: ptr IUnknown): HRESULT {.stdcall.}
    GetPath*: proc(self: ptr IOpenControlPanel, pszName: LPCWSTR, pszPath: LPWSTR, cchPath: UINT): HRESULT {.stdcall.}
    GetCurrentView*: proc(self: ptr IOpenControlPanel, pView: ptr CPVIEW): HRESULT {.stdcall.}
  IComputerInfoChangeNotify* {.pure.} = object
    lpVtbl*: ptr IComputerInfoChangeNotifyVtbl
  IComputerInfoChangeNotifyVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ComputerInfoChanged*: proc(self: ptr IComputerInfoChangeNotify): HRESULT {.stdcall.}
  IFileSystemBindData* {.pure.} = object
    lpVtbl*: ptr IFileSystemBindDataVtbl
  IFileSystemBindDataVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetFindData*: proc(self: ptr IFileSystemBindData, pfd: ptr WIN32_FIND_DATAW): HRESULT {.stdcall.}
    GetFindData*: proc(self: ptr IFileSystemBindData, pfd: ptr WIN32_FIND_DATAW): HRESULT {.stdcall.}
  IFileSystemBindData2* {.pure.} = object
    lpVtbl*: ptr IFileSystemBindData2Vtbl
  IFileSystemBindData2Vtbl* {.pure, inheritable.} = object of IFileSystemBindDataVtbl
    SetFileID*: proc(self: ptr IFileSystemBindData2, liFileID: LARGE_INTEGER): HRESULT {.stdcall.}
    GetFileID*: proc(self: ptr IFileSystemBindData2, pliFileID: ptr LARGE_INTEGER): HRESULT {.stdcall.}
    SetJunctionCLSID*: proc(self: ptr IFileSystemBindData2, clsid: REFCLSID): HRESULT {.stdcall.}
    GetJunctionCLSID*: proc(self: ptr IFileSystemBindData2, pclsid: ptr CLSID): HRESULT {.stdcall.}
  ICustomDestinationList* {.pure.} = object
    lpVtbl*: ptr ICustomDestinationListVtbl
  ICustomDestinationListVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetAppID*: proc(self: ptr ICustomDestinationList, pszAppID: LPCWSTR): HRESULT {.stdcall.}
    BeginList*: proc(self: ptr ICustomDestinationList, pcMinSlots: ptr UINT, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    AppendCategory*: proc(self: ptr ICustomDestinationList, pszCategory: LPCWSTR, poa: ptr IObjectArray): HRESULT {.stdcall.}
    AppendKnownCategory*: proc(self: ptr ICustomDestinationList, category: KNOWNDESTCATEGORY): HRESULT {.stdcall.}
    AddUserTasks*: proc(self: ptr ICustomDestinationList, poa: ptr IObjectArray): HRESULT {.stdcall.}
    CommitList*: proc(self: ptr ICustomDestinationList): HRESULT {.stdcall.}
    GetRemovedDestinations*: proc(self: ptr ICustomDestinationList, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    DeleteList*: proc(self: ptr ICustomDestinationList, pszAppID: LPCWSTR): HRESULT {.stdcall.}
    AbortList*: proc(self: ptr ICustomDestinationList): HRESULT {.stdcall.}
  IApplicationDestinations* {.pure.} = object
    lpVtbl*: ptr IApplicationDestinationsVtbl
  IApplicationDestinationsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetAppID*: proc(self: ptr IApplicationDestinations, pszAppID: LPCWSTR): HRESULT {.stdcall.}
    RemoveDestination*: proc(self: ptr IApplicationDestinations, punk: ptr IUnknown): HRESULT {.stdcall.}
    RemoveAllDestinations*: proc(self: ptr IApplicationDestinations): HRESULT {.stdcall.}
  IApplicationDocumentLists* {.pure.} = object
    lpVtbl*: ptr IApplicationDocumentListsVtbl
  IApplicationDocumentListsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetAppID*: proc(self: ptr IApplicationDocumentLists, pszAppID: LPCWSTR): HRESULT {.stdcall.}
    GetList*: proc(self: ptr IApplicationDocumentLists, listtype: APPDOCLISTTYPE, cItemsDesired: UINT, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  IObjectWithAppUserModelID* {.pure.} = object
    lpVtbl*: ptr IObjectWithAppUserModelIDVtbl
  IObjectWithAppUserModelIDVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetAppID*: proc(self: ptr IObjectWithAppUserModelID, pszAppID: LPCWSTR): HRESULT {.stdcall.}
    GetAppID*: proc(self: ptr IObjectWithAppUserModelID, ppszAppID: ptr LPWSTR): HRESULT {.stdcall.}
  IObjectWithProgID* {.pure.} = object
    lpVtbl*: ptr IObjectWithProgIDVtbl
  IObjectWithProgIDVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetProgID*: proc(self: ptr IObjectWithProgID, pszProgID: LPCWSTR): HRESULT {.stdcall.}
    GetProgID*: proc(self: ptr IObjectWithProgID, ppszProgID: ptr LPWSTR): HRESULT {.stdcall.}
  IUpdateIDList* {.pure.} = object
    lpVtbl*: ptr IUpdateIDListVtbl
  IUpdateIDListVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Update*: proc(self: ptr IUpdateIDList, pbc: ptr IBindCtx, pidlIn: PCUITEMID_CHILD, ppidlOut: ptr PITEMID_CHILD): HRESULT {.stdcall.}
  IDesktopGadget* {.pure.} = object
    lpVtbl*: ptr IDesktopGadgetVtbl
  IDesktopGadgetVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    RunGadget*: proc(self: ptr IDesktopGadget, gadgetPath: LPCWSTR): HRESULT {.stdcall.}
  IDesktopWallpaper* {.pure.} = object
    lpVtbl*: ptr IDesktopWallpaperVtbl
  IDesktopWallpaperVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetWallpaper*: proc(self: ptr IDesktopWallpaper, monitorID: LPCWSTR, wallpaper: LPCWSTR): HRESULT {.stdcall.}
    GetWallpaper*: proc(self: ptr IDesktopWallpaper, monitorID: LPCWSTR, wallpaper: ptr LPWSTR): HRESULT {.stdcall.}
    GetMonitorDevicePathAt*: proc(self: ptr IDesktopWallpaper, monitorIndex: UINT, monitorID: ptr LPWSTR): HRESULT {.stdcall.}
    GetMonitorDevicePathCount*: proc(self: ptr IDesktopWallpaper, count: ptr UINT): HRESULT {.stdcall.}
    GetMonitorRECT*: proc(self: ptr IDesktopWallpaper, monitorID: LPCWSTR, displayRect: ptr RECT): HRESULT {.stdcall.}
    SetBackgroundColor*: proc(self: ptr IDesktopWallpaper, color: COLORREF): HRESULT {.stdcall.}
    GetBackgroundColor*: proc(self: ptr IDesktopWallpaper, color: ptr COLORREF): HRESULT {.stdcall.}
    SetPosition*: proc(self: ptr IDesktopWallpaper, position: DESKTOP_WALLPAPER_POSITION): HRESULT {.stdcall.}
    GetPosition*: proc(self: ptr IDesktopWallpaper, position: ptr DESKTOP_WALLPAPER_POSITION): HRESULT {.stdcall.}
    SetSlideshow*: proc(self: ptr IDesktopWallpaper, items: ptr IShellItemArray): HRESULT {.stdcall.}
    GetSlideshow*: proc(self: ptr IDesktopWallpaper, items: ptr ptr IShellItemArray): HRESULT {.stdcall.}
    SetSlideshowOptions*: proc(self: ptr IDesktopWallpaper, options: DESKTOP_SLIDESHOW_OPTIONS, slideshowTick: UINT): HRESULT {.stdcall.}
    GetSlideshowOptions*: proc(self: ptr IDesktopWallpaper, options: ptr DESKTOP_SLIDESHOW_OPTIONS, slideshowTick: ptr UINT): HRESULT {.stdcall.}
    AdvanceSlideshow*: proc(self: ptr IDesktopWallpaper, monitorID: LPCWSTR, direction: DESKTOP_SLIDESHOW_DIRECTION): HRESULT {.stdcall.}
    GetStatus*: proc(self: ptr IDesktopWallpaper, state: ptr DESKTOP_SLIDESHOW_STATE): HRESULT {.stdcall.}
    Enable*: proc(self: ptr IDesktopWallpaper, enable: WINBOOL): HRESULT {.stdcall.}
  IHomeGroup* {.pure.} = object
    lpVtbl*: ptr IHomeGroupVtbl
  IHomeGroupVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    IsMember*: proc(self: ptr IHomeGroup, member: ptr WINBOOL): HRESULT {.stdcall.}
    ShowSharingWizard*: proc(self: ptr IHomeGroup, owner: HWND, sharingchoices: ptr HOMEGROUPSHARINGCHOICES): HRESULT {.stdcall.}
  IInitializeWithPropertyStore* {.pure.} = object
    lpVtbl*: ptr IInitializeWithPropertyStoreVtbl
  IInitializeWithPropertyStoreVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IInitializeWithPropertyStore, pps: ptr IPropertyStore): HRESULT {.stdcall.}
  IOpenSearchSource* {.pure.} = object
    lpVtbl*: ptr IOpenSearchSourceVtbl
  IOpenSearchSourceVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetResults*: proc(self: ptr IOpenSearchSource, hwnd: HWND, pszQuery: LPCWSTR, dwStartIndex: DWORD, dwCount: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  IShellLibrary* {.pure.} = object
    lpVtbl*: ptr IShellLibraryVtbl
  IShellLibraryVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    LoadLibraryFromItem*: proc(self: ptr IShellLibrary, psiLibrary: ptr IShellItem, grfMode: DWORD): HRESULT {.stdcall.}
    LoadLibraryFromKnownFolder*: proc(self: ptr IShellLibrary, kfidLibrary: REFKNOWNFOLDERID, grfMode: DWORD): HRESULT {.stdcall.}
    AddFolder*: proc(self: ptr IShellLibrary, psiLocation: ptr IShellItem): HRESULT {.stdcall.}
    RemoveFolder*: proc(self: ptr IShellLibrary, psiLocation: ptr IShellItem): HRESULT {.stdcall.}
    GetFolders*: proc(self: ptr IShellLibrary, lff: LIBRARYFOLDERFILTER, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    ResolveFolder*: proc(self: ptr IShellLibrary, psiFolderToResolve: ptr IShellItem, dwTimeout: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    GetDefaultSaveFolder*: proc(self: ptr IShellLibrary, dsft: DEFAULTSAVEFOLDERTYPE, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
    SetDefaultSaveFolder*: proc(self: ptr IShellLibrary, dsft: DEFAULTSAVEFOLDERTYPE, psi: ptr IShellItem): HRESULT {.stdcall.}
    GetOptions*: proc(self: ptr IShellLibrary, plofOptions: ptr LIBRARYOPTIONFLAGS): HRESULT {.stdcall.}
    SetOptions*: proc(self: ptr IShellLibrary, lofMask: LIBRARYOPTIONFLAGS, lofOptions: LIBRARYOPTIONFLAGS): HRESULT {.stdcall.}
    GetFolderType*: proc(self: ptr IShellLibrary, pftid: ptr FOLDERTYPEID): HRESULT {.stdcall.}
    SetFolderType*: proc(self: ptr IShellLibrary, ftid: REFFOLDERTYPEID): HRESULT {.stdcall.}
    GetIcon*: proc(self: ptr IShellLibrary, ppszIcon: ptr LPWSTR): HRESULT {.stdcall.}
    SetIcon*: proc(self: ptr IShellLibrary, pszIcon: LPCWSTR): HRESULT {.stdcall.}
    Commit*: proc(self: ptr IShellLibrary): HRESULT {.stdcall.}
    Save*: proc(self: ptr IShellLibrary, psiFolderToSaveIn: ptr IShellItem, pszLibraryName: LPCWSTR, lsf: LIBRARYSAVEFLAGS, ppsiSavedTo: ptr ptr IShellItem): HRESULT {.stdcall.}
    SaveInKnownFolder*: proc(self: ptr IShellLibrary, kfidToSaveIn: REFKNOWNFOLDERID, pszLibraryName: LPCWSTR, lsf: LIBRARYSAVEFLAGS, ppsiSavedTo: ptr ptr IShellItem): HRESULT {.stdcall.}
  IPlaybackManagerEvents* {.pure.} = object
    lpVtbl*: ptr IPlaybackManagerEventsVtbl
  IPlaybackManagerEventsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnPlaybackManagerEvent*: proc(self: ptr IPlaybackManagerEvents, dwSessionId: DWORD, mediaEvent: PBM_EVENT): HRESULT {.stdcall.}
  IPlaybackManager* {.pure.} = object
    lpVtbl*: ptr IPlaybackManagerVtbl
  IPlaybackManagerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Advise*: proc(self: ptr IPlaybackManager, `type`: PBM_SESSION_TYPE, pEvents: ptr IPlaybackManagerEvents, pdwSessionId: ptr DWORD): HRESULT {.stdcall.}
    Unadvise*: proc(self: ptr IPlaybackManager, dwSessionId: DWORD): HRESULT {.stdcall.}
    ChangeSessionState*: proc(self: ptr IPlaybackManager, dwSessionId: DWORD, state: PBM_PLAY_STATE, mute: PBM_MUTE_STATE): HRESULT {.stdcall.}
  IDefaultFolderMenuInitialize* {.pure.} = object
    lpVtbl*: ptr IDefaultFolderMenuInitializeVtbl
  IDefaultFolderMenuInitializeVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IDefaultFolderMenuInitialize, hwnd: HWND, pcmcb: ptr IContextMenuCB, pidlFolder: PCIDLIST_ABSOLUTE, psf: ptr IShellFolder, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, punkAssociation: ptr IUnknown, cKeys: UINT, aKeys: ptr HKEY): HRESULT {.stdcall.}
    SetMenuRestrictions*: proc(self: ptr IDefaultFolderMenuInitialize, dfmrValues: DEFAULT_FOLDER_MENU_RESTRICTIONS): HRESULT {.stdcall.}
    GetMenuRestrictions*: proc(self: ptr IDefaultFolderMenuInitialize, dfmrMask: DEFAULT_FOLDER_MENU_RESTRICTIONS, pdfmrValues: ptr DEFAULT_FOLDER_MENU_RESTRICTIONS): HRESULT {.stdcall.}
    SetHandlerClsid*: proc(self: ptr IDefaultFolderMenuInitialize, rclsid: REFCLSID): HRESULT {.stdcall.}
  IApplicationActivationManager* {.pure.} = object
    lpVtbl*: ptr IApplicationActivationManagerVtbl
  IApplicationActivationManagerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ActivateApplication*: proc(self: ptr IApplicationActivationManager, appUserModelId: LPCWSTR, arguments: LPCWSTR, options: ACTIVATEOPTIONS, processId: ptr DWORD): HRESULT {.stdcall.}
    ActivateForFile*: proc(self: ptr IApplicationActivationManager, appUserModelId: LPCWSTR, itemArray: ptr IShellItemArray, verb: LPCWSTR, processId: ptr DWORD): HRESULT {.stdcall.}
    ActivateForProtocol*: proc(self: ptr IApplicationActivationManager, appUserModelId: LPCWSTR, itemArray: ptr IShellItemArray, processId: ptr DWORD): HRESULT {.stdcall.}
  IAssocHandlerInvoker* {.pure.} = object
    lpVtbl*: ptr IAssocHandlerInvokerVtbl
  IAssocHandlerInvokerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SupportsSelection*: proc(self: ptr IAssocHandlerInvoker): HRESULT {.stdcall.}
    Invoke*: proc(self: ptr IAssocHandlerInvoker): HRESULT {.stdcall.}
  IAssocHandler* {.pure.} = object
    lpVtbl*: ptr IAssocHandlerVtbl
  IAssocHandlerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetName*: proc(self: ptr IAssocHandler, ppsz: ptr LPWSTR): HRESULT {.stdcall.}
    GetUIName*: proc(self: ptr IAssocHandler, ppsz: ptr LPWSTR): HRESULT {.stdcall.}
    GetIconLocation*: proc(self: ptr IAssocHandler, ppszPath: ptr LPWSTR, pIndex: ptr int32): HRESULT {.stdcall.}
    IsRecommended*: proc(self: ptr IAssocHandler): HRESULT {.stdcall.}
    MakeDefault*: proc(self: ptr IAssocHandler, pszDescription: LPCWSTR): HRESULT {.stdcall.}
    Invoke*: proc(self: ptr IAssocHandler, pdo: ptr IDataObject): HRESULT {.stdcall.}
    CreateInvoker*: proc(self: ptr IAssocHandler, pdo: ptr IDataObject, ppInvoker: ptr ptr IAssocHandlerInvoker): HRESULT {.stdcall.}
  IEnumAssocHandlers* {.pure.} = object
    lpVtbl*: ptr IEnumAssocHandlersVtbl
  IEnumAssocHandlersVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Next*: proc(self: ptr IEnumAssocHandlers, celt: ULONG, rgelt: ptr ptr IAssocHandler, pceltFetched: ptr ULONG): HRESULT {.stdcall.}
  IDataObjectProvider* {.pure.} = object
    lpVtbl*: ptr IDataObjectProviderVtbl
  IDataObjectProviderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetDataObject*: proc(self: ptr IDataObjectProvider, dataObject: ptr ptr IDataObject): HRESULT {.stdcall.}
    SetDataObject*: proc(self: ptr IDataObjectProvider, dataObject: ptr IDataObject): HRESULT {.stdcall.}
  IDataTransferManagerInterop* {.pure.} = object
    lpVtbl*: ptr IDataTransferManagerInteropVtbl
  IDataTransferManagerInteropVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetForWindow*: proc(self: ptr IDataTransferManagerInterop, appWindow: HWND, riid: REFIID, dataTransferManager: ptr pointer): HRESULT {.stdcall.}
    ShowShareUIForWindow*: proc(self: ptr IDataTransferManagerInterop, appWindow: HWND): HRESULT {.stdcall.}
  IFrameworkInputPaneHandler* {.pure.} = object
    lpVtbl*: ptr IFrameworkInputPaneHandlerVtbl
  IFrameworkInputPaneHandlerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Showing*: proc(self: ptr IFrameworkInputPaneHandler, prcInputPaneScreenLocation: ptr RECT, fEnsureFocusedElementInView: WINBOOL): HRESULT {.stdcall.}
    Hiding*: proc(self: ptr IFrameworkInputPaneHandler, fEnsureFocusedElementInView: WINBOOL): HRESULT {.stdcall.}
  IFrameworkInputPane* {.pure.} = object
    lpVtbl*: ptr IFrameworkInputPaneVtbl
  IFrameworkInputPaneVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Advise*: proc(self: ptr IFrameworkInputPane, pWindow: ptr IUnknown, pHandler: ptr IFrameworkInputPaneHandler, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    AdviseWithHWND*: proc(self: ptr IFrameworkInputPane, hwnd: HWND, pHandler: ptr IFrameworkInputPaneHandler, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    Unadvise*: proc(self: ptr IFrameworkInputPane, dwCookie: DWORD): HRESULT {.stdcall.}
    Location*: proc(self: ptr IFrameworkInputPane, prcInputPaneScreenLocation: ptr RECT): HRESULT {.stdcall.}
  ISearchableApplication* {.pure.} = object
    lpVtbl*: ptr ISearchableApplicationVtbl
  ISearchableApplicationVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetSearchWindow*: proc(self: ptr ISearchableApplication, hwnd: ptr HWND): HRESULT {.stdcall.}
  IAccessibilityDockingServiceCallback* {.pure.} = object
    lpVtbl*: ptr IAccessibilityDockingServiceCallbackVtbl
  IAccessibilityDockingServiceCallbackVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Undocked*: proc(self: ptr IAccessibilityDockingServiceCallback, undockReason: UNDOCK_REASON): HRESULT {.stdcall.}
  IAccessibilityDockingService* {.pure.} = object
    lpVtbl*: ptr IAccessibilityDockingServiceVtbl
  IAccessibilityDockingServiceVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetAvailableSize*: proc(self: ptr IAccessibilityDockingService, hMonitor: HMONITOR, pcxFixed: ptr UINT, pcyMax: ptr UINT): HRESULT {.stdcall.}
    DockWindow*: proc(self: ptr IAccessibilityDockingService, hwnd: HWND, hMonitor: HMONITOR, cyRequested: UINT, pCallback: ptr IAccessibilityDockingServiceCallback): HRESULT {.stdcall.}
    UndockWindow*: proc(self: ptr IAccessibilityDockingService, hwnd: HWND): HRESULT {.stdcall.}
  IAppVisibilityEvents* {.pure.} = object
    lpVtbl*: ptr IAppVisibilityEventsVtbl
  IAppVisibilityEventsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    AppVisibilityOnMonitorChanged*: proc(self: ptr IAppVisibilityEvents, hMonitor: HMONITOR, previousMode: MONITOR_APP_VISIBILITY, currentMode: MONITOR_APP_VISIBILITY): HRESULT {.stdcall.}
    LauncherVisibilityChange*: proc(self: ptr IAppVisibilityEvents, currentVisibleState: WINBOOL): HRESULT {.stdcall.}
  IAppVisibility* {.pure.} = object
    lpVtbl*: ptr IAppVisibilityVtbl
  IAppVisibilityVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetAppVisibilityOnMonitor*: proc(self: ptr IAppVisibility, hMonitor: HMONITOR, pMode: ptr MONITOR_APP_VISIBILITY): HRESULT {.stdcall.}
    IsLauncherVisible*: proc(self: ptr IAppVisibility, pfVisible: ptr WINBOOL): HRESULT {.stdcall.}
    Advise*: proc(self: ptr IAppVisibility, pCallback: ptr IAppVisibilityEvents, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    Unadvise*: proc(self: ptr IAppVisibility, dwCookie: DWORD): HRESULT {.stdcall.}
  IPackageExecutionStateChangeNotification* {.pure.} = object
    lpVtbl*: ptr IPackageExecutionStateChangeNotificationVtbl
  IPackageExecutionStateChangeNotificationVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnStateChanged*: proc(self: ptr IPackageExecutionStateChangeNotification, pszPackageFullName: LPCWSTR, pesNewState: PACKAGE_EXECUTION_STATE): HRESULT {.stdcall.}
  IPackageDebugSettings* {.pure.} = object
    lpVtbl*: ptr IPackageDebugSettingsVtbl
  IPackageDebugSettingsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    EnableDebugging*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR, debuggerCommandLine: LPCWSTR, environment: PZZWSTR): HRESULT {.stdcall.}
    DisableDebugging*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.stdcall.}
    Suspend*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.stdcall.}
    Resume*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.stdcall.}
    TerminateAllProcesses*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.stdcall.}
    SetTargetSessionId*: proc(self: ptr IPackageDebugSettings, sessionId: ULONG): HRESULT {.stdcall.}
    EnumerateBackgroundTasks*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR, taskCount: ptr ULONG, taskIds: ptr LPCGUID, taskNames: ptr ptr LPCWSTR): HRESULT {.stdcall.}
    ActivateBackgroundTask*: proc(self: ptr IPackageDebugSettings, taskId: LPCGUID): HRESULT {.stdcall.}
    StartServicing*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.stdcall.}
    StopServicing*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.stdcall.}
    StartSessionRedirection*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR, sessionId: ULONG): HRESULT {.stdcall.}
    StopSessionRedirection*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.stdcall.}
    GetPackageExecutionState*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR, packageExecutionState: ptr PACKAGE_EXECUTION_STATE): HRESULT {.stdcall.}
    RegisterForPackageStateChanges*: proc(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR, pPackageExecutionStateChangeNotification: ptr IPackageExecutionStateChangeNotification, pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    UnregisterForPackageStateChanges*: proc(self: ptr IPackageDebugSettings, dwCookie: DWORD): HRESULT {.stdcall.}
  IExecuteCommandApplicationHostEnvironment* {.pure.} = object
    lpVtbl*: ptr IExecuteCommandApplicationHostEnvironmentVtbl
  IExecuteCommandApplicationHostEnvironmentVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetValue*: proc(self: ptr IExecuteCommandApplicationHostEnvironment, pahe: ptr AHE_TYPE): HRESULT {.stdcall.}
  IExecuteCommandHost* {.pure.} = object
    lpVtbl*: ptr IExecuteCommandHostVtbl
  IExecuteCommandHostVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetUIMode*: proc(self: ptr IExecuteCommandHost, pUIMode: ptr EC_HOST_UI_MODE): HRESULT {.stdcall.}
  IApplicationDesignModeSettings* {.pure.} = object
    lpVtbl*: ptr IApplicationDesignModeSettingsVtbl
  IApplicationDesignModeSettingsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetNativeDisplaySize*: proc(self: ptr IApplicationDesignModeSettings, sizeNativeDisplay: SIZE): HRESULT {.stdcall.}
    SetScaleFactor*: proc(self: ptr IApplicationDesignModeSettings, scaleFactor: DEVICE_SCALE_FACTOR): HRESULT {.stdcall.}
    SetApplicationViewState*: proc(self: ptr IApplicationDesignModeSettings, viewState: APPLICATION_VIEW_STATE): HRESULT {.stdcall.}
    ComputeApplicationSize*: proc(self: ptr IApplicationDesignModeSettings, psizeApplication: ptr SIZE): HRESULT {.stdcall.}
    IsApplicationViewStateSupported*: proc(self: ptr IApplicationDesignModeSettings, viewState: APPLICATION_VIEW_STATE, sizeNativeDisplay: SIZE, scaleFactor: DEVICE_SCALE_FACTOR, pfSupported: ptr WINBOOL): HRESULT {.stdcall.}
    TriggerEdgeGesture*: proc(self: ptr IApplicationDesignModeSettings, edgeGestureKind: EDGE_GESTURE_KIND): HRESULT {.stdcall.}
  IInitializeWithWindow* {.pure.} = object
    lpVtbl*: ptr IInitializeWithWindowVtbl
  IInitializeWithWindowVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IInitializeWithWindow, hwnd: HWND): HRESULT {.stdcall.}
  IHandlerInfo* {.pure.} = object
    lpVtbl*: ptr IHandlerInfoVtbl
  IHandlerInfoVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetApplicationDisplayName*: proc(self: ptr IHandlerInfo, value: ptr LPWSTR): HRESULT {.stdcall.}
    GetApplicationPublisher*: proc(self: ptr IHandlerInfo, value: ptr LPWSTR): HRESULT {.stdcall.}
    GetApplicationIconReference*: proc(self: ptr IHandlerInfo, value: ptr LPWSTR): HRESULT {.stdcall.}
  IHandlerActivationHost* {.pure.} = object
    lpVtbl*: ptr IHandlerActivationHostVtbl
  IHandlerActivationHostVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    BeforeCoCreateInstance*: proc(self: ptr IHandlerActivationHost, clsidHandler: REFCLSID, itemsBeingActivated: ptr IShellItemArray, handlerInfo: ptr IHandlerInfo): HRESULT {.stdcall.}
    BeforeCreateProcess*: proc(self: ptr IHandlerActivationHost, applicationPath: LPCWSTR, commandLine: LPCWSTR, handlerInfo: ptr IHandlerInfo): HRESULT {.stdcall.}
  IShellIconOverlayIdentifier* {.pure.} = object
    lpVtbl*: ptr IShellIconOverlayIdentifierVtbl
  IShellIconOverlayIdentifierVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    IsMemberOf*: proc(self: ptr IShellIconOverlayIdentifier, pwszPath: PCWSTR, dwAttrib: DWORD): HRESULT {.stdcall.}
    GetOverlayInfo*: proc(self: ptr IShellIconOverlayIdentifier, pwszIconFile: PWSTR, cchMax: int32, pIndex: ptr int32, pdwFlags: ptr DWORD): HRESULT {.stdcall.}
    GetPriority*: proc(self: ptr IShellIconOverlayIdentifier, pIPriority: ptr int32): HRESULT {.stdcall.}
  IShellIconOverlayManager* {.pure.} = object
    lpVtbl*: ptr IShellIconOverlayManagerVtbl
  IShellIconOverlayManagerVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetFileOverlayInfo*: proc(self: ptr IShellIconOverlayManager, pwszPath: PCWSTR, dwAttrib: DWORD, pIndex: ptr int32, dwflags: DWORD): HRESULT {.stdcall.}
    GetReservedOverlayInfo*: proc(self: ptr IShellIconOverlayManager, pwszPath: PCWSTR, dwAttrib: DWORD, pIndex: ptr int32, dwflags: DWORD, iReservedID: int32): HRESULT {.stdcall.}
    RefreshOverlayImages*: proc(self: ptr IShellIconOverlayManager, dwFlags: DWORD): HRESULT {.stdcall.}
    LoadNonloadedOverlayIdentifiers*: proc(self: ptr IShellIconOverlayManager): HRESULT {.stdcall.}
    OverlayIndexFromImageIndex*: proc(self: ptr IShellIconOverlayManager, iImage: int32, piIndex: ptr int32, fAdd: WINBOOL): HRESULT {.stdcall.}
  IShellIconOverlay* {.pure.} = object
    lpVtbl*: ptr IShellIconOverlayVtbl
  IShellIconOverlayVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetOverlayIndex*: proc(self: ptr IShellIconOverlay, pidl: PCUITEMID_CHILD, pIndex: ptr int32): HRESULT {.stdcall.}
    GetOverlayIconIndex*: proc(self: ptr IShellIconOverlay, pidl: PCUITEMID_CHILD, pIconIndex: ptr int32): HRESULT {.stdcall.}
  IShellExecuteHookA* {.pure.} = object
    lpVtbl*: ptr IShellExecuteHookAVtbl
  IShellExecuteHookAVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Execute*: proc(self: ptr IShellExecuteHookA, pei: LPSHELLEXECUTEINFOA): HRESULT {.stdcall.}
  IShellExecuteHookW* {.pure.} = object
    lpVtbl*: ptr IShellExecuteHookWVtbl
  IShellExecuteHookWVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Execute*: proc(self: ptr IShellExecuteHookW, pei: LPSHELLEXECUTEINFOW): HRESULT {.stdcall.}
  IURLSearchHook* {.pure.} = object
    lpVtbl*: ptr IURLSearchHookVtbl
  IURLSearchHookVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Translate*: proc(self: ptr IURLSearchHook, pwszSearchURL: PWSTR, cchBufferSize: DWORD): HRESULT {.stdcall.}
  ISearchContext* {.pure.} = object
    lpVtbl*: ptr ISearchContextVtbl
  ISearchContextVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetSearchUrl*: proc(self: ptr ISearchContext, pbstrSearchUrl: ptr BSTR): HRESULT {.stdcall.}
    GetSearchText*: proc(self: ptr ISearchContext, pbstrSearchText: ptr BSTR): HRESULT {.stdcall.}
    GetSearchStyle*: proc(self: ptr ISearchContext, pdwSearchStyle: ptr DWORD): HRESULT {.stdcall.}
  IURLSearchHook2* {.pure.} = object
    lpVtbl*: ptr IURLSearchHook2Vtbl
  IURLSearchHook2Vtbl* {.pure, inheritable.} = object of IURLSearchHookVtbl
    TranslateWithSearchContext*: proc(self: ptr IURLSearchHook2, pwszSearchURL: PWSTR, cchBufferSize: DWORD, pSearchContext: ptr ISearchContext): HRESULT {.stdcall.}
  INewShortcutHookA* {.pure.} = object
    lpVtbl*: ptr INewShortcutHookAVtbl
  INewShortcutHookAVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetReferent*: proc(self: ptr INewShortcutHookA, pcszReferent: PCSTR, hwnd: HWND): HRESULT {.stdcall.}
    GetReferent*: proc(self: ptr INewShortcutHookA, pszReferent: PSTR, cchReferent: int32): HRESULT {.stdcall.}
    SetFolder*: proc(self: ptr INewShortcutHookA, pcszFolder: PCSTR): HRESULT {.stdcall.}
    GetFolder*: proc(self: ptr INewShortcutHookA, pszFolder: PSTR, cchFolder: int32): HRESULT {.stdcall.}
    GetName*: proc(self: ptr INewShortcutHookA, pszName: PSTR, cchName: int32): HRESULT {.stdcall.}
    GetExtension*: proc(self: ptr INewShortcutHookA, pszExtension: PSTR, cchExtension: int32): HRESULT {.stdcall.}
  INewShortcutHookW* {.pure.} = object
    lpVtbl*: ptr INewShortcutHookWVtbl
  INewShortcutHookWVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetReferent*: proc(self: ptr INewShortcutHookW, pcszReferent: PCWSTR, hwnd: HWND): HRESULT {.stdcall.}
    GetReferent*: proc(self: ptr INewShortcutHookW, pszReferent: PWSTR, cchReferent: int32): HRESULT {.stdcall.}
    SetFolder*: proc(self: ptr INewShortcutHookW, pcszFolder: PCWSTR): HRESULT {.stdcall.}
    GetFolder*: proc(self: ptr INewShortcutHookW, pszFolder: PWSTR, cchFolder: int32): HRESULT {.stdcall.}
    GetName*: proc(self: ptr INewShortcutHookW, pszName: PWSTR, cchName: int32): HRESULT {.stdcall.}
    GetExtension*: proc(self: ptr INewShortcutHookW, pszExtension: PWSTR, cchExtension: int32): HRESULT {.stdcall.}
  IShellDetails* {.pure.} = object
    lpVtbl*: ptr IShellDetailsVtbl
  IShellDetailsVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetDetailsOf*: proc(self: ptr IShellDetails, pidl: PCUITEMID_CHILD, iColumn: UINT, pDetails: ptr SHELLDETAILS): HRESULT {.stdcall.}
    ColumnClick*: proc(self: ptr IShellDetails, iColumn: UINT): HRESULT {.stdcall.}
  IObjMgr* {.pure.} = object
    lpVtbl*: ptr IObjMgrVtbl
  IObjMgrVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Append*: proc(self: ptr IObjMgr, punk: ptr IUnknown): HRESULT {.stdcall.}
    Remove*: proc(self: ptr IObjMgr, punk: ptr IUnknown): HRESULT {.stdcall.}
  ICurrentWorkingDirectory* {.pure.} = object
    lpVtbl*: ptr ICurrentWorkingDirectoryVtbl
  ICurrentWorkingDirectoryVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetDirectory*: proc(self: ptr ICurrentWorkingDirectory, pwzPath: PWSTR, cchSize: DWORD): HRESULT {.stdcall.}
    SetDirectory*: proc(self: ptr ICurrentWorkingDirectory, pwzPath: PCWSTR): HRESULT {.stdcall.}
  IACList* {.pure.} = object
    lpVtbl*: ptr IACListVtbl
  IACListVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Expand*: proc(self: ptr IACList, pszExpand: PCWSTR): HRESULT {.stdcall.}
  IACList2* {.pure.} = object
    lpVtbl*: ptr IACList2Vtbl
  IACList2Vtbl* {.pure, inheritable.} = object of IACListVtbl
    SetOptions*: proc(self: ptr IACList2, dwFlag: DWORD): HRESULT {.stdcall.}
    GetOptions*: proc(self: ptr IACList2, pdwFlag: ptr DWORD): HRESULT {.stdcall.}
  IProgressDialog* {.pure.} = object
    lpVtbl*: ptr IProgressDialogVtbl
  IProgressDialogVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    StartProgressDialog*: proc(self: ptr IProgressDialog, hwndParent: HWND, punkEnableModless: ptr IUnknown, dwFlags: DWORD, pvResevered: LPCVOID): HRESULT {.stdcall.}
    StopProgressDialog*: proc(self: ptr IProgressDialog): HRESULT {.stdcall.}
    SetTitle*: proc(self: ptr IProgressDialog, pwzTitle: PCWSTR): HRESULT {.stdcall.}
    SetAnimation*: proc(self: ptr IProgressDialog, hInstAnimation: HINSTANCE, idAnimation: UINT): HRESULT {.stdcall.}
    HasUserCancelled*: proc(self: ptr IProgressDialog): WINBOOL {.stdcall.}
    SetProgress*: proc(self: ptr IProgressDialog, dwCompleted: DWORD, dwTotal: DWORD): HRESULT {.stdcall.}
    SetProgress64*: proc(self: ptr IProgressDialog, ullCompleted: ULONGLONG, ullTotal: ULONGLONG): HRESULT {.stdcall.}
    SetLine*: proc(self: ptr IProgressDialog, dwLineNum: DWORD, pwzString: PCWSTR, fCompactPath: WINBOOL, pvResevered: LPCVOID): HRESULT {.stdcall.}
    SetCancelMsg*: proc(self: ptr IProgressDialog, pwzCancelMsg: PCWSTR, pvResevered: LPCVOID): HRESULT {.stdcall.}
    Timer*: proc(self: ptr IProgressDialog, dwTimerAction: DWORD, pvResevered: LPCVOID): HRESULT {.stdcall.}
  IDockingWindowSite* {.pure.} = object
    lpVtbl*: ptr IDockingWindowSiteVtbl
  IDockingWindowSiteVtbl* {.pure, inheritable.} = object of IOleWindowVtbl
    GetBorderDW*: proc(self: ptr IDockingWindowSite, punkObj: ptr IUnknown, prcBorder: ptr RECT): HRESULT {.stdcall.}
    RequestBorderSpaceDW*: proc(self: ptr IDockingWindowSite, punkObj: ptr IUnknown, pbw: LPCBORDERWIDTHS): HRESULT {.stdcall.}
    SetBorderSpaceDW*: proc(self: ptr IDockingWindowSite, punkObj: ptr IUnknown, pbw: LPCBORDERWIDTHS): HRESULT {.stdcall.}
  IDockingWindowFrame* {.pure.} = object
    lpVtbl*: ptr IDockingWindowFrameVtbl
  IDockingWindowFrameVtbl* {.pure, inheritable.} = object of IOleWindowVtbl
    AddToolbar*: proc(self: ptr IDockingWindowFrame, punkSrc: ptr IUnknown, pwszItem: PCWSTR, dwAddFlags: DWORD): HRESULT {.stdcall.}
    RemoveToolbar*: proc(self: ptr IDockingWindowFrame, punkSrc: ptr IUnknown, dwRemoveFlags: DWORD): HRESULT {.stdcall.}
    FindToolbar*: proc(self: ptr IDockingWindowFrame, pwszItem: PCWSTR, riid: REFIID, ppv: ptr pointer): HRESULT {.stdcall.}
  IShellFolderBand* {.pure.} = object
    lpVtbl*: ptr IShellFolderBandVtbl
  IShellFolderBandVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    InitializeSFB*: proc(self: ptr IShellFolderBand, psf: ptr IShellFolder, pidl: PCIDLIST_ABSOLUTE): HRESULT {.stdcall.}
    SetBandInfoSFB*: proc(self: ptr IShellFolderBand, pbi: PBANDINFOSFB): HRESULT {.stdcall.}
    GetBandInfoSFB*: proc(self: ptr IShellFolderBand, pbi: PBANDINFOSFB): HRESULT {.stdcall.}
  IDeskBarClient* {.pure.} = object
    lpVtbl*: ptr IDeskBarClientVtbl
  IDeskBarClientVtbl* {.pure, inheritable.} = object of IOleWindowVtbl
    SetDeskBarSite*: proc(self: ptr IDeskBarClient, punkSite: ptr IUnknown): HRESULT {.stdcall.}
    SetModeDBC*: proc(self: ptr IDeskBarClient, dwMode: DWORD): HRESULT {.stdcall.}
    UIActivateDBC*: proc(self: ptr IDeskBarClient, dwState: DWORD): HRESULT {.stdcall.}
    GetSize*: proc(self: ptr IDeskBarClient, dwWhich: DWORD, prc: LPRECT): HRESULT {.stdcall.}
  IColumnProvider* {.pure.} = object
    lpVtbl*: ptr IColumnProviderVtbl
  IColumnProviderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IColumnProvider, psci: LPCSHCOLUMNINIT): HRESULT {.stdcall.}
    GetColumnInfo*: proc(self: ptr IColumnProvider, dwIndex: DWORD, psci: ptr SHCOLUMNINFO): HRESULT {.stdcall.}
    GetItemData*: proc(self: ptr IColumnProvider, pscid: LPCSHCOLUMNID, pscd: LPCSHCOLUMNDATA, pvarData: ptr VARIANT): HRESULT {.stdcall.}
  IShellChangeNotify* {.pure.} = object
    lpVtbl*: ptr IShellChangeNotifyVtbl
  IShellChangeNotifyVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnChange*: proc(self: ptr IShellChangeNotify, lEvent: LONG, pidl1: PCIDLIST_ABSOLUTE, pidl2: PCIDLIST_ABSOLUTE): HRESULT {.stdcall.}
  IQueryInfo* {.pure.} = object
    lpVtbl*: ptr IQueryInfoVtbl
  IQueryInfoVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetInfoTip*: proc(self: ptr IQueryInfo, dwFlags: DWORD, ppwszTip: ptr PWSTR): HRESULT {.stdcall.}
    GetInfoFlags*: proc(self: ptr IQueryInfo, pdwFlags: ptr DWORD): HRESULT {.stdcall.}
  IDefViewFrame* {.pure.} = object
    lpVtbl*: ptr IDefViewFrameVtbl
  IDefViewFrameVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetWindowLV*: proc(self: ptr IDefViewFrame, phwnd: ptr HWND): HRESULT {.stdcall.}
    ReleaseWindowLV*: proc(self: ptr IDefViewFrame): HRESULT {.stdcall.}
    GetShellFolder*: proc(self: ptr IDefViewFrame, ppsf: ptr ptr IShellFolder): HRESULT {.stdcall.}
  IDocViewSite* {.pure.} = object
    lpVtbl*: ptr IDocViewSiteVtbl
  IDocViewSiteVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    OnSetTitle*: proc(self: ptr IDocViewSite, pvTitle: ptr VARIANTARG): HRESULT {.stdcall.}
  IInitializeObject* {.pure.} = object
    lpVtbl*: ptr IInitializeObjectVtbl
  IInitializeObjectVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IInitializeObject): HRESULT {.stdcall.}
  IBanneredBar* {.pure.} = object
    lpVtbl*: ptr IBanneredBarVtbl
  IBanneredBarVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    SetIconSize*: proc(self: ptr IBanneredBar, iIcon: DWORD): HRESULT {.stdcall.}
    GetIconSize*: proc(self: ptr IBanneredBar, piIcon: ptr DWORD): HRESULT {.stdcall.}
    SetBitmap*: proc(self: ptr IBanneredBar, hBitmap: HBITMAP): HRESULT {.stdcall.}
    GetBitmap*: proc(self: ptr IBanneredBar, phBitmap: ptr HBITMAP): HRESULT {.stdcall.}
  IShellFolderView* {.pure.} = object
    lpVtbl*: ptr IShellFolderViewVtbl
  IShellFolderViewVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Rearrange*: proc(self: ptr IShellFolderView, lParamSort: LPARAM): HRESULT {.stdcall.}
    GetArrangeParam*: proc(self: ptr IShellFolderView, plParamSort: ptr LPARAM): HRESULT {.stdcall.}
    ArrangeGrid*: proc(self: ptr IShellFolderView): HRESULT {.stdcall.}
    AutoArrange*: proc(self: ptr IShellFolderView): HRESULT {.stdcall.}
    GetAutoArrange*: proc(self: ptr IShellFolderView): HRESULT {.stdcall.}
    AddObject*: proc(self: ptr IShellFolderView, pidl: PUITEMID_CHILD, puItem: ptr UINT): HRESULT {.stdcall.}
    GetObject*: proc(self: ptr IShellFolderView, ppidl: ptr PITEMID_CHILD, uItem: UINT): HRESULT {.stdcall.}
    RemoveObject*: proc(self: ptr IShellFolderView, pidl: PUITEMID_CHILD, puItem: ptr UINT): HRESULT {.stdcall.}
    GetObjectCount*: proc(self: ptr IShellFolderView, puCount: ptr UINT): HRESULT {.stdcall.}
    SetObjectCount*: proc(self: ptr IShellFolderView, uCount: UINT, dwFlags: UINT): HRESULT {.stdcall.}
    UpdateObject*: proc(self: ptr IShellFolderView, pidlOld: PUITEMID_CHILD, pidlNew: PUITEMID_CHILD, puItem: ptr UINT): HRESULT {.stdcall.}
    RefreshObject*: proc(self: ptr IShellFolderView, pidl: PUITEMID_CHILD, puItem: ptr UINT): HRESULT {.stdcall.}
    SetRedraw*: proc(self: ptr IShellFolderView, bRedraw: WINBOOL): HRESULT {.stdcall.}
    GetSelectedCount*: proc(self: ptr IShellFolderView, puSelected: ptr UINT): HRESULT {.stdcall.}
    GetSelectedObjects*: proc(self: ptr IShellFolderView, pppidl: ptr ptr PCUITEMID_CHILD, puItems: ptr UINT): HRESULT {.stdcall.}
    IsDropOnSource*: proc(self: ptr IShellFolderView, pDropTarget: ptr IDropTarget): HRESULT {.stdcall.}
    GetDragPoint*: proc(self: ptr IShellFolderView, ppt: ptr POINT): HRESULT {.stdcall.}
    GetDropPoint*: proc(self: ptr IShellFolderView, ppt: ptr POINT): HRESULT {.stdcall.}
    MoveIcons*: proc(self: ptr IShellFolderView, pDataObject: ptr IDataObject): HRESULT {.stdcall.}
    SetItemPos*: proc(self: ptr IShellFolderView, pidl: PCUITEMID_CHILD, ppt: ptr POINT): HRESULT {.stdcall.}
    IsBkDropTarget*: proc(self: ptr IShellFolderView, pDropTarget: ptr IDropTarget): HRESULT {.stdcall.}
    SetClipboard*: proc(self: ptr IShellFolderView, bMove: WINBOOL): HRESULT {.stdcall.}
    SetPoints*: proc(self: ptr IShellFolderView, pDataObject: ptr IDataObject): HRESULT {.stdcall.}
    GetItemSpacing*: proc(self: ptr IShellFolderView, pSpacing: ptr ITEMSPACING): HRESULT {.stdcall.}
    SetCallback*: proc(self: ptr IShellFolderView, pNewCB: ptr IShellFolderViewCB, ppOldCB: ptr ptr IShellFolderViewCB): HRESULT {.stdcall.}
    Select*: proc(self: ptr IShellFolderView, dwFlags: UINT): HRESULT {.stdcall.}
    QuerySupport*: proc(self: ptr IShellFolderView, pdwSupport: ptr UINT): HRESULT {.stdcall.}
    SetAutomationObject*: proc(self: ptr IShellFolderView, pdisp: ptr IDispatch): HRESULT {.stdcall.}
  INamedPropertyBag* {.pure.} = object
    lpVtbl*: ptr INamedPropertyBagVtbl
  INamedPropertyBagVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    ReadPropertyNPB*: proc(self: ptr INamedPropertyBag, pszBagname: PCWSTR, pszPropName: PCWSTR, pVar: ptr PROPVARIANT): HRESULT {.stdcall.}
    WritePropertyNPB*: proc(self: ptr INamedPropertyBag, pszBagname: PCWSTR, pszPropName: PCWSTR, pVar: ptr PROPVARIANT): HRESULT {.stdcall.}
    RemovePropertyNPB*: proc(self: ptr INamedPropertyBag, pszBagname: PCWSTR, pszPropName: PCWSTR): HRESULT {.stdcall.}
proc DragQueryFileA*(hDrop: HDROP, iFile: UINT, lpszFile: LPSTR, cch: UINT): UINT {.winapi, stdcall, dynlib: "shell32", importc.}
proc DragQueryFileW*(hDrop: HDROP, iFile: UINT, lpszFile: LPWSTR, cch: UINT): UINT {.winapi, stdcall, dynlib: "shell32", importc.}
proc DragQueryPoint*(hDrop: HDROP, ppt: ptr POINT): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc DragFinish*(hDrop: HDROP): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc DragAcceptFiles*(hWnd: HWND, fAccept: WINBOOL): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc ShellExecuteA*(hwnd: HWND, lpOperation: LPCSTR, lpFile: LPCSTR, lpParameters: LPCSTR, lpDirectory: LPCSTR, nShowCmd: INT): HINSTANCE {.winapi, stdcall, dynlib: "shell32", importc.}
proc ShellExecuteW*(hwnd: HWND, lpOperation: LPCWSTR, lpFile: LPCWSTR, lpParameters: LPCWSTR, lpDirectory: LPCWSTR, nShowCmd: INT): HINSTANCE {.winapi, stdcall, dynlib: "shell32", importc.}
proc FindExecutableA*(lpFile: LPCSTR, lpDirectory: LPCSTR, lpResult: LPSTR): HINSTANCE {.winapi, stdcall, dynlib: "shell32", importc.}
proc FindExecutableW*(lpFile: LPCWSTR, lpDirectory: LPCWSTR, lpResult: LPWSTR): HINSTANCE {.winapi, stdcall, dynlib: "shell32", importc.}
proc CommandLineToArgvW*(lpCmdLine: LPCWSTR, pNumArgs: ptr int32): ptr LPWSTR {.winapi, stdcall, dynlib: "shell32", importc.}
proc ShellAboutA*(hWnd: HWND, szApp: LPCSTR, szOtherStuff: LPCSTR, hIcon: HICON): INT {.winapi, stdcall, dynlib: "shell32", importc.}
proc ShellAboutW*(hWnd: HWND, szApp: LPCWSTR, szOtherStuff: LPCWSTR, hIcon: HICON): INT {.winapi, stdcall, dynlib: "shell32", importc.}
proc DuplicateIcon*(hInst: HINSTANCE, hIcon: HICON): HICON {.winapi, stdcall, dynlib: "shell32", importc.}
proc ExtractAssociatedIconA*(hInst: HINSTANCE, pszIconPath: LPSTR, piIcon: ptr WORD): HICON {.winapi, stdcall, dynlib: "shell32", importc.}
proc ExtractAssociatedIconW*(hInst: HINSTANCE, pszIconPath: LPWSTR, piIcon: ptr WORD): HICON {.winapi, stdcall, dynlib: "shell32", importc.}
proc ExtractAssociatedIconExA*(hInst: HINSTANCE, pszIconPath: LPSTR, piIconIndex: ptr WORD, piIconId: ptr WORD): HICON {.winapi, stdcall, dynlib: "shell32", importc.}
proc ExtractAssociatedIconExW*(hInst: HINSTANCE, pszIconPath: LPWSTR, piIconIndex: ptr WORD, piIconId: ptr WORD): HICON {.winapi, stdcall, dynlib: "shell32", importc.}
proc ExtractIconA*(hInst: HINSTANCE, pszExeFileName: LPCSTR, nIconIndex: UINT): HICON {.winapi, stdcall, dynlib: "shell32", importc.}
proc ExtractIconW*(hInst: HINSTANCE, pszExeFileName: LPCWSTR, nIconIndex: UINT): HICON {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHAppBarMessage*(dwMessage: DWORD, pData: PAPPBARDATA): UINT_PTR {.winapi, stdcall, dynlib: "shell32", importc.}
proc DoEnvironmentSubstA*(pszSrc: LPSTR, cchSrc: UINT): DWORD {.winapi, stdcall, dynlib: "shell32", importc.}
proc DoEnvironmentSubstW*(pszSrc: LPWSTR, cchSrc: UINT): DWORD {.winapi, stdcall, dynlib: "shell32", importc.}
proc ExtractIconExA*(lpszFile: LPCSTR, nIconIndex: int32, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIcons: UINT): UINT {.winapi, stdcall, dynlib: "shell32", importc.}
proc ExtractIconExW*(lpszFile: LPCWSTR, nIconIndex: int32, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIcons: UINT): UINT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHFileOperationA*(lpFileOp: LPSHFILEOPSTRUCTA): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHFileOperationW*(lpFileOp: LPSHFILEOPSTRUCTW): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHFreeNameMappings*(hNameMappings: HANDLE): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc ShellExecuteExA*(pExecInfo: ptr SHELLEXECUTEINFOA): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc ShellExecuteExW*(pExecInfo: ptr SHELLEXECUTEINFOW): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateProcessAsUserW*(pscpi: PSHCREATEPROCESSINFOW): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHEvaluateSystemCommandTemplate*(pszCmdTemplate: PCWSTR, ppszApplication: ptr PWSTR, ppszCommandLine: ptr PWSTR, ppszParameters: ptr PWSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc AssocCreateForClasses*(rgClasses: ptr ASSOCIATIONELEMENT, cClasses: ULONG, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHQueryRecycleBinA*(pszRootPath: LPCSTR, pSHQueryRBInfo: LPSHQUERYRBINFO): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHQueryRecycleBinW*(pszRootPath: LPCWSTR, pSHQueryRBInfo: LPSHQUERYRBINFO): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHEmptyRecycleBinA*(hwnd: HWND, pszRootPath: LPCSTR, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHEmptyRecycleBinW*(hwnd: HWND, pszRootPath: LPCWSTR, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHQueryUserNotificationState*(pquns: ptr QUERY_USER_NOTIFICATION_STATE): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetPropertyStoreForWindow*(hwnd: HWND, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc Shell_NotifyIconA*(dwMessage: DWORD, lpData: PNOTIFYICONDATAA): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc Shell_NotifyIconW*(dwMessage: DWORD, lpData: PNOTIFYICONDATAW): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc Shell_NotifyIconGetRect*(identifier: ptr NOTIFYICONIDENTIFIER, iconLocation: ptr RECT): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetFileInfoA*(pszPath: LPCSTR, dwFileAttributes: DWORD, psfi: ptr SHFILEINFOA, cbFileInfo: UINT, uFlags: UINT): DWORD_PTR {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetFileInfoW*(pszPath: LPCWSTR, dwFileAttributes: DWORD, psfi: ptr SHFILEINFOW, cbFileInfo: UINT, uFlags: UINT): DWORD_PTR {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetStockIconInfo*(siid: SHSTOCKICONID, uFlags: UINT, psii: ptr SHSTOCKICONINFO): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetDiskFreeSpaceExA*(pszDirectoryName: LPCSTR, pulFreeBytesAvailableToCaller: ptr ULARGE_INTEGER, pulTotalNumberOfBytes: ptr ULARGE_INTEGER, pulTotalNumberOfFreeBytes: ptr ULARGE_INTEGER): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetDiskFreeSpaceExW*(pszDirectoryName: LPCWSTR, pulFreeBytesAvailableToCaller: ptr ULARGE_INTEGER, pulTotalNumberOfBytes: ptr ULARGE_INTEGER, pulTotalNumberOfFreeBytes: ptr ULARGE_INTEGER): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetNewLinkInfoA*(pszLinkTo: LPCSTR, pszDir: LPCSTR, pszName: LPSTR, pfMustCopy: ptr WINBOOL, uFlags: UINT): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetNewLinkInfoW*(pszLinkTo: LPCWSTR, pszDir: LPCWSTR, pszName: LPWSTR, pfMustCopy: ptr WINBOOL, uFlags: UINT): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHInvokePrinterCommandA*(hwnd: HWND, uAction: UINT, lpBuf1: LPCSTR, lpBuf2: LPCSTR, fModal: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHInvokePrinterCommandW*(hwnd: HWND, uAction: UINT, lpBuf1: LPCWSTR, lpBuf2: LPCWSTR, fModal: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHLoadNonloadedIconOverlayIdentifiers*(): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHIsFileAvailableOffline*(pwszPath: PCWSTR, pdwStatus: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHSetLocalizedName*(pszPath: PCWSTR, pszResModule: PCWSTR, idsRes: int32): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHRemoveLocalizedName*(pszPath: PCWSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetLocalizedName*(pszPath: PCWSTR, pszResModule: PWSTR, cch: UINT, pidsRes: ptr int32): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc ShellMessageBoxA*(hAppInst: HINSTANCE, hWnd: HWND, lpcText: LPCSTR, lpcTitle: LPCSTR, fuStyle: UINT): int32 {.winapi, xpincompatible, cdecl, varargs, dynlib: "shlwapi", importc.}
proc ShellMessageBoxW*(hAppInst: HINSTANCE, hWnd: HWND, lpcText: LPCWSTR, lpcTitle: LPCWSTR, fuStyle: UINT): int32 {.winapi, xpincompatible, cdecl, varargs, dynlib: "shlwapi", importc.}
proc IsLFNDriveA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc IsLFNDriveW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHEnumerateUnreadMailAccountsW*(hKeyUser: HKEY, dwIndex: DWORD, pszMailAddress: LPWSTR, cchMailAddress: int32): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetUnreadMailCountW*(hKeyUser: HKEY, pszMailAddress: LPCWSTR, pdwCount: ptr DWORD, pFileTime: ptr FILETIME, pszShellExecuteCommand: LPWSTR, cchShellExecuteCommand: int32): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHSetUnreadMailCountW*(pszMailAddress: LPCWSTR, dwCount: DWORD, pszShellExecuteCommand: LPCWSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHTestTokenMembership*(hToken: HANDLE, ulRID: ULONG): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetImageList*(iImageList: int32, riid: REFIID, ppvObj: ptr pointer): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc InitNetworkAddressControl*(): WINBOOL {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetDriveMedia*(pszDrive: PCWSTR, pdwMediaContent: ptr DWORD): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc StrChrA*(lpStart: LPCSTR, wMatch: WORD): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrChrW*(lpStart: LPCWSTR, wMatch: WCHAR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrChrIA*(lpStart: LPCSTR, wMatch: WORD): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrChrIW*(lpStart: LPCWSTR, wMatch: WCHAR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpNA*(lpStr1: LPCSTR, lpStr2: LPCSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpNW*(lpStr1: LPCWSTR, lpStr2: LPCWSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpNIA*(lpStr1: LPCSTR, lpStr2: LPCSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpNIW*(lpStr1: LPCWSTR, lpStr2: LPCWSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCSpnA*(lpStr: LPCSTR, lpSet: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCSpnW*(lpStr: LPCWSTR, lpSet: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCSpnIA*(lpStr: LPCSTR, lpSet: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCSpnIW*(lpStr: LPCWSTR, lpSet: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrDupA*(lpSrch: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrDupW*(lpSrch: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrFormatByteSizeA*(dw: DWORD, szBuf: LPSTR, uiBufSize: UINT): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrFormatByteSize64A*(qdw: LONGLONG, szBuf: LPSTR, uiBufSize: UINT): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrFormatByteSizeW*(qdw: LONGLONG, szBuf: LPWSTR, uiBufSize: UINT): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrFormatKBSizeW*(qdw: LONGLONG, szBuf: LPWSTR, uiBufSize: UINT): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrFormatKBSizeA*(qdw: LONGLONG, szBuf: LPSTR, uiBufSize: UINT): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrFromTimeIntervalA*(pszOut: LPSTR, cchMax: UINT, dwTimeMS: DWORD, digits: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrFromTimeIntervalW*(pszOut: LPWSTR, cchMax: UINT, dwTimeMS: DWORD, digits: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrIsIntlEqualA*(fCaseSens: WINBOOL, lpString1: LPCSTR, lpString2: LPCSTR, nChar: int32): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrIsIntlEqualW*(fCaseSens: WINBOOL, lpString1: LPCWSTR, lpString2: LPCWSTR, nChar: int32): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrNCatA*(psz1: LPSTR, psz2: LPCSTR, cchMax: int32): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrNCatW*(psz1: LPWSTR, psz2: LPCWSTR, cchMax: int32): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrPBrkA*(psz: LPCSTR, pszSet: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrPBrkW*(psz: LPCWSTR, pszSet: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrRChrA*(lpStart: LPCSTR, lpEnd: LPCSTR, wMatch: WORD): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrRChrW*(lpStart: LPCWSTR, lpEnd: LPCWSTR, wMatch: WCHAR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrRChrIA*(lpStart: LPCSTR, lpEnd: LPCSTR, wMatch: WORD): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrRChrIW*(lpStart: LPCWSTR, lpEnd: LPCWSTR, wMatch: WCHAR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrRStrIA*(lpSource: LPCSTR, lpLast: LPCSTR, lpSrch: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrRStrIW*(lpSource: LPCWSTR, lpLast: LPCWSTR, lpSrch: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrSpnA*(psz: LPCSTR, pszSet: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrSpnW*(psz: LPCWSTR, pszSet: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrStrA*(lpFirst: LPCSTR, lpSrch: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrStrW*(lpFirst: LPCWSTR, lpSrch: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrStrIA*(lpFirst: LPCSTR, lpSrch: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrStrIW*(lpFirst: LPCWSTR, lpSrch: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrToIntA*(lpSrc: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrToIntW*(lpSrc: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrToIntExA*(pszString: LPCSTR, dwFlags: DWORD, piRet: ptr int32): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrToIntExW*(pszString: LPCWSTR, dwFlags: DWORD, piRet: ptr int32): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrToInt64ExA*(pszString: LPCSTR, dwFlags: DWORD, pllRet: ptr LONGLONG): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrToInt64ExW*(pszString: LPCWSTR, dwFlags: DWORD, pllRet: ptr LONGLONG): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrTrimA*(psz: LPSTR, pszTrimChars: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrTrimW*(psz: LPWSTR, pszTrimChars: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCatW*(psz1: LPWSTR, psz2: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpW*(psz1: LPCWSTR, psz2: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpIW*(psz1: LPCWSTR, psz2: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCpyW*(psz1: LPWSTR, psz2: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCpyNW*(psz1: LPWSTR, psz2: LPCWSTR, cchMax: int32): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCatBuffW*(pszDest: LPWSTR, pszSrc: LPCWSTR, cchDestBuffSize: int32): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCatBuffA*(pszDest: LPSTR, pszSrc: LPCSTR, cchDestBuffSize: int32): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc ChrCmpIA*(w1: WORD, w2: WORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc ChrCmpIW*(w1: WCHAR, w2: WCHAR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc wvnsprintfA*(lpOut: LPSTR, cchLimitIn: int32, lpFmt: LPCSTR, arglist: va_list): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc wvnsprintfW*(lpOut: LPWSTR, cchLimitIn: int32, lpFmt: LPCWSTR, arglist: va_list): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc wnsprintfA*(lpOut: LPSTR, cchLimitIn: int32, lpFmt: LPCSTR): int32 {.winapi, cdecl, varargs, dynlib: "shlwapi", importc.}
proc wnsprintfW*(lpOut: LPWSTR, cchLimitIn: int32, lpFmt: LPCWSTR): int32 {.winapi, cdecl, varargs, dynlib: "shlwapi", importc.}
proc StrRetToStrA*(pstr: ptr STRRET, pidl: LPCITEMIDLIST, ppsz: ptr LPSTR): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrRetToStrW*(pstr: ptr STRRET, pidl: LPCITEMIDLIST, ppsz: ptr LPWSTR): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrRetToBufA*(pstr: ptr STRRET, pidl: LPCITEMIDLIST, pszBuf: LPSTR, cchBuf: UINT): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrRetToBufW*(pstr: ptr STRRET, pidl: LPCITEMIDLIST, pszBuf: LPWSTR, cchBuf: UINT): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrRetToBSTR*(pstr: ptr STRRET, pidl: LPCITEMIDLIST, pbstr: ptr BSTR): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHStrDupA*(psz: LPCSTR, ppwsz: ptr ptr WCHAR): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHStrDupW*(psz: LPCWSTR, ppwsz: ptr ptr WCHAR): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpLogicalW*(psz1: LPCWSTR, psz2: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCatChainW*(pszDst: LPWSTR, cchDst: DWORD, ichAt: DWORD, pszSrc: LPCWSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHLoadIndirectString*(pszSource: LPCWSTR, pszOutBuf: LPWSTR, cchOutBuf: UINT, ppvReserved: ptr pointer): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc IsCharSpaceA*(wch: CHAR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc IsCharSpaceW*(wch: WCHAR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpCA*(pszStr1: LPCSTR, pszStr2: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpCW*(pszStr1: LPCWSTR, pszStr2: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpICA*(pszStr1: LPCSTR, pszStr2: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc StrCmpICW*(pszStr1: LPCWSTR, pszStr2: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc IntlStrEqWorkerA*(fCaseSens: WINBOOL, lpString1: LPCSTR, lpString2: LPCSTR, nChar: int32): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc IntlStrEqWorkerW*(fCaseSens: WINBOOL, lpString1: LPCWSTR, lpString2: LPCWSTR, nChar: int32): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathAddBackslashA*(pszPath: LPSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathAddBackslashW*(pszPath: LPWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathAddExtensionA*(pszPath: LPSTR, pszExt: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathAddExtensionW*(pszPath: LPWSTR, pszExt: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathAppendA*(pszPath: LPSTR, pMore: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathAppendW*(pszPath: LPWSTR, pMore: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathBuildRootA*(pszRoot: LPSTR, iDrive: int32): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathBuildRootW*(pszRoot: LPWSTR, iDrive: int32): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCanonicalizeA*(pszBuf: LPSTR, pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCanonicalizeW*(pszBuf: LPWSTR, pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCombineA*(pszDest: LPSTR, pszDir: LPCSTR, pszFile: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCombineW*(pszDest: LPWSTR, pszDir: LPCWSTR, pszFile: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCompactPathA*(hDC: HDC, pszPath: LPSTR, dx: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCompactPathW*(hDC: HDC, pszPath: LPWSTR, dx: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCompactPathExA*(pszOut: LPSTR, pszSrc: LPCSTR, cchMax: UINT, dwFlags: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCompactPathExW*(pszOut: LPWSTR, pszSrc: LPCWSTR, cchMax: UINT, dwFlags: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCommonPrefixA*(pszFile1: LPCSTR, pszFile2: LPCSTR, achPath: LPSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCommonPrefixW*(pszFile1: LPCWSTR, pszFile2: LPCWSTR, achPath: LPWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFileExistsA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFileExistsW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFindExtensionA*(pszPath: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFindExtensionW*(pszPath: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFindFileNameA*(pszPath: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFindFileNameW*(pszPath: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFindNextComponentA*(pszPath: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFindNextComponentW*(pszPath: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFindOnPathA*(pszPath: LPSTR, ppszOtherDirs: ptr LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFindOnPathW*(pszPath: LPWSTR, ppszOtherDirs: ptr LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathGetArgsA*(pszPath: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathGetArgsW*(pszPath: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFindSuffixArrayA*(pszPath: LPCSTR, apszSuffix: ptr LPCSTR, iArraySize: int32): LPCSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathFindSuffixArrayW*(pszPath: LPCWSTR, apszSuffix: ptr LPCWSTR, iArraySize: int32): LPCWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsLFNFileSpecA*(lpName: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsLFNFileSpecW*(lpName: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathGetCharTypeA*(ch: UCHAR): UINT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathGetCharTypeW*(ch: WCHAR): UINT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathGetDriveNumberA*(pszPath: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathGetDriveNumberW*(pszPath: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsDirectoryA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsDirectoryW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsDirectoryEmptyA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsDirectoryEmptyW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsFileSpecA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsFileSpecW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsPrefixA*(pszPrefix: LPCSTR, pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsPrefixW*(pszPrefix: LPCWSTR, pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsRelativeA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsRelativeW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsRootA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsRootW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsSameRootA*(pszPath1: LPCSTR, pszPath2: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsSameRootW*(pszPath1: LPCWSTR, pszPath2: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsUNCA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsUNCW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsNetworkPathA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsNetworkPathW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsUNCServerA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsUNCServerW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsUNCServerShareA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsUNCServerShareW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsContentTypeA*(pszPath: LPCSTR, pszContentType: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsContentTypeW*(pszPath: LPCWSTR, pszContentType: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsURLA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsURLW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathMakePrettyA*(pszPath: LPSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathMakePrettyW*(pszPath: LPWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathMatchSpecA*(pszFile: LPCSTR, pszSpec: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathMatchSpecW*(pszFile: LPCWSTR, pszSpec: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathParseIconLocationA*(pszIconFile: LPSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathParseIconLocationW*(pszIconFile: LPWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathQuoteSpacesA*(lpsz: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathQuoteSpacesW*(lpsz: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRelativePathToA*(pszPath: LPSTR, pszFrom: LPCSTR, dwAttrFrom: DWORD, pszTo: LPCSTR, dwAttrTo: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRelativePathToW*(pszPath: LPWSTR, pszFrom: LPCWSTR, dwAttrFrom: DWORD, pszTo: LPCWSTR, dwAttrTo: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRemoveArgsA*(pszPath: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRemoveArgsW*(pszPath: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRemoveBackslashA*(pszPath: LPSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRemoveBackslashW*(pszPath: LPWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRemoveBlanksA*(pszPath: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRemoveBlanksW*(pszPath: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRemoveExtensionA*(pszPath: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRemoveExtensionW*(pszPath: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRemoveFileSpecA*(pszPath: LPSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRemoveFileSpecW*(pszPath: LPWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRenameExtensionA*(pszPath: LPSTR, pszExt: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathRenameExtensionW*(pszPath: LPWSTR, pszExt: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathSearchAndQualifyA*(pszPath: LPCSTR, pszBuf: LPSTR, cchBuf: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathSearchAndQualifyW*(pszPath: LPCWSTR, pszBuf: LPWSTR, cchBuf: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathSetDlgItemPathA*(hDlg: HWND, id: int32, pszPath: LPCSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathSetDlgItemPathW*(hDlg: HWND, id: int32, pszPath: LPCWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathSkipRootA*(pszPath: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathSkipRootW*(pszPath: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathStripPathA*(pszPath: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathStripPathW*(pszPath: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathStripToRootA*(pszPath: LPSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathStripToRootW*(pszPath: LPWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathUnquoteSpacesA*(lpsz: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathUnquoteSpacesW*(lpsz: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathMakeSystemFolderA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathMakeSystemFolderW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathUnmakeSystemFolderA*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathUnmakeSystemFolderW*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsSystemFolderA*(pszPath: LPCSTR, dwAttrb: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathIsSystemFolderW*(pszPath: LPCWSTR, dwAttrb: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathUndecorateA*(pszPath: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathUndecorateW*(pszPath: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathUnExpandEnvStringsA*(pszPath: LPCSTR, pszBuf: LPSTR, cchBuf: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathUnExpandEnvStringsW*(pszPath: LPCWSTR, pszBuf: LPWSTR, cchBuf: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlCompareA*(psz1: LPCSTR, psz2: LPCSTR, fIgnoreSlash: WINBOOL): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlCompareW*(psz1: LPCWSTR, psz2: LPCWSTR, fIgnoreSlash: WINBOOL): int32 {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlCombineA*(pszBase: LPCSTR, pszRelative: LPCSTR, pszCombined: LPSTR, pcchCombined: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlCombineW*(pszBase: LPCWSTR, pszRelative: LPCWSTR, pszCombined: LPWSTR, pcchCombined: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlCanonicalizeA*(pszUrl: LPCSTR, pszCanonicalized: LPSTR, pcchCanonicalized: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlCanonicalizeW*(pszUrl: LPCWSTR, pszCanonicalized: LPWSTR, pcchCanonicalized: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlIsOpaqueA*(pszURL: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlIsOpaqueW*(pszURL: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlIsNoHistoryA*(pszURL: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlIsNoHistoryW*(pszURL: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlIsA*(pszUrl: LPCSTR, UrlIs: TURLIS): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlIsW*(pszUrl: LPCWSTR, UrlIs: TURLIS): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlGetLocationA*(psz1: LPCSTR): LPCSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlGetLocationW*(psz1: LPCWSTR): LPCWSTR {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlUnescapeA*(pszUrl: LPSTR, pszUnescaped: LPSTR, pcchUnescaped: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlUnescapeW*(pszUrl: LPWSTR, pszUnescaped: LPWSTR, pcchUnescaped: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlEscapeA*(pszUrl: LPCSTR, pszEscaped: LPSTR, pcchEscaped: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlEscapeW*(pszUrl: LPCWSTR, pszEscaped: LPWSTR, pcchEscaped: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlCreateFromPathA*(pszPath: LPCSTR, pszUrl: LPSTR, pcchUrl: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlCreateFromPathW*(pszPath: LPCWSTR, pszUrl: LPWSTR, pcchUrl: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCreateFromUrlA*(pszUrl: LPCSTR, pszPath: LPSTR, pcchPath: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc PathCreateFromUrlW*(pszUrl: LPCWSTR, pszPath: LPWSTR, pcchPath: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlHashA*(pszUrl: LPCSTR, pbHash: LPBYTE, cbHash: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlHashW*(pszUrl: LPCWSTR, pbHash: LPBYTE, cbHash: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlGetPartW*(pszIn: LPCWSTR, pszOut: LPWSTR, pcchOut: LPDWORD, dwPart: DWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlGetPartA*(pszIn: LPCSTR, pszOut: LPSTR, pcchOut: LPDWORD, dwPart: DWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlApplySchemeA*(pszIn: LPCSTR, pszOut: LPSTR, pcchOut: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc UrlApplySchemeW*(pszIn: LPCWSTR, pszOut: LPWSTR, pcchOut: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc HashData*(pbData: LPBYTE, cbData: DWORD, pbHash: LPBYTE, cbHash: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHDeleteEmptyKeyA*(hkey: HKEY, pszSubKey: LPCSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHDeleteEmptyKeyW*(hkey: HKEY, pszSubKey: LPCWSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHDeleteKeyA*(hkey: HKEY, pszSubKey: LPCSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHDeleteKeyW*(hkey: HKEY, pszSubKey: LPCWSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegDuplicateHKey*(hkey: HKEY): HKEY {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHDeleteValueA*(hkey: HKEY, pszSubKey: LPCSTR, pszValue: LPCSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHDeleteValueW*(hkey: HKEY, pszSubKey: LPCWSTR, pszValue: LPCWSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHGetValueA*(hkey: HKEY, pszSubKey: LPCSTR, pszValue: LPCSTR, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHGetValueW*(hkey: HKEY, pszSubKey: LPCWSTR, pszValue: LPCWSTR, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHSetValueA*(hkey: HKEY, pszSubKey: LPCSTR, pszValue: LPCSTR, dwType: DWORD, pvData: LPCVOID, cbData: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHSetValueW*(hkey: HKEY, pszSubKey: LPCWSTR, pszValue: LPCWSTR, dwType: DWORD, pvData: LPCVOID, cbData: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegGetValueA*(hkey: HKEY, pszSubKey: LPCSTR, pszValue: LPCSTR, dwFlags: SRRF, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegGetValueW*(hkey: HKEY, pszSubKey: LPCWSTR, pszValue: LPCWSTR, dwFlags: SRRF, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHQueryValueExA*(hkey: HKEY, pszValue: LPCSTR, pdwReserved: ptr DWORD, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHQueryValueExW*(hkey: HKEY, pszValue: LPCWSTR, pdwReserved: ptr DWORD, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHEnumKeyExA*(hkey: HKEY, dwIndex: DWORD, pszName: LPSTR, pcchName: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHEnumKeyExW*(hkey: HKEY, dwIndex: DWORD, pszName: LPWSTR, pcchName: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHEnumValueA*(hkey: HKEY, dwIndex: DWORD, pszValueName: LPSTR, pcchValueName: LPDWORD, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHEnumValueW*(hkey: HKEY, dwIndex: DWORD, pszValueName: LPWSTR, pcchValueName: LPDWORD, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHQueryInfoKeyA*(hkey: HKEY, pcSubKeys: LPDWORD, pcchMaxSubKeyLen: LPDWORD, pcValues: LPDWORD, pcchMaxValueNameLen: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHQueryInfoKeyW*(hkey: HKEY, pcSubKeys: LPDWORD, pcchMaxSubKeyLen: LPDWORD, pcValues: LPDWORD, pcchMaxValueNameLen: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHCopyKeyA*(hkeySrc: HKEY, szSrcSubKey: LPCSTR, hkeyDest: HKEY, fReserved: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHCopyKeyW*(hkeySrc: HKEY, wszSrcSubKey: LPCWSTR, hkeyDest: HKEY, fReserved: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegGetPathA*(hKey: HKEY, pcszSubKey: LPCSTR, pcszValue: LPCSTR, pszPath: LPSTR, dwFlags: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegGetPathW*(hKey: HKEY, pcszSubKey: LPCWSTR, pcszValue: LPCWSTR, pszPath: LPWSTR, dwFlags: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegSetPathA*(hKey: HKEY, pcszSubKey: LPCSTR, pcszValue: LPCSTR, pcszPath: LPCSTR, dwFlags: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegSetPathW*(hKey: HKEY, pcszSubKey: LPCWSTR, pcszValue: LPCWSTR, pcszPath: LPCWSTR, dwFlags: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegCreateUSKeyA*(pszPath: LPCSTR, samDesired: REGSAM, hRelativeUSKey: HUSKEY, phNewUSKey: PHUSKEY, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegCreateUSKeyW*(pwzPath: LPCWSTR, samDesired: REGSAM, hRelativeUSKey: HUSKEY, phNewUSKey: PHUSKEY, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegOpenUSKeyA*(pszPath: LPCSTR, samDesired: REGSAM, hRelativeUSKey: HUSKEY, phNewUSKey: PHUSKEY, fIgnoreHKCU: WINBOOL): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegOpenUSKeyW*(pwzPath: LPCWSTR, samDesired: REGSAM, hRelativeUSKey: HUSKEY, phNewUSKey: PHUSKEY, fIgnoreHKCU: WINBOOL): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegQueryUSValueA*(hUSKey: HUSKEY, pszValue: LPCSTR, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, fIgnoreHKCU: WINBOOL, pvDefaultData: pointer, dwDefaultDataSize: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegQueryUSValueW*(hUSKey: HUSKEY, pwzValue: LPCWSTR, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, fIgnoreHKCU: WINBOOL, pvDefaultData: pointer, dwDefaultDataSize: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegWriteUSValueA*(hUSKey: HUSKEY, pszValue: LPCSTR, dwType: DWORD, pvData: pointer, cbData: DWORD, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegWriteUSValueW*(hUSKey: HUSKEY, pwzValue: LPCWSTR, dwType: DWORD, pvData: pointer, cbData: DWORD, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegDeleteUSValueA*(hUSKey: HUSKEY, pszValue: LPCSTR, delRegFlags: SHREGDEL_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegDeleteEmptyUSKeyW*(hUSKey: HUSKEY, pwzSubKey: LPCWSTR, delRegFlags: SHREGDEL_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegDeleteEmptyUSKeyA*(hUSKey: HUSKEY, pszSubKey: LPCSTR, delRegFlags: SHREGDEL_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegDeleteUSValueW*(hUSKey: HUSKEY, pwzValue: LPCWSTR, delRegFlags: SHREGDEL_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegEnumUSKeyA*(hUSKey: HUSKEY, dwIndex: DWORD, pszName: LPSTR, pcchName: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegEnumUSKeyW*(hUSKey: HUSKEY, dwIndex: DWORD, pwzName: LPWSTR, pcchName: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegEnumUSValueA*(hUSkey: HUSKEY, dwIndex: DWORD, pszValueName: LPSTR, pcchValueName: LPDWORD, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegEnumUSValueW*(hUSkey: HUSKEY, dwIndex: DWORD, pszValueName: LPWSTR, pcchValueName: LPDWORD, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegQueryInfoUSKeyA*(hUSKey: HUSKEY, pcSubKeys: LPDWORD, pcchMaxSubKeyLen: LPDWORD, pcValues: LPDWORD, pcchMaxValueNameLen: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegQueryInfoUSKeyW*(hUSKey: HUSKEY, pcSubKeys: LPDWORD, pcchMaxSubKeyLen: LPDWORD, pcValues: LPDWORD, pcchMaxValueNameLen: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegCloseUSKey*(hUSKey: HUSKEY): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegGetUSValueA*(pszSubKey: LPCSTR, pszValue: LPCSTR, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, fIgnoreHKCU: WINBOOL, pvDefaultData: pointer, dwDefaultDataSize: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegGetUSValueW*(pwzSubKey: LPCWSTR, pwzValue: LPCWSTR, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, fIgnoreHKCU: WINBOOL, pvDefaultData: pointer, dwDefaultDataSize: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegSetUSValueA*(pszSubKey: LPCSTR, pszValue: LPCSTR, dwType: DWORD, pvData: pointer, cbData: DWORD, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegSetUSValueW*(pwzSubKey: LPCWSTR, pwzValue: LPCWSTR, dwType: DWORD, pvData: pointer, cbData: DWORD, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegGetIntW*(hk: HKEY, pwzKey: LPCWSTR, iDefault: int32): int32 {.winapi, xpincompatible, stdcall, dynlib: "shlwapi", importc.}
proc SHRegGetBoolUSValueA*(pszSubKey: LPCSTR, pszValue: LPCSTR, fIgnoreHKCU: WINBOOL, fDefault: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHRegGetBoolUSValueW*(pszSubKey: LPCWSTR, pszValue: LPCWSTR, fIgnoreHKCU: WINBOOL, fDefault: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc AssocCreate*(clsid: CLSID, riid: REFIID, ppv: ptr LPVOID): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc AssocQueryStringA*(flags: ASSOCF, str: ASSOCSTR, pszAssoc: LPCSTR, pszExtra: LPCSTR, pszOut: LPSTR, pcchOut: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc AssocQueryStringW*(flags: ASSOCF, str: ASSOCSTR, pszAssoc: LPCWSTR, pszExtra: LPCWSTR, pszOut: LPWSTR, pcchOut: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc AssocQueryStringByKeyA*(flags: ASSOCF, str: ASSOCSTR, hkAssoc: HKEY, pszExtra: LPCSTR, pszOut: LPSTR, pcchOut: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc AssocQueryStringByKeyW*(flags: ASSOCF, str: ASSOCSTR, hkAssoc: HKEY, pszExtra: LPCWSTR, pszOut: LPWSTR, pcchOut: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc AssocQueryKeyA*(flags: ASSOCF, key: ASSOCKEY, pszAssoc: LPCSTR, pszExtra: LPCSTR, phkeyOut: ptr HKEY): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc AssocQueryKeyW*(flags: ASSOCF, key: ASSOCKEY, pszAssoc: LPCWSTR, pszExtra: LPCWSTR, phkeyOut: ptr HKEY): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc AssocIsDangerous*(pszAssoc: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc AssocGetPerceivedType*(pszExt: LPCWSTR, ptype: ptr PERCEIVED, pflag: ptr PERCEIVEDFLAG, ppszType: ptr LPWSTR): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHOpenRegStreamA*(hkey: HKEY, pszSubkey: LPCSTR, pszValue: LPCSTR, grfMode: DWORD): ptr IStream {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHOpenRegStreamW*(hkey: HKEY, pszSubkey: LPCWSTR, pszValue: LPCWSTR, grfMode: DWORD): ptr IStream {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHOpenRegStream2A*(hkey: HKEY, pszSubkey: LPCSTR, pszValue: LPCSTR, grfMode: DWORD): ptr IStream {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHOpenRegStream2W*(hkey: HKEY, pszSubkey: LPCWSTR, pszValue: LPCWSTR, grfMode: DWORD): ptr IStream {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHCreateStreamOnFileA*(pszFile: LPCSTR, grfMode: DWORD, ppstm: ptr ptr IStream): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHCreateStreamOnFileW*(pszFile: LPCWSTR, grfMode: DWORD, ppstm: ptr ptr IStream): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHCreateStreamOnFileEx*(pszFile: LPCWSTR, grfMode: DWORD, dwAttributes: DWORD, fCreate: WINBOOL, pstmTemplate: ptr IStream, ppstm: ptr ptr IStream): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc GetAcceptLanguagesA*(psz: LPSTR, pcch: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc GetAcceptLanguagesW*(psz: LPWSTR, pcch: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHGetViewStatePropertyBag*(pidl: LPCITEMIDLIST, pszBagName: LPCWSTR, dwFlags: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHAllocShared*(pvData: pointer, dwSize: DWORD, dwProcessId: DWORD): HANDLE {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHFreeShared*(hData: HANDLE, dwProcessId: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHLockShared*(hData: HANDLE, dwProcessId: DWORD): pointer {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHUnlockShared*(pvData: pointer): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHAutoComplete*(hwndEdit: HWND, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHSetThreadRef*(punk: ptr IUnknown): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHGetThreadRef*(ppunk: ptr ptr IUnknown): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHSkipJunction*(pbc: ptr IBindCtx, pclsid: ptr CLSID): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHCreateThreadRef*(pcRef: ptr LONG, ppunk: ptr ptr IUnknown): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHCreateThread*(pfnThreadProc: LPTHREAD_START_ROUTINE, pData: pointer, dwFlags: DWORD, pfnCallback: LPTHREAD_START_ROUTINE): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHReleaseThreadRef*(): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc SHCreateShellPalette*(hdc: HDC): HPALETTE {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc ColorRGBToHLS*(clrRGB: COLORREF, pwHue: ptr WORD, pwLuminance: ptr WORD, pwSaturation: ptr WORD): void {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc ColorHLSToRGB*(wHue: WORD, wLuminance: WORD, wSaturation: WORD): COLORREF {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc ColorAdjustLuma*(clrRGB: COLORREF, n: int32, fScale: WINBOOL): COLORREF {.winapi, stdcall, dynlib: "shlwapi", importc.}
proc DllInstall*(bInstall: WINBOOL, pszCmdLine: LPCWSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc IsInternetESCEnabled*(): WINBOOL {.winapi, xpincompatible, stdcall, dynlib: "shlwapi", importc.}
proc SHGetFolderPathW*(hwnd: HWND, csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszPath: LPWSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHSimpleIDListFromPath*(pszPath: PCWSTR): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateItemFromIDList*(pidl: PCIDLIST_ABSOLUTE, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateItemFromParsingName*(pszPath: PCWSTR, pbc: ptr IBindCtx, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateItemWithParent*(pidlParent: PCIDLIST_ABSOLUTE, psfParent: ptr IShellFolder, pidl: PCUITEMID_CHILD, riid: REFIID, ppvItem: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateItemFromRelativeName*(psiParent: ptr IShellItem, pszName: PCWSTR, pbc: ptr IBindCtx, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateItemInKnownFolder*(kfid: REFKNOWNFOLDERID, dwKFFlags: DWORD, pszItem: PCWSTR, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetIDListFromObject*(punk: ptr IUnknown, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetItemFromObject*(punk: ptr IUnknown, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetPropertyStoreFromIDList*(pidl: PCIDLIST_ABSOLUTE, flags: GETPROPERTYSTOREFLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetPropertyStoreFromParsingName*(pszPath: PCWSTR, pbc: ptr IBindCtx, flags: GETPROPERTYSTOREFLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetNameFromIDList*(pidl: PCIDLIST_ABSOLUTE, sigdnName: SIGDN, ppszName: ptr PWSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetItemFromDataObject*(pdtobj: ptr IDataObject, dwFlags: DATAOBJ_GET_ITEM_FLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateShellItemArray*(pidlParent: PCIDLIST_ABSOLUTE, psf: ptr IShellFolder, cidl: UINT, ppidl: PCUITEMID_CHILD_ARRAY, ppsiItemArray: ptr ptr IShellItemArray): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateShellItemArrayFromDataObject*(pdo: ptr IDataObject, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateShellItemArrayFromIDLists*(cidl: UINT, rgpidl: PCIDLIST_ABSOLUTE_ARRAY, ppsiItemArray: ptr ptr IShellItemArray): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateShellItemArrayFromShellItem*(psi: ptr IShellItem, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHAddDefaultPropertiesByExt*(pszExt: PCWSTR, pPropStore: ptr IPropertyStore): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateDefaultPropertiesOp*(psi: ptr IShellItem, ppFileOp: ptr ptr IFileOperation): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHSetDefaultProperties*(hwnd: HWND, psi: ptr IShellItem, dwFileOpFlags: DWORD, pfops: ptr IFileOperationProgressSink): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateAssociationRegistration*(riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateDefaultExtractIcon*(riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SetCurrentProcessExplicitAppUserModelID*(AppID: PCWSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc GetCurrentProcessExplicitAppUserModelID*(AppID: ptr PWSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetTemporaryPropertyForItem*(psi: ptr IShellItem, propkey: REFPROPERTYKEY, ppropvar: ptr PROPVARIANT): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHSetTemporaryPropertyForItem*(psi: ptr IShellItem, propkey: REFPROPERTYKEY, propvar: REFPROPVARIANT): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHShowManageLibraryUI*(psiLibrary: ptr IShellItem, hwndOwner: HWND, pszTitle: LPCWSTR, pszInstruction: LPCWSTR, lmdOptions: LIBRARYMANAGEDIALOGOPTIONS): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHResolveLibrary*(psiLibrary: ptr IShellItem): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHAssocEnumHandlers*(pszExtra: PCWSTR, afFilter: ASSOC_FILTER, ppEnumHandler: ptr ptr IEnumAssocHandlers): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHAssocEnumHandlersForProtocolByApplication*(protocol: PCWSTR, riid: REFIID, enumHandlers: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetMalloc*(ppMalloc: ptr ptr IMalloc): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHAlloc*(cb: SIZE_T): pointer {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHFree*(pv: pointer): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetIconOverlayIndexA*(pszIconPath: LPCSTR, iIconIndex: int32): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetIconOverlayIndexW*(pszIconPath: LPCWSTR, iIconIndex: int32): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILClone*(pidl: PCUIDLIST_RELATIVE): PIDLIST_RELATIVE {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILCloneFirst*(pidl: PCUIDLIST_RELATIVE): PITEMID_CHILD {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILCombine*(pidl1: PCIDLIST_ABSOLUTE, pidl2: PCUIDLIST_RELATIVE): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILFree*(pidl: PIDLIST_RELATIVE): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILGetNext*(pidl: PCUIDLIST_RELATIVE): PUIDLIST_RELATIVE {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILGetSize*(pidl: PCUIDLIST_RELATIVE): UINT {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILFindChild*(pidlParent: PIDLIST_ABSOLUTE, pidlChild: PCIDLIST_ABSOLUTE): PUIDLIST_RELATIVE {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILFindLastID*(pidl: PCUIDLIST_RELATIVE): PUITEMID_CHILD {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILRemoveLastID*(pidl: PUIDLIST_RELATIVE): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILIsEqual*(pidl1: PCIDLIST_ABSOLUTE, pidl2: PCIDLIST_ABSOLUTE): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILIsParent*(pidl1: PCIDLIST_ABSOLUTE, pidl2: PCIDLIST_ABSOLUTE, fImmediate: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILSaveToStream*(pstm: ptr IStream, pidl: PCUIDLIST_RELATIVE): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILLoadFromStreamEx*(pstm: ptr IStream, pidl: ptr PIDLIST_RELATIVE): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc ILCreateFromPathA*(pszPath: PCSTR): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILCreateFromPathW*(pszPath: PCWSTR): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHILCreateFromPath*(pszPath: PCWSTR, ppidl: ptr PIDLIST_ABSOLUTE, rgfInOut: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc ILAppendID*(pidl: PIDLIST_RELATIVE, pmkid: LPCSHITEMID, fAppend: WINBOOL): PIDLIST_RELATIVE {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetPathFromIDListEx*(pidl: PCIDLIST_ABSOLUTE, pszPath: PWSTR, cchPath: DWORD, uOpts: GPFIDL_FLAGS): WINBOOL {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetPathFromIDListA*(pidl: PCIDLIST_ABSOLUTE, pszPath: LPSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetPathFromIDListW*(pidl: PCIDLIST_ABSOLUTE, pszPath: LPWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateDirectory*(hwnd: HWND, pszPath: PCWSTR): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateDirectoryExA*(hwnd: HWND, pszPath: LPCSTR, psa: ptr SECURITY_ATTRIBUTES): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateDirectoryExW*(hwnd: HWND, pszPath: LPCWSTR, psa: ptr SECURITY_ATTRIBUTES): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHOpenFolderAndSelectItems*(pidlFolder: PCIDLIST_ABSOLUTE, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateShellItem*(pidlParent: PCIDLIST_ABSOLUTE, psfParent: ptr IShellFolder, pidl: PCUITEMID_CHILD, ppsi: ptr ptr IShellItem): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetSpecialFolderLocation*(hwnd: HWND, csidl: int32, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCloneSpecialIDList*(hwnd: HWND, csidl: int32, fCreate: WINBOOL): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetSpecialFolderPathA*(hwnd: HWND, pszPath: LPSTR, csidl: int32, fCreate: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetSpecialFolderPathW*(hwnd: HWND, pszPath: LPWSTR, csidl: int32, fCreate: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHFlushSFCache*(): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetFolderPathA*(hwnd: HWND, csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszPath: LPSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetFolderLocation*(hwnd: HWND, csidl: int32, hToken: HANDLE, dwFlags: DWORD, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHSetFolderPathA*(csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszPath: LPCSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHSetFolderPathW*(csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszPath: LPCWSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetFolderPathAndSubDirA*(hwnd: HWND, csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszSubDir: LPCSTR, pszPath: LPSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetFolderPathAndSubDirW*(hwnd: HWND, csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszSubDir: LPCWSTR, pszPath: LPWSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetKnownFolderIDList*(rfid: REFKNOWNFOLDERID, dwFlags: DWORD, hToken: HANDLE, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHSetKnownFolderPath*(rfid: REFKNOWNFOLDERID, dwFlags: DWORD, hToken: HANDLE, pszPath: PCWSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetKnownFolderPath*(rfid: REFKNOWNFOLDERID, dwFlags: DWORD, hToken: HANDLE, ppszPath: ptr PWSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetKnownFolderItem*(rfid: REFKNOWNFOLDERID, flags: KNOWN_FOLDER_FLAG, hToken: HANDLE, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHGetSetFolderCustomSettings*(pfcs: LPSHFOLDERCUSTOMSETTINGS, pszPath: PCWSTR, dwReadWrite: DWORD): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHBrowseForFolderA*(lpbi: LPBROWSEINFOA): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHBrowseForFolderW*(lpbi: LPBROWSEINFOW): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHLoadInProc*(rclsid: REFCLSID): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetDesktopFolder*(ppshf: ptr ptr IShellFolder): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHChangeNotify*(wEventId: LONG, uFlags: UINT, dwItem1: LPCVOID, dwItem2: LPCVOID): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHAddToRecentDocs*(uFlags: UINT, pv: LPCVOID): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHHandleUpdateImage*(pidlExtra: PCIDLIST_ABSOLUTE): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHUpdateImageA*(pszHashItem: LPCSTR, iIndex: int32, uFlags: UINT, iImageIndex: int32): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHUpdateImageW*(pszHashItem: LPCWSTR, iIndex: int32, uFlags: UINT, iImageIndex: int32): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHChangeNotifyRegister*(hwnd: HWND, fSources: int32, fEvents: LONG, wMsg: UINT, cEntries: int32, pshcne: ptr SHChangeNotifyEntry): ULONG {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHChangeNotifyDeregister*(ulID: ULONG): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHChangeNotifyRegisterThread*(status: SCNRT_STATUS): void {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHChangeNotification_Lock*(hChange: HANDLE, dwProcId: DWORD, pppidl: ptr ptr PIDLIST_ABSOLUTE, plEvent: ptr LONG): HANDLE {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHChangeNotification_Unlock*(hLock: HANDLE): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetRealIDL*(psf: ptr IShellFolder, pidlSimple: PCUITEMID_CHILD, ppidlReal: ptr PITEMID_CHILD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetInstanceExplorer*(ppunk: ptr ptr IUnknown): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetDataFromIDListA*(psf: ptr IShellFolder, pidl: PCUITEMID_CHILD, nFormat: int32, pv: pointer, cb: int32): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetDataFromIDListW*(psf: ptr IShellFolder, pidl: PCUITEMID_CHILD, nFormat: int32, pv: pointer, cb: int32): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc RestartDialog*(hwnd: HWND, pszPrompt: PCWSTR, dwReturn: DWORD): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc RestartDialogEx*(hwnd: HWND, pszPrompt: PCWSTR, dwReturn: DWORD, dwReasonCode: DWORD): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCoCreateInstance*(pszCLSID: PCWSTR, pclsid: ptr CLSID, pUnkOuter: ptr IUnknown, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateDataObject*(pidlFolder: PCIDLIST_ABSOLUTE, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, pdtInner: ptr IDataObject, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc CIDLData_CreateFromIDArray*(pidlFolder: PCIDLIST_ABSOLUTE, cidl: UINT, apidl: PCUIDLIST_RELATIVE_ARRAY, ppdtobj: ptr ptr IDataObject): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHCreateStdEnumFmtEtc*(cfmt: UINT, afmt: ptr FORMATETC, ppenumFormatEtc: ptr ptr IEnumFORMATETC): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHDoDragDrop*(hwnd: HWND, pdata: ptr IDataObject, pdsrc: ptr IDropSource, dwEffect: DWORD, pdwEffect: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc DAD_SetDragImage*(him: HIMAGELIST, pptOffset: ptr POINT): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc DAD_DragEnterEx*(hwndTarget: HWND, ptStart: POINT): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc DAD_DragEnterEx2*(hwndTarget: HWND, ptStart: POINT, pdtObject: ptr IDataObject): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc DAD_ShowDragImage*(fShow: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc DAD_DragMove*(pt: POINT): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc DAD_DragLeave*(): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc DAD_AutoScroll*(hwnd: HWND, pad: ptr AUTO_SCROLL_DATA, pptNow: ptr POINT): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc ReadCabinetState*(pcs: ptr CABINETSTATE, cLength: int32): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc WriteCabinetState*(pcs: ptr CABINETSTATE): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc PathMakeUniqueName*(pszUniqueName: PWSTR, cchMax: UINT, pszTemplate: PCWSTR, pszLongPlate: PCWSTR, pszDir: PCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc PathQualify*(psz: PWSTR): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc PathIsExe*(pszPath: PCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc PathIsSlowA*(pszFile: LPCSTR, dwAttr: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc PathIsSlowW*(pszFile: LPCWSTR, dwAttr: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc PathCleanupSpec*(pszDir: PCWSTR, pszSpec: PWSTR): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc PathResolve*(pszPath: PWSTR, dirs: PZPCWSTR, fFlags: UINT): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc GetFileNameFromBrowse*(hwnd: HWND, pszFilePath: PWSTR, cchFilePath: UINT, pszWorkingDir: PCWSTR, pszDefExt: PCWSTR, pszFilters: PCWSTR, pszTitle: PCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc DriveType*(iDrive: int32): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc RealDriveType*(iDrive: int32, fOKToHitNet: WINBOOL): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc IsNetDrive*(iDrive: int32): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc Shell_MergeMenus*(hmDst: HMENU, hmSrc: HMENU, uInsert: UINT, uIDAdjust: UINT, uIDAdjustMax: UINT, uFlags: ULONG): UINT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHObjectProperties*(hwnd: HWND, shopObjectType: DWORD, pszObjectName: PCWSTR, pszPropertyPage: PCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHFormatDrive*(hwnd: HWND, drive: UINT, fmtID: UINT, options: UINT): DWORD {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreatePropSheetExtArray*(hKey: HKEY, pszSubKey: PCWSTR, max_iface: UINT): HPSXA {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHDestroyPropSheetExtArray*(hpsxa: HPSXA): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHAddFromPropSheetExtArray*(hpsxa: HPSXA, lpfnAddPage: LPFNADDPROPSHEETPAGE, lParam: LPARAM): UINT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHReplaceFromPropSheetExtArray*(hpsxa: HPSXA, uPageID: UINT, lpfnReplaceWith: LPFNADDPROPSHEETPAGE, lParam: LPARAM): UINT {.winapi, stdcall, dynlib: "shell32", importc.}
proc OpenRegStream*(hkey: HKEY, pszSubkey: PCWSTR, pszValue: PCWSTR, grfMode: DWORD): ptr IStream {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHFindFiles*(pidlFolder: PCIDLIST_ABSOLUTE, pidlSaveFile: PCIDLIST_ABSOLUTE): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc PathGetShortPath*(pszLongPath: PWSTR): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc PathYetAnotherMakeUniqueName*(pszUniqueName: PWSTR, pszPath: PCWSTR, pszShort: PCWSTR, pszFileSpec: PCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc Win32DeleteFile*(pszPath: PCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHRestricted*(rest: RESTRICTIONS): DWORD {.winapi, stdcall, dynlib: "shell32", importc.}
proc SignalFileOpen*(pidl: PCIDLIST_ABSOLUTE): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc AssocGetDetailsOfPropKey*(psf: ptr IShellFolder, pidl: PCUITEMID_CHILD, pkey: ptr PROPERTYKEY, pv: ptr VARIANT, pfFoundPropKey: ptr WINBOOL): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHStartNetConnectionDialogW*(hwnd: HWND, pszRemoteName: LPCWSTR, dwType: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHDefExtractIconA*(pszIconFile: LPCSTR, iIndex: int32, uFlags: UINT, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIconSize: UINT): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHDefExtractIconW*(pszIconFile: LPCWSTR, iIndex: int32, uFlags: UINT, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIconSize: UINT): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHOpenWithDialog*(hwndParent: HWND, poainfo: ptr OPENASINFO): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc Shell_GetImageLists*(phiml: ptr HIMAGELIST, phimlSmall: ptr HIMAGELIST): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc Shell_GetCachedImageIndex*(pwszIconPath: PCWSTR, iIconIndex: int32, uIconFlags: UINT): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc Shell_GetCachedImageIndexA*(pszIconPath: LPCSTR, iIconIndex: int32, uIconFlags: UINT): int32 {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc Shell_GetCachedImageIndexW*(pszIconPath: LPCWSTR, iIconIndex: int32, uIconFlags: UINT): int32 {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHValidateUNC*(hwndOwner: HWND, pszFile: PWSTR, fConnect: UINT): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc PifMgr_OpenProperties*(pszApp: PCWSTR, pszPIF: PCWSTR, hInf: UINT, flOpt: UINT): HANDLE {.winapi, stdcall, dynlib: "shell32", importc.}
proc PifMgr_GetProperties*(hProps: HANDLE, pszGroup: PCSTR, lpProps: pointer, cbProps: int32, flOpt: UINT): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc PifMgr_SetProperties*(hProps: HANDLE, pszGroup: PCSTR, lpProps: pointer, cbProps: int32, flOpt: UINT): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc PifMgr_CloseProperties*(hProps: HANDLE, flOpt: UINT): HANDLE {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHSetInstanceExplorer*(punk: ptr IUnknown): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc IsUserAnAdmin*(): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHShellFolderView_Message*(hwndMain: HWND, uMsg: UINT, lParam: LPARAM): LRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateShellFolderView*(pcsfv: ptr SFV_CREATE, ppsv: ptr ptr IShellView): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc CDefFolderMenu_Create2*(pidlFolder: PCIDLIST_ABSOLUTE, hwnd: HWND, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, psf: ptr IShellFolder, pfn: LPFNDFMCALLBACK, nKeys: UINT, ahkeys: ptr HKEY, ppcm: ptr ptr IContextMenu): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateDefaultContextMenu*(pdcm: ptr DEFCONTEXTMENU, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHOpenPropSheetW*(pszCaption: LPCWSTR, ahkeys: ptr HKEY, ckeys: UINT, pclsidDefault: ptr CLSID, pdtobj: ptr IDataObject, psb: ptr IShellBrowser, pStartPage: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHFind_InitMenuPopup*(hmenu: HMENU, hwndOwner: HWND, idCmdFirst: UINT, idCmdLast: UINT): ptr IContextMenu {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateShellFolderViewEx*(pcsfv: ptr CSFV, ppsv: ptr ptr IShellView): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
when winimUnicode:
  type
    LPSHELLSTATE* = LPSHELLSTATEW
when winimAnsi:
  type
    LPSHELLSTATE* = LPSHELLSTATEA
proc SHGetSetSettings*(lpss: LPSHELLSTATE, dwMask: DWORD, bSet: WINBOOL): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetSettings*(psfs: ptr SHELLFLAGSTATE, dwMask: DWORD): void {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHBindToParent*(pidl: PCIDLIST_ABSOLUTE, riid: REFIID, ppv: ptr pointer, ppidlLast: ptr PCUITEMID_CHILD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHBindToFolderIDListParent*(psfRoot: ptr IShellFolder, pidl: PCUIDLIST_RELATIVE, riid: REFIID, ppv: ptr pointer, ppidlLast: ptr PCUITEMID_CHILD): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHBindToFolderIDListParentEx*(psfRoot: ptr IShellFolder, pidl: PCUIDLIST_RELATIVE, ppbc: ptr IBindCtx, riid: REFIID, ppv: ptr pointer, ppidlLast: ptr PCUITEMID_CHILD): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHBindToObject*(psf: ptr IShellFolder, pidl: PCUIDLIST_RELATIVE, pbc: ptr IBindCtx, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc SHParseDisplayName*(pszName: PCWSTR, pbc: ptr IBindCtx, ppidl: ptr PIDLIST_ABSOLUTE, sfgaoIn: SFGAOF, psfgaoOut: ptr SFGAOF): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHPathPrepareForWriteA*(hwnd: HWND, punkEnableModless: ptr IUnknown, pszPath: LPCSTR, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHPathPrepareForWriteW*(hwnd: HWND, punkEnableModless: ptr IUnknown, pszPath: LPCWSTR, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SoftwareUpdateMessageBox*(hWnd: HWND, pszDistUnit: PCWSTR, dwFlags: DWORD, psdi: LPSOFTDISTINFO): DWORD {.winapi, stdcall, dynlib: "shdocvw", importc.}
proc SHPropStgCreate*(psstg: ptr IPropertySetStorage, fmtid: REFFMTID, pclsid: ptr CLSID, grfFlags: DWORD, grfMode: DWORD, dwDisposition: DWORD, ppstg: ptr ptr IPropertyStorage, puCodePage: ptr UINT): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHPropStgReadMultiple*(pps: ptr IPropertyStorage, uCodePage: UINT, cpspec: ULONG, rgpspec: ptr PROPSPEC, rgvar: ptr PROPVARIANT): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHPropStgWriteMultiple*(pps: ptr IPropertyStorage, puCodePage: ptr UINT, cpspec: ULONG, rgpspec: ptr PROPSPEC, rgvar: ptr PROPVARIANT, propidNameFirst: PROPID): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateFileExtractIconW*(pszFile: LPCWSTR, dwFileAttributes: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHLimitInputEdit*(hwndEdit: HWND, psf: ptr IShellFolder): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHGetAttributesFromDataObject*(pdo: ptr IDataObject, dwAttributeMask: DWORD, pdwAttributes: ptr DWORD, pcItems: ptr UINT): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHMultiFileProperties*(pdtobj: ptr IDataObject, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHMapPIDLToSystemImageListIndex*(pshf: ptr IShellFolder, pidl: PCUITEMID_CHILD, piIndexSel: ptr int32): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCLSIDFromString*(psz: PCWSTR, pclsid: ptr CLSID): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc SHCreateQueryCancelAutoPlayMoniker*(ppmoniker: ptr ptr IMoniker): HRESULT {.winapi, stdcall, dynlib: "shell32", importc.}
proc PerUserInit*(): void {.winapi, stdcall, dynlib: "mydocs", importc.}
proc PickIconDlg*(hwnd: HWND, pszIconPath: PWSTR, cchIconPath: UINT, piIconIndex: ptr int32): int32 {.winapi, stdcall, dynlib: "shell32", importc.}
proc StgMakeUniqueName*(pstgParent: ptr IStorage, pszFileSpec: PCWSTR, grfMode: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc.}
proc ImportPrivacySettings*(pszFilename: PCWSTR, pfParsePrivacyPreferences: ptr WINBOOL, pfParsePerSiteRules: ptr WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shdocvw", importc.}
proc `hIcon=`*(self: var SHELLEXECUTEINFOA, x: HANDLE) {.inline.} = self.union1.hIcon = x
proc hIcon*(self: SHELLEXECUTEINFOA): HANDLE {.inline.} = self.union1.hIcon
proc hIcon*(self: var SHELLEXECUTEINFOA): var HANDLE {.inline.} = self.union1.hIcon
proc `hMonitor=`*(self: var SHELLEXECUTEINFOA, x: HANDLE) {.inline.} = self.union1.hMonitor = x
proc hMonitor*(self: SHELLEXECUTEINFOA): HANDLE {.inline.} = self.union1.hMonitor
proc hMonitor*(self: var SHELLEXECUTEINFOA): var HANDLE {.inline.} = self.union1.hMonitor
proc `hIcon=`*(self: var SHELLEXECUTEINFOW, x: HANDLE) {.inline.} = self.union1.hIcon = x
proc hIcon*(self: SHELLEXECUTEINFOW): HANDLE {.inline.} = self.union1.hIcon
proc hIcon*(self: var SHELLEXECUTEINFOW): var HANDLE {.inline.} = self.union1.hIcon
proc `hMonitor=`*(self: var SHELLEXECUTEINFOW, x: HANDLE) {.inline.} = self.union1.hMonitor = x
proc hMonitor*(self: SHELLEXECUTEINFOW): HANDLE {.inline.} = self.union1.hMonitor
proc hMonitor*(self: var SHELLEXECUTEINFOW): var HANDLE {.inline.} = self.union1.hMonitor
proc `uTimeout=`*(self: var NOTIFYICONDATAA, x: UINT) {.inline.} = self.union1.uTimeout = x
proc uTimeout*(self: NOTIFYICONDATAA): UINT {.inline.} = self.union1.uTimeout
proc uTimeout*(self: var NOTIFYICONDATAA): var UINT {.inline.} = self.union1.uTimeout
proc `uVersion=`*(self: var NOTIFYICONDATAA, x: UINT) {.inline.} = self.union1.uVersion = x
proc uVersion*(self: NOTIFYICONDATAA): UINT {.inline.} = self.union1.uVersion
proc uVersion*(self: var NOTIFYICONDATAA): var UINT {.inline.} = self.union1.uVersion
proc `uTimeout=`*(self: var NOTIFYICONDATAW, x: UINT) {.inline.} = self.union1.uTimeout = x
proc uTimeout*(self: NOTIFYICONDATAW): UINT {.inline.} = self.union1.uTimeout
proc uTimeout*(self: var NOTIFYICONDATAW): var UINT {.inline.} = self.union1.uTimeout
proc `uVersion=`*(self: var NOTIFYICONDATAW, x: UINT) {.inline.} = self.union1.uVersion = x
proc uVersion*(self: NOTIFYICONDATAW): UINT {.inline.} = self.union1.uVersion
proc uVersion*(self: var NOTIFYICONDATAW): var UINT {.inline.} = self.union1.uVersion
proc Init*(self: ptr IQueryAssociations, flags: ASSOCF, pszAssoc: LPCWSTR, hkProgid: HKEY, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.Init(self, flags, pszAssoc, hkProgid, hwnd)
proc GetString*(self: ptr IQueryAssociations, flags: ASSOCF, str: ASSOCSTR, pszExtra: LPCWSTR, pszOut: LPWSTR, pcchOut: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetString(self, flags, str, pszExtra, pszOut, pcchOut)
proc GetKey*(self: ptr IQueryAssociations, flags: ASSOCF, key: ASSOCKEY, pszExtra: LPCWSTR, phkeyOut: ptr HKEY): HRESULT {.winapi, inline.} = self.lpVtbl.GetKey(self, flags, key, pszExtra, phkeyOut)
proc GetData*(self: ptr IQueryAssociations, flags: ASSOCF, data: ASSOCDATA, pszExtra: LPCWSTR, pvOut: LPVOID, pcbOut: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetData(self, flags, data, pszExtra, pvOut, pcbOut)
proc GetEnum*(self: ptr IQueryAssociations, flags: ASSOCF, assocenum: ASSOCENUM, pszExtra: LPCWSTR, riid: REFIID, ppvOut: ptr LPVOID): HRESULT {.winapi, inline.} = self.lpVtbl.GetEnum(self, flags, assocenum, pszExtra, riid, ppvOut)
proc SetFolderView*(self: ptr IFolderViewOC, pdisp: ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.SetFolderView(self, pdisp)
proc get_Name*(self: ptr DFConstraint, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_Name(self, pbs)
proc get_Value*(self: ptr DFConstraint, pv: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.get_Value(self, pv)
proc get_Title*(self: ptr Folder, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_Title(self, pbs)
proc get_Application*(self: ptr Folder, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Application(self, ppid)
proc get_Parent*(self: ptr Folder, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Parent(self, ppid)
proc get_ParentFolder*(self: ptr Folder, ppsf: ptr ptr Folder): HRESULT {.winapi, inline.} = self.lpVtbl.get_ParentFolder(self, ppsf)
proc Items*(self: ptr Folder, ppid: ptr ptr FolderItems): HRESULT {.winapi, inline.} = self.lpVtbl.Items(self, ppid)
proc ParseName*(self: ptr Folder, bName: BSTR, ppid: ptr ptr FolderItem): HRESULT {.winapi, inline.} = self.lpVtbl.ParseName(self, bName, ppid)
proc NewFolder*(self: ptr Folder, bName: BSTR, vOptions: VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.NewFolder(self, bName, vOptions)
proc MoveHere*(self: ptr Folder, vItem: VARIANT, vOptions: VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.MoveHere(self, vItem, vOptions)
proc CopyHere*(self: ptr Folder, vItem: VARIANT, vOptions: VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.CopyHere(self, vItem, vOptions)
proc GetDetailsOf*(self: ptr Folder, vItem: VARIANT, iColumn: int32, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetDetailsOf(self, vItem, iColumn, pbs)
proc get_Self*(self: ptr Folder2, ppfi: ptr ptr FolderItem): HRESULT {.winapi, inline.} = self.lpVtbl.get_Self(self, ppfi)
proc get_OfflineStatus*(self: ptr Folder2, pul: ptr LONG): HRESULT {.winapi, inline.} = self.lpVtbl.get_OfflineStatus(self, pul)
proc mSynchronize*(self: ptr Folder2): HRESULT {.winapi, inline.} = self.lpVtbl.Synchronize(self)
proc get_HaveToShowWebViewBarricade*(self: ptr Folder2, pbHaveToShowWebViewBarricade: ptr VARIANT_BOOL): HRESULT {.winapi, inline.} = self.lpVtbl.get_HaveToShowWebViewBarricade(self, pbHaveToShowWebViewBarricade)
proc DismissedWebViewBarricade*(self: ptr Folder2): HRESULT {.winapi, inline.} = self.lpVtbl.DismissedWebViewBarricade(self)
proc get_ShowWebViewBarricade*(self: ptr Folder3, pbShowWebViewBarricade: ptr VARIANT_BOOL): HRESULT {.winapi, inline.} = self.lpVtbl.get_ShowWebViewBarricade(self, pbShowWebViewBarricade)
proc put_ShowWebViewBarricade*(self: ptr Folder3, bShowWebViewBarricade: VARIANT_BOOL): HRESULT {.winapi, inline.} = self.lpVtbl.put_ShowWebViewBarricade(self, bShowWebViewBarricade)
proc get_Application*(self: ptr FolderItem, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Application(self, ppid)
proc get_Parent*(self: ptr FolderItem, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Parent(self, ppid)
proc get_Name*(self: ptr FolderItem, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_Name(self, pbs)
proc put_Name*(self: ptr FolderItem, bs: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.put_Name(self, bs)
proc get_Path*(self: ptr FolderItem, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_Path(self, pbs)
proc get_GetLink*(self: ptr FolderItem, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_GetLink(self, ppid)
proc get_GetFolder*(self: ptr FolderItem, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_GetFolder(self, ppid)
proc get_IsLink*(self: ptr FolderItem, pb: ptr VARIANT_BOOL): HRESULT {.winapi, inline.} = self.lpVtbl.get_IsLink(self, pb)
proc get_IsFolder*(self: ptr FolderItem, pb: ptr VARIANT_BOOL): HRESULT {.winapi, inline.} = self.lpVtbl.get_IsFolder(self, pb)
proc get_IsFileSystem*(self: ptr FolderItem, pb: ptr VARIANT_BOOL): HRESULT {.winapi, inline.} = self.lpVtbl.get_IsFileSystem(self, pb)
proc get_IsBrowsable*(self: ptr FolderItem, pb: ptr VARIANT_BOOL): HRESULT {.winapi, inline.} = self.lpVtbl.get_IsBrowsable(self, pb)
proc get_ModifyDate*(self: ptr FolderItem, pdt: ptr DATE): HRESULT {.winapi, inline.} = self.lpVtbl.get_ModifyDate(self, pdt)
proc put_ModifyDate*(self: ptr FolderItem, dt: DATE): HRESULT {.winapi, inline.} = self.lpVtbl.put_ModifyDate(self, dt)
proc get_Size*(self: ptr FolderItem, pul: ptr LONG): HRESULT {.winapi, inline.} = self.lpVtbl.get_Size(self, pul)
proc get_Type*(self: ptr FolderItem, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_Type(self, pbs)
proc Verbs*(self: ptr FolderItem, ppfic: ptr ptr FolderItemVerbs): HRESULT {.winapi, inline.} = self.lpVtbl.Verbs(self, ppfic)
proc InvokeVerb*(self: ptr FolderItem, vVerb: VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.InvokeVerb(self, vVerb)
proc InvokeVerbEx*(self: ptr FolderItem2, vVerb: VARIANT, vArgs: VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.InvokeVerbEx(self, vVerb, vArgs)
proc ExtendedProperty*(self: ptr FolderItem2, bstrPropName: BSTR, pvRet: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.ExtendedProperty(self, bstrPropName, pvRet)
proc get_Count*(self: ptr FolderItems, plCount: ptr LONG): HRESULT {.winapi, inline.} = self.lpVtbl.get_Count(self, plCount)
proc get_Application*(self: ptr FolderItems, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Application(self, ppid)
proc get_Parent*(self: ptr FolderItems, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Parent(self, ppid)
proc Item*(self: ptr FolderItems, index: VARIANT, ppid: ptr ptr FolderItem): HRESULT {.winapi, inline.} = self.lpVtbl.Item(self, index, ppid)
proc NewEnum*(self: ptr FolderItems, ppunk: ptr ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.NewEnum(self, ppunk)
proc InvokeVerbEx*(self: ptr FolderItems2, vVerb: VARIANT, vArgs: VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.InvokeVerbEx(self, vVerb, vArgs)
proc Filter*(self: ptr FolderItems3, grfFlags: LONG, bstrFileSpec: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Filter(self, grfFlags, bstrFileSpec)
proc get_Verbs*(self: ptr FolderItems3, ppfic: ptr ptr FolderItemVerbs): HRESULT {.winapi, inline.} = self.lpVtbl.get_Verbs(self, ppfic)
proc get_Application*(self: ptr FolderItemVerb, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Application(self, ppid)
proc get_Parent*(self: ptr FolderItemVerb, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Parent(self, ppid)
proc get_Name*(self: ptr FolderItemVerb, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_Name(self, pbs)
proc DoIt*(self: ptr FolderItemVerb): HRESULT {.winapi, inline.} = self.lpVtbl.DoIt(self)
proc get_Count*(self: ptr FolderItemVerbs, plCount: ptr LONG): HRESULT {.winapi, inline.} = self.lpVtbl.get_Count(self, plCount)
proc get_Application*(self: ptr FolderItemVerbs, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Application(self, ppid)
proc get_Parent*(self: ptr FolderItemVerbs, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Parent(self, ppid)
proc Item*(self: ptr FolderItemVerbs, index: VARIANT, ppid: ptr ptr FolderItemVerb): HRESULT {.winapi, inline.} = self.lpVtbl.Item(self, index, ppid)
proc NewEnum*(self: ptr FolderItemVerbs, ppunk: ptr ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.NewEnum(self, ppunk)
proc get_Path*(self: ptr IShellLinkDual, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_Path(self, pbs)
proc put_Path*(self: ptr IShellLinkDual, bs: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.put_Path(self, bs)
proc get_Description*(self: ptr IShellLinkDual, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_Description(self, pbs)
proc put_Description*(self: ptr IShellLinkDual, bs: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.put_Description(self, bs)
proc get_WorkingDirectory*(self: ptr IShellLinkDual, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_WorkingDirectory(self, pbs)
proc put_WorkingDirectory*(self: ptr IShellLinkDual, bs: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.put_WorkingDirectory(self, bs)
proc get_Arguments*(self: ptr IShellLinkDual, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_Arguments(self, pbs)
proc put_Arguments*(self: ptr IShellLinkDual, bs: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.put_Arguments(self, bs)
proc get_Hotkey*(self: ptr IShellLinkDual, piHK: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.get_Hotkey(self, piHK)
proc put_Hotkey*(self: ptr IShellLinkDual, iHK: int32): HRESULT {.winapi, inline.} = self.lpVtbl.put_Hotkey(self, iHK)
proc get_ShowCommand*(self: ptr IShellLinkDual, piShowCommand: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.get_ShowCommand(self, piShowCommand)
proc put_ShowCommand*(self: ptr IShellLinkDual, iShowCommand: int32): HRESULT {.winapi, inline.} = self.lpVtbl.put_ShowCommand(self, iShowCommand)
proc Resolve*(self: ptr IShellLinkDual, fFlags: int32): HRESULT {.winapi, inline.} = self.lpVtbl.Resolve(self, fFlags)
proc GetIconLocation*(self: ptr IShellLinkDual, pbs: ptr BSTR, piIcon: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetIconLocation(self, pbs, piIcon)
proc SetIconLocation*(self: ptr IShellLinkDual, bs: BSTR, iIcon: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetIconLocation(self, bs, iIcon)
proc Save*(self: ptr IShellLinkDual, vWhere: VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.Save(self, vWhere)
proc get_Target*(self: ptr IShellLinkDual2, ppfi: ptr ptr FolderItem): HRESULT {.winapi, inline.} = self.lpVtbl.get_Target(self, ppfi)
proc get_Application*(self: ptr IShellFolderViewDual, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Application(self, ppid)
proc get_Parent*(self: ptr IShellFolderViewDual, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Parent(self, ppid)
proc get_Folder*(self: ptr IShellFolderViewDual, ppid: ptr ptr Folder): HRESULT {.winapi, inline.} = self.lpVtbl.get_Folder(self, ppid)
proc SelectedItems*(self: ptr IShellFolderViewDual, ppid: ptr ptr FolderItems): HRESULT {.winapi, inline.} = self.lpVtbl.SelectedItems(self, ppid)
proc get_FocusedItem*(self: ptr IShellFolderViewDual, ppid: ptr ptr FolderItem): HRESULT {.winapi, inline.} = self.lpVtbl.get_FocusedItem(self, ppid)
proc SelectItem*(self: ptr IShellFolderViewDual, pvfi: ptr VARIANT, dwFlags: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SelectItem(self, pvfi, dwFlags)
proc PopupItemMenu*(self: ptr IShellFolderViewDual, pfi: ptr FolderItem, vx: VARIANT, vy: VARIANT, pbs: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.PopupItemMenu(self, pfi, vx, vy, pbs)
proc get_Script*(self: ptr IShellFolderViewDual, ppDisp: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Script(self, ppDisp)
proc get_ViewOptions*(self: ptr IShellFolderViewDual, plViewOptions: ptr LONG): HRESULT {.winapi, inline.} = self.lpVtbl.get_ViewOptions(self, plViewOptions)
proc get_CurrentViewMode*(self: ptr IShellFolderViewDual2, pViewMode: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.get_CurrentViewMode(self, pViewMode)
proc put_CurrentViewMode*(self: ptr IShellFolderViewDual2, ViewMode: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.put_CurrentViewMode(self, ViewMode)
proc SelectItemRelative*(self: ptr IShellFolderViewDual2, iRelative: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SelectItemRelative(self, iRelative)
proc get_GroupBy*(self: ptr IShellFolderViewDual3, pbstrGroupBy: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_GroupBy(self, pbstrGroupBy)
proc put_GroupBy*(self: ptr IShellFolderViewDual3, bstrGroupBy: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.put_GroupBy(self, bstrGroupBy)
proc get_FolderFlags*(self: ptr IShellFolderViewDual3, pdwFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.get_FolderFlags(self, pdwFlags)
proc put_FolderFlags*(self: ptr IShellFolderViewDual3, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.put_FolderFlags(self, dwFlags)
proc get_SortColumns*(self: ptr IShellFolderViewDual3, pbstrSortColumns: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_SortColumns(self, pbstrSortColumns)
proc put_SortColumns*(self: ptr IShellFolderViewDual3, bstrSortColumns: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.put_SortColumns(self, bstrSortColumns)
proc put_IconSize*(self: ptr IShellFolderViewDual3, iIconSize: int32): HRESULT {.winapi, inline.} = self.lpVtbl.put_IconSize(self, iIconSize)
proc get_IconSize*(self: ptr IShellFolderViewDual3, piIconSize: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.get_IconSize(self, piIconSize)
proc FilterView*(self: ptr IShellFolderViewDual3, bstrFilterText: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.FilterView(self, bstrFilterText)
proc get_Application*(self: ptr IShellDispatch, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Application(self, ppid)
proc get_Parent*(self: ptr IShellDispatch, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.get_Parent(self, ppid)
proc NameSpace*(self: ptr IShellDispatch, vDir: VARIANT, ppsdf: ptr ptr Folder): HRESULT {.winapi, inline.} = self.lpVtbl.NameSpace(self, vDir, ppsdf)
proc BrowseForFolder*(self: ptr IShellDispatch, Hwnd: LONG, Title: BSTR, Options: LONG, RootFolder: VARIANT, ppsdf: ptr ptr Folder): HRESULT {.winapi, inline.} = self.lpVtbl.BrowseForFolder(self, Hwnd, Title, Options, RootFolder, ppsdf)
proc Windows*(self: ptr IShellDispatch, ppid: ptr ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.Windows(self, ppid)
proc Open*(self: ptr IShellDispatch, vDir: VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.Open(self, vDir)
proc Explore*(self: ptr IShellDispatch, vDir: VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.Explore(self, vDir)
proc MinimizeAll*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.MinimizeAll(self)
proc UndoMinimizeALL*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.UndoMinimizeALL(self)
proc FileRun*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.FileRun(self)
proc CascadeWindows*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.CascadeWindows(self)
proc TileVertically*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.TileVertically(self)
proc TileHorizontally*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.TileHorizontally(self)
proc ShutdownWindows*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.ShutdownWindows(self)
proc Suspend*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.Suspend(self)
proc EjectPC*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.EjectPC(self)
proc SetTime*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.SetTime(self)
proc TrayProperties*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.TrayProperties(self)
proc Help*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.Help(self)
proc FindFiles*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.FindFiles(self)
proc FindComputer*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.FindComputer(self)
proc RefreshMenu*(self: ptr IShellDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.RefreshMenu(self)
proc ControlPanelItem*(self: ptr IShellDispatch, bstrDir: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.ControlPanelItem(self, bstrDir)
proc IsRestricted*(self: ptr IShellDispatch2, Group: BSTR, Restriction: BSTR, plRestrictValue: ptr LONG): HRESULT {.winapi, inline.} = self.lpVtbl.IsRestricted(self, Group, Restriction, plRestrictValue)
proc ShellExecute*(self: ptr IShellDispatch2, File: BSTR, vArgs: VARIANT, vDir: VARIANT, vOperation: VARIANT, vShow: VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.ShellExecute(self, File, vArgs, vDir, vOperation, vShow)
proc FindPrinter*(self: ptr IShellDispatch2, name: BSTR, location: BSTR, model: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.FindPrinter(self, name, location, model)
proc GetSystemInformation*(self: ptr IShellDispatch2, name: BSTR, pv: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.GetSystemInformation(self, name, pv)
proc mServiceStart*(self: ptr IShellDispatch2, ServiceName: BSTR, Persistent: VARIANT, pSuccess: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.ServiceStart(self, ServiceName, Persistent, pSuccess)
proc mServiceStop*(self: ptr IShellDispatch2, ServiceName: BSTR, Persistent: VARIANT, pSuccess: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.ServiceStop(self, ServiceName, Persistent, pSuccess)
proc IsServiceRunning*(self: ptr IShellDispatch2, ServiceName: BSTR, pRunning: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.IsServiceRunning(self, ServiceName, pRunning)
proc CanStartStopService*(self: ptr IShellDispatch2, ServiceName: BSTR, pCanStartStop: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.CanStartStopService(self, ServiceName, pCanStartStop)
proc ShowBrowserBar*(self: ptr IShellDispatch2, bstrClsid: BSTR, bShow: VARIANT, pSuccess: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.ShowBrowserBar(self, bstrClsid, bShow, pSuccess)
proc AddToRecent*(self: ptr IShellDispatch3, varFile: VARIANT, bstrCategory: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.AddToRecent(self, varFile, bstrCategory)
proc WindowsSecurity*(self: ptr IShellDispatch4): HRESULT {.winapi, inline.} = self.lpVtbl.WindowsSecurity(self)
proc ToggleDesktop*(self: ptr IShellDispatch4): HRESULT {.winapi, inline.} = self.lpVtbl.ToggleDesktop(self)
proc ExplorerPolicy*(self: ptr IShellDispatch4, bstrPolicyName: BSTR, pValue: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.ExplorerPolicy(self, bstrPolicyName, pValue)
proc GetSetting*(self: ptr IShellDispatch4, lSetting: LONG, pResult: ptr VARIANT_BOOL): HRESULT {.winapi, inline.} = self.lpVtbl.GetSetting(self, lSetting, pResult)
proc WindowSwitcher*(self: ptr IShellDispatch5): HRESULT {.winapi, inline.} = self.lpVtbl.WindowSwitcher(self)
proc SearchCommand*(self: ptr IShellDispatch6): HRESULT {.winapi, inline.} = self.lpVtbl.SearchCommand(self)
proc SetFocus*(self: ptr IFileSearchBand): HRESULT {.winapi, inline.} = self.lpVtbl.SetFocus(self)
proc SetSearchParameters*(self: ptr IFileSearchBand, pbstrSearchID: ptr BSTR, bNavToResults: VARIANT_BOOL, pvarScope: ptr VARIANT, pvarQueryFile: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.SetSearchParameters(self, pbstrSearchID, bNavToResults, pvarScope, pvarQueryFile)
proc get_SearchID*(self: ptr IFileSearchBand, pbstrSearchID: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_SearchID(self, pbstrSearchID)
proc get_Scope*(self: ptr IFileSearchBand, pvarScope: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.get_Scope(self, pvarScope)
proc get_QueryFile*(self: ptr IFileSearchBand, pvarFile: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.get_QueryFile(self, pvarFile)
proc FinalBack*(self: ptr IWebWizardHost): HRESULT {.winapi, inline.} = self.lpVtbl.FinalBack(self)
proc FinalNext*(self: ptr IWebWizardHost): HRESULT {.winapi, inline.} = self.lpVtbl.FinalNext(self)
proc Cancel*(self: ptr IWebWizardHost): HRESULT {.winapi, inline.} = self.lpVtbl.Cancel(self)
proc put_Caption*(self: ptr IWebWizardHost, bstrCaption: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.put_Caption(self, bstrCaption)
proc get_Caption*(self: ptr IWebWizardHost, pbstrCaption: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.get_Caption(self, pbstrCaption)
proc put_Property*(self: ptr IWebWizardHost, bstrPropertyName: BSTR, pvProperty: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.put_Property(self, bstrPropertyName, pvProperty)
proc get_Property*(self: ptr IWebWizardHost, bstrPropertyName: BSTR, pvProperty: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.get_Property(self, bstrPropertyName, pvProperty)
proc SetWizardButtons*(self: ptr IWebWizardHost, vfEnableBack: VARIANT_BOOL, vfEnableNext: VARIANT_BOOL, vfLastPage: VARIANT_BOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetWizardButtons(self, vfEnableBack, vfEnableNext, vfLastPage)
proc SetHeaderText*(self: ptr IWebWizardHost, bstrHeaderTitle: BSTR, bstrHeaderSubtitle: BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetHeaderText(self, bstrHeaderTitle, bstrHeaderSubtitle)
proc PassportAuthenticate*(self: ptr INewWDEvents, bstrSignInUrl: BSTR, pvfAuthenitcated: ptr VARIANT_BOOL): HRESULT {.winapi, inline.} = self.lpVtbl.PassportAuthenticate(self, bstrSignInUrl, pvfAuthenitcated)
proc Init*(self: ptr IAutoComplete, hwndEdit: HWND, punkACL: ptr IUnknown, pwszRegKeyPath: LPCWSTR, pwszQuickComplete: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Init(self, hwndEdit, punkACL, pwszRegKeyPath, pwszQuickComplete)
proc Enable*(self: ptr IAutoComplete, fEnable: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.Enable(self, fEnable)
proc SetOptions*(self: ptr IAutoComplete2, dwFlag: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetOptions(self, dwFlag)
proc GetOptions*(self: ptr IAutoComplete2, pdwFlag: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetOptions(self, pdwFlag)
proc NextItem*(self: ptr IEnumACString, pszUrl: LPWSTR, cchMax: ULONG, pulSortIndex: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.NextItem(self, pszUrl, cchMax, pulSortIndex)
proc SetEnumOptions*(self: ptr IEnumACString, dwOptions: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetEnumOptions(self, dwOptions)
proc GetEnumOptions*(self: ptr IEnumACString, pdwOptions: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetEnumOptions(self, pdwOptions)
proc SetAsyncMode*(self: ptr IDataObjectAsyncCapability, fDoOpAsync: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetAsyncMode(self, fDoOpAsync)
proc GetAsyncMode*(self: ptr IDataObjectAsyncCapability, pfIsOpAsync: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.GetAsyncMode(self, pfIsOpAsync)
proc StartOperation*(self: ptr IDataObjectAsyncCapability, pbcReserved: ptr IBindCtx): HRESULT {.winapi, inline.} = self.lpVtbl.StartOperation(self, pbcReserved)
proc InOperation*(self: ptr IDataObjectAsyncCapability, pfInAsyncOp: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.InOperation(self, pfInAsyncOp)
proc EndOperation*(self: ptr IDataObjectAsyncCapability, hResult: HRESULT, pbcReserved: ptr IBindCtx, dwEffects: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.EndOperation(self, hResult, pbcReserved, dwEffects)
proc GetCount*(self: ptr IObjectArray, pcObjects: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetCount(self, pcObjects)
proc GetAt*(self: ptr IObjectArray, uiIndex: UINT, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetAt(self, uiIndex, riid, ppv)
proc AddObject*(self: ptr IObjectCollection, punk: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.AddObject(self, punk)
proc AddFromArray*(self: ptr IObjectCollection, poaSource: ptr IObjectArray): HRESULT {.winapi, inline.} = self.lpVtbl.AddFromArray(self, poaSource)
proc RemoveObjectAt*(self: ptr IObjectCollection, uiIndex: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveObjectAt(self, uiIndex)
proc Clear*(self: ptr IObjectCollection): HRESULT {.winapi, inline.} = self.lpVtbl.Clear(self)
proc QueryContextMenu*(self: ptr IContextMenu, hmenu: HMENU, indexMenu: UINT, idCmdFirst: UINT, idCmdLast: UINT, uFlags: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.QueryContextMenu(self, hmenu, indexMenu, idCmdFirst, idCmdLast, uFlags)
proc InvokeCommand*(self: ptr IContextMenu, pici: ptr CMINVOKECOMMANDINFO): HRESULT {.winapi, inline.} = self.lpVtbl.InvokeCommand(self, pici)
proc GetCommandString*(self: ptr IContextMenu, idCmd: UINT_PTR, uType: UINT, pReserved: ptr UINT, pszName: cstring, cchMax: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetCommandString(self, idCmd, uType, pReserved, pszName, cchMax)
proc HandleMenuMsg*(self: ptr IContextMenu2, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.winapi, inline.} = self.lpVtbl.HandleMenuMsg(self, uMsg, wParam, lParam)
proc HandleMenuMsg2*(self: ptr IContextMenu3, uMsg: UINT, wParam: WPARAM, lParam: LPARAM, plResult: ptr LRESULT): HRESULT {.winapi, inline.} = self.lpVtbl.HandleMenuMsg2(self, uMsg, wParam, lParam, plResult)
proc SetKeyState*(self: ptr IExecuteCommand, grfKeyState: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetKeyState(self, grfKeyState)
proc SetParameters*(self: ptr IExecuteCommand, pszParameters: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetParameters(self, pszParameters)
proc SetPosition*(self: ptr IExecuteCommand, pt: POINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetPosition(self, pt)
proc SetShowWindow*(self: ptr IExecuteCommand, nShow: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetShowWindow(self, nShow)
proc SetNoShowUI*(self: ptr IExecuteCommand, fNoShowUI: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetNoShowUI(self, fNoShowUI)
proc SetDirectory*(self: ptr IExecuteCommand, pszDirectory: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetDirectory(self, pszDirectory)
proc Execute*(self: ptr IExecuteCommand): HRESULT {.winapi, inline.} = self.lpVtbl.Execute(self)
proc Initialize*(self: ptr IPersistFolder, pidl: PCIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, pidl)
proc Run*(self: ptr IRunnableTask): HRESULT {.winapi, inline.} = self.lpVtbl.Run(self)
proc Kill*(self: ptr IRunnableTask, bWait: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.Kill(self, bWait)
proc Suspend*(self: ptr IRunnableTask): HRESULT {.winapi, inline.} = self.lpVtbl.Suspend(self)
proc Resume*(self: ptr IRunnableTask): HRESULT {.winapi, inline.} = self.lpVtbl.Resume(self)
proc IsRunning*(self: ptr IRunnableTask): ULONG {.winapi, inline.} = self.lpVtbl.IsRunning(self)
proc AddTask*(self: ptr IShellTaskScheduler, prt: ptr IRunnableTask, rtoid: REFTASKOWNERID, lParam: DWORD_PTR, dwPriority: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.AddTask(self, prt, rtoid, lParam, dwPriority)
proc RemoveTasks*(self: ptr IShellTaskScheduler, rtoid: REFTASKOWNERID, lParam: DWORD_PTR, bWaitIfRunning: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveTasks(self, rtoid, lParam, bWaitIfRunning)
proc CountTasks*(self: ptr IShellTaskScheduler, rtoid: REFTASKOWNERID): UINT {.winapi, inline.} = self.lpVtbl.CountTasks(self, rtoid)
proc Status*(self: ptr IShellTaskScheduler, dwReleaseStatus: DWORD, dwThreadTimeout: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Status(self, dwReleaseStatus, dwThreadTimeout)
proc GetCodePage*(self: ptr IQueryCodePage, puiCodePage: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetCodePage(self, puiCodePage)
proc SetCodePage*(self: ptr IQueryCodePage, uiCodePage: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetCodePage(self, uiCodePage)
proc GetCurFolder*(self: ptr IPersistFolder2, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.GetCurFolder(self, ppidl)
proc InitializeEx*(self: ptr IPersistFolder3, pbc: ptr IBindCtx, pidlRoot: PCIDLIST_ABSOLUTE, ppfti: ptr PERSIST_FOLDER_TARGET_INFO): HRESULT {.winapi, inline.} = self.lpVtbl.InitializeEx(self, pbc, pidlRoot, ppfti)
proc GetFolderTargetInfo*(self: ptr IPersistFolder3, ppfti: ptr PERSIST_FOLDER_TARGET_INFO): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolderTargetInfo(self, ppfti)
proc SetIDList*(self: ptr IPersistIDList, pidl: PCIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.SetIDList(self, pidl)
proc GetIDList*(self: ptr IPersistIDList, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.GetIDList(self, ppidl)
proc Next*(self: ptr IEnumIDList, celt: ULONG, rgelt: ptr PITEMID_CHILD, pceltFetched: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Next(self, celt, rgelt, pceltFetched)
proc Skip*(self: ptr IEnumIDList, celt: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Skip(self, celt)
proc Reset*(self: ptr IEnumIDList): HRESULT {.winapi, inline.} = self.lpVtbl.Reset(self)
proc Clone*(self: ptr IEnumIDList, ppenum: ptr ptr IEnumIDList): HRESULT {.winapi, inline.} = self.lpVtbl.Clone(self, ppenum)
proc Next*(self: ptr IEnumFullIDList, celt: ULONG, rgelt: ptr PIDLIST_ABSOLUTE, pceltFetched: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Next(self, celt, rgelt, pceltFetched)
proc Skip*(self: ptr IEnumFullIDList, celt: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Skip(self, celt)
proc Reset*(self: ptr IEnumFullIDList): HRESULT {.winapi, inline.} = self.lpVtbl.Reset(self)
proc Clone*(self: ptr IEnumFullIDList, ppenum: ptr ptr IEnumFullIDList): HRESULT {.winapi, inline.} = self.lpVtbl.Clone(self, ppenum)
proc SetMode*(self: ptr IObjectWithFolderEnumMode, feMode: FOLDER_ENUM_MODE): HRESULT {.winapi, inline.} = self.lpVtbl.SetMode(self, feMode)
proc GetMode*(self: ptr IObjectWithFolderEnumMode, pfeMode: ptr FOLDER_ENUM_MODE): HRESULT {.winapi, inline.} = self.lpVtbl.GetMode(self, pfeMode)
proc SetItem*(self: ptr IParseAndCreateItem, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.SetItem(self, psi)
proc GetItem*(self: ptr IParseAndCreateItem, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetItem(self, riid, ppv)
proc ParseDisplayName*(self: ptr IShellFolder, hwnd: HWND, pbc: ptr IBindCtx, pszDisplayName: LPWSTR, pchEaten: ptr ULONG, ppidl: ptr PIDLIST_RELATIVE, pdwAttributes: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.ParseDisplayName(self, hwnd, pbc, pszDisplayName, pchEaten, ppidl, pdwAttributes)
proc EnumObjects*(self: ptr IShellFolder, hwnd: HWND, grfFlags: SHCONTF, ppenumIDList: ptr ptr IEnumIDList): HRESULT {.winapi, inline.} = self.lpVtbl.EnumObjects(self, hwnd, grfFlags, ppenumIDList)
proc BindToObject*(self: ptr IShellFolder, pidl: PCUIDLIST_RELATIVE, pbc: ptr IBindCtx, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.BindToObject(self, pidl, pbc, riid, ppv)
proc BindToStorage*(self: ptr IShellFolder, pidl: PCUIDLIST_RELATIVE, pbc: ptr IBindCtx, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.BindToStorage(self, pidl, pbc, riid, ppv)
proc CompareIDs*(self: ptr IShellFolder, lParam: LPARAM, pidl1: PCUIDLIST_RELATIVE, pidl2: PCUIDLIST_RELATIVE): HRESULT {.winapi, inline.} = self.lpVtbl.CompareIDs(self, lParam, pidl1, pidl2)
proc CreateViewObject*(self: ptr IShellFolder, hwndOwner: HWND, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.CreateViewObject(self, hwndOwner, riid, ppv)
proc GetAttributesOf*(self: ptr IShellFolder, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, rgfInOut: ptr SFGAOF): HRESULT {.winapi, inline.} = self.lpVtbl.GetAttributesOf(self, cidl, apidl, rgfInOut)
proc GetUIObjectOf*(self: ptr IShellFolder, hwndOwner: HWND, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, riid: REFIID, rgfReserved: ptr UINT, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetUIObjectOf(self, hwndOwner, cidl, apidl, riid, rgfReserved, ppv)
proc GetDisplayNameOf*(self: ptr IShellFolder, pidl: PCUITEMID_CHILD, uFlags: SHGDNF, pName: ptr STRRET): HRESULT {.winapi, inline.} = self.lpVtbl.GetDisplayNameOf(self, pidl, uFlags, pName)
proc SetNameOf*(self: ptr IShellFolder, hwnd: HWND, pidl: PCUITEMID_CHILD, pszName: LPCWSTR, uFlags: SHGDNF, ppidlOut: ptr PITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.SetNameOf(self, hwnd, pidl, pszName, uFlags, ppidlOut)
proc Next*(self: ptr IEnumExtraSearch, celt: ULONG, rgelt: ptr EXTRASEARCH, pceltFetched: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Next(self, celt, rgelt, pceltFetched)
proc Skip*(self: ptr IEnumExtraSearch, celt: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Skip(self, celt)
proc Reset*(self: ptr IEnumExtraSearch): HRESULT {.winapi, inline.} = self.lpVtbl.Reset(self)
proc Clone*(self: ptr IEnumExtraSearch, ppenum: ptr ptr IEnumExtraSearch): HRESULT {.winapi, inline.} = self.lpVtbl.Clone(self, ppenum)
proc GetDefaultSearchGUID*(self: ptr IShellFolder2, pguid: ptr GUID): HRESULT {.winapi, inline.} = self.lpVtbl.GetDefaultSearchGUID(self, pguid)
proc EnumSearches*(self: ptr IShellFolder2, ppenum: ptr ptr IEnumExtraSearch): HRESULT {.winapi, inline.} = self.lpVtbl.EnumSearches(self, ppenum)
proc GetDefaultColumn*(self: ptr IShellFolder2, dwRes: DWORD, pSort: ptr ULONG, pDisplay: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.GetDefaultColumn(self, dwRes, pSort, pDisplay)
proc GetDefaultColumnState*(self: ptr IShellFolder2, iColumn: UINT, pcsFlags: ptr SHCOLSTATEF): HRESULT {.winapi, inline.} = self.lpVtbl.GetDefaultColumnState(self, iColumn, pcsFlags)
proc GetDetailsEx*(self: ptr IShellFolder2, pidl: PCUITEMID_CHILD, pscid: ptr SHCOLUMNID, pv: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.GetDetailsEx(self, pidl, pscid, pv)
proc GetDetailsOf*(self: ptr IShellFolder2, pidl: PCUITEMID_CHILD, iColumn: UINT, psd: ptr SHELLDETAILS): HRESULT {.winapi, inline.} = self.lpVtbl.GetDetailsOf(self, pidl, iColumn, psd)
proc MapColumnToSCID*(self: ptr IShellFolder2, iColumn: UINT, pscid: ptr SHCOLUMNID): HRESULT {.winapi, inline.} = self.lpVtbl.MapColumnToSCID(self, iColumn, pscid)
proc SetFolderViewOptions*(self: ptr IFolderViewOptions, fvoMask: FOLDERVIEWOPTIONS, fvoFlags: FOLDERVIEWOPTIONS): HRESULT {.winapi, inline.} = self.lpVtbl.SetFolderViewOptions(self, fvoMask, fvoFlags)
proc GetFolderViewOptions*(self: ptr IFolderViewOptions, pfvoFlags: ptr FOLDERVIEWOPTIONS): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolderViewOptions(self, pfvoFlags)
proc TranslateAccelerator*(self: ptr IShellView, pmsg: ptr MSG): HRESULT {.winapi, inline.} = self.lpVtbl.TranslateAccelerator(self, pmsg)
proc EnableModeless*(self: ptr IShellView, fEnable: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.EnableModeless(self, fEnable)
proc UIActivate*(self: ptr IShellView, uState: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.UIActivate(self, uState)
proc Refresh*(self: ptr IShellView): HRESULT {.winapi, inline.} = self.lpVtbl.Refresh(self)
proc CreateViewWindow*(self: ptr IShellView, psvPrevious: ptr IShellView, pfs: LPCFOLDERSETTINGS, psb: ptr IShellBrowser, prcView: ptr RECT, phWnd: ptr HWND): HRESULT {.winapi, inline.} = self.lpVtbl.CreateViewWindow(self, psvPrevious, pfs, psb, prcView, phWnd)
proc DestroyViewWindow*(self: ptr IShellView): HRESULT {.winapi, inline.} = self.lpVtbl.DestroyViewWindow(self)
proc GetCurrentInfo*(self: ptr IShellView, pfs: LPFOLDERSETTINGS): HRESULT {.winapi, inline.} = self.lpVtbl.GetCurrentInfo(self, pfs)
proc AddPropertySheetPages*(self: ptr IShellView, dwReserved: DWORD, pfn: LPFNSVADDPROPSHEETPAGE, lparam: LPARAM): HRESULT {.winapi, inline.} = self.lpVtbl.AddPropertySheetPages(self, dwReserved, pfn, lparam)
proc SaveViewState*(self: ptr IShellView): HRESULT {.winapi, inline.} = self.lpVtbl.SaveViewState(self)
proc SelectItem*(self: ptr IShellView, pidlItem: PCUITEMID_CHILD, uFlags: SVSIF): HRESULT {.winapi, inline.} = self.lpVtbl.SelectItem(self, pidlItem, uFlags)
proc GetItemObject*(self: ptr IShellView, uItem: UINT, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetItemObject(self, uItem, riid, ppv)
proc GetView*(self: ptr IShellView2, pvid: ptr SHELLVIEWID, uView: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.GetView(self, pvid, uView)
proc CreateViewWindow2*(self: ptr IShellView2, lpParams: LPSV2CVW2_PARAMS): HRESULT {.winapi, inline.} = self.lpVtbl.CreateViewWindow2(self, lpParams)
proc HandleRename*(self: ptr IShellView2, pidlNew: PCUITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.HandleRename(self, pidlNew)
proc SelectAndPositionItem*(self: ptr IShellView2, pidlItem: PCUITEMID_CHILD, uFlags: UINT, ppt: ptr POINT): HRESULT {.winapi, inline.} = self.lpVtbl.SelectAndPositionItem(self, pidlItem, uFlags, ppt)
proc CreateViewWindow3*(self: ptr IShellView3, psbOwner: ptr IShellBrowser, psvPrev: ptr IShellView, dwViewFlags: SV3CVW3_FLAGS, dwMask: FOLDERFLAGS, dwFlags: FOLDERFLAGS, fvMode: FOLDERVIEWMODE, pvid: ptr SHELLVIEWID, prcView: ptr RECT, phwndView: ptr HWND): HRESULT {.winapi, inline.} = self.lpVtbl.CreateViewWindow3(self, psbOwner, psvPrev, dwViewFlags, dwMask, dwFlags, fvMode, pvid, prcView, phwndView)
proc GetCurrentViewMode*(self: ptr IFolderView, pViewMode: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetCurrentViewMode(self, pViewMode)
proc SetCurrentViewMode*(self: ptr IFolderView, ViewMode: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetCurrentViewMode(self, ViewMode)
proc GetFolder*(self: ptr IFolderView, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolder(self, riid, ppv)
proc Item*(self: ptr IFolderView, iItemIndex: int32, ppidl: ptr PITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.Item(self, iItemIndex, ppidl)
proc ItemCount*(self: ptr IFolderView, uFlags: UINT, pcItems: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.ItemCount(self, uFlags, pcItems)
proc Items*(self: ptr IFolderView, uFlags: UINT, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.Items(self, uFlags, riid, ppv)
proc GetSelectionMarkedItem*(self: ptr IFolderView, piItem: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetSelectionMarkedItem(self, piItem)
proc GetFocusedItem*(self: ptr IFolderView, piItem: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetFocusedItem(self, piItem)
proc GetItemPosition*(self: ptr IFolderView, pidl: PCUITEMID_CHILD, ppt: ptr POINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetItemPosition(self, pidl, ppt)
proc GetSpacing*(self: ptr IFolderView, ppt: ptr POINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetSpacing(self, ppt)
proc GetDefaultSpacing*(self: ptr IFolderView, ppt: ptr POINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetDefaultSpacing(self, ppt)
proc GetAutoArrange*(self: ptr IFolderView): HRESULT {.winapi, inline.} = self.lpVtbl.GetAutoArrange(self)
proc SelectItem*(self: ptr IFolderView, iItem: int32, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SelectItem(self, iItem, dwFlags)
proc SelectAndPositionItems*(self: ptr IFolderView, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, apt: ptr POINT, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SelectAndPositionItems(self, cidl, apidl, apt, dwFlags)
proc GetCondition*(self: ptr ISearchBoxInfo, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetCondition(self, riid, ppv)
proc GetText*(self: ptr ISearchBoxInfo, ppsz: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetText(self, ppsz)
proc SetGroupBy*(self: ptr IFolderView2, key: REFPROPERTYKEY, fAscending: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetGroupBy(self, key, fAscending)
proc GetGroupBy*(self: ptr IFolderView2, pkey: ptr PROPERTYKEY, pfAscending: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.GetGroupBy(self, pkey, pfAscending)
proc SetViewProperty*(self: ptr IFolderView2, pidl: PCUITEMID_CHILD, propkey: REFPROPERTYKEY, propvar: REFPROPVARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.SetViewProperty(self, pidl, propkey, propvar)
proc GetViewProperty*(self: ptr IFolderView2, pidl: PCUITEMID_CHILD, propkey: REFPROPERTYKEY, ppropvar: ptr PROPVARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.GetViewProperty(self, pidl, propkey, ppropvar)
proc SetTileViewProperties*(self: ptr IFolderView2, pidl: PCUITEMID_CHILD, pszPropList: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetTileViewProperties(self, pidl, pszPropList)
proc SetExtendedTileViewProperties*(self: ptr IFolderView2, pidl: PCUITEMID_CHILD, pszPropList: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetExtendedTileViewProperties(self, pidl, pszPropList)
proc SetText*(self: ptr IFolderView2, iType: FVTEXTTYPE, pwszText: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetText(self, iType, pwszText)
proc SetCurrentFolderFlags*(self: ptr IFolderView2, dwMask: DWORD, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetCurrentFolderFlags(self, dwMask, dwFlags)
proc GetCurrentFolderFlags*(self: ptr IFolderView2, pdwFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetCurrentFolderFlags(self, pdwFlags)
proc GetSortColumnCount*(self: ptr IFolderView2, pcColumns: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetSortColumnCount(self, pcColumns)
proc SetSortColumns*(self: ptr IFolderView2, rgSortColumns: ptr SORTCOLUMN, cColumns: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetSortColumns(self, rgSortColumns, cColumns)
proc GetSortColumns*(self: ptr IFolderView2, rgSortColumns: ptr SORTCOLUMN, cColumns: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetSortColumns(self, rgSortColumns, cColumns)
proc GetItem*(self: ptr IFolderView2, iItem: int32, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetItem(self, iItem, riid, ppv)
proc GetVisibleItem*(self: ptr IFolderView2, iStart: int32, fPrevious: WINBOOL, piItem: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetVisibleItem(self, iStart, fPrevious, piItem)
proc GetSelectedItem*(self: ptr IFolderView2, iStart: int32, piItem: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetSelectedItem(self, iStart, piItem)
proc GetSelection*(self: ptr IFolderView2, fNoneImpliesFolder: WINBOOL, ppsia: ptr ptr IShellItemArray): HRESULT {.winapi, inline.} = self.lpVtbl.GetSelection(self, fNoneImpliesFolder, ppsia)
proc GetSelectionState*(self: ptr IFolderView2, pidl: PCUITEMID_CHILD, pdwFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetSelectionState(self, pidl, pdwFlags)
proc InvokeVerbOnSelection*(self: ptr IFolderView2, pszVerb: LPCSTR): HRESULT {.winapi, inline.} = self.lpVtbl.InvokeVerbOnSelection(self, pszVerb)
proc SetViewModeAndIconSize*(self: ptr IFolderView2, uViewMode: FOLDERVIEWMODE, iImageSize: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetViewModeAndIconSize(self, uViewMode, iImageSize)
proc GetViewModeAndIconSize*(self: ptr IFolderView2, puViewMode: ptr FOLDERVIEWMODE, piImageSize: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetViewModeAndIconSize(self, puViewMode, piImageSize)
proc SetGroupSubsetCount*(self: ptr IFolderView2, cVisibleRows: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetGroupSubsetCount(self, cVisibleRows)
proc GetGroupSubsetCount*(self: ptr IFolderView2, pcVisibleRows: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetGroupSubsetCount(self, pcVisibleRows)
proc SetRedraw*(self: ptr IFolderView2, fRedrawOn: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetRedraw(self, fRedrawOn)
proc IsMoveInSameFolder*(self: ptr IFolderView2): HRESULT {.winapi, inline.} = self.lpVtbl.IsMoveInSameFolder(self)
proc DoRename*(self: ptr IFolderView2): HRESULT {.winapi, inline.} = self.lpVtbl.DoRename(self)
proc GetColumnPropertyList*(self: ptr IFolderViewSettings, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetColumnPropertyList(self, riid, ppv)
proc GetGroupByProperty*(self: ptr IFolderViewSettings, pkey: ptr PROPERTYKEY, pfGroupAscending: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.GetGroupByProperty(self, pkey, pfGroupAscending)
proc GetViewMode*(self: ptr IFolderViewSettings, plvm: ptr FOLDERLOGICALVIEWMODE): HRESULT {.winapi, inline.} = self.lpVtbl.GetViewMode(self, plvm)
proc GetIconSize*(self: ptr IFolderViewSettings, puIconSize: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetIconSize(self, puIconSize)
proc GetFolderFlags*(self: ptr IFolderViewSettings, pfolderMask: ptr FOLDERFLAGS, pfolderFlags: ptr FOLDERFLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolderFlags(self, pfolderMask, pfolderFlags)
proc GetSortColumns*(self: ptr IFolderViewSettings, rgSortColumns: ptr SORTCOLUMN, cColumnsIn: UINT, pcColumnsOut: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetSortColumns(self, rgSortColumns, cColumnsIn, pcColumnsOut)
proc GetGroupSubsetCount*(self: ptr IFolderViewSettings, pcVisibleRows: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetGroupSubsetCount(self, pcVisibleRows)
proc mSetBackgroundColor*(self: ptr IPreviewHandlerVisuals, color: COLORREF): HRESULT {.winapi, inline.} = self.lpVtbl.SetBackgroundColor(self, color)
proc SetFont*(self: ptr IPreviewHandlerVisuals, plf: ptr LOGFONTW): HRESULT {.winapi, inline.} = self.lpVtbl.SetFont(self, plf)
proc SetTextColor*(self: ptr IPreviewHandlerVisuals, color: COLORREF): HRESULT {.winapi, inline.} = self.lpVtbl.SetTextColor(self, color)
proc SetWatermark*(self: ptr IVisualProperties, hbmp: HBITMAP, vpwf: VPWATERMARKFLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.SetWatermark(self, hbmp, vpwf)
proc SetColor*(self: ptr IVisualProperties, vpcf: VPCOLORFLAGS, cr: COLORREF): HRESULT {.winapi, inline.} = self.lpVtbl.SetColor(self, vpcf, cr)
proc GetColor*(self: ptr IVisualProperties, vpcf: VPCOLORFLAGS, pcr: ptr COLORREF): HRESULT {.winapi, inline.} = self.lpVtbl.GetColor(self, vpcf, pcr)
proc SetItemHeight*(self: ptr IVisualProperties, cyItemInPixels: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetItemHeight(self, cyItemInPixels)
proc GetItemHeight*(self: ptr IVisualProperties, cyItemInPixels: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetItemHeight(self, cyItemInPixels)
proc SetFont*(self: ptr IVisualProperties, plf: ptr LOGFONTW, bRedraw: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetFont(self, plf, bRedraw)
proc GetFont*(self: ptr IVisualProperties, plf: ptr LOGFONTW): HRESULT {.winapi, inline.} = self.lpVtbl.GetFont(self, plf)
proc SetTheme*(self: ptr IVisualProperties, pszSubAppName: LPCWSTR, pszSubIdList: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetTheme(self, pszSubAppName, pszSubIdList)
proc OnDefaultCommand*(self: ptr ICommDlgBrowser, ppshv: ptr IShellView): HRESULT {.winapi, inline.} = self.lpVtbl.OnDefaultCommand(self, ppshv)
proc OnStateChange*(self: ptr ICommDlgBrowser, ppshv: ptr IShellView, uChange: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.OnStateChange(self, ppshv, uChange)
proc IncludeObject*(self: ptr ICommDlgBrowser, ppshv: ptr IShellView, pidl: PCUITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.IncludeObject(self, ppshv, pidl)
proc Notify*(self: ptr ICommDlgBrowser2, ppshv: ptr IShellView, dwNotifyType: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Notify(self, ppshv, dwNotifyType)
proc GetDefaultMenuText*(self: ptr ICommDlgBrowser2, ppshv: ptr IShellView, pszText: LPWSTR, cchMax: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetDefaultMenuText(self, ppshv, pszText, cchMax)
proc GetViewFlags*(self: ptr ICommDlgBrowser2, pdwFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetViewFlags(self, pdwFlags)
proc OnColumnClicked*(self: ptr ICommDlgBrowser3, ppshv: ptr IShellView, iColumn: int32): HRESULT {.winapi, inline.} = self.lpVtbl.OnColumnClicked(self, ppshv, iColumn)
proc GetCurrentFilter*(self: ptr ICommDlgBrowser3, pszFileSpec: LPWSTR, cchFileSpec: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetCurrentFilter(self, pszFileSpec, cchFileSpec)
proc OnPreViewCreated*(self: ptr ICommDlgBrowser3, ppshv: ptr IShellView): HRESULT {.winapi, inline.} = self.lpVtbl.OnPreViewCreated(self, ppshv)
proc SetColumnInfo*(self: ptr IColumnManager, propkey: REFPROPERTYKEY, pcmci: ptr CM_COLUMNINFO): HRESULT {.winapi, inline.} = self.lpVtbl.SetColumnInfo(self, propkey, pcmci)
proc GetColumnInfo*(self: ptr IColumnManager, propkey: REFPROPERTYKEY, pcmci: ptr CM_COLUMNINFO): HRESULT {.winapi, inline.} = self.lpVtbl.GetColumnInfo(self, propkey, pcmci)
proc GetColumnCount*(self: ptr IColumnManager, dwFlags: CM_ENUM_FLAGS, puCount: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetColumnCount(self, dwFlags, puCount)
proc GetColumns*(self: ptr IColumnManager, dwFlags: CM_ENUM_FLAGS, rgkeyOrder: ptr PROPERTYKEY, cColumns: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetColumns(self, dwFlags, rgkeyOrder, cColumns)
proc SetColumns*(self: ptr IColumnManager, rgkeyOrder: ptr PROPERTYKEY, cVisible: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetColumns(self, rgkeyOrder, cVisible)
proc SetFilter*(self: ptr IFolderFilterSite, punk: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.SetFilter(self, punk)
proc ShouldShow*(self: ptr IFolderFilter, psf: ptr IShellFolder, pidlFolder: PCIDLIST_ABSOLUTE, pidlItem: PCUITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.ShouldShow(self, psf, pidlFolder, pidlItem)
proc GetEnumFlags*(self: ptr IFolderFilter, psf: ptr IShellFolder, pidlFolder: PCIDLIST_ABSOLUTE, phwnd: ptr HWND, pgrfFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetEnumFlags(self, psf, pidlFolder, phwnd, pgrfFlags)
proc OnFocusChangeIS*(self: ptr IInputObjectSite, punkObj: ptr IUnknown, fSetFocus: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.OnFocusChangeIS(self, punkObj, fSetFocus)
proc UIActivateIO*(self: ptr IInputObject, fActivate: WINBOOL, pMsg: ptr MSG): HRESULT {.winapi, inline.} = self.lpVtbl.UIActivateIO(self, fActivate, pMsg)
proc HasFocusIO*(self: ptr IInputObject): HRESULT {.winapi, inline.} = self.lpVtbl.HasFocusIO(self)
proc TranslateAcceleratorIO*(self: ptr IInputObject, pMsg: ptr MSG): HRESULT {.winapi, inline.} = self.lpVtbl.TranslateAcceleratorIO(self, pMsg)
proc TranslateAcceleratorGlobal*(self: ptr IInputObject2, pMsg: ptr MSG): HRESULT {.winapi, inline.} = self.lpVtbl.TranslateAcceleratorGlobal(self, pMsg)
proc GetIconOf*(self: ptr IShellIcon, pidl: PCUITEMID_CHILD, flags: UINT, pIconIndex: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetIconOf(self, pidl, flags, pIconIndex)
proc InsertMenusSB*(self: ptr IShellBrowser, hmenuShared: HMENU, lpMenuWidths: LPOLEMENUGROUPWIDTHS): HRESULT {.winapi, inline.} = self.lpVtbl.InsertMenusSB(self, hmenuShared, lpMenuWidths)
proc SetMenuSB*(self: ptr IShellBrowser, hmenuShared: HMENU, holemenuRes: HOLEMENU, hwndActiveObject: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.SetMenuSB(self, hmenuShared, holemenuRes, hwndActiveObject)
proc RemoveMenusSB*(self: ptr IShellBrowser, hmenuShared: HMENU): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveMenusSB(self, hmenuShared)
proc SetStatusTextSB*(self: ptr IShellBrowser, pszStatusText: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetStatusTextSB(self, pszStatusText)
proc EnableModelessSB*(self: ptr IShellBrowser, fEnable: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.EnableModelessSB(self, fEnable)
proc TranslateAcceleratorSB*(self: ptr IShellBrowser, pmsg: ptr MSG, wID: WORD): HRESULT {.winapi, inline.} = self.lpVtbl.TranslateAcceleratorSB(self, pmsg, wID)
proc BrowseObject*(self: ptr IShellBrowser, pidl: PCUIDLIST_RELATIVE, wFlags: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.BrowseObject(self, pidl, wFlags)
proc GetViewStateStream*(self: ptr IShellBrowser, grfMode: DWORD, ppStrm: ptr ptr IStream): HRESULT {.winapi, inline.} = self.lpVtbl.GetViewStateStream(self, grfMode, ppStrm)
proc GetControlWindow*(self: ptr IShellBrowser, id: UINT, phwnd: ptr HWND): HRESULT {.winapi, inline.} = self.lpVtbl.GetControlWindow(self, id, phwnd)
proc SendControlMsg*(self: ptr IShellBrowser, id: UINT, uMsg: UINT, wParam: WPARAM, lParam: LPARAM, pret: ptr LRESULT): HRESULT {.winapi, inline.} = self.lpVtbl.SendControlMsg(self, id, uMsg, wParam, lParam, pret)
proc QueryActiveShellView*(self: ptr IShellBrowser, ppshv: ptr ptr IShellView): HRESULT {.winapi, inline.} = self.lpVtbl.QueryActiveShellView(self, ppshv)
proc OnViewWindowActive*(self: ptr IShellBrowser, pshv: ptr IShellView): HRESULT {.winapi, inline.} = self.lpVtbl.OnViewWindowActive(self, pshv)
proc SetToolbarItems*(self: ptr IShellBrowser, lpButtons: LPTBBUTTONSB, nButtons: UINT, uFlags: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetToolbarItems(self, lpButtons, nButtons, uFlags)
proc ProfferService*(self: ptr IProfferService, guidService: REFGUID, psp: ptr IServiceProvider, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.ProfferService(self, guidService, psp, pdwCookie)
proc RevokeService*(self: ptr IProfferService, dwCookie: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.RevokeService(self, dwCookie)
proc BindToHandler*(self: ptr IShellItem, pbc: ptr IBindCtx, bhid: REFGUID, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.BindToHandler(self, pbc, bhid, riid, ppv)
proc GetParent*(self: ptr IShellItem, ppsi: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.GetParent(self, ppsi)
proc GetDisplayName*(self: ptr IShellItem, sigdnName: SIGDN, ppszName: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetDisplayName(self, sigdnName, ppszName)
proc GetAttributes*(self: ptr IShellItem, sfgaoMask: SFGAOF, psfgaoAttribs: ptr SFGAOF): HRESULT {.winapi, inline.} = self.lpVtbl.GetAttributes(self, sfgaoMask, psfgaoAttribs)
proc Compare*(self: ptr IShellItem, psi: ptr IShellItem, hint: SICHINTF, piOrder: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.Compare(self, psi, hint, piOrder)
proc GetPropertyStore*(self: ptr IShellItem2, flags: GETPROPERTYSTOREFLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetPropertyStore(self, flags, riid, ppv)
proc GetPropertyStoreWithCreateObject*(self: ptr IShellItem2, flags: GETPROPERTYSTOREFLAGS, punkCreateObject: ptr IUnknown, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetPropertyStoreWithCreateObject(self, flags, punkCreateObject, riid, ppv)
proc GetPropertyStoreForKeys*(self: ptr IShellItem2, rgKeys: ptr PROPERTYKEY, cKeys: UINT, flags: GETPROPERTYSTOREFLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetPropertyStoreForKeys(self, rgKeys, cKeys, flags, riid, ppv)
proc GetPropertyDescriptionList*(self: ptr IShellItem2, keyType: REFPROPERTYKEY, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetPropertyDescriptionList(self, keyType, riid, ppv)
proc Update*(self: ptr IShellItem2, pbc: ptr IBindCtx): HRESULT {.winapi, inline.} = self.lpVtbl.Update(self, pbc)
proc GetProperty*(self: ptr IShellItem2, key: REFPROPERTYKEY, ppropvar: ptr PROPVARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.GetProperty(self, key, ppropvar)
proc GetCLSID*(self: ptr IShellItem2, key: REFPROPERTYKEY, pclsid: ptr CLSID): HRESULT {.winapi, inline.} = self.lpVtbl.GetCLSID(self, key, pclsid)
proc GetFileTime*(self: ptr IShellItem2, key: REFPROPERTYKEY, pft: ptr FILETIME): HRESULT {.winapi, inline.} = self.lpVtbl.GetFileTime(self, key, pft)
proc GetInt32*(self: ptr IShellItem2, key: REFPROPERTYKEY, pi: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetInt32(self, key, pi)
proc GetString*(self: ptr IShellItem2, key: REFPROPERTYKEY, ppsz: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetString(self, key, ppsz)
proc GetUInt32*(self: ptr IShellItem2, key: REFPROPERTYKEY, pui: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.GetUInt32(self, key, pui)
proc GetUInt64*(self: ptr IShellItem2, key: REFPROPERTYKEY, pull: ptr ULONGLONG): HRESULT {.winapi, inline.} = self.lpVtbl.GetUInt64(self, key, pull)
proc GetBool*(self: ptr IShellItem2, key: REFPROPERTYKEY, pf: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.GetBool(self, key, pf)
proc GetImage*(self: ptr IShellItemImageFactory, size: SIZE, flags: SIIGBF, phbm: ptr HBITMAP): HRESULT {.winapi, inline.} = self.lpVtbl.GetImage(self, size, flags, phbm)
proc OnPictureChange*(self: ptr IUserAccountChangeCallback, pszUserName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.OnPictureChange(self, pszUserName)
proc Next*(self: ptr IEnumShellItems, celt: ULONG, rgelt: ptr ptr IShellItem, pceltFetched: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Next(self, celt, rgelt, pceltFetched)
proc Skip*(self: ptr IEnumShellItems, celt: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Skip(self, celt)
proc Reset*(self: ptr IEnumShellItems): HRESULT {.winapi, inline.} = self.lpVtbl.Reset(self)
proc Clone*(self: ptr IEnumShellItems, ppenum: ptr ptr IEnumShellItems): HRESULT {.winapi, inline.} = self.lpVtbl.Clone(self, ppenum)
proc UpdateProgress*(self: ptr ITransferAdviseSink, ullSizeCurrent: ULONGLONG, ullSizeTotal: ULONGLONG, nFilesCurrent: int32, nFilesTotal: int32, nFoldersCurrent: int32, nFoldersTotal: int32): HRESULT {.winapi, inline.} = self.lpVtbl.UpdateProgress(self, ullSizeCurrent, ullSizeTotal, nFilesCurrent, nFilesTotal, nFoldersCurrent, nFoldersTotal)
proc UpdateTransferState*(self: ptr ITransferAdviseSink, ts: TRANSFER_ADVISE_STATE): HRESULT {.winapi, inline.} = self.lpVtbl.UpdateTransferState(self, ts)
proc ConfirmOverwrite*(self: ptr ITransferAdviseSink, psiSource: ptr IShellItem, psiDestParent: ptr IShellItem, pszName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.ConfirmOverwrite(self, psiSource, psiDestParent, pszName)
proc ConfirmEncryptionLoss*(self: ptr ITransferAdviseSink, psiSource: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.ConfirmEncryptionLoss(self, psiSource)
proc FileFailure*(self: ptr ITransferAdviseSink, psi: ptr IShellItem, pszItem: LPCWSTR, hrError: HRESULT, pszRename: LPWSTR, cchRename: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.FileFailure(self, psi, pszItem, hrError, pszRename, cchRename)
proc SubStreamFailure*(self: ptr ITransferAdviseSink, psi: ptr IShellItem, pszStreamName: LPCWSTR, hrError: HRESULT): HRESULT {.winapi, inline.} = self.lpVtbl.SubStreamFailure(self, psi, pszStreamName, hrError)
proc PropertyFailure*(self: ptr ITransferAdviseSink, psi: ptr IShellItem, pkey: ptr PROPERTYKEY, hrError: HRESULT): HRESULT {.winapi, inline.} = self.lpVtbl.PropertyFailure(self, psi, pkey, hrError)
proc Advise*(self: ptr ITransferSource, psink: ptr ITransferAdviseSink, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Advise(self, psink, pdwCookie)
proc Unadvise*(self: ptr ITransferSource, dwCookie: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Unadvise(self, dwCookie)
proc SetProperties*(self: ptr ITransferSource, pproparray: ptr IPropertyChangeArray): HRESULT {.winapi, inline.} = self.lpVtbl.SetProperties(self, pproparray)
proc OpenItem*(self: ptr ITransferSource, psi: ptr IShellItem, flags: TRANSFER_SOURCE_FLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.OpenItem(self, psi, flags, riid, ppv)
proc MoveItem*(self: ptr ITransferSource, psi: ptr IShellItem, psiParentDst: ptr IShellItem, pszNameDst: LPCWSTR, flags: TRANSFER_SOURCE_FLAGS, ppsiNew: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.MoveItem(self, psi, psiParentDst, pszNameDst, flags, ppsiNew)
proc RecycleItem*(self: ptr ITransferSource, psiSource: ptr IShellItem, psiParentDest: ptr IShellItem, flags: TRANSFER_SOURCE_FLAGS, ppsiNewDest: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.RecycleItem(self, psiSource, psiParentDest, flags, ppsiNewDest)
proc RemoveItem*(self: ptr ITransferSource, psiSource: ptr IShellItem, flags: TRANSFER_SOURCE_FLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveItem(self, psiSource, flags)
proc RenameItem*(self: ptr ITransferSource, psiSource: ptr IShellItem, pszNewName: LPCWSTR, flags: TRANSFER_SOURCE_FLAGS, ppsiNewDest: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.RenameItem(self, psiSource, pszNewName, flags, ppsiNewDest)
proc LinkItem*(self: ptr ITransferSource, psiSource: ptr IShellItem, psiParentDest: ptr IShellItem, pszNewName: LPCWSTR, flags: TRANSFER_SOURCE_FLAGS, ppsiNewDest: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.LinkItem(self, psiSource, psiParentDest, pszNewName, flags, ppsiNewDest)
proc ApplyPropertiesToItem*(self: ptr ITransferSource, psiSource: ptr IShellItem, ppsiNew: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.ApplyPropertiesToItem(self, psiSource, ppsiNew)
proc GetDefaultDestinationName*(self: ptr ITransferSource, psiSource: ptr IShellItem, psiParentDest: ptr IShellItem, ppszDestinationName: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetDefaultDestinationName(self, psiSource, psiParentDest, ppszDestinationName)
proc EnterFolder*(self: ptr ITransferSource, psiChildFolderDest: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.EnterFolder(self, psiChildFolderDest)
proc LeaveFolder*(self: ptr ITransferSource, psiChildFolderDest: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.LeaveFolder(self, psiChildFolderDest)
proc Next*(self: ptr IEnumResources, celt: ULONG, psir: ptr SHELL_ITEM_RESOURCE, pceltFetched: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Next(self, celt, psir, pceltFetched)
proc Skip*(self: ptr IEnumResources, celt: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Skip(self, celt)
proc Reset*(self: ptr IEnumResources): HRESULT {.winapi, inline.} = self.lpVtbl.Reset(self)
proc Clone*(self: ptr IEnumResources, ppenumr: ptr ptr IEnumResources): HRESULT {.winapi, inline.} = self.lpVtbl.Clone(self, ppenumr)
proc GetAttributes*(self: ptr IShellItemResources, pdwAttributes: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetAttributes(self, pdwAttributes)
proc GetSize*(self: ptr IShellItemResources, pullSize: ptr ULONGLONG): HRESULT {.winapi, inline.} = self.lpVtbl.GetSize(self, pullSize)
proc GetTimes*(self: ptr IShellItemResources, pftCreation: ptr FILETIME, pftWrite: ptr FILETIME, pftAccess: ptr FILETIME): HRESULT {.winapi, inline.} = self.lpVtbl.GetTimes(self, pftCreation, pftWrite, pftAccess)
proc SetTimes*(self: ptr IShellItemResources, pftCreation: ptr FILETIME, pftWrite: ptr FILETIME, pftAccess: ptr FILETIME): HRESULT {.winapi, inline.} = self.lpVtbl.SetTimes(self, pftCreation, pftWrite, pftAccess)
proc GetResourceDescription*(self: ptr IShellItemResources, pcsir: ptr SHELL_ITEM_RESOURCE, ppszDescription: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetResourceDescription(self, pcsir, ppszDescription)
proc EnumResources*(self: ptr IShellItemResources, ppenumr: ptr ptr IEnumResources): HRESULT {.winapi, inline.} = self.lpVtbl.EnumResources(self, ppenumr)
proc SupportsResource*(self: ptr IShellItemResources, pcsir: ptr SHELL_ITEM_RESOURCE): HRESULT {.winapi, inline.} = self.lpVtbl.SupportsResource(self, pcsir)
proc OpenResource*(self: ptr IShellItemResources, pcsir: ptr SHELL_ITEM_RESOURCE, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.OpenResource(self, pcsir, riid, ppv)
proc CreateResource*(self: ptr IShellItemResources, pcsir: ptr SHELL_ITEM_RESOURCE, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.CreateResource(self, pcsir, riid, ppv)
proc MarkForDelete*(self: ptr IShellItemResources): HRESULT {.winapi, inline.} = self.lpVtbl.MarkForDelete(self)
proc Advise*(self: ptr ITransferDestination, psink: ptr ITransferAdviseSink, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Advise(self, psink, pdwCookie)
proc Unadvise*(self: ptr ITransferDestination, dwCookie: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Unadvise(self, dwCookie)
proc CreateItem*(self: ptr ITransferDestination, pszName: LPCWSTR, dwAttributes: DWORD, ullSize: ULONGLONG, flags: TRANSFER_SOURCE_FLAGS, riidItem: REFIID, ppvItem: ptr pointer, riidResources: REFIID, ppvResources: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.CreateItem(self, pszName, dwAttributes, ullSize, flags, riidItem, ppvItem, riidResources, ppvResources)
proc ReadAsync*(self: ptr IStreamAsync, pv: pointer, cb: DWORD, pcbRead: LPDWORD, lpOverlapped: LPOVERLAPPED): HRESULT {.winapi, inline.} = self.lpVtbl.ReadAsync(self, pv, cb, pcbRead, lpOverlapped)
proc WriteAsync*(self: ptr IStreamAsync, lpBuffer: pointer, cb: DWORD, pcbWritten: LPDWORD, lpOverlapped: LPOVERLAPPED): HRESULT {.winapi, inline.} = self.lpVtbl.WriteAsync(self, lpBuffer, cb, pcbWritten, lpOverlapped)
proc OverlappedResult*(self: ptr IStreamAsync, lpOverlapped: LPOVERLAPPED, lpNumberOfBytesTransferred: LPDWORD, bWait: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.OverlappedResult(self, lpOverlapped, lpNumberOfBytesTransferred, bWait)
proc CancelIo*(self: ptr IStreamAsync): HRESULT {.winapi, inline.} = self.lpVtbl.CancelIo(self)
proc GetSectorSize*(self: ptr IStreamUnbufferedInfo, pcbSectorSize: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.GetSectorSize(self, pcbSectorSize)
proc StartOperations*(self: ptr IFileOperationProgressSink): HRESULT {.winapi, inline.} = self.lpVtbl.StartOperations(self)
proc FinishOperations*(self: ptr IFileOperationProgressSink, hrResult: HRESULT): HRESULT {.winapi, inline.} = self.lpVtbl.FinishOperations(self, hrResult)
proc PreRenameItem*(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, pszNewName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.PreRenameItem(self, dwFlags, psiItem, pszNewName)
proc PostRenameItem*(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, pszNewName: LPCWSTR, hrRename: HRESULT, psiNewlyCreated: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.PostRenameItem(self, dwFlags, psiItem, pszNewName, hrRename, psiNewlyCreated)
proc PreMoveItem*(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.PreMoveItem(self, dwFlags, psiItem, psiDestinationFolder, pszNewName)
proc PostMoveItem*(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR, hrMove: HRESULT, psiNewlyCreated: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.PostMoveItem(self, dwFlags, psiItem, psiDestinationFolder, pszNewName, hrMove, psiNewlyCreated)
proc PreCopyItem*(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.PreCopyItem(self, dwFlags, psiItem, psiDestinationFolder, pszNewName)
proc PostCopyItem*(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR, hrCopy: HRESULT, psiNewlyCreated: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.PostCopyItem(self, dwFlags, psiItem, psiDestinationFolder, pszNewName, hrCopy, psiNewlyCreated)
proc PreDeleteItem*(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.PreDeleteItem(self, dwFlags, psiItem)
proc PostDeleteItem*(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiItem: ptr IShellItem, hrDelete: HRESULT, psiNewlyCreated: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.PostDeleteItem(self, dwFlags, psiItem, hrDelete, psiNewlyCreated)
proc PreNewItem*(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.PreNewItem(self, dwFlags, psiDestinationFolder, pszNewName)
proc PostNewItem*(self: ptr IFileOperationProgressSink, dwFlags: DWORD, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR, pszTemplateName: LPCWSTR, dwFileAttributes: DWORD, hrNew: HRESULT, psiNewItem: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.PostNewItem(self, dwFlags, psiDestinationFolder, pszNewName, pszTemplateName, dwFileAttributes, hrNew, psiNewItem)
proc UpdateProgress*(self: ptr IFileOperationProgressSink, iWorkTotal: UINT, iWorkSoFar: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.UpdateProgress(self, iWorkTotal, iWorkSoFar)
proc ResetTimer*(self: ptr IFileOperationProgressSink): HRESULT {.winapi, inline.} = self.lpVtbl.ResetTimer(self)
proc PauseTimer*(self: ptr IFileOperationProgressSink): HRESULT {.winapi, inline.} = self.lpVtbl.PauseTimer(self)
proc ResumeTimer*(self: ptr IFileOperationProgressSink): HRESULT {.winapi, inline.} = self.lpVtbl.ResumeTimer(self)
proc BindToHandler*(self: ptr IShellItemArray, pbc: ptr IBindCtx, bhid: REFGUID, riid: REFIID, ppvOut: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.BindToHandler(self, pbc, bhid, riid, ppvOut)
proc GetPropertyStore*(self: ptr IShellItemArray, flags: GETPROPERTYSTOREFLAGS, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetPropertyStore(self, flags, riid, ppv)
proc GetPropertyDescriptionList*(self: ptr IShellItemArray, keyType: REFPROPERTYKEY, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetPropertyDescriptionList(self, keyType, riid, ppv)
proc GetAttributes*(self: ptr IShellItemArray, AttribFlags: SIATTRIBFLAGS, sfgaoMask: SFGAOF, psfgaoAttribs: ptr SFGAOF): HRESULT {.winapi, inline.} = self.lpVtbl.GetAttributes(self, AttribFlags, sfgaoMask, psfgaoAttribs)
proc GetCount*(self: ptr IShellItemArray, pdwNumItems: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetCount(self, pdwNumItems)
proc GetItemAt*(self: ptr IShellItemArray, dwIndex: DWORD, ppsi: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.GetItemAt(self, dwIndex, ppsi)
proc EnumItems*(self: ptr IShellItemArray, ppenumShellItems: ptr ptr IEnumShellItems): HRESULT {.winapi, inline.} = self.lpVtbl.EnumItems(self, ppenumShellItems)
proc Initialize*(self: ptr IInitializeWithItem, psi: ptr IShellItem, grfMode: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, psi, grfMode)
proc SetSelection*(self: ptr IObjectWithSelection, psia: ptr IShellItemArray): HRESULT {.winapi, inline.} = self.lpVtbl.SetSelection(self, psia)
proc GetSelection*(self: ptr IObjectWithSelection, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetSelection(self, riid, ppv)
proc RemoveBackReferences*(self: ptr IObjectWithBackReferences): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveBackReferences(self)
proc ParsePropertyName*(self: ptr IPropertyUI, pszName: LPCWSTR, pfmtid: ptr FMTID, ppid: ptr PROPID, pchEaten: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.ParsePropertyName(self, pszName, pfmtid, ppid, pchEaten)
proc GetCannonicalName*(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, pwszText: LPWSTR, cchText: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetCannonicalName(self, fmtid, pid, pwszText, cchText)
proc GetDisplayName*(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, flags: PROPERTYUI_NAME_FLAGS, pwszText: LPWSTR, cchText: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetDisplayName(self, fmtid, pid, flags, pwszText, cchText)
proc GetPropertyDescription*(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, pwszText: LPWSTR, cchText: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetPropertyDescription(self, fmtid, pid, pwszText, cchText)
proc GetDefaultWidth*(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, pcxChars: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.GetDefaultWidth(self, fmtid, pid, pcxChars)
proc GetFlags*(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, pflags: ptr PROPERTYUI_FLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.GetFlags(self, fmtid, pid, pflags)
proc FormatForDisplay*(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, ppropvar: ptr PROPVARIANT, puiff: PROPERTYUI_FORMAT_FLAGS, pwszText: LPWSTR, cchText: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.FormatForDisplay(self, fmtid, pid, ppropvar, puiff, pwszText, cchText)
proc GetHelpInfo*(self: ptr IPropertyUI, fmtid: REFFMTID, pid: PROPID, pwszHelpFile: LPWSTR, cch: DWORD, puHelpID: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetHelpInfo(self, fmtid, pid, pwszHelpFile, cch, puHelpID)
proc CanCategorizeOnSCID*(self: ptr ICategoryProvider, pscid: ptr SHCOLUMNID): HRESULT {.winapi, inline.} = self.lpVtbl.CanCategorizeOnSCID(self, pscid)
proc GetDefaultCategory*(self: ptr ICategoryProvider, pguid: ptr GUID, pscid: ptr SHCOLUMNID): HRESULT {.winapi, inline.} = self.lpVtbl.GetDefaultCategory(self, pguid, pscid)
proc GetCategoryForSCID*(self: ptr ICategoryProvider, pscid: ptr SHCOLUMNID, pguid: ptr GUID): HRESULT {.winapi, inline.} = self.lpVtbl.GetCategoryForSCID(self, pscid, pguid)
proc EnumCategories*(self: ptr ICategoryProvider, penum: ptr ptr IEnumGUID): HRESULT {.winapi, inline.} = self.lpVtbl.EnumCategories(self, penum)
proc GetCategoryName*(self: ptr ICategoryProvider, pguid: ptr GUID, pszName: LPWSTR, cch: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetCategoryName(self, pguid, pszName, cch)
proc CreateCategory*(self: ptr ICategoryProvider, pguid: ptr GUID, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.CreateCategory(self, pguid, riid, ppv)
proc GetDescription*(self: ptr ICategorizer, pszDesc: LPWSTR, cch: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetDescription(self, pszDesc, cch)
proc GetCategory*(self: ptr ICategorizer, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, rgCategoryIds: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetCategory(self, cidl, apidl, rgCategoryIds)
proc GetCategoryInfo*(self: ptr ICategorizer, dwCategoryId: DWORD, pci: ptr TCATEGORY_INFO): HRESULT {.winapi, inline.} = self.lpVtbl.GetCategoryInfo(self, dwCategoryId, pci)
proc CompareCategory*(self: ptr ICategorizer, csfFlags: CATSORT_FLAGS, dwCategoryId1: DWORD, dwCategoryId2: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.CompareCategory(self, csfFlags, dwCategoryId1, dwCategoryId2)
proc DragEnter*(self: ptr IDropTargetHelper, hwndTarget: HWND, pDataObject: ptr IDataObject, ppt: ptr POINT, dwEffect: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.DragEnter(self, hwndTarget, pDataObject, ppt, dwEffect)
proc DragLeave*(self: ptr IDropTargetHelper): HRESULT {.winapi, inline.} = self.lpVtbl.DragLeave(self)
proc DragOver*(self: ptr IDropTargetHelper, ppt: ptr POINT, dwEffect: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.DragOver(self, ppt, dwEffect)
proc Drop*(self: ptr IDropTargetHelper, pDataObject: ptr IDataObject, ppt: ptr POINT, dwEffect: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Drop(self, pDataObject, ppt, dwEffect)
proc Show*(self: ptr IDropTargetHelper, fShow: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.Show(self, fShow)
proc InitializeFromBitmap*(self: ptr IDragSourceHelper, pshdi: LPSHDRAGIMAGE, pDataObject: ptr IDataObject): HRESULT {.winapi, inline.} = self.lpVtbl.InitializeFromBitmap(self, pshdi, pDataObject)
proc InitializeFromWindow*(self: ptr IDragSourceHelper, hwnd: HWND, ppt: ptr POINT, pDataObject: ptr IDataObject): HRESULT {.winapi, inline.} = self.lpVtbl.InitializeFromWindow(self, hwnd, ppt, pDataObject)
proc SetFlags*(self: ptr IDragSourceHelper2, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetFlags(self, dwFlags)
proc GetPath*(self: ptr IShellLinkA, pszFile: LPSTR, cch: int32, pfd: ptr WIN32_FIND_DATAA, fFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetPath(self, pszFile, cch, pfd, fFlags)
proc GetIDList*(self: ptr IShellLinkA, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.GetIDList(self, ppidl)
proc SetIDList*(self: ptr IShellLinkA, pidl: PCIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.SetIDList(self, pidl)
proc GetDescription*(self: ptr IShellLinkA, pszName: LPSTR, cch: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetDescription(self, pszName, cch)
proc SetDescription*(self: ptr IShellLinkA, pszName: LPCSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetDescription(self, pszName)
proc GetWorkingDirectory*(self: ptr IShellLinkA, pszDir: LPSTR, cch: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetWorkingDirectory(self, pszDir, cch)
proc SetWorkingDirectory*(self: ptr IShellLinkA, pszDir: LPCSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetWorkingDirectory(self, pszDir)
proc GetArguments*(self: ptr IShellLinkA, pszArgs: LPSTR, cch: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetArguments(self, pszArgs, cch)
proc SetArguments*(self: ptr IShellLinkA, pszArgs: LPCSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetArguments(self, pszArgs)
proc GetHotkey*(self: ptr IShellLinkA, pwHotkey: ptr WORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetHotkey(self, pwHotkey)
proc SetHotkey*(self: ptr IShellLinkA, wHotkey: WORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetHotkey(self, wHotkey)
proc GetShowCmd*(self: ptr IShellLinkA, piShowCmd: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetShowCmd(self, piShowCmd)
proc SetShowCmd*(self: ptr IShellLinkA, iShowCmd: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetShowCmd(self, iShowCmd)
proc GetIconLocation*(self: ptr IShellLinkA, pszIconPath: LPSTR, cch: int32, piIcon: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetIconLocation(self, pszIconPath, cch, piIcon)
proc SetIconLocation*(self: ptr IShellLinkA, pszIconPath: LPCSTR, iIcon: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetIconLocation(self, pszIconPath, iIcon)
proc SetRelativePath*(self: ptr IShellLinkA, pszPathRel: LPCSTR, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetRelativePath(self, pszPathRel, dwReserved)
proc Resolve*(self: ptr IShellLinkA, hwnd: HWND, fFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Resolve(self, hwnd, fFlags)
proc SetPath*(self: ptr IShellLinkA, pszFile: LPCSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetPath(self, pszFile)
proc GetPath*(self: ptr IShellLinkW, pszFile: LPWSTR, cch: int32, pfd: ptr WIN32_FIND_DATAW, fFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetPath(self, pszFile, cch, pfd, fFlags)
proc GetIDList*(self: ptr IShellLinkW, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.GetIDList(self, ppidl)
proc SetIDList*(self: ptr IShellLinkW, pidl: PCIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.SetIDList(self, pidl)
proc GetDescription*(self: ptr IShellLinkW, pszName: LPWSTR, cch: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetDescription(self, pszName, cch)
proc SetDescription*(self: ptr IShellLinkW, pszName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetDescription(self, pszName)
proc GetWorkingDirectory*(self: ptr IShellLinkW, pszDir: LPWSTR, cch: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetWorkingDirectory(self, pszDir, cch)
proc SetWorkingDirectory*(self: ptr IShellLinkW, pszDir: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetWorkingDirectory(self, pszDir)
proc GetArguments*(self: ptr IShellLinkW, pszArgs: LPWSTR, cch: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetArguments(self, pszArgs, cch)
proc SetArguments*(self: ptr IShellLinkW, pszArgs: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetArguments(self, pszArgs)
proc GetHotkey*(self: ptr IShellLinkW, pwHotkey: ptr WORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetHotkey(self, pwHotkey)
proc SetHotkey*(self: ptr IShellLinkW, wHotkey: WORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetHotkey(self, wHotkey)
proc GetShowCmd*(self: ptr IShellLinkW, piShowCmd: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetShowCmd(self, piShowCmd)
proc SetShowCmd*(self: ptr IShellLinkW, iShowCmd: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetShowCmd(self, iShowCmd)
proc GetIconLocation*(self: ptr IShellLinkW, pszIconPath: LPWSTR, cch: int32, piIcon: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetIconLocation(self, pszIconPath, cch, piIcon)
proc SetIconLocation*(self: ptr IShellLinkW, pszIconPath: LPCWSTR, iIcon: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetIconLocation(self, pszIconPath, iIcon)
proc SetRelativePath*(self: ptr IShellLinkW, pszPathRel: LPCWSTR, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetRelativePath(self, pszPathRel, dwReserved)
proc Resolve*(self: ptr IShellLinkW, hwnd: HWND, fFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Resolve(self, hwnd, fFlags)
proc SetPath*(self: ptr IShellLinkW, pszFile: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetPath(self, pszFile)
proc AddDataBlock*(self: ptr IShellLinkDataList, pDataBlock: pointer): HRESULT {.winapi, inline.} = self.lpVtbl.AddDataBlock(self, pDataBlock)
proc CopyDataBlock*(self: ptr IShellLinkDataList, dwSig: DWORD, ppDataBlock: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.CopyDataBlock(self, dwSig, ppDataBlock)
proc RemoveDataBlock*(self: ptr IShellLinkDataList, dwSig: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveDataBlock(self, dwSig)
proc GetFlags*(self: ptr IShellLinkDataList, pdwFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetFlags(self, pdwFlags)
proc SetFlags*(self: ptr IShellLinkDataList, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetFlags(self, dwFlags)
proc ResolveShellLink*(self: ptr IResolveShellLink, punkLink: ptr IUnknown, hwnd: HWND, fFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.ResolveShellLink(self, punkLink, hwnd, fFlags)
proc Initialize*(self: ptr IActionProgressDialog, flags: SPINITF, pszTitle: LPCWSTR, pszCancel: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, flags, pszTitle, pszCancel)
proc Stop*(self: ptr IActionProgressDialog): HRESULT {.winapi, inline.} = self.lpVtbl.Stop(self)
proc Initialize*(self: ptr IHWEventHandler, pszParams: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, pszParams)
proc HandleEvent*(self: ptr IHWEventHandler, pszDeviceID: LPCWSTR, pszAltDeviceID: LPCWSTR, pszEventType: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.HandleEvent(self, pszDeviceID, pszAltDeviceID, pszEventType)
proc HandleEventWithContent*(self: ptr IHWEventHandler, pszDeviceID: LPCWSTR, pszAltDeviceID: LPCWSTR, pszEventType: LPCWSTR, pszContentTypeHandler: LPCWSTR, pdataobject: ptr IDataObject): HRESULT {.winapi, inline.} = self.lpVtbl.HandleEventWithContent(self, pszDeviceID, pszAltDeviceID, pszEventType, pszContentTypeHandler, pdataobject)
proc HandleEventWithHWND*(self: ptr IHWEventHandler2, pszDeviceID: LPCWSTR, pszAltDeviceID: LPCWSTR, pszEventType: LPCWSTR, hwndOwner: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.HandleEventWithHWND(self, pszDeviceID, pszAltDeviceID, pszEventType, hwndOwner)
proc AllowAutoPlay*(self: ptr IQueryCancelAutoPlay, pszPath: LPCWSTR, dwContentType: DWORD, pszLabel: LPCWSTR, dwSerialNumber: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.AllowAutoPlay(self, pszPath, dwContentType, pszLabel, dwSerialNumber)
proc GetDynamicInfo*(self: ptr IDynamicHWHandler, pszDeviceID: LPCWSTR, dwContentType: DWORD, ppszAction: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetDynamicInfo(self, pszDeviceID, dwContentType, ppszAction)
proc Begin*(self: ptr IActionProgress, action: SPACTION, flags: SPBEGINF): HRESULT {.winapi, inline.} = self.lpVtbl.Begin(self, action, flags)
proc UpdateProgress*(self: ptr IActionProgress, ulCompleted: ULONGLONG, ulTotal: ULONGLONG): HRESULT {.winapi, inline.} = self.lpVtbl.UpdateProgress(self, ulCompleted, ulTotal)
proc UpdateText*(self: ptr IActionProgress, sptext: SPTEXT, pszText: LPCWSTR, fMayCompact: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.UpdateText(self, sptext, pszText, fMayCompact)
proc QueryCancel*(self: ptr IActionProgress, pfCancelled: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.QueryCancel(self, pfCancelled)
proc ResetCancel*(self: ptr IActionProgress): HRESULT {.winapi, inline.} = self.lpVtbl.ResetCancel(self)
proc End*(self: ptr IActionProgress): HRESULT {.winapi, inline.} = self.lpVtbl.End(self)
proc Initialize*(self: ptr IShellExtInit, pidlFolder: PCIDLIST_ABSOLUTE, pdtobj: ptr IDataObject, hkeyProgID: HKEY): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, pidlFolder, pdtobj, hkeyProgID)
proc AddPages*(self: ptr IShellPropSheetExt, pfnAddPage: LPFNSVADDPROPSHEETPAGE, lParam: LPARAM): HRESULT {.winapi, inline.} = self.lpVtbl.AddPages(self, pfnAddPage, lParam)
proc ReplacePage*(self: ptr IShellPropSheetExt, uPageID: EXPPS, pfnReplaceWith: LPFNSVADDPROPSHEETPAGE, lParam: LPARAM): HRESULT {.winapi, inline.} = self.lpVtbl.ReplacePage(self, uPageID, pfnReplaceWith, lParam)
proc Initialize*(self: ptr IRemoteComputer, pszMachine: LPCWSTR, bEnumerating: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, pszMachine, bEnumerating)
proc QueryContinue*(self: ptr IQueryContinue): HRESULT {.winapi, inline.} = self.lpVtbl.QueryContinue(self)
proc GetCancelEvent*(self: ptr IObjectWithCancelEvent, phEvent: ptr HANDLE): HRESULT {.winapi, inline.} = self.lpVtbl.GetCancelEvent(self, phEvent)
proc SetBalloonInfo*(self: ptr IUserNotification, pszTitle: LPCWSTR, pszText: LPCWSTR, dwInfoFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetBalloonInfo(self, pszTitle, pszText, dwInfoFlags)
proc SetBalloonRetry*(self: ptr IUserNotification, dwShowTime: DWORD, dwInterval: DWORD, cRetryCount: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetBalloonRetry(self, dwShowTime, dwInterval, cRetryCount)
proc SetIconInfo*(self: ptr IUserNotification, hIcon: HICON, pszToolTip: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetIconInfo(self, hIcon, pszToolTip)
proc Show*(self: ptr IUserNotification, pqc: ptr IQueryContinue, dwContinuePollInterval: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Show(self, pqc, dwContinuePollInterval)
proc PlaySound*(self: ptr IUserNotification, pszSoundName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.PlaySound(self, pszSoundName)
proc OnBalloonUserClick*(self: ptr IUserNotificationCallback, pt: ptr POINT): HRESULT {.winapi, inline.} = self.lpVtbl.OnBalloonUserClick(self, pt)
proc OnLeftClick*(self: ptr IUserNotificationCallback, pt: ptr POINT): HRESULT {.winapi, inline.} = self.lpVtbl.OnLeftClick(self, pt)
proc OnContextMenu*(self: ptr IUserNotificationCallback, pt: ptr POINT): HRESULT {.winapi, inline.} = self.lpVtbl.OnContextMenu(self, pt)
proc SetBalloonInfo*(self: ptr IUserNotification2, pszTitle: LPCWSTR, pszText: LPCWSTR, dwInfoFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetBalloonInfo(self, pszTitle, pszText, dwInfoFlags)
proc SetBalloonRetry*(self: ptr IUserNotification2, dwShowTime: DWORD, dwInterval: DWORD, cRetryCount: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetBalloonRetry(self, dwShowTime, dwInterval, cRetryCount)
proc SetIconInfo*(self: ptr IUserNotification2, hIcon: HICON, pszToolTip: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetIconInfo(self, hIcon, pszToolTip)
proc Show*(self: ptr IUserNotification2, pqc: ptr IQueryContinue, dwContinuePollInterval: DWORD, pSink: ptr IUserNotificationCallback): HRESULT {.winapi, inline.} = self.lpVtbl.Show(self, pqc, dwContinuePollInterval, pSink)
proc PlaySound*(self: ptr IUserNotification2, pszSoundName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.PlaySound(self, pszSoundName)
proc GetValidCharacters*(self: ptr IItemNameLimits, ppwszValidChars: ptr LPWSTR, ppwszInvalidChars: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetValidCharacters(self, ppwszValidChars, ppwszInvalidChars)
proc GetMaxLength*(self: ptr IItemNameLimits, pszName: LPCWSTR, piMaxNameLen: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetMaxLength(self, pszName, piMaxNameLen)
proc SetDisplayName*(self: ptr ISearchFolderItemFactory, pszDisplayName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetDisplayName(self, pszDisplayName)
proc SetFolderTypeID*(self: ptr ISearchFolderItemFactory, ftid: FOLDERTYPEID): HRESULT {.winapi, inline.} = self.lpVtbl.SetFolderTypeID(self, ftid)
proc SetFolderLogicalViewMode*(self: ptr ISearchFolderItemFactory, flvm: FOLDERLOGICALVIEWMODE): HRESULT {.winapi, inline.} = self.lpVtbl.SetFolderLogicalViewMode(self, flvm)
proc SetIconSize*(self: ptr ISearchFolderItemFactory, iIconSize: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetIconSize(self, iIconSize)
proc SetVisibleColumns*(self: ptr ISearchFolderItemFactory, cVisibleColumns: UINT, rgKey: ptr PROPERTYKEY): HRESULT {.winapi, inline.} = self.lpVtbl.SetVisibleColumns(self, cVisibleColumns, rgKey)
proc SetSortColumns*(self: ptr ISearchFolderItemFactory, cSortColumns: UINT, rgSortColumns: ptr SORTCOLUMN): HRESULT {.winapi, inline.} = self.lpVtbl.SetSortColumns(self, cSortColumns, rgSortColumns)
proc SetGroupColumn*(self: ptr ISearchFolderItemFactory, keyGroup: REFPROPERTYKEY): HRESULT {.winapi, inline.} = self.lpVtbl.SetGroupColumn(self, keyGroup)
proc SetStacks*(self: ptr ISearchFolderItemFactory, cStackKeys: UINT, rgStackKeys: ptr PROPERTYKEY): HRESULT {.winapi, inline.} = self.lpVtbl.SetStacks(self, cStackKeys, rgStackKeys)
proc SetScope*(self: ptr ISearchFolderItemFactory, psiaScope: ptr IShellItemArray): HRESULT {.winapi, inline.} = self.lpVtbl.SetScope(self, psiaScope)
proc SetCondition*(self: ptr ISearchFolderItemFactory, pCondition: ptr ICondition): HRESULT {.winapi, inline.} = self.lpVtbl.SetCondition(self, pCondition)
proc GetShellItem*(self: ptr ISearchFolderItemFactory, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetShellItem(self, riid, ppv)
proc GetIDList*(self: ptr ISearchFolderItemFactory, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.GetIDList(self, ppidl)
proc GetLocation*(self: ptr IExtractImage, pszPathBuffer: LPWSTR, cch: DWORD, pdwPriority: ptr DWORD, prgSize: ptr SIZE, dwRecClrDepth: DWORD, pdwFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetLocation(self, pszPathBuffer, cch, pdwPriority, prgSize, dwRecClrDepth, pdwFlags)
proc Extract*(self: ptr IExtractImage, phBmpThumbnail: ptr HBITMAP): HRESULT {.winapi, inline.} = self.lpVtbl.Extract(self, phBmpThumbnail)
proc GetDateStamp*(self: ptr IExtractImage2, pDateStamp: ptr FILETIME): HRESULT {.winapi, inline.} = self.lpVtbl.GetDateStamp(self, pDateStamp)
proc GetThumbnailHandler*(self: ptr IThumbnailHandlerFactory, pidlChild: PCUITEMID_CHILD, pbc: ptr IBindCtx, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetThumbnailHandler(self, pidlChild, pbc, riid, ppv)
proc SetParentAndItem*(self: ptr IParentAndItem, pidlParent: PCIDLIST_ABSOLUTE, psf: ptr IShellFolder, pidlChild: PCUITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.SetParentAndItem(self, pidlParent, psf, pidlChild)
proc GetParentAndItem*(self: ptr IParentAndItem, ppidlParent: ptr PIDLIST_ABSOLUTE, ppsf: ptr ptr IShellFolder, ppidlChild: ptr PITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.GetParentAndItem(self, ppidlParent, ppsf, ppidlChild)
proc ShowDW*(self: ptr IDockingWindow, fShow: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.ShowDW(self, fShow)
proc CloseDW*(self: ptr IDockingWindow, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.CloseDW(self, dwReserved)
proc ResizeBorderDW*(self: ptr IDockingWindow, prcBorder: LPCRECT, punkToolbarSite: ptr IUnknown, fReserved: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.ResizeBorderDW(self, prcBorder, punkToolbarSite, fReserved)
proc GetBandInfo*(self: ptr IDeskBand, dwBandID: DWORD, dwViewMode: DWORD, pdbi: ptr DESKBANDINFO): HRESULT {.winapi, inline.} = self.lpVtbl.GetBandInfo(self, dwBandID, dwViewMode, pdbi)
proc GetDefaultBandWidth*(self: ptr IDeskBandInfo, dwBandID: DWORD, dwViewMode: DWORD, pnWidth: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetDefaultBandWidth(self, dwBandID, dwViewMode, pnWidth)
proc CanRenderComposited*(self: ptr IDeskBand2, pfCanRenderComposited: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.CanRenderComposited(self, pfCanRenderComposited)
proc SetCompositionState*(self: ptr IDeskBand2, fCompositionEnabled: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetCompositionState(self, fCompositionEnabled)
proc GetCompositionState*(self: ptr IDeskBand2, pfCompositionEnabled: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.GetCompositionState(self, pfCompositionEnabled)
proc HrInit*(self: ptr ITaskbarList): HRESULT {.winapi, inline.} = self.lpVtbl.HrInit(self)
proc AddTab*(self: ptr ITaskbarList, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.AddTab(self, hwnd)
proc DeleteTab*(self: ptr ITaskbarList, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.DeleteTab(self, hwnd)
proc ActivateTab*(self: ptr ITaskbarList, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.ActivateTab(self, hwnd)
proc SetActiveAlt*(self: ptr ITaskbarList, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.SetActiveAlt(self, hwnd)
proc MarkFullscreenWindow*(self: ptr ITaskbarList2, hwnd: HWND, fFullscreen: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.MarkFullscreenWindow(self, hwnd, fFullscreen)
proc SetProgressValue*(self: ptr ITaskbarList3, hwnd: HWND, ullCompleted: ULONGLONG, ullTotal: ULONGLONG): HRESULT {.winapi, inline.} = self.lpVtbl.SetProgressValue(self, hwnd, ullCompleted, ullTotal)
proc SetProgressState*(self: ptr ITaskbarList3, hwnd: HWND, tbpFlags: TBPFLAG): HRESULT {.winapi, inline.} = self.lpVtbl.SetProgressState(self, hwnd, tbpFlags)
proc RegisterTab*(self: ptr ITaskbarList3, hwndTab: HWND, hwndMDI: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.RegisterTab(self, hwndTab, hwndMDI)
proc UnregisterTab*(self: ptr ITaskbarList3, hwndTab: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.UnregisterTab(self, hwndTab)
proc SetTabOrder*(self: ptr ITaskbarList3, hwndTab: HWND, hwndInsertBefore: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.SetTabOrder(self, hwndTab, hwndInsertBefore)
proc SetTabActive*(self: ptr ITaskbarList3, hwndTab: HWND, hwndMDI: HWND, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetTabActive(self, hwndTab, hwndMDI, dwReserved)
proc ThumbBarAddButtons*(self: ptr ITaskbarList3, hwnd: HWND, cButtons: UINT, pButton: LPTHUMBBUTTON): HRESULT {.winapi, inline.} = self.lpVtbl.ThumbBarAddButtons(self, hwnd, cButtons, pButton)
proc ThumbBarUpdateButtons*(self: ptr ITaskbarList3, hwnd: HWND, cButtons: UINT, pButton: LPTHUMBBUTTON): HRESULT {.winapi, inline.} = self.lpVtbl.ThumbBarUpdateButtons(self, hwnd, cButtons, pButton)
proc ThumbBarSetImageList*(self: ptr ITaskbarList3, hwnd: HWND, himl: HIMAGELIST): HRESULT {.winapi, inline.} = self.lpVtbl.ThumbBarSetImageList(self, hwnd, himl)
proc SetOverlayIcon*(self: ptr ITaskbarList3, hwnd: HWND, hIcon: HICON, pszDescription: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetOverlayIcon(self, hwnd, hIcon, pszDescription)
proc SetThumbnailTooltip*(self: ptr ITaskbarList3, hwnd: HWND, pszTip: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetThumbnailTooltip(self, hwnd, pszTip)
proc SetThumbnailClip*(self: ptr ITaskbarList3, hwnd: HWND, prcClip: ptr RECT): HRESULT {.winapi, inline.} = self.lpVtbl.SetThumbnailClip(self, hwnd, prcClip)
proc SetTabProperties*(self: ptr ITaskbarList4, hwndTab: HWND, stpFlags: STPFLAG): HRESULT {.winapi, inline.} = self.lpVtbl.SetTabProperties(self, hwndTab, stpFlags)
proc RemoveFromList*(self: ptr IStartMenuPinnedList, pitem: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveFromList(self, pitem)
proc GetRecorderDriveLetter*(self: ptr ICDBurn, pszDrive: LPWSTR, cch: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetRecorderDriveLetter(self, pszDrive, cch)
proc Burn*(self: ptr ICDBurn, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.Burn(self, hwnd)
proc HasRecordableDrive*(self: ptr ICDBurn, pfHasRecorder: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.HasRecordableDrive(self, pfHasRecorder)
proc GetPreviousPage*(self: ptr IWizardSite, phpage: ptr HPROPSHEETPAGE): HRESULT {.winapi, inline.} = self.lpVtbl.GetPreviousPage(self, phpage)
proc GetNextPage*(self: ptr IWizardSite, phpage: ptr HPROPSHEETPAGE): HRESULT {.winapi, inline.} = self.lpVtbl.GetNextPage(self, phpage)
proc GetCancelledPage*(self: ptr IWizardSite, phpage: ptr HPROPSHEETPAGE): HRESULT {.winapi, inline.} = self.lpVtbl.GetCancelledPage(self, phpage)
proc AddPages*(self: ptr IWizardExtension, aPages: ptr HPROPSHEETPAGE, cPages: UINT, pnPagesAdded: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.AddPages(self, aPages, cPages, pnPagesAdded)
proc GetFirstPage*(self: ptr IWizardExtension, phpage: ptr HPROPSHEETPAGE): HRESULT {.winapi, inline.} = self.lpVtbl.GetFirstPage(self, phpage)
proc GetLastPage*(self: ptr IWizardExtension, phpage: ptr HPROPSHEETPAGE): HRESULT {.winapi, inline.} = self.lpVtbl.GetLastPage(self, phpage)
proc SetInitialURL*(self: ptr IWebWizardExtension, pszURL: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetInitialURL(self, pszURL)
proc SetErrorURL*(self: ptr IWebWizardExtension, pszErrorURL: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetErrorURL(self, pszErrorURL)
proc Initialize*(self: ptr IPublishingWizard, pdo: ptr IDataObject, dwOptions: DWORD, pszServiceScope: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, pdo, dwOptions, pszServiceScope)
proc GetTransferManifest*(self: ptr IPublishingWizard, phrFromTransfer: ptr HRESULT, pdocManifest: ptr ptr IXMLDOMDocument): HRESULT {.winapi, inline.} = self.lpVtbl.GetTransferManifest(self, phrFromTransfer, pdocManifest)
proc Initialize*(self: ptr IFolderViewHost, hwndParent: HWND, pdo: ptr IDataObject, prc: ptr RECT): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, hwndParent, pdo, prc)
proc OnNavigationPending*(self: ptr IExplorerBrowserEvents, pidlFolder: PCIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.OnNavigationPending(self, pidlFolder)
proc OnViewCreated*(self: ptr IExplorerBrowserEvents, psv: ptr IShellView): HRESULT {.winapi, inline.} = self.lpVtbl.OnViewCreated(self, psv)
proc OnNavigationComplete*(self: ptr IExplorerBrowserEvents, pidlFolder: PCIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.OnNavigationComplete(self, pidlFolder)
proc OnNavigationFailed*(self: ptr IExplorerBrowserEvents, pidlFolder: PCIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.OnNavigationFailed(self, pidlFolder)
proc Initialize*(self: ptr IExplorerBrowser, hwndParent: HWND, prc: ptr RECT, pfs: ptr FOLDERSETTINGS): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, hwndParent, prc, pfs)
proc Destroy*(self: ptr IExplorerBrowser): HRESULT {.winapi, inline.} = self.lpVtbl.Destroy(self)
proc SetRect*(self: ptr IExplorerBrowser, phdwp: ptr HDWP, rcBrowser: RECT): HRESULT {.winapi, inline.} = self.lpVtbl.SetRect(self, phdwp, rcBrowser)
proc SetPropertyBag*(self: ptr IExplorerBrowser, pszPropertyBag: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetPropertyBag(self, pszPropertyBag)
proc SetEmptyText*(self: ptr IExplorerBrowser, pszEmptyText: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetEmptyText(self, pszEmptyText)
proc SetFolderSettings*(self: ptr IExplorerBrowser, pfs: ptr FOLDERSETTINGS): HRESULT {.winapi, inline.} = self.lpVtbl.SetFolderSettings(self, pfs)
proc Advise*(self: ptr IExplorerBrowser, psbe: ptr IExplorerBrowserEvents, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Advise(self, psbe, pdwCookie)
proc Unadvise*(self: ptr IExplorerBrowser, dwCookie: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Unadvise(self, dwCookie)
proc SetOptions*(self: ptr IExplorerBrowser, dwFlag: EXPLORER_BROWSER_OPTIONS): HRESULT {.winapi, inline.} = self.lpVtbl.SetOptions(self, dwFlag)
proc GetOptions*(self: ptr IExplorerBrowser, pdwFlag: ptr EXPLORER_BROWSER_OPTIONS): HRESULT {.winapi, inline.} = self.lpVtbl.GetOptions(self, pdwFlag)
proc BrowseToIDList*(self: ptr IExplorerBrowser, pidl: PCUIDLIST_RELATIVE, uFlags: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.BrowseToIDList(self, pidl, uFlags)
proc BrowseToObject*(self: ptr IExplorerBrowser, punk: ptr IUnknown, uFlags: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.BrowseToObject(self, punk, uFlags)
proc FillFromObject*(self: ptr IExplorerBrowser, punk: ptr IUnknown, dwFlags: EXPLORER_BROWSER_FILL_FLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.FillFromObject(self, punk, dwFlags)
proc RemoveAll*(self: ptr IExplorerBrowser): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveAll(self)
proc GetCurrentView*(self: ptr IExplorerBrowser, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetCurrentView(self, riid, ppv)
proc SetAccessibleName*(self: ptr IAccessibleObject, pszName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetAccessibleName(self, pszName)
proc AddItem*(self: ptr IResultsFolder, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.AddItem(self, psi)
proc AddIDList*(self: ptr IResultsFolder, pidl: PCIDLIST_ABSOLUTE, ppidlAdded: ptr PITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.AddIDList(self, pidl, ppidlAdded)
proc RemoveItem*(self: ptr IResultsFolder, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveItem(self, psi)
proc RemoveIDList*(self: ptr IResultsFolder, pidl: PCIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveIDList(self, pidl)
proc RemoveAll*(self: ptr IResultsFolder): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveAll(self)
proc Next*(self: ptr IEnumObjects, celt: ULONG, riid: REFIID, rgelt: ptr pointer, pceltFetched: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Next(self, celt, riid, rgelt, pceltFetched)
proc Skip*(self: ptr IEnumObjects, celt: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Skip(self, celt)
proc Reset*(self: ptr IEnumObjects): HRESULT {.winapi, inline.} = self.lpVtbl.Reset(self)
proc Clone*(self: ptr IEnumObjects, ppenum: ptr ptr IEnumObjects): HRESULT {.winapi, inline.} = self.lpVtbl.Clone(self, ppenum)
proc StartProgressDialog*(self: ptr IOperationsProgressDialog, hwndOwner: HWND, flags: OPPROGDLGF): HRESULT {.winapi, inline.} = self.lpVtbl.StartProgressDialog(self, hwndOwner, flags)
proc StopProgressDialog*(self: ptr IOperationsProgressDialog): HRESULT {.winapi, inline.} = self.lpVtbl.StopProgressDialog(self)
proc SetOperation*(self: ptr IOperationsProgressDialog, action: SPACTION): HRESULT {.winapi, inline.} = self.lpVtbl.SetOperation(self, action)
proc SetMode*(self: ptr IOperationsProgressDialog, mode: PDMODE): HRESULT {.winapi, inline.} = self.lpVtbl.SetMode(self, mode)
proc UpdateProgress*(self: ptr IOperationsProgressDialog, ullPointsCurrent: ULONGLONG, ullPointsTotal: ULONGLONG, ullSizeCurrent: ULONGLONG, ullSizeTotal: ULONGLONG, ullItemsCurrent: ULONGLONG, ullItemsTotal: ULONGLONG): HRESULT {.winapi, inline.} = self.lpVtbl.UpdateProgress(self, ullPointsCurrent, ullPointsTotal, ullSizeCurrent, ullSizeTotal, ullItemsCurrent, ullItemsTotal)
proc UpdateLocations*(self: ptr IOperationsProgressDialog, psiSource: ptr IShellItem, psiTarget: ptr IShellItem, psiItem: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.UpdateLocations(self, psiSource, psiTarget, psiItem)
proc ResetTimer*(self: ptr IOperationsProgressDialog): HRESULT {.winapi, inline.} = self.lpVtbl.ResetTimer(self)
proc PauseTimer*(self: ptr IOperationsProgressDialog): HRESULT {.winapi, inline.} = self.lpVtbl.PauseTimer(self)
proc ResumeTimer*(self: ptr IOperationsProgressDialog): HRESULT {.winapi, inline.} = self.lpVtbl.ResumeTimer(self)
proc GetMilliseconds*(self: ptr IOperationsProgressDialog, pullElapsed: ptr ULONGLONG, pullRemaining: ptr ULONGLONG): HRESULT {.winapi, inline.} = self.lpVtbl.GetMilliseconds(self, pullElapsed, pullRemaining)
proc GetOperationStatus*(self: ptr IOperationsProgressDialog, popstatus: ptr PDOPSTATUS): HRESULT {.winapi, inline.} = self.lpVtbl.GetOperationStatus(self, popstatus)
proc SetCancelInformation*(self: ptr IIOCancelInformation, dwThreadID: DWORD, uMsgCancel: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetCancelInformation(self, dwThreadID, uMsgCancel)
proc GetCancelInformation*(self: ptr IIOCancelInformation, pdwThreadID: ptr DWORD, puMsgCancel: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetCancelInformation(self, pdwThreadID, puMsgCancel)
proc Advise*(self: ptr IFileOperation, pfops: ptr IFileOperationProgressSink, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Advise(self, pfops, pdwCookie)
proc Unadvise*(self: ptr IFileOperation, dwCookie: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Unadvise(self, dwCookie)
proc SetOperationFlags*(self: ptr IFileOperation, dwOperationFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetOperationFlags(self, dwOperationFlags)
proc SetProgressMessage*(self: ptr IFileOperation, pszMessage: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetProgressMessage(self, pszMessage)
proc SetProgressDialog*(self: ptr IFileOperation, popd: ptr IOperationsProgressDialog): HRESULT {.winapi, inline.} = self.lpVtbl.SetProgressDialog(self, popd)
proc SetProperties*(self: ptr IFileOperation, pproparray: ptr IPropertyChangeArray): HRESULT {.winapi, inline.} = self.lpVtbl.SetProperties(self, pproparray)
proc SetOwnerWindow*(self: ptr IFileOperation, hwndOwner: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.SetOwnerWindow(self, hwndOwner)
proc ApplyPropertiesToItem*(self: ptr IFileOperation, psiItem: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.ApplyPropertiesToItem(self, psiItem)
proc ApplyPropertiesToItems*(self: ptr IFileOperation, punkItems: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.ApplyPropertiesToItems(self, punkItems)
proc RenameItem*(self: ptr IFileOperation, psiItem: ptr IShellItem, pszNewName: LPCWSTR, pfopsItem: ptr IFileOperationProgressSink): HRESULT {.winapi, inline.} = self.lpVtbl.RenameItem(self, psiItem, pszNewName, pfopsItem)
proc RenameItems*(self: ptr IFileOperation, pUnkItems: ptr IUnknown, pszNewName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.RenameItems(self, pUnkItems, pszNewName)
proc MoveItem*(self: ptr IFileOperation, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszNewName: LPCWSTR, pfopsItem: ptr IFileOperationProgressSink): HRESULT {.winapi, inline.} = self.lpVtbl.MoveItem(self, psiItem, psiDestinationFolder, pszNewName, pfopsItem)
proc MoveItems*(self: ptr IFileOperation, punkItems: ptr IUnknown, psiDestinationFolder: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.MoveItems(self, punkItems, psiDestinationFolder)
proc CopyItem*(self: ptr IFileOperation, psiItem: ptr IShellItem, psiDestinationFolder: ptr IShellItem, pszCopyName: LPCWSTR, pfopsItem: ptr IFileOperationProgressSink): HRESULT {.winapi, inline.} = self.lpVtbl.CopyItem(self, psiItem, psiDestinationFolder, pszCopyName, pfopsItem)
proc CopyItems*(self: ptr IFileOperation, punkItems: ptr IUnknown, psiDestinationFolder: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.CopyItems(self, punkItems, psiDestinationFolder)
proc DeleteItem*(self: ptr IFileOperation, psiItem: ptr IShellItem, pfopsItem: ptr IFileOperationProgressSink): HRESULT {.winapi, inline.} = self.lpVtbl.DeleteItem(self, psiItem, pfopsItem)
proc DeleteItems*(self: ptr IFileOperation, punkItems: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.DeleteItems(self, punkItems)
proc NewItem*(self: ptr IFileOperation, psiDestinationFolder: ptr IShellItem, dwFileAttributes: DWORD, pszName: LPCWSTR, pszTemplateName: LPCWSTR, pfopsItem: ptr IFileOperationProgressSink): HRESULT {.winapi, inline.} = self.lpVtbl.NewItem(self, psiDestinationFolder, dwFileAttributes, pszName, pszTemplateName, pfopsItem)
proc PerformOperations*(self: ptr IFileOperation): HRESULT {.winapi, inline.} = self.lpVtbl.PerformOperations(self)
proc GetAnyOperationsAborted*(self: ptr IFileOperation, pfAnyOperationsAborted: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.GetAnyOperationsAborted(self, pfAnyOperationsAborted)
proc QueryObject*(self: ptr IObjectProvider, guidObject: REFGUID, riid: REFIID, ppvOut: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.QueryObject(self, guidObject, riid, ppvOut)
proc FoundItem*(self: ptr INamespaceWalkCB, psf: ptr IShellFolder, pidl: PCUITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.FoundItem(self, psf, pidl)
proc EnterFolder*(self: ptr INamespaceWalkCB, psf: ptr IShellFolder, pidl: PCUITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.EnterFolder(self, psf, pidl)
proc LeaveFolder*(self: ptr INamespaceWalkCB, psf: ptr IShellFolder, pidl: PCUITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.LeaveFolder(self, psf, pidl)
proc InitializeProgressDialog*(self: ptr INamespaceWalkCB, ppszTitle: ptr LPWSTR, ppszCancel: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.InitializeProgressDialog(self, ppszTitle, ppszCancel)
proc WalkComplete*(self: ptr INamespaceWalkCB2, hr: HRESULT): HRESULT {.winapi, inline.} = self.lpVtbl.WalkComplete(self, hr)
proc Walk*(self: ptr INamespaceWalk, punkToWalk: ptr IUnknown, dwFlags: DWORD, cDepth: int32, pnswcb: ptr INamespaceWalkCB): HRESULT {.winapi, inline.} = self.lpVtbl.Walk(self, punkToWalk, dwFlags, cDepth, pnswcb)
proc GetIDArrayResult*(self: ptr INamespaceWalk, pcItems: ptr UINT, prgpidl: ptr ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.GetIDArrayResult(self, pcItems, prgpidl)
proc GetDropDownStatus*(self: ptr IAutoCompleteDropDown, pdwFlags: ptr DWORD, ppwszString: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetDropDownStatus(self, pdwFlags, ppwszString)
proc ResetEnumerator*(self: ptr IAutoCompleteDropDown): HRESULT {.winapi, inline.} = self.lpVtbl.ResetEnumerator(self)
proc AddBand*(self: ptr IBandSite, punk: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.AddBand(self, punk)
proc EnumBands*(self: ptr IBandSite, uBand: UINT, pdwBandID: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.EnumBands(self, uBand, pdwBandID)
proc QueryBand*(self: ptr IBandSite, dwBandID: DWORD, ppstb: ptr ptr IDeskBand, pdwState: ptr DWORD, pszName: LPWSTR, cchName: int32): HRESULT {.winapi, inline.} = self.lpVtbl.QueryBand(self, dwBandID, ppstb, pdwState, pszName, cchName)
proc SetBandState*(self: ptr IBandSite, dwBandID: DWORD, dwMask: DWORD, dwState: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetBandState(self, dwBandID, dwMask, dwState)
proc RemoveBand*(self: ptr IBandSite, dwBandID: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveBand(self, dwBandID)
proc GetBandObject*(self: ptr IBandSite, dwBandID: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetBandObject(self, dwBandID, riid, ppv)
proc SetBandSiteInfo*(self: ptr IBandSite, pbsinfo: ptr BANDSITEINFO): HRESULT {.winapi, inline.} = self.lpVtbl.SetBandSiteInfo(self, pbsinfo)
proc GetBandSiteInfo*(self: ptr IBandSite, pbsinfo: ptr BANDSITEINFO): HRESULT {.winapi, inline.} = self.lpVtbl.GetBandSiteInfo(self, pbsinfo)
proc Show*(self: ptr IModalWindow, hwndOwner: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.Show(self, hwndOwner)
proc GetSupportedActionTypes*(self: ptr ICDBurnExt, pdwActions: ptr CDBE_ACTIONS): HRESULT {.winapi, inline.} = self.lpVtbl.GetSupportedActionTypes(self, pdwActions)
proc DoContextMenuPopup*(self: ptr IContextMenuSite, punkContextMenu: ptr IUnknown, fFlags: UINT, pt: POINT): HRESULT {.winapi, inline.} = self.lpVtbl.DoContextMenuPopup(self, punkContextMenu, fFlags, pt)
proc EnumReady*(self: ptr IEnumReadyCallback): HRESULT {.winapi, inline.} = self.lpVtbl.EnumReady(self)
proc SetEnumReadyCallback*(self: ptr IEnumerableView, percb: ptr IEnumReadyCallback): HRESULT {.winapi, inline.} = self.lpVtbl.SetEnumReadyCallback(self, percb)
proc CreateEnumIDListFromContents*(self: ptr IEnumerableView, pidlFolder: PCIDLIST_ABSOLUTE, dwEnumFlags: DWORD, ppEnumIDList: ptr ptr IEnumIDList): HRESULT {.winapi, inline.} = self.lpVtbl.CreateEnumIDListFromContents(self, pidlFolder, dwEnumFlags, ppEnumIDList)
proc InsertItem*(self: ptr IInsertItem, pidl: PCUIDLIST_RELATIVE): HRESULT {.winapi, inline.} = self.lpVtbl.InsertItem(self, pidl)
proc IsMenuMessage*(self: ptr IMenuBand, pmsg: ptr MSG): HRESULT {.winapi, inline.} = self.lpVtbl.IsMenuMessage(self, pmsg)
proc TranslateMenuMessage*(self: ptr IMenuBand, pmsg: ptr MSG, plRet: ptr LRESULT): HRESULT {.winapi, inline.} = self.lpVtbl.TranslateMenuMessage(self, pmsg, plRet)
proc SetCascade*(self: ptr IFolderBandPriv, fCascade: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetCascade(self, fCascade)
proc SetAccelerators*(self: ptr IFolderBandPriv, fAccelerators: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetAccelerators(self, fAccelerators)
proc SetNoIcons*(self: ptr IFolderBandPriv, fNoIcons: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetNoIcons(self, fNoIcons)
proc SetNoText*(self: ptr IFolderBandPriv, fNoText: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetNoText(self, fNoText)
proc GetCheckState*(self: ptr IRegTreeItem, pbCheck: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.GetCheckState(self, pbCheck)
proc SetCheckState*(self: ptr IRegTreeItem, bCheck: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetCheckState(self, bCheck)
proc RecompressImage*(self: ptr IImageRecompress, psi: ptr IShellItem, cx: int32, cy: int32, iQuality: int32, pstg: ptr IStorage, ppstrmOut: ptr ptr IStream): HRESULT {.winapi, inline.} = self.lpVtbl.RecompressImage(self, psi, cx, cy, iQuality, pstg, ppstrmOut)
proc SetClient*(self: ptr IDeskBar, punkClient: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.SetClient(self, punkClient)
proc GetClient*(self: ptr IDeskBar, ppunkClient: ptr ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.GetClient(self, ppunkClient)
proc OnPosRectChangeDB*(self: ptr IDeskBar, prc: ptr RECT): HRESULT {.winapi, inline.} = self.lpVtbl.OnPosRectChangeDB(self, prc)
proc Popup*(self: ptr IMenuPopup, ppt: ptr POINTL, prcExclude: ptr RECTL, dwFlags: MP_POPUPFLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.Popup(self, ppt, prcExclude, dwFlags)
proc OnSelect*(self: ptr IMenuPopup, dwSelectType: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.OnSelect(self, dwSelectType)
proc SetSubMenu*(self: ptr IMenuPopup, pmp: ptr IMenuPopup, fSet: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetSubMenu(self, pmp, fSet)
proc GetAppName*(self: ptr IFileIsInUse, ppszName: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetAppName(self, ppszName)
proc GetUsage*(self: ptr IFileIsInUse, pfut: ptr FILE_USAGE_TYPE): HRESULT {.winapi, inline.} = self.lpVtbl.GetUsage(self, pfut)
proc GetCapabilities*(self: ptr IFileIsInUse, pdwCapFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetCapabilities(self, pdwCapFlags)
proc GetSwitchToHWND*(self: ptr IFileIsInUse, phwnd: ptr HWND): HRESULT {.winapi, inline.} = self.lpVtbl.GetSwitchToHWND(self, phwnd)
proc CloseFile*(self: ptr IFileIsInUse): HRESULT {.winapi, inline.} = self.lpVtbl.CloseFile(self)
proc OnFileOk*(self: ptr IFileDialogEvents, pfd: ptr IFileDialog): HRESULT {.winapi, inline.} = self.lpVtbl.OnFileOk(self, pfd)
proc OnFolderChanging*(self: ptr IFileDialogEvents, pfd: ptr IFileDialog, psiFolder: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.OnFolderChanging(self, pfd, psiFolder)
proc OnFolderChange*(self: ptr IFileDialogEvents, pfd: ptr IFileDialog): HRESULT {.winapi, inline.} = self.lpVtbl.OnFolderChange(self, pfd)
proc OnSelectionChange*(self: ptr IFileDialogEvents, pfd: ptr IFileDialog): HRESULT {.winapi, inline.} = self.lpVtbl.OnSelectionChange(self, pfd)
proc OnShareViolation*(self: ptr IFileDialogEvents, pfd: ptr IFileDialog, psi: ptr IShellItem, pResponse: ptr FDE_SHAREVIOLATION_RESPONSE): HRESULT {.winapi, inline.} = self.lpVtbl.OnShareViolation(self, pfd, psi, pResponse)
proc OnTypeChange*(self: ptr IFileDialogEvents, pfd: ptr IFileDialog): HRESULT {.winapi, inline.} = self.lpVtbl.OnTypeChange(self, pfd)
proc OnOverwrite*(self: ptr IFileDialogEvents, pfd: ptr IFileDialog, psi: ptr IShellItem, pResponse: ptr FDE_OVERWRITE_RESPONSE): HRESULT {.winapi, inline.} = self.lpVtbl.OnOverwrite(self, pfd, psi, pResponse)
proc SetFileTypes*(self: ptr IFileDialog, cFileTypes: UINT, rgFilterSpec: ptr COMDLG_FILTERSPEC): HRESULT {.winapi, inline.} = self.lpVtbl.SetFileTypes(self, cFileTypes, rgFilterSpec)
proc SetFileTypeIndex*(self: ptr IFileDialog, iFileType: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetFileTypeIndex(self, iFileType)
proc GetFileTypeIndex*(self: ptr IFileDialog, piFileType: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetFileTypeIndex(self, piFileType)
proc Advise*(self: ptr IFileDialog, pfde: ptr IFileDialogEvents, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Advise(self, pfde, pdwCookie)
proc Unadvise*(self: ptr IFileDialog, dwCookie: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Unadvise(self, dwCookie)
proc SetOptions*(self: ptr IFileDialog, fos: FILEOPENDIALOGOPTIONS): HRESULT {.winapi, inline.} = self.lpVtbl.SetOptions(self, fos)
proc GetOptions*(self: ptr IFileDialog, pfos: ptr FILEOPENDIALOGOPTIONS): HRESULT {.winapi, inline.} = self.lpVtbl.GetOptions(self, pfos)
proc SetDefaultFolder*(self: ptr IFileDialog, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.SetDefaultFolder(self, psi)
proc SetFolder*(self: ptr IFileDialog, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.SetFolder(self, psi)
proc GetFolder*(self: ptr IFileDialog, ppsi: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolder(self, ppsi)
proc GetCurrentSelection*(self: ptr IFileDialog, ppsi: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.GetCurrentSelection(self, ppsi)
proc SetFileName*(self: ptr IFileDialog, pszName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetFileName(self, pszName)
proc GetFileName*(self: ptr IFileDialog, pszName: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetFileName(self, pszName)
proc SetTitle*(self: ptr IFileDialog, pszTitle: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetTitle(self, pszTitle)
proc SetOkButtonLabel*(self: ptr IFileDialog, pszText: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetOkButtonLabel(self, pszText)
proc SetFileNameLabel*(self: ptr IFileDialog, pszLabel: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetFileNameLabel(self, pszLabel)
proc GetResult*(self: ptr IFileDialog, ppsi: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.GetResult(self, ppsi)
proc AddPlace*(self: ptr IFileDialog, psi: ptr IShellItem, fdap: FDAP): HRESULT {.winapi, inline.} = self.lpVtbl.AddPlace(self, psi, fdap)
proc SetDefaultExtension*(self: ptr IFileDialog, pszDefaultExtension: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetDefaultExtension(self, pszDefaultExtension)
proc Close*(self: ptr IFileDialog, hr: HRESULT): HRESULT {.winapi, inline.} = self.lpVtbl.Close(self, hr)
proc SetClientGuid*(self: ptr IFileDialog, guid: REFGUID): HRESULT {.winapi, inline.} = self.lpVtbl.SetClientGuid(self, guid)
proc ClearClientData*(self: ptr IFileDialog): HRESULT {.winapi, inline.} = self.lpVtbl.ClearClientData(self)
proc SetFilter*(self: ptr IFileDialog, pFilter: ptr IShellItemFilter): HRESULT {.winapi, inline.} = self.lpVtbl.SetFilter(self, pFilter)
proc SetSaveAsItem*(self: ptr IFileSaveDialog, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.SetSaveAsItem(self, psi)
proc SetProperties*(self: ptr IFileSaveDialog, pStore: ptr IPropertyStore): HRESULT {.winapi, inline.} = self.lpVtbl.SetProperties(self, pStore)
proc SetCollectedProperties*(self: ptr IFileSaveDialog, pList: ptr IPropertyDescriptionList, fAppendDefault: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetCollectedProperties(self, pList, fAppendDefault)
proc GetProperties*(self: ptr IFileSaveDialog, ppStore: ptr ptr IPropertyStore): HRESULT {.winapi, inline.} = self.lpVtbl.GetProperties(self, ppStore)
proc ApplyProperties*(self: ptr IFileSaveDialog, psi: ptr IShellItem, pStore: ptr IPropertyStore, hwnd: HWND, pSink: ptr IFileOperationProgressSink): HRESULT {.winapi, inline.} = self.lpVtbl.ApplyProperties(self, psi, pStore, hwnd, pSink)
proc GetResults*(self: ptr IFileOpenDialog, ppenum: ptr ptr IShellItemArray): HRESULT {.winapi, inline.} = self.lpVtbl.GetResults(self, ppenum)
proc GetSelectedItems*(self: ptr IFileOpenDialog, ppsai: ptr ptr IShellItemArray): HRESULT {.winapi, inline.} = self.lpVtbl.GetSelectedItems(self, ppsai)
proc EnableOpenDropDown*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.EnableOpenDropDown(self, dwIDCtl)
proc AddMenu*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszLabel: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.AddMenu(self, dwIDCtl, pszLabel)
proc AddPushButton*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszLabel: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.AddPushButton(self, dwIDCtl, pszLabel)
proc AddComboBox*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.AddComboBox(self, dwIDCtl)
proc AddRadioButtonList*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.AddRadioButtonList(self, dwIDCtl)
proc AddCheckButton*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszLabel: LPCWSTR, bChecked: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.AddCheckButton(self, dwIDCtl, pszLabel, bChecked)
proc AddEditBox*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszText: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.AddEditBox(self, dwIDCtl, pszText)
proc AddSeparator*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.AddSeparator(self, dwIDCtl)
proc AddText*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszText: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.AddText(self, dwIDCtl, pszText)
proc SetControlLabel*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszLabel: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetControlLabel(self, dwIDCtl, pszLabel)
proc GetControlState*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pdwState: ptr CDCONTROLSTATEF): HRESULT {.winapi, inline.} = self.lpVtbl.GetControlState(self, dwIDCtl, pdwState)
proc SetControlState*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwState: CDCONTROLSTATEF): HRESULT {.winapi, inline.} = self.lpVtbl.SetControlState(self, dwIDCtl, dwState)
proc GetEditBoxText*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, ppszText: ptr ptr WCHAR): HRESULT {.winapi, inline.} = self.lpVtbl.GetEditBoxText(self, dwIDCtl, ppszText)
proc SetEditBoxText*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszText: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetEditBoxText(self, dwIDCtl, pszText)
proc GetCheckButtonState*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pbChecked: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.GetCheckButtonState(self, dwIDCtl, pbChecked)
proc SetCheckButtonState*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, bChecked: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetCheckButtonState(self, dwIDCtl, bChecked)
proc AddControlItem*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD, pszLabel: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.AddControlItem(self, dwIDCtl, dwIDItem, pszLabel)
proc RemoveControlItem*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveControlItem(self, dwIDCtl, dwIDItem)
proc RemoveAllControlItems*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveAllControlItems(self, dwIDCtl)
proc GetControlItemState*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD, pdwState: ptr CDCONTROLSTATEF): HRESULT {.winapi, inline.} = self.lpVtbl.GetControlItemState(self, dwIDCtl, dwIDItem, pdwState)
proc SetControlItemState*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD, dwState: CDCONTROLSTATEF): HRESULT {.winapi, inline.} = self.lpVtbl.SetControlItemState(self, dwIDCtl, dwIDItem, dwState)
proc GetSelectedControlItem*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pdwIDItem: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetSelectedControlItem(self, dwIDCtl, pdwIDItem)
proc SetSelectedControlItem*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetSelectedControlItem(self, dwIDCtl, dwIDItem)
proc StartVisualGroup*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, pszLabel: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.StartVisualGroup(self, dwIDCtl, pszLabel)
proc EndVisualGroup*(self: ptr IFileDialogCustomize): HRESULT {.winapi, inline.} = self.lpVtbl.EndVisualGroup(self)
proc MakeProminent*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.MakeProminent(self, dwIDCtl)
proc SetControlItemText*(self: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD, pszLabel: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetControlItemText(self, dwIDCtl, dwIDItem, pszLabel)
proc OnItemSelected*(self: ptr IFileDialogControlEvents, pfdc: ptr IFileDialogCustomize, dwIDCtl: DWORD, dwIDItem: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.OnItemSelected(self, pfdc, dwIDCtl, dwIDItem)
proc OnButtonClicked*(self: ptr IFileDialogControlEvents, pfdc: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.OnButtonClicked(self, pfdc, dwIDCtl)
proc OnCheckButtonToggled*(self: ptr IFileDialogControlEvents, pfdc: ptr IFileDialogCustomize, dwIDCtl: DWORD, bChecked: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.OnCheckButtonToggled(self, pfdc, dwIDCtl, bChecked)
proc OnControlActivating*(self: ptr IFileDialogControlEvents, pfdc: ptr IFileDialogCustomize, dwIDCtl: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.OnControlActivating(self, pfdc, dwIDCtl)
proc SetCancelButtonLabel*(self: ptr IFileDialog2, pszLabel: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetCancelButtonLabel(self, pszLabel)
proc SetNavigationRoot*(self: ptr IFileDialog2, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.SetNavigationRoot(self, psi)
proc QueryCurrentDefault*(self: ptr IApplicationAssociationRegistration, pszQuery: LPCWSTR, atQueryType: ASSOCIATIONTYPE, alQueryLevel: ASSOCIATIONLEVEL, ppszAssociation: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.QueryCurrentDefault(self, pszQuery, atQueryType, alQueryLevel, ppszAssociation)
proc QueryAppIsDefault*(self: ptr IApplicationAssociationRegistration, pszQuery: LPCWSTR, atQueryType: ASSOCIATIONTYPE, alQueryLevel: ASSOCIATIONLEVEL, pszAppRegistryName: LPCWSTR, pfDefault: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.QueryAppIsDefault(self, pszQuery, atQueryType, alQueryLevel, pszAppRegistryName, pfDefault)
proc QueryAppIsDefaultAll*(self: ptr IApplicationAssociationRegistration, alQueryLevel: ASSOCIATIONLEVEL, pszAppRegistryName: LPCWSTR, pfDefault: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.QueryAppIsDefaultAll(self, alQueryLevel, pszAppRegistryName, pfDefault)
proc SetAppAsDefault*(self: ptr IApplicationAssociationRegistration, pszAppRegistryName: LPCWSTR, pszSet: LPCWSTR, atSetType: ASSOCIATIONTYPE): HRESULT {.winapi, inline.} = self.lpVtbl.SetAppAsDefault(self, pszAppRegistryName, pszSet, atSetType)
proc SetAppAsDefaultAll*(self: ptr IApplicationAssociationRegistration, pszAppRegistryName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetAppAsDefaultAll(self, pszAppRegistryName)
proc ClearUserAssociations*(self: ptr IApplicationAssociationRegistration): HRESULT {.winapi, inline.} = self.lpVtbl.ClearUserAssociations(self)
proc LaunchAdvancedAssociationUI*(self: ptr IApplicationAssociationRegistrationUI, pszAppRegistryName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.LaunchAdvancedAssociationUI(self, pszAppRegistryName)
proc SetItemAlloc*(self: ptr IDelegateFolder, pmalloc: ptr IMalloc): HRESULT {.winapi, inline.} = self.lpVtbl.SetItemAlloc(self, pmalloc)
proc GetFrameOptions*(self: ptr IBrowserFrameOptions, dwMask: BROWSERFRAMEOPTIONS, pdwOptions: ptr BROWSERFRAMEOPTIONS): HRESULT {.winapi, inline.} = self.lpVtbl.GetFrameOptions(self, dwMask, pdwOptions)
proc EvaluateNewWindow*(self: ptr INewWindowManager, pszUrl: LPCWSTR, pszName: LPCWSTR, pszUrlContext: LPCWSTR, pszFeatures: LPCWSTR, fReplace: WINBOOL, dwFlags: DWORD, dwUserActionTime: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.EvaluateNewWindow(self, pszUrl, pszName, pszUrlContext, pszFeatures, fReplace, dwFlags, dwUserActionTime)
proc SetClientTitle*(self: ptr IAttachmentExecute, pszTitle: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetClientTitle(self, pszTitle)
proc SetClientGuid*(self: ptr IAttachmentExecute, guid: REFGUID): HRESULT {.winapi, inline.} = self.lpVtbl.SetClientGuid(self, guid)
proc SetLocalPath*(self: ptr IAttachmentExecute, pszLocalPath: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetLocalPath(self, pszLocalPath)
proc SetFileName*(self: ptr IAttachmentExecute, pszFileName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetFileName(self, pszFileName)
proc SetSource*(self: ptr IAttachmentExecute, pszSource: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetSource(self, pszSource)
proc SetReferrer*(self: ptr IAttachmentExecute, pszReferrer: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetReferrer(self, pszReferrer)
proc CheckPolicy*(self: ptr IAttachmentExecute): HRESULT {.winapi, inline.} = self.lpVtbl.CheckPolicy(self)
proc Prompt*(self: ptr IAttachmentExecute, hwnd: HWND, prompt: ATTACHMENT_PROMPT, paction: ptr ATTACHMENT_ACTION): HRESULT {.winapi, inline.} = self.lpVtbl.Prompt(self, hwnd, prompt, paction)
proc Save*(self: ptr IAttachmentExecute): HRESULT {.winapi, inline.} = self.lpVtbl.Save(self)
proc Execute*(self: ptr IAttachmentExecute, hwnd: HWND, pszVerb: LPCWSTR, phProcess: ptr HANDLE): HRESULT {.winapi, inline.} = self.lpVtbl.Execute(self, hwnd, pszVerb, phProcess)
proc SaveWithUI*(self: ptr IAttachmentExecute, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.SaveWithUI(self, hwnd)
proc ClearClientState*(self: ptr IAttachmentExecute): HRESULT {.winapi, inline.} = self.lpVtbl.ClearClientState(self)
proc CallbackSM*(self: ptr IShellMenuCallback, psmd: LPSMDATA, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.winapi, inline.} = self.lpVtbl.CallbackSM(self, psmd, uMsg, wParam, lParam)
proc Initialize*(self: ptr IShellMenu, psmc: ptr IShellMenuCallback, uId: UINT, uIdAncestor: UINT, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, psmc, uId, uIdAncestor, dwFlags)
proc GetMenuInfo*(self: ptr IShellMenu, ppsmc: ptr ptr IShellMenuCallback, puId: ptr UINT, puIdAncestor: ptr UINT, pdwFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetMenuInfo(self, ppsmc, puId, puIdAncestor, pdwFlags)
proc SetShellFolder*(self: ptr IShellMenu, psf: ptr IShellFolder, pidlFolder: PCIDLIST_ABSOLUTE, hKey: HKEY, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetShellFolder(self, psf, pidlFolder, hKey, dwFlags)
proc GetShellFolder*(self: ptr IShellMenu, pdwFlags: ptr DWORD, ppidl: ptr PIDLIST_ABSOLUTE, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetShellFolder(self, pdwFlags, ppidl, riid, ppv)
proc SetMenu*(self: ptr IShellMenu, hmenu: HMENU, hwnd: HWND, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetMenu(self, hmenu, hwnd, dwFlags)
proc GetMenu*(self: ptr IShellMenu, phmenu: ptr HMENU, phwnd: ptr HWND, pdwFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetMenu(self, phmenu, phwnd, pdwFlags)
proc InvalidateItem*(self: ptr IShellMenu, psmd: LPSMDATA, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.InvalidateItem(self, psmd, dwFlags)
proc GetState*(self: ptr IShellMenu, psmd: LPSMDATA): HRESULT {.winapi, inline.} = self.lpVtbl.GetState(self, psmd)
proc SetMenuToolbar*(self: ptr IShellMenu, punk: ptr IUnknown, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetMenuToolbar(self, punk, dwFlags)
proc Run*(self: ptr IShellRunDll, pszArgs: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Run(self, pszArgs)
proc GetId*(self: ptr IKnownFolder, pkfid: ptr KNOWNFOLDERID): HRESULT {.winapi, inline.} = self.lpVtbl.GetId(self, pkfid)
proc GetCategory*(self: ptr IKnownFolder, pCategory: ptr KF_CATEGORY): HRESULT {.winapi, inline.} = self.lpVtbl.GetCategory(self, pCategory)
proc GetShellItem*(self: ptr IKnownFolder, dwFlags: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetShellItem(self, dwFlags, riid, ppv)
proc GetPath*(self: ptr IKnownFolder, dwFlags: DWORD, ppszPath: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetPath(self, dwFlags, ppszPath)
proc SetPath*(self: ptr IKnownFolder, dwFlags: DWORD, pszPath: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetPath(self, dwFlags, pszPath)
proc GetIDList*(self: ptr IKnownFolder, dwFlags: DWORD, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.GetIDList(self, dwFlags, ppidl)
proc GetFolderType*(self: ptr IKnownFolder, pftid: ptr FOLDERTYPEID): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolderType(self, pftid)
proc GetRedirectionCapabilities*(self: ptr IKnownFolder, pCapabilities: ptr KF_REDIRECTION_CAPABILITIES): HRESULT {.winapi, inline.} = self.lpVtbl.GetRedirectionCapabilities(self, pCapabilities)
proc GetFolderDefinition*(self: ptr IKnownFolder, pKFD: ptr KNOWNFOLDER_DEFINITION): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolderDefinition(self, pKFD)
proc FolderIdFromCsidl*(self: ptr IKnownFolderManager, nCsidl: int32, pfid: ptr KNOWNFOLDERID): HRESULT {.winapi, inline.} = self.lpVtbl.FolderIdFromCsidl(self, nCsidl, pfid)
proc FolderIdToCsidl*(self: ptr IKnownFolderManager, rfid: REFKNOWNFOLDERID, pnCsidl: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.FolderIdToCsidl(self, rfid, pnCsidl)
proc GetFolderIds*(self: ptr IKnownFolderManager, ppKFId: ptr ptr KNOWNFOLDERID, pCount: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolderIds(self, ppKFId, pCount)
proc GetFolder*(self: ptr IKnownFolderManager, rfid: REFKNOWNFOLDERID, ppkf: ptr ptr IKnownFolder): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolder(self, rfid, ppkf)
proc GetFolderByName*(self: ptr IKnownFolderManager, pszCanonicalName: LPCWSTR, ppkf: ptr ptr IKnownFolder): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolderByName(self, pszCanonicalName, ppkf)
proc RegisterFolder*(self: ptr IKnownFolderManager, rfid: REFKNOWNFOLDERID, pKFD: ptr KNOWNFOLDER_DEFINITION): HRESULT {.winapi, inline.} = self.lpVtbl.RegisterFolder(self, rfid, pKFD)
proc UnregisterFolder*(self: ptr IKnownFolderManager, rfid: REFKNOWNFOLDERID): HRESULT {.winapi, inline.} = self.lpVtbl.UnregisterFolder(self, rfid)
proc FindFolderFromPath*(self: ptr IKnownFolderManager, pszPath: LPCWSTR, mode: FFFP_MODE, ppkf: ptr ptr IKnownFolder): HRESULT {.winapi, inline.} = self.lpVtbl.FindFolderFromPath(self, pszPath, mode, ppkf)
proc FindFolderFromIDList*(self: ptr IKnownFolderManager, pidl: PCIDLIST_ABSOLUTE, ppkf: ptr ptr IKnownFolder): HRESULT {.winapi, inline.} = self.lpVtbl.FindFolderFromIDList(self, pidl, ppkf)
proc Redirect*(self: ptr IKnownFolderManager, rfid: REFKNOWNFOLDERID, hwnd: HWND, flags: KF_REDIRECT_FLAGS, pszTargetPath: LPCWSTR, cFolders: UINT, pExclusion: ptr KNOWNFOLDERID, ppszError: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Redirect(self, rfid, hwnd, flags, pszTargetPath, cFolders, pExclusion, ppszError)
proc CreateShare*(self: ptr ISharingConfigurationManager, dsid: DEF_SHARE_ID, role: SHARE_ROLE): HRESULT {.winapi, inline.} = self.lpVtbl.CreateShare(self, dsid, role)
proc DeleteShare*(self: ptr ISharingConfigurationManager, dsid: DEF_SHARE_ID): HRESULT {.winapi, inline.} = self.lpVtbl.DeleteShare(self, dsid)
proc ShareExists*(self: ptr ISharingConfigurationManager, dsid: DEF_SHARE_ID): HRESULT {.winapi, inline.} = self.lpVtbl.ShareExists(self, dsid)
proc GetSharePermissions*(self: ptr ISharingConfigurationManager, dsid: DEF_SHARE_ID, pRole: ptr SHARE_ROLE): HRESULT {.winapi, inline.} = self.lpVtbl.GetSharePermissions(self, dsid, pRole)
proc SharePrinters*(self: ptr ISharingConfigurationManager): HRESULT {.winapi, inline.} = self.lpVtbl.SharePrinters(self)
proc StopSharingPrinters*(self: ptr ISharingConfigurationManager): HRESULT {.winapi, inline.} = self.lpVtbl.StopSharingPrinters(self)
proc ArePrintersShared*(self: ptr ISharingConfigurationManager): HRESULT {.winapi, inline.} = self.lpVtbl.ArePrintersShared(self)
proc AreSnapshotsAvailable*(self: ptr IPreviousVersionsInfo, pszPath: LPCWSTR, fOkToBeSlow: WINBOOL, pfAvailable: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.AreSnapshotsAvailable(self, pszPath, fOkToBeSlow, pfAvailable)
proc GetItemIDList*(self: ptr IRelatedItem, ppidl: ptr PIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.GetItemIDList(self, ppidl)
proc GetItem*(self: ptr IRelatedItem, ppsi: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.GetItem(self, ppsi)
proc GetDestinationStream*(self: ptr IDestinationStreamFactory, ppstm: ptr ptr IStream): HRESULT {.winapi, inline.} = self.lpVtbl.GetDestinationStream(self, ppstm)
proc IncludeItems*(self: ptr INewMenuClient, pflags: ptr NMCII_FLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.IncludeItems(self, pflags)
proc SelectAndEditItem*(self: ptr INewMenuClient, pidlItem: PCIDLIST_ABSOLUTE, flags: NMCSAEI_FLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.SelectAndEditItem(self, pidlItem, flags)
proc Initialize*(self: ptr IInitializeWithBindCtx, pbc: ptr IBindCtx): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, pbc)
proc IncludeItem*(self: ptr IShellItemFilter, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.IncludeItem(self, psi)
proc GetEnumFlagsForItem*(self: ptr IShellItemFilter, psi: ptr IShellItem, pgrfFlags: ptr SHCONTF): HRESULT {.winapi, inline.} = self.lpVtbl.GetEnumFlagsForItem(self, psi, pgrfFlags)
proc Initialize*(self: ptr INameSpaceTreeControl, hwndParent: HWND, prc: ptr RECT, nsctsFlags: NSTCSTYLE): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, hwndParent, prc, nsctsFlags)
proc TreeAdvise*(self: ptr INameSpaceTreeControl, punk: ptr IUnknown, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.TreeAdvise(self, punk, pdwCookie)
proc TreeUnadvise*(self: ptr INameSpaceTreeControl, dwCookie: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.TreeUnadvise(self, dwCookie)
proc AppendRoot*(self: ptr INameSpaceTreeControl, psiRoot: ptr IShellItem, grfEnumFlags: SHCONTF, grfRootStyle: NSTCROOTSTYLE, pif: ptr IShellItemFilter): HRESULT {.winapi, inline.} = self.lpVtbl.AppendRoot(self, psiRoot, grfEnumFlags, grfRootStyle, pif)
proc InsertRoot*(self: ptr INameSpaceTreeControl, iIndex: int32, psiRoot: ptr IShellItem, grfEnumFlags: SHCONTF, grfRootStyle: NSTCROOTSTYLE, pif: ptr IShellItemFilter): HRESULT {.winapi, inline.} = self.lpVtbl.InsertRoot(self, iIndex, psiRoot, grfEnumFlags, grfRootStyle, pif)
proc RemoveRoot*(self: ptr INameSpaceTreeControl, psiRoot: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveRoot(self, psiRoot)
proc RemoveAllRoots*(self: ptr INameSpaceTreeControl): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveAllRoots(self)
proc GetRootItems*(self: ptr INameSpaceTreeControl, ppsiaRootItems: ptr ptr IShellItemArray): HRESULT {.winapi, inline.} = self.lpVtbl.GetRootItems(self, ppsiaRootItems)
proc SetItemState*(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, nstcisMask: NSTCITEMSTATE, nstcisFlags: NSTCITEMSTATE): HRESULT {.winapi, inline.} = self.lpVtbl.SetItemState(self, psi, nstcisMask, nstcisFlags)
proc GetItemState*(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, nstcisMask: NSTCITEMSTATE, pnstcisFlags: ptr NSTCITEMSTATE): HRESULT {.winapi, inline.} = self.lpVtbl.GetItemState(self, psi, nstcisMask, pnstcisFlags)
proc GetSelectedItems*(self: ptr INameSpaceTreeControl, psiaItems: ptr ptr IShellItemArray): HRESULT {.winapi, inline.} = self.lpVtbl.GetSelectedItems(self, psiaItems)
proc GetItemCustomState*(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, piStateNumber: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetItemCustomState(self, psi, piStateNumber)
proc SetItemCustomState*(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, iStateNumber: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetItemCustomState(self, psi, iStateNumber)
proc EnsureItemVisible*(self: ptr INameSpaceTreeControl, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.EnsureItemVisible(self, psi)
proc SetTheme*(self: ptr INameSpaceTreeControl, pszTheme: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetTheme(self, pszTheme)
proc GetNextItem*(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, nstcgi: NSTCGNI, ppsiNext: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.GetNextItem(self, psi, nstcgi, ppsiNext)
proc HitTest*(self: ptr INameSpaceTreeControl, ppt: ptr POINT, ppsiOut: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.HitTest(self, ppt, ppsiOut)
proc GetItemRect*(self: ptr INameSpaceTreeControl, psi: ptr IShellItem, prect: ptr RECT): HRESULT {.winapi, inline.} = self.lpVtbl.GetItemRect(self, psi, prect)
proc CollapseAll*(self: ptr INameSpaceTreeControl): HRESULT {.winapi, inline.} = self.lpVtbl.CollapseAll(self)
proc SetControlStyle*(self: ptr INameSpaceTreeControl2, nstcsMask: NSTCSTYLE, nstcsStyle: NSTCSTYLE): HRESULT {.winapi, inline.} = self.lpVtbl.SetControlStyle(self, nstcsMask, nstcsStyle)
proc GetControlStyle*(self: ptr INameSpaceTreeControl2, nstcsMask: NSTCSTYLE, pnstcsStyle: ptr NSTCSTYLE): HRESULT {.winapi, inline.} = self.lpVtbl.GetControlStyle(self, nstcsMask, pnstcsStyle)
proc SetControlStyle2*(self: ptr INameSpaceTreeControl2, nstcsMask: NSTCSTYLE2, nstcsStyle: NSTCSTYLE2): HRESULT {.winapi, inline.} = self.lpVtbl.SetControlStyle2(self, nstcsMask, nstcsStyle)
proc GetControlStyle2*(self: ptr INameSpaceTreeControl2, nstcsMask: NSTCSTYLE2, pnstcsStyle: ptr NSTCSTYLE2): HRESULT {.winapi, inline.} = self.lpVtbl.GetControlStyle2(self, nstcsMask, pnstcsStyle)
proc OnItemClick*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, nstceHitTest: NSTCEHITTEST, nstceClickType: NSTCECLICKTYPE): HRESULT {.winapi, inline.} = self.lpVtbl.OnItemClick(self, psi, nstceHitTest, nstceClickType)
proc OnPropertyItemCommit*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.OnPropertyItemCommit(self, psi)
proc OnItemStateChanging*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, nstcisMask: NSTCITEMSTATE, nstcisState: NSTCITEMSTATE): HRESULT {.winapi, inline.} = self.lpVtbl.OnItemStateChanging(self, psi, nstcisMask, nstcisState)
proc OnItemStateChanged*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, nstcisMask: NSTCITEMSTATE, nstcisState: NSTCITEMSTATE): HRESULT {.winapi, inline.} = self.lpVtbl.OnItemStateChanged(self, psi, nstcisMask, nstcisState)
proc OnSelectionChanged*(self: ptr INameSpaceTreeControlEvents, psiaSelection: ptr IShellItemArray): HRESULT {.winapi, inline.} = self.lpVtbl.OnSelectionChanged(self, psiaSelection)
proc OnKeyboardInput*(self: ptr INameSpaceTreeControlEvents, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.winapi, inline.} = self.lpVtbl.OnKeyboardInput(self, uMsg, wParam, lParam)
proc OnBeforeExpand*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.OnBeforeExpand(self, psi)
proc OnAfterExpand*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.OnAfterExpand(self, psi)
proc OnBeginLabelEdit*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.OnBeginLabelEdit(self, psi)
proc OnEndLabelEdit*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.OnEndLabelEdit(self, psi)
proc OnGetToolTip*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, pszTip: LPWSTR, cchTip: int32): HRESULT {.winapi, inline.} = self.lpVtbl.OnGetToolTip(self, psi, pszTip, cchTip)
proc OnBeforeItemDelete*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.OnBeforeItemDelete(self, psi)
proc OnItemAdded*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, fIsRoot: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.OnItemAdded(self, psi, fIsRoot)
proc OnItemDeleted*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, fIsRoot: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.OnItemDeleted(self, psi, fIsRoot)
proc OnBeforeContextMenu*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.OnBeforeContextMenu(self, psi, riid, ppv)
proc OnAfterContextMenu*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, pcmIn: ptr IContextMenu, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.OnAfterContextMenu(self, psi, pcmIn, riid, ppv)
proc OnBeforeStateImageChange*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.OnBeforeStateImageChange(self, psi)
proc OnGetDefaultIconIndex*(self: ptr INameSpaceTreeControlEvents, psi: ptr IShellItem, piDefaultIcon: ptr int32, piOpenIcon: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.OnGetDefaultIconIndex(self, psi, piDefaultIcon, piOpenIcon)
proc OnDragEnter*(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem, psiaData: ptr IShellItemArray, fOutsideSource: WINBOOL, grfKeyState: DWORD, pdwEffect: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.OnDragEnter(self, psiOver, psiaData, fOutsideSource, grfKeyState, pdwEffect)
proc OnDragOver*(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem, psiaData: ptr IShellItemArray, grfKeyState: DWORD, pdwEffect: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.OnDragOver(self, psiOver, psiaData, grfKeyState, pdwEffect)
proc OnDragPosition*(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem, psiaData: ptr IShellItemArray, iNewPosition: int32, iOldPosition: int32): HRESULT {.winapi, inline.} = self.lpVtbl.OnDragPosition(self, psiOver, psiaData, iNewPosition, iOldPosition)
proc OnDrop*(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem, psiaData: ptr IShellItemArray, iPosition: int32, grfKeyState: DWORD, pdwEffect: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.OnDrop(self, psiOver, psiaData, iPosition, grfKeyState, pdwEffect)
proc OnDropPosition*(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem, psiaData: ptr IShellItemArray, iNewPosition: int32, iOldPosition: int32): HRESULT {.winapi, inline.} = self.lpVtbl.OnDropPosition(self, psiOver, psiaData, iNewPosition, iOldPosition)
proc OnDragLeave*(self: ptr INameSpaceTreeControlDropHandler, psiOver: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.OnDragLeave(self, psiOver)
proc OnGetDefaultAccessibilityAction*(self: ptr INameSpaceTreeAccessible, psi: ptr IShellItem, pbstrDefaultAction: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.OnGetDefaultAccessibilityAction(self, psi, pbstrDefaultAction)
proc OnDoDefaultAccessibilityAction*(self: ptr INameSpaceTreeAccessible, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.OnDoDefaultAccessibilityAction(self, psi)
proc OnGetAccessibilityRole*(self: ptr INameSpaceTreeAccessible, psi: ptr IShellItem, pvarRole: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.OnGetAccessibilityRole(self, psi, pvarRole)
proc PrePaint*(self: ptr INameSpaceTreeControlCustomDraw, hdc: HDC, prc: ptr RECT, plres: ptr LRESULT): HRESULT {.winapi, inline.} = self.lpVtbl.PrePaint(self, hdc, prc, plres)
proc PostPaint*(self: ptr INameSpaceTreeControlCustomDraw, hdc: HDC, prc: ptr RECT): HRESULT {.winapi, inline.} = self.lpVtbl.PostPaint(self, hdc, prc)
proc ItemPrePaint*(self: ptr INameSpaceTreeControlCustomDraw, hdc: HDC, prc: ptr RECT, pnstccdItem: ptr NSTCCUSTOMDRAW, pclrText: ptr COLORREF, pclrTextBk: ptr COLORREF, plres: ptr LRESULT): HRESULT {.winapi, inline.} = self.lpVtbl.ItemPrePaint(self, hdc, prc, pnstccdItem, pclrText, pclrTextBk, plres)
proc ItemPostPaint*(self: ptr INameSpaceTreeControlCustomDraw, hdc: HDC, prc: ptr RECT, pnstccdItem: ptr NSTCCUSTOMDRAW): HRESULT {.winapi, inline.} = self.lpVtbl.ItemPostPaint(self, hdc, prc, pnstccdItem)
proc GetFolderCapabilities*(self: ptr INameSpaceTreeControlFolderCapabilities, nfcMask: NSTCFOLDERCAPABILITIES, pnfcValue: ptr NSTCFOLDERCAPABILITIES): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolderCapabilities(self, nfcMask, pnfcValue)
proc SetWindow*(self: ptr IPreviewHandler, hwnd: HWND, prc: ptr RECT): HRESULT {.winapi, inline.} = self.lpVtbl.SetWindow(self, hwnd, prc)
proc SetRect*(self: ptr IPreviewHandler, prc: ptr RECT): HRESULT {.winapi, inline.} = self.lpVtbl.SetRect(self, prc)
proc DoPreview*(self: ptr IPreviewHandler): HRESULT {.winapi, inline.} = self.lpVtbl.DoPreview(self)
proc Unload*(self: ptr IPreviewHandler): HRESULT {.winapi, inline.} = self.lpVtbl.Unload(self)
proc SetFocus*(self: ptr IPreviewHandler): HRESULT {.winapi, inline.} = self.lpVtbl.SetFocus(self)
proc QueryFocus*(self: ptr IPreviewHandler, phwnd: ptr HWND): HRESULT {.winapi, inline.} = self.lpVtbl.QueryFocus(self, phwnd)
proc TranslateAccelerator*(self: ptr IPreviewHandler, pmsg: ptr MSG): HRESULT {.winapi, inline.} = self.lpVtbl.TranslateAccelerator(self, pmsg)
proc GetWindowContext*(self: ptr IPreviewHandlerFrame, pinfo: ptr PREVIEWHANDLERFRAMEINFO): HRESULT {.winapi, inline.} = self.lpVtbl.GetWindowContext(self, pinfo)
proc TranslateAccelerator*(self: ptr IPreviewHandlerFrame, pmsg: ptr MSG): HRESULT {.winapi, inline.} = self.lpVtbl.TranslateAccelerator(self, pmsg)
proc ShowDeskBand*(self: ptr ITrayDeskBand, clsid: REFCLSID): HRESULT {.winapi, inline.} = self.lpVtbl.ShowDeskBand(self, clsid)
proc HideDeskBand*(self: ptr ITrayDeskBand, clsid: REFCLSID): HRESULT {.winapi, inline.} = self.lpVtbl.HideDeskBand(self, clsid)
proc IsDeskBandShown*(self: ptr ITrayDeskBand, clsid: REFCLSID): HRESULT {.winapi, inline.} = self.lpVtbl.IsDeskBandShown(self, clsid)
proc DeskBandRegistrationChanged*(self: ptr ITrayDeskBand): HRESULT {.winapi, inline.} = self.lpVtbl.DeskBandRegistrationChanged(self)
proc CreateBand*(self: ptr IBandHost, rclsidBand: REFCLSID, fAvailable: WINBOOL, fVisible: WINBOOL, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.CreateBand(self, rclsidBand, fAvailable, fVisible, riid, ppv)
proc SetBandAvailability*(self: ptr IBandHost, rclsidBand: REFCLSID, fAvailable: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetBandAvailability(self, rclsidBand, fAvailable)
proc DestroyBand*(self: ptr IBandHost, rclsidBand: REFCLSID): HRESULT {.winapi, inline.} = self.lpVtbl.DestroyBand(self, rclsidBand)
proc GetPaneState*(self: ptr IExplorerPaneVisibility, ep: REFEXPLORERPANE, peps: ptr EXPLORERPANESTATE): HRESULT {.winapi, inline.} = self.lpVtbl.GetPaneState(self, ep, peps)
proc CallBack*(self: ptr IContextMenuCB, psf: ptr IShellFolder, hwndOwner: HWND, pdtobj: ptr IDataObject, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.winapi, inline.} = self.lpVtbl.CallBack(self, psf, hwndOwner, pdtobj, uMsg, wParam, lParam)
proc SetFlags*(self: ptr IDefaultExtractIconInit, uFlags: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetFlags(self, uFlags)
proc SetKey*(self: ptr IDefaultExtractIconInit, hkey: HKEY): HRESULT {.winapi, inline.} = self.lpVtbl.SetKey(self, hkey)
proc SetNormalIcon*(self: ptr IDefaultExtractIconInit, pszFile: LPCWSTR, iIcon: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetNormalIcon(self, pszFile, iIcon)
proc SetOpenIcon*(self: ptr IDefaultExtractIconInit, pszFile: LPCWSTR, iIcon: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetOpenIcon(self, pszFile, iIcon)
proc SetShortcutIcon*(self: ptr IDefaultExtractIconInit, pszFile: LPCWSTR, iIcon: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetShortcutIcon(self, pszFile, iIcon)
proc SetDefaultIcon*(self: ptr IDefaultExtractIconInit, pszFile: LPCWSTR, iIcon: int32): HRESULT {.winapi, inline.} = self.lpVtbl.SetDefaultIcon(self, pszFile, iIcon)
proc GetTitle*(self: ptr IExplorerCommand, psiItemArray: ptr IShellItemArray, ppszName: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetTitle(self, psiItemArray, ppszName)
proc GetIcon*(self: ptr IExplorerCommand, psiItemArray: ptr IShellItemArray, ppszIcon: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetIcon(self, psiItemArray, ppszIcon)
proc GetToolTip*(self: ptr IExplorerCommand, psiItemArray: ptr IShellItemArray, ppszInfotip: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetToolTip(self, psiItemArray, ppszInfotip)
proc GetCanonicalName*(self: ptr IExplorerCommand, pguidCommandName: ptr GUID): HRESULT {.winapi, inline.} = self.lpVtbl.GetCanonicalName(self, pguidCommandName)
proc GetState*(self: ptr IExplorerCommand, psiItemArray: ptr IShellItemArray, fOkToBeSlow: WINBOOL, pCmdState: ptr EXPCMDSTATE): HRESULT {.winapi, inline.} = self.lpVtbl.GetState(self, psiItemArray, fOkToBeSlow, pCmdState)
proc Invoke*(self: ptr IExplorerCommand, psiItemArray: ptr IShellItemArray, pbc: ptr IBindCtx): HRESULT {.winapi, inline.} = self.lpVtbl.Invoke(self, psiItemArray, pbc)
proc GetFlags*(self: ptr IExplorerCommand, pFlags: ptr EXPCMDFLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.GetFlags(self, pFlags)
proc EnumSubCommands*(self: ptr IExplorerCommand, ppEnum: ptr ptr IEnumExplorerCommand): HRESULT {.winapi, inline.} = self.lpVtbl.EnumSubCommands(self, ppEnum)
proc GetState*(self: ptr IExplorerCommandState, psiItemArray: ptr IShellItemArray, fOkToBeSlow: WINBOOL, pCmdState: ptr EXPCMDSTATE): HRESULT {.winapi, inline.} = self.lpVtbl.GetState(self, psiItemArray, fOkToBeSlow, pCmdState)
proc Initialize*(self: ptr IInitializeCommand, pszCommandName: LPCWSTR, ppb: ptr IPropertyBag): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, pszCommandName, ppb)
proc Next*(self: ptr IEnumExplorerCommand, celt: ULONG, pUICommand: ptr ptr IExplorerCommand, pceltFetched: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Next(self, celt, pUICommand, pceltFetched)
proc Skip*(self: ptr IEnumExplorerCommand, celt: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Skip(self, celt)
proc Reset*(self: ptr IEnumExplorerCommand): HRESULT {.winapi, inline.} = self.lpVtbl.Reset(self)
proc Clone*(self: ptr IEnumExplorerCommand, ppenum: ptr ptr IEnumExplorerCommand): HRESULT {.winapi, inline.} = self.lpVtbl.Clone(self, ppenum)
proc GetCommands*(self: ptr IExplorerCommandProvider, punkSite: ptr IUnknown, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetCommands(self, punkSite, riid, ppv)
proc GetCommand*(self: ptr IExplorerCommandProvider, rguidCommandId: REFGUID, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetCommand(self, rguidCommandId, riid, ppv)
proc Initialize*(self: ptr IInitializeNetworkFolder, pidl: PCIDLIST_ABSOLUTE, pidlTarget: PCIDLIST_ABSOLUTE, uDisplayType: UINT, pszResName: LPCWSTR, pszProvider: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, pidl, pidlTarget, uDisplayType, pszResName, pszProvider)
proc Open*(self: ptr IOpenControlPanel, pszName: LPCWSTR, pszPage: LPCWSTR, punkSite: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.Open(self, pszName, pszPage, punkSite)
proc GetPath*(self: ptr IOpenControlPanel, pszName: LPCWSTR, pszPath: LPWSTR, cchPath: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetPath(self, pszName, pszPath, cchPath)
proc GetCurrentView*(self: ptr IOpenControlPanel, pView: ptr CPVIEW): HRESULT {.winapi, inline.} = self.lpVtbl.GetCurrentView(self, pView)
proc ComputerInfoChanged*(self: ptr IComputerInfoChangeNotify): HRESULT {.winapi, inline.} = self.lpVtbl.ComputerInfoChanged(self)
proc SetFindData*(self: ptr IFileSystemBindData, pfd: ptr WIN32_FIND_DATAW): HRESULT {.winapi, inline.} = self.lpVtbl.SetFindData(self, pfd)
proc GetFindData*(self: ptr IFileSystemBindData, pfd: ptr WIN32_FIND_DATAW): HRESULT {.winapi, inline.} = self.lpVtbl.GetFindData(self, pfd)
proc SetFileID*(self: ptr IFileSystemBindData2, liFileID: LARGE_INTEGER): HRESULT {.winapi, inline.} = self.lpVtbl.SetFileID(self, liFileID)
proc GetFileID*(self: ptr IFileSystemBindData2, pliFileID: ptr LARGE_INTEGER): HRESULT {.winapi, inline.} = self.lpVtbl.GetFileID(self, pliFileID)
proc SetJunctionCLSID*(self: ptr IFileSystemBindData2, clsid: REFCLSID): HRESULT {.winapi, inline.} = self.lpVtbl.SetJunctionCLSID(self, clsid)
proc GetJunctionCLSID*(self: ptr IFileSystemBindData2, pclsid: ptr CLSID): HRESULT {.winapi, inline.} = self.lpVtbl.GetJunctionCLSID(self, pclsid)
proc SetAppID*(self: ptr ICustomDestinationList, pszAppID: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetAppID(self, pszAppID)
proc BeginList*(self: ptr ICustomDestinationList, pcMinSlots: ptr UINT, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.BeginList(self, pcMinSlots, riid, ppv)
proc AppendCategory*(self: ptr ICustomDestinationList, pszCategory: LPCWSTR, poa: ptr IObjectArray): HRESULT {.winapi, inline.} = self.lpVtbl.AppendCategory(self, pszCategory, poa)
proc AppendKnownCategory*(self: ptr ICustomDestinationList, category: KNOWNDESTCATEGORY): HRESULT {.winapi, inline.} = self.lpVtbl.AppendKnownCategory(self, category)
proc AddUserTasks*(self: ptr ICustomDestinationList, poa: ptr IObjectArray): HRESULT {.winapi, inline.} = self.lpVtbl.AddUserTasks(self, poa)
proc CommitList*(self: ptr ICustomDestinationList): HRESULT {.winapi, inline.} = self.lpVtbl.CommitList(self)
proc GetRemovedDestinations*(self: ptr ICustomDestinationList, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetRemovedDestinations(self, riid, ppv)
proc DeleteList*(self: ptr ICustomDestinationList, pszAppID: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.DeleteList(self, pszAppID)
proc AbortList*(self: ptr ICustomDestinationList): HRESULT {.winapi, inline.} = self.lpVtbl.AbortList(self)
proc SetAppID*(self: ptr IApplicationDestinations, pszAppID: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetAppID(self, pszAppID)
proc RemoveDestination*(self: ptr IApplicationDestinations, punk: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveDestination(self, punk)
proc RemoveAllDestinations*(self: ptr IApplicationDestinations): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveAllDestinations(self)
proc SetAppID*(self: ptr IApplicationDocumentLists, pszAppID: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetAppID(self, pszAppID)
proc GetList*(self: ptr IApplicationDocumentLists, listtype: APPDOCLISTTYPE, cItemsDesired: UINT, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetList(self, listtype, cItemsDesired, riid, ppv)
proc SetAppID*(self: ptr IObjectWithAppUserModelID, pszAppID: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetAppID(self, pszAppID)
proc GetAppID*(self: ptr IObjectWithAppUserModelID, ppszAppID: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetAppID(self, ppszAppID)
proc SetProgID*(self: ptr IObjectWithProgID, pszProgID: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetProgID(self, pszProgID)
proc GetProgID*(self: ptr IObjectWithProgID, ppszProgID: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetProgID(self, ppszProgID)
proc Update*(self: ptr IUpdateIDList, pbc: ptr IBindCtx, pidlIn: PCUITEMID_CHILD, ppidlOut: ptr PITEMID_CHILD): HRESULT {.winapi, inline.} = self.lpVtbl.Update(self, pbc, pidlIn, ppidlOut)
proc RunGadget*(self: ptr IDesktopGadget, gadgetPath: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.RunGadget(self, gadgetPath)
proc SetWallpaper*(self: ptr IDesktopWallpaper, monitorID: LPCWSTR, wallpaper: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetWallpaper(self, monitorID, wallpaper)
proc GetWallpaper*(self: ptr IDesktopWallpaper, monitorID: LPCWSTR, wallpaper: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetWallpaper(self, monitorID, wallpaper)
proc GetMonitorDevicePathAt*(self: ptr IDesktopWallpaper, monitorIndex: UINT, monitorID: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetMonitorDevicePathAt(self, monitorIndex, monitorID)
proc GetMonitorDevicePathCount*(self: ptr IDesktopWallpaper, count: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetMonitorDevicePathCount(self, count)
proc GetMonitorRECT*(self: ptr IDesktopWallpaper, monitorID: LPCWSTR, displayRect: ptr RECT): HRESULT {.winapi, inline.} = self.lpVtbl.GetMonitorRECT(self, monitorID, displayRect)
proc mSetBackgroundColor*(self: ptr IDesktopWallpaper, color: COLORREF): HRESULT {.winapi, inline.} = self.lpVtbl.SetBackgroundColor(self, color)
proc GetBackgroundColor*(self: ptr IDesktopWallpaper, color: ptr COLORREF): HRESULT {.winapi, inline.} = self.lpVtbl.GetBackgroundColor(self, color)
proc SetPosition*(self: ptr IDesktopWallpaper, position: DESKTOP_WALLPAPER_POSITION): HRESULT {.winapi, inline.} = self.lpVtbl.SetPosition(self, position)
proc GetPosition*(self: ptr IDesktopWallpaper, position: ptr DESKTOP_WALLPAPER_POSITION): HRESULT {.winapi, inline.} = self.lpVtbl.GetPosition(self, position)
proc SetSlideshow*(self: ptr IDesktopWallpaper, items: ptr IShellItemArray): HRESULT {.winapi, inline.} = self.lpVtbl.SetSlideshow(self, items)
proc GetSlideshow*(self: ptr IDesktopWallpaper, items: ptr ptr IShellItemArray): HRESULT {.winapi, inline.} = self.lpVtbl.GetSlideshow(self, items)
proc SetSlideshowOptions*(self: ptr IDesktopWallpaper, options: DESKTOP_SLIDESHOW_OPTIONS, slideshowTick: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetSlideshowOptions(self, options, slideshowTick)
proc GetSlideshowOptions*(self: ptr IDesktopWallpaper, options: ptr DESKTOP_SLIDESHOW_OPTIONS, slideshowTick: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetSlideshowOptions(self, options, slideshowTick)
proc AdvanceSlideshow*(self: ptr IDesktopWallpaper, monitorID: LPCWSTR, direction: DESKTOP_SLIDESHOW_DIRECTION): HRESULT {.winapi, inline.} = self.lpVtbl.AdvanceSlideshow(self, monitorID, direction)
proc GetStatus*(self: ptr IDesktopWallpaper, state: ptr DESKTOP_SLIDESHOW_STATE): HRESULT {.winapi, inline.} = self.lpVtbl.GetStatus(self, state)
proc Enable*(self: ptr IDesktopWallpaper, enable: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.Enable(self, enable)
proc IsMember*(self: ptr IHomeGroup, member: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.IsMember(self, member)
proc ShowSharingWizard*(self: ptr IHomeGroup, owner: HWND, sharingchoices: ptr HOMEGROUPSHARINGCHOICES): HRESULT {.winapi, inline.} = self.lpVtbl.ShowSharingWizard(self, owner, sharingchoices)
proc Initialize*(self: ptr IInitializeWithPropertyStore, pps: ptr IPropertyStore): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, pps)
proc GetResults*(self: ptr IOpenSearchSource, hwnd: HWND, pszQuery: LPCWSTR, dwStartIndex: DWORD, dwCount: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetResults(self, hwnd, pszQuery, dwStartIndex, dwCount, riid, ppv)
proc LoadLibraryFromItem*(self: ptr IShellLibrary, psiLibrary: ptr IShellItem, grfMode: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.LoadLibraryFromItem(self, psiLibrary, grfMode)
proc LoadLibraryFromKnownFolder*(self: ptr IShellLibrary, kfidLibrary: REFKNOWNFOLDERID, grfMode: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.LoadLibraryFromKnownFolder(self, kfidLibrary, grfMode)
proc AddFolder*(self: ptr IShellLibrary, psiLocation: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.AddFolder(self, psiLocation)
proc RemoveFolder*(self: ptr IShellLibrary, psiLocation: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveFolder(self, psiLocation)
proc GetFolders*(self: ptr IShellLibrary, lff: LIBRARYFOLDERFILTER, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolders(self, lff, riid, ppv)
proc ResolveFolder*(self: ptr IShellLibrary, psiFolderToResolve: ptr IShellItem, dwTimeout: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.ResolveFolder(self, psiFolderToResolve, dwTimeout, riid, ppv)
proc GetDefaultSaveFolder*(self: ptr IShellLibrary, dsft: DEFAULTSAVEFOLDERTYPE, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetDefaultSaveFolder(self, dsft, riid, ppv)
proc SetDefaultSaveFolder*(self: ptr IShellLibrary, dsft: DEFAULTSAVEFOLDERTYPE, psi: ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.SetDefaultSaveFolder(self, dsft, psi)
proc GetOptions*(self: ptr IShellLibrary, plofOptions: ptr LIBRARYOPTIONFLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.GetOptions(self, plofOptions)
proc SetOptions*(self: ptr IShellLibrary, lofMask: LIBRARYOPTIONFLAGS, lofOptions: LIBRARYOPTIONFLAGS): HRESULT {.winapi, inline.} = self.lpVtbl.SetOptions(self, lofMask, lofOptions)
proc GetFolderType*(self: ptr IShellLibrary, pftid: ptr FOLDERTYPEID): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolderType(self, pftid)
proc SetFolderType*(self: ptr IShellLibrary, ftid: REFFOLDERTYPEID): HRESULT {.winapi, inline.} = self.lpVtbl.SetFolderType(self, ftid)
proc GetIcon*(self: ptr IShellLibrary, ppszIcon: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetIcon(self, ppszIcon)
proc SetIcon*(self: ptr IShellLibrary, pszIcon: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetIcon(self, pszIcon)
proc Commit*(self: ptr IShellLibrary): HRESULT {.winapi, inline.} = self.lpVtbl.Commit(self)
proc Save*(self: ptr IShellLibrary, psiFolderToSaveIn: ptr IShellItem, pszLibraryName: LPCWSTR, lsf: LIBRARYSAVEFLAGS, ppsiSavedTo: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.Save(self, psiFolderToSaveIn, pszLibraryName, lsf, ppsiSavedTo)
proc SaveInKnownFolder*(self: ptr IShellLibrary, kfidToSaveIn: REFKNOWNFOLDERID, pszLibraryName: LPCWSTR, lsf: LIBRARYSAVEFLAGS, ppsiSavedTo: ptr ptr IShellItem): HRESULT {.winapi, inline.} = self.lpVtbl.SaveInKnownFolder(self, kfidToSaveIn, pszLibraryName, lsf, ppsiSavedTo)
proc OnPlaybackManagerEvent*(self: ptr IPlaybackManagerEvents, dwSessionId: DWORD, mediaEvent: PBM_EVENT): HRESULT {.winapi, inline.} = self.lpVtbl.OnPlaybackManagerEvent(self, dwSessionId, mediaEvent)
proc Advise*(self: ptr IPlaybackManager, `type`: PBM_SESSION_TYPE, pEvents: ptr IPlaybackManagerEvents, pdwSessionId: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Advise(self, `type`, pEvents, pdwSessionId)
proc Unadvise*(self: ptr IPlaybackManager, dwSessionId: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Unadvise(self, dwSessionId)
proc ChangeSessionState*(self: ptr IPlaybackManager, dwSessionId: DWORD, state: PBM_PLAY_STATE, mute: PBM_MUTE_STATE): HRESULT {.winapi, inline.} = self.lpVtbl.ChangeSessionState(self, dwSessionId, state, mute)
proc Initialize*(self: ptr IDefaultFolderMenuInitialize, hwnd: HWND, pcmcb: ptr IContextMenuCB, pidlFolder: PCIDLIST_ABSOLUTE, psf: ptr IShellFolder, cidl: UINT, apidl: PCUITEMID_CHILD_ARRAY, punkAssociation: ptr IUnknown, cKeys: UINT, aKeys: ptr HKEY): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, hwnd, pcmcb, pidlFolder, psf, cidl, apidl, punkAssociation, cKeys, aKeys)
proc SetMenuRestrictions*(self: ptr IDefaultFolderMenuInitialize, dfmrValues: DEFAULT_FOLDER_MENU_RESTRICTIONS): HRESULT {.winapi, inline.} = self.lpVtbl.SetMenuRestrictions(self, dfmrValues)
proc GetMenuRestrictions*(self: ptr IDefaultFolderMenuInitialize, dfmrMask: DEFAULT_FOLDER_MENU_RESTRICTIONS, pdfmrValues: ptr DEFAULT_FOLDER_MENU_RESTRICTIONS): HRESULT {.winapi, inline.} = self.lpVtbl.GetMenuRestrictions(self, dfmrMask, pdfmrValues)
proc SetHandlerClsid*(self: ptr IDefaultFolderMenuInitialize, rclsid: REFCLSID): HRESULT {.winapi, inline.} = self.lpVtbl.SetHandlerClsid(self, rclsid)
proc ActivateApplication*(self: ptr IApplicationActivationManager, appUserModelId: LPCWSTR, arguments: LPCWSTR, options: ACTIVATEOPTIONS, processId: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.ActivateApplication(self, appUserModelId, arguments, options, processId)
proc ActivateForFile*(self: ptr IApplicationActivationManager, appUserModelId: LPCWSTR, itemArray: ptr IShellItemArray, verb: LPCWSTR, processId: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.ActivateForFile(self, appUserModelId, itemArray, verb, processId)
proc ActivateForProtocol*(self: ptr IApplicationActivationManager, appUserModelId: LPCWSTR, itemArray: ptr IShellItemArray, processId: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.ActivateForProtocol(self, appUserModelId, itemArray, processId)
proc SupportsSelection*(self: ptr IAssocHandlerInvoker): HRESULT {.winapi, inline.} = self.lpVtbl.SupportsSelection(self)
proc Invoke*(self: ptr IAssocHandlerInvoker): HRESULT {.winapi, inline.} = self.lpVtbl.Invoke(self)
proc GetName*(self: ptr IAssocHandler, ppsz: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetName(self, ppsz)
proc GetUIName*(self: ptr IAssocHandler, ppsz: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetUIName(self, ppsz)
proc GetIconLocation*(self: ptr IAssocHandler, ppszPath: ptr LPWSTR, pIndex: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetIconLocation(self, ppszPath, pIndex)
proc IsRecommended*(self: ptr IAssocHandler): HRESULT {.winapi, inline.} = self.lpVtbl.IsRecommended(self)
proc MakeDefault*(self: ptr IAssocHandler, pszDescription: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.MakeDefault(self, pszDescription)
proc Invoke*(self: ptr IAssocHandler, pdo: ptr IDataObject): HRESULT {.winapi, inline.} = self.lpVtbl.Invoke(self, pdo)
proc CreateInvoker*(self: ptr IAssocHandler, pdo: ptr IDataObject, ppInvoker: ptr ptr IAssocHandlerInvoker): HRESULT {.winapi, inline.} = self.lpVtbl.CreateInvoker(self, pdo, ppInvoker)
proc Next*(self: ptr IEnumAssocHandlers, celt: ULONG, rgelt: ptr ptr IAssocHandler, pceltFetched: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Next(self, celt, rgelt, pceltFetched)
proc GetDataObject*(self: ptr IDataObjectProvider, dataObject: ptr ptr IDataObject): HRESULT {.winapi, inline.} = self.lpVtbl.GetDataObject(self, dataObject)
proc SetDataObject*(self: ptr IDataObjectProvider, dataObject: ptr IDataObject): HRESULT {.winapi, inline.} = self.lpVtbl.SetDataObject(self, dataObject)
proc GetForWindow*(self: ptr IDataTransferManagerInterop, appWindow: HWND, riid: REFIID, dataTransferManager: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.GetForWindow(self, appWindow, riid, dataTransferManager)
proc ShowShareUIForWindow*(self: ptr IDataTransferManagerInterop, appWindow: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.ShowShareUIForWindow(self, appWindow)
proc Showing*(self: ptr IFrameworkInputPaneHandler, prcInputPaneScreenLocation: ptr RECT, fEnsureFocusedElementInView: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.Showing(self, prcInputPaneScreenLocation, fEnsureFocusedElementInView)
proc Hiding*(self: ptr IFrameworkInputPaneHandler, fEnsureFocusedElementInView: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.Hiding(self, fEnsureFocusedElementInView)
proc Advise*(self: ptr IFrameworkInputPane, pWindow: ptr IUnknown, pHandler: ptr IFrameworkInputPaneHandler, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Advise(self, pWindow, pHandler, pdwCookie)
proc AdviseWithHWND*(self: ptr IFrameworkInputPane, hwnd: HWND, pHandler: ptr IFrameworkInputPaneHandler, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.AdviseWithHWND(self, hwnd, pHandler, pdwCookie)
proc Unadvise*(self: ptr IFrameworkInputPane, dwCookie: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Unadvise(self, dwCookie)
proc Location*(self: ptr IFrameworkInputPane, prcInputPaneScreenLocation: ptr RECT): HRESULT {.winapi, inline.} = self.lpVtbl.Location(self, prcInputPaneScreenLocation)
proc GetSearchWindow*(self: ptr ISearchableApplication, hwnd: ptr HWND): HRESULT {.winapi, inline.} = self.lpVtbl.GetSearchWindow(self, hwnd)
proc Undocked*(self: ptr IAccessibilityDockingServiceCallback, undockReason: UNDOCK_REASON): HRESULT {.winapi, inline.} = self.lpVtbl.Undocked(self, undockReason)
proc GetAvailableSize*(self: ptr IAccessibilityDockingService, hMonitor: HMONITOR, pcxFixed: ptr UINT, pcyMax: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetAvailableSize(self, hMonitor, pcxFixed, pcyMax)
proc DockWindow*(self: ptr IAccessibilityDockingService, hwnd: HWND, hMonitor: HMONITOR, cyRequested: UINT, pCallback: ptr IAccessibilityDockingServiceCallback): HRESULT {.winapi, inline.} = self.lpVtbl.DockWindow(self, hwnd, hMonitor, cyRequested, pCallback)
proc UndockWindow*(self: ptr IAccessibilityDockingService, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.UndockWindow(self, hwnd)
proc AppVisibilityOnMonitorChanged*(self: ptr IAppVisibilityEvents, hMonitor: HMONITOR, previousMode: MONITOR_APP_VISIBILITY, currentMode: MONITOR_APP_VISIBILITY): HRESULT {.winapi, inline.} = self.lpVtbl.AppVisibilityOnMonitorChanged(self, hMonitor, previousMode, currentMode)
proc LauncherVisibilityChange*(self: ptr IAppVisibilityEvents, currentVisibleState: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.LauncherVisibilityChange(self, currentVisibleState)
proc GetAppVisibilityOnMonitor*(self: ptr IAppVisibility, hMonitor: HMONITOR, pMode: ptr MONITOR_APP_VISIBILITY): HRESULT {.winapi, inline.} = self.lpVtbl.GetAppVisibilityOnMonitor(self, hMonitor, pMode)
proc IsLauncherVisible*(self: ptr IAppVisibility, pfVisible: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.IsLauncherVisible(self, pfVisible)
proc Advise*(self: ptr IAppVisibility, pCallback: ptr IAppVisibilityEvents, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Advise(self, pCallback, pdwCookie)
proc Unadvise*(self: ptr IAppVisibility, dwCookie: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Unadvise(self, dwCookie)
proc OnStateChanged*(self: ptr IPackageExecutionStateChangeNotification, pszPackageFullName: LPCWSTR, pesNewState: PACKAGE_EXECUTION_STATE): HRESULT {.winapi, inline.} = self.lpVtbl.OnStateChanged(self, pszPackageFullName, pesNewState)
proc EnableDebugging*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR, debuggerCommandLine: LPCWSTR, environment: PZZWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.EnableDebugging(self, packageFullName, debuggerCommandLine, environment)
proc DisableDebugging*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.DisableDebugging(self, packageFullName)
proc Suspend*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Suspend(self, packageFullName)
proc Resume*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Resume(self, packageFullName)
proc TerminateAllProcesses*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.TerminateAllProcesses(self, packageFullName)
proc SetTargetSessionId*(self: ptr IPackageDebugSettings, sessionId: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.SetTargetSessionId(self, sessionId)
proc EnumerateBackgroundTasks*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR, taskCount: ptr ULONG, taskIds: ptr LPCGUID, taskNames: ptr ptr LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.EnumerateBackgroundTasks(self, packageFullName, taskCount, taskIds, taskNames)
proc ActivateBackgroundTask*(self: ptr IPackageDebugSettings, taskId: LPCGUID): HRESULT {.winapi, inline.} = self.lpVtbl.ActivateBackgroundTask(self, taskId)
proc StartServicing*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.StartServicing(self, packageFullName)
proc StopServicing*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.StopServicing(self, packageFullName)
proc StartSessionRedirection*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR, sessionId: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.StartSessionRedirection(self, packageFullName, sessionId)
proc StopSessionRedirection*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.StopSessionRedirection(self, packageFullName)
proc GetPackageExecutionState*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR, packageExecutionState: ptr PACKAGE_EXECUTION_STATE): HRESULT {.winapi, inline.} = self.lpVtbl.GetPackageExecutionState(self, packageFullName, packageExecutionState)
proc RegisterForPackageStateChanges*(self: ptr IPackageDebugSettings, packageFullName: LPCWSTR, pPackageExecutionStateChangeNotification: ptr IPackageExecutionStateChangeNotification, pdwCookie: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.RegisterForPackageStateChanges(self, packageFullName, pPackageExecutionStateChangeNotification, pdwCookie)
proc UnregisterForPackageStateChanges*(self: ptr IPackageDebugSettings, dwCookie: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.UnregisterForPackageStateChanges(self, dwCookie)
proc GetValue*(self: ptr IExecuteCommandApplicationHostEnvironment, pahe: ptr AHE_TYPE): HRESULT {.winapi, inline.} = self.lpVtbl.GetValue(self, pahe)
proc GetUIMode*(self: ptr IExecuteCommandHost, pUIMode: ptr EC_HOST_UI_MODE): HRESULT {.winapi, inline.} = self.lpVtbl.GetUIMode(self, pUIMode)
proc SetNativeDisplaySize*(self: ptr IApplicationDesignModeSettings, sizeNativeDisplay: SIZE): HRESULT {.winapi, inline.} = self.lpVtbl.SetNativeDisplaySize(self, sizeNativeDisplay)
proc SetScaleFactor*(self: ptr IApplicationDesignModeSettings, scaleFactor: DEVICE_SCALE_FACTOR): HRESULT {.winapi, inline.} = self.lpVtbl.SetScaleFactor(self, scaleFactor)
proc SetApplicationViewState*(self: ptr IApplicationDesignModeSettings, viewState: APPLICATION_VIEW_STATE): HRESULT {.winapi, inline.} = self.lpVtbl.SetApplicationViewState(self, viewState)
proc ComputeApplicationSize*(self: ptr IApplicationDesignModeSettings, psizeApplication: ptr SIZE): HRESULT {.winapi, inline.} = self.lpVtbl.ComputeApplicationSize(self, psizeApplication)
proc IsApplicationViewStateSupported*(self: ptr IApplicationDesignModeSettings, viewState: APPLICATION_VIEW_STATE, sizeNativeDisplay: SIZE, scaleFactor: DEVICE_SCALE_FACTOR, pfSupported: ptr WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.IsApplicationViewStateSupported(self, viewState, sizeNativeDisplay, scaleFactor, pfSupported)
proc TriggerEdgeGesture*(self: ptr IApplicationDesignModeSettings, edgeGestureKind: EDGE_GESTURE_KIND): HRESULT {.winapi, inline.} = self.lpVtbl.TriggerEdgeGesture(self, edgeGestureKind)
proc Initialize*(self: ptr IInitializeWithWindow, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, hwnd)
proc GetApplicationDisplayName*(self: ptr IHandlerInfo, value: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetApplicationDisplayName(self, value)
proc GetApplicationPublisher*(self: ptr IHandlerInfo, value: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetApplicationPublisher(self, value)
proc GetApplicationIconReference*(self: ptr IHandlerInfo, value: ptr LPWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetApplicationIconReference(self, value)
proc BeforeCoCreateInstance*(self: ptr IHandlerActivationHost, clsidHandler: REFCLSID, itemsBeingActivated: ptr IShellItemArray, handlerInfo: ptr IHandlerInfo): HRESULT {.winapi, inline.} = self.lpVtbl.BeforeCoCreateInstance(self, clsidHandler, itemsBeingActivated, handlerInfo)
proc BeforeCreateProcess*(self: ptr IHandlerActivationHost, applicationPath: LPCWSTR, commandLine: LPCWSTR, handlerInfo: ptr IHandlerInfo): HRESULT {.winapi, inline.} = self.lpVtbl.BeforeCreateProcess(self, applicationPath, commandLine, handlerInfo)
proc GetIconLocation*(self: ptr IExtractIconA, uFlags: UINT, pszIconFile: PSTR, cchMax: UINT, piIndex: ptr int32, pwFlags: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetIconLocation(self, uFlags, pszIconFile, cchMax, piIndex, pwFlags)
proc Extract*(self: ptr IExtractIconA, pszFile: PCSTR, nIconIndex: UINT, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIconSize: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.Extract(self, pszFile, nIconIndex, phiconLarge, phiconSmall, nIconSize)
proc GetIconLocation*(self: ptr IExtractIconW, uFlags: UINT, pszIconFile: PWSTR, cchMax: UINT, piIndex: ptr int32, pwFlags: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetIconLocation(self, uFlags, pszIconFile, cchMax, piIndex, pwFlags)
proc Extract*(self: ptr IExtractIconW, pszFile: PCWSTR, nIconIndex: UINT, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIconSize: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.Extract(self, pszFile, nIconIndex, phiconLarge, phiconSmall, nIconSize)
proc IsMemberOf*(self: ptr IShellIconOverlayIdentifier, pwszPath: PCWSTR, dwAttrib: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.IsMemberOf(self, pwszPath, dwAttrib)
proc GetOverlayInfo*(self: ptr IShellIconOverlayIdentifier, pwszIconFile: PWSTR, cchMax: int32, pIndex: ptr int32, pdwFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetOverlayInfo(self, pwszIconFile, cchMax, pIndex, pdwFlags)
proc GetPriority*(self: ptr IShellIconOverlayIdentifier, pIPriority: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetPriority(self, pIPriority)
proc GetFileOverlayInfo*(self: ptr IShellIconOverlayManager, pwszPath: PCWSTR, dwAttrib: DWORD, pIndex: ptr int32, dwflags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetFileOverlayInfo(self, pwszPath, dwAttrib, pIndex, dwflags)
proc GetReservedOverlayInfo*(self: ptr IShellIconOverlayManager, pwszPath: PCWSTR, dwAttrib: DWORD, pIndex: ptr int32, dwflags: DWORD, iReservedID: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetReservedOverlayInfo(self, pwszPath, dwAttrib, pIndex, dwflags, iReservedID)
proc RefreshOverlayImages*(self: ptr IShellIconOverlayManager, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.RefreshOverlayImages(self, dwFlags)
proc LoadNonloadedOverlayIdentifiers*(self: ptr IShellIconOverlayManager): HRESULT {.winapi, inline.} = self.lpVtbl.LoadNonloadedOverlayIdentifiers(self)
proc OverlayIndexFromImageIndex*(self: ptr IShellIconOverlayManager, iImage: int32, piIndex: ptr int32, fAdd: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.OverlayIndexFromImageIndex(self, iImage, piIndex, fAdd)
proc GetOverlayIndex*(self: ptr IShellIconOverlay, pidl: PCUITEMID_CHILD, pIndex: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetOverlayIndex(self, pidl, pIndex)
proc GetOverlayIconIndex*(self: ptr IShellIconOverlay, pidl: PCUITEMID_CHILD, pIconIndex: ptr int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetOverlayIconIndex(self, pidl, pIconIndex)
proc Execute*(self: ptr IShellExecuteHookA, pei: LPSHELLEXECUTEINFOA): HRESULT {.winapi, inline.} = self.lpVtbl.Execute(self, pei)
proc Execute*(self: ptr IShellExecuteHookW, pei: LPSHELLEXECUTEINFOW): HRESULT {.winapi, inline.} = self.lpVtbl.Execute(self, pei)
proc Translate*(self: ptr IURLSearchHook, pwszSearchURL: PWSTR, cchBufferSize: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Translate(self, pwszSearchURL, cchBufferSize)
proc GetSearchUrl*(self: ptr ISearchContext, pbstrSearchUrl: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetSearchUrl(self, pbstrSearchUrl)
proc GetSearchText*(self: ptr ISearchContext, pbstrSearchText: ptr BSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetSearchText(self, pbstrSearchText)
proc GetSearchStyle*(self: ptr ISearchContext, pdwSearchStyle: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetSearchStyle(self, pdwSearchStyle)
proc TranslateWithSearchContext*(self: ptr IURLSearchHook2, pwszSearchURL: PWSTR, cchBufferSize: DWORD, pSearchContext: ptr ISearchContext): HRESULT {.winapi, inline.} = self.lpVtbl.TranslateWithSearchContext(self, pwszSearchURL, cchBufferSize, pSearchContext)
proc SetReferent*(self: ptr INewShortcutHookA, pcszReferent: PCSTR, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.SetReferent(self, pcszReferent, hwnd)
proc GetReferent*(self: ptr INewShortcutHookA, pszReferent: PSTR, cchReferent: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetReferent(self, pszReferent, cchReferent)
proc SetFolder*(self: ptr INewShortcutHookA, pcszFolder: PCSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetFolder(self, pcszFolder)
proc GetFolder*(self: ptr INewShortcutHookA, pszFolder: PSTR, cchFolder: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolder(self, pszFolder, cchFolder)
proc GetName*(self: ptr INewShortcutHookA, pszName: PSTR, cchName: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetName(self, pszName, cchName)
proc GetExtension*(self: ptr INewShortcutHookA, pszExtension: PSTR, cchExtension: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetExtension(self, pszExtension, cchExtension)
proc SetReferent*(self: ptr INewShortcutHookW, pcszReferent: PCWSTR, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.SetReferent(self, pcszReferent, hwnd)
proc GetReferent*(self: ptr INewShortcutHookW, pszReferent: PWSTR, cchReferent: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetReferent(self, pszReferent, cchReferent)
proc SetFolder*(self: ptr INewShortcutHookW, pcszFolder: PCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetFolder(self, pcszFolder)
proc GetFolder*(self: ptr INewShortcutHookW, pszFolder: PWSTR, cchFolder: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetFolder(self, pszFolder, cchFolder)
proc GetName*(self: ptr INewShortcutHookW, pszName: PWSTR, cchName: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetName(self, pszName, cchName)
proc GetExtension*(self: ptr INewShortcutHookW, pszExtension: PWSTR, cchExtension: int32): HRESULT {.winapi, inline.} = self.lpVtbl.GetExtension(self, pszExtension, cchExtension)
proc CopyCallback*(self: ptr ICopyHookA, hwnd: HWND, wFunc: UINT, wFlags: UINT, pszSrcFile: PCSTR, dwSrcAttribs: DWORD, pszDestFile: PCSTR, dwDestAttribs: DWORD): UINT {.winapi, inline.} = self.lpVtbl.CopyCallback(self, hwnd, wFunc, wFlags, pszSrcFile, dwSrcAttribs, pszDestFile, dwDestAttribs)
proc CopyCallback*(self: ptr ICopyHookW, hwnd: HWND, wFunc: UINT, wFlags: UINT, pszSrcFile: PCWSTR, dwSrcAttribs: DWORD, pszDestFile: PCWSTR, dwDestAttribs: DWORD): UINT {.winapi, inline.} = self.lpVtbl.CopyCallback(self, hwnd, wFunc, wFlags, pszSrcFile, dwSrcAttribs, pszDestFile, dwDestAttribs)
proc SetPinnedWindow*(self: ptr IFileViewerSite, hwnd: HWND): HRESULT {.winapi, inline.} = self.lpVtbl.SetPinnedWindow(self, hwnd)
proc GetPinnedWindow*(self: ptr IFileViewerSite, phwnd: ptr HWND): HRESULT {.winapi, inline.} = self.lpVtbl.GetPinnedWindow(self, phwnd)
proc ShowInitialize*(self: ptr IFileViewerA, lpfsi: LPFILEVIEWERSITE): HRESULT {.winapi, inline.} = self.lpVtbl.ShowInitialize(self, lpfsi)
proc Show*(self: ptr IFileViewerA, pvsi: LPFVSHOWINFO): HRESULT {.winapi, inline.} = self.lpVtbl.Show(self, pvsi)
proc PrintTo*(self: ptr IFileViewerA, pszDriver: PSTR, fSuppressUI: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.PrintTo(self, pszDriver, fSuppressUI)
proc ShowInitialize*(self: ptr IFileViewerW, lpfsi: LPFILEVIEWERSITE): HRESULT {.winapi, inline.} = self.lpVtbl.ShowInitialize(self, lpfsi)
proc Show*(self: ptr IFileViewerW, pvsi: LPFVSHOWINFO): HRESULT {.winapi, inline.} = self.lpVtbl.Show(self, pvsi)
proc PrintTo*(self: ptr IFileViewerW, pszDriver: PWSTR, fSuppressUI: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.PrintTo(self, pszDriver, fSuppressUI)
proc GetDetailsOf*(self: ptr IShellDetails, pidl: PCUITEMID_CHILD, iColumn: UINT, pDetails: ptr SHELLDETAILS): HRESULT {.winapi, inline.} = self.lpVtbl.GetDetailsOf(self, pidl, iColumn, pDetails)
proc ColumnClick*(self: ptr IShellDetails, iColumn: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.ColumnClick(self, iColumn)
proc Append*(self: ptr IObjMgr, punk: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.Append(self, punk)
proc Remove*(self: ptr IObjMgr, punk: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.Remove(self, punk)
proc GetDirectory*(self: ptr ICurrentWorkingDirectory, pwzPath: PWSTR, cchSize: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetDirectory(self, pwzPath, cchSize)
proc SetDirectory*(self: ptr ICurrentWorkingDirectory, pwzPath: PCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetDirectory(self, pwzPath)
proc Expand*(self: ptr IACList, pszExpand: PCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.Expand(self, pszExpand)
proc SetOptions*(self: ptr IACList2, dwFlag: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetOptions(self, dwFlag)
proc GetOptions*(self: ptr IACList2, pdwFlag: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetOptions(self, pdwFlag)
proc StartProgressDialog*(self: ptr IProgressDialog, hwndParent: HWND, punkEnableModless: ptr IUnknown, dwFlags: DWORD, pvResevered: LPCVOID): HRESULT {.winapi, inline.} = self.lpVtbl.StartProgressDialog(self, hwndParent, punkEnableModless, dwFlags, pvResevered)
proc StopProgressDialog*(self: ptr IProgressDialog): HRESULT {.winapi, inline.} = self.lpVtbl.StopProgressDialog(self)
proc SetTitle*(self: ptr IProgressDialog, pwzTitle: PCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.SetTitle(self, pwzTitle)
proc SetAnimation*(self: ptr IProgressDialog, hInstAnimation: HINSTANCE, idAnimation: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetAnimation(self, hInstAnimation, idAnimation)
proc HasUserCancelled*(self: ptr IProgressDialog): WINBOOL {.winapi, inline.} = self.lpVtbl.HasUserCancelled(self)
proc SetProgress*(self: ptr IProgressDialog, dwCompleted: DWORD, dwTotal: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetProgress(self, dwCompleted, dwTotal)
proc SetProgress64*(self: ptr IProgressDialog, ullCompleted: ULONGLONG, ullTotal: ULONGLONG): HRESULT {.winapi, inline.} = self.lpVtbl.SetProgress64(self, ullCompleted, ullTotal)
proc SetLine*(self: ptr IProgressDialog, dwLineNum: DWORD, pwzString: PCWSTR, fCompactPath: WINBOOL, pvResevered: LPCVOID): HRESULT {.winapi, inline.} = self.lpVtbl.SetLine(self, dwLineNum, pwzString, fCompactPath, pvResevered)
proc SetCancelMsg*(self: ptr IProgressDialog, pwzCancelMsg: PCWSTR, pvResevered: LPCVOID): HRESULT {.winapi, inline.} = self.lpVtbl.SetCancelMsg(self, pwzCancelMsg, pvResevered)
proc Timer*(self: ptr IProgressDialog, dwTimerAction: DWORD, pvResevered: LPCVOID): HRESULT {.winapi, inline.} = self.lpVtbl.Timer(self, dwTimerAction, pvResevered)
proc GetBorderDW*(self: ptr IDockingWindowSite, punkObj: ptr IUnknown, prcBorder: ptr RECT): HRESULT {.winapi, inline.} = self.lpVtbl.GetBorderDW(self, punkObj, prcBorder)
proc RequestBorderSpaceDW*(self: ptr IDockingWindowSite, punkObj: ptr IUnknown, pbw: LPCBORDERWIDTHS): HRESULT {.winapi, inline.} = self.lpVtbl.RequestBorderSpaceDW(self, punkObj, pbw)
proc SetBorderSpaceDW*(self: ptr IDockingWindowSite, punkObj: ptr IUnknown, pbw: LPCBORDERWIDTHS): HRESULT {.winapi, inline.} = self.lpVtbl.SetBorderSpaceDW(self, punkObj, pbw)
proc AddToolbar*(self: ptr IDockingWindowFrame, punkSrc: ptr IUnknown, pwszItem: PCWSTR, dwAddFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.AddToolbar(self, punkSrc, pwszItem, dwAddFlags)
proc RemoveToolbar*(self: ptr IDockingWindowFrame, punkSrc: ptr IUnknown, dwRemoveFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveToolbar(self, punkSrc, dwRemoveFlags)
proc FindToolbar*(self: ptr IDockingWindowFrame, pwszItem: PCWSTR, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, inline.} = self.lpVtbl.FindToolbar(self, pwszItem, riid, ppv)
proc CaptureThumbnail*(self: ptr IThumbnailCapture, pMaxSize: ptr SIZE, pHTMLDoc2: ptr IUnknown, phbmThumbnail: ptr HBITMAP): HRESULT {.winapi, inline.} = self.lpVtbl.CaptureThumbnail(self, pMaxSize, pHTMLDoc2, phbmThumbnail)
proc Reset*(self: ptr IEnumShellImageStore): HRESULT {.winapi, inline.} = self.lpVtbl.Reset(self)
proc Next*(self: ptr IEnumShellImageStore, celt: ULONG, prgElt: ptr PENUMSHELLIMAGESTOREDATA, pceltFetched: ptr ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Next(self, celt, prgElt, pceltFetched)
proc Skip*(self: ptr IEnumShellImageStore, celt: ULONG): HRESULT {.winapi, inline.} = self.lpVtbl.Skip(self, celt)
proc Clone*(self: ptr IEnumShellImageStore, ppEnum: ptr ptr IEnumShellImageStore): HRESULT {.winapi, inline.} = self.lpVtbl.Clone(self, ppEnum)
proc Open*(self: ptr IShellImageStore, dwMode: DWORD, pdwLock: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Open(self, dwMode, pdwLock)
proc Create*(self: ptr IShellImageStore, dwMode: DWORD, pdwLock: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Create(self, dwMode, pdwLock)
proc ReleaseLock*(self: ptr IShellImageStore, pdwLock: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.ReleaseLock(self, pdwLock)
proc Close*(self: ptr IShellImageStore, pdwLock: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Close(self, pdwLock)
proc Commit*(self: ptr IShellImageStore, pdwLock: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.Commit(self, pdwLock)
proc IsLocked*(self: ptr IShellImageStore): HRESULT {.winapi, inline.} = self.lpVtbl.IsLocked(self)
proc GetMode*(self: ptr IShellImageStore, pdwMode: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetMode(self, pdwMode)
proc GetCapabilities*(self: ptr IShellImageStore, pdwCapMask: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetCapabilities(self, pdwCapMask)
proc AddEntry*(self: ptr IShellImageStore, pszName: PCWSTR, pftTimeStamp: ptr FILETIME, dwMode: DWORD, hImage: HBITMAP): HRESULT {.winapi, inline.} = self.lpVtbl.AddEntry(self, pszName, pftTimeStamp, dwMode, hImage)
proc GetEntry*(self: ptr IShellImageStore, pszName: PCWSTR, dwMode: DWORD, phImage: ptr HBITMAP): HRESULT {.winapi, inline.} = self.lpVtbl.GetEntry(self, pszName, dwMode, phImage)
proc DeleteEntry*(self: ptr IShellImageStore, pszName: PCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.DeleteEntry(self, pszName)
proc IsEntryInStore*(self: ptr IShellImageStore, pszName: PCWSTR, pftTimeStamp: ptr FILETIME): HRESULT {.winapi, inline.} = self.lpVtbl.IsEntryInStore(self, pszName, pftTimeStamp)
proc Enum*(self: ptr IShellImageStore, ppEnum: ptr LPENUMSHELLIMAGESTORE): HRESULT {.winapi, inline.} = self.lpVtbl.Enum(self, ppEnum)
proc InitializeSFB*(self: ptr IShellFolderBand, psf: ptr IShellFolder, pidl: PCIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.InitializeSFB(self, psf, pidl)
proc SetBandInfoSFB*(self: ptr IShellFolderBand, pbi: PBANDINFOSFB): HRESULT {.winapi, inline.} = self.lpVtbl.SetBandInfoSFB(self, pbi)
proc GetBandInfoSFB*(self: ptr IShellFolderBand, pbi: PBANDINFOSFB): HRESULT {.winapi, inline.} = self.lpVtbl.GetBandInfoSFB(self, pbi)
proc SetDeskBarSite*(self: ptr IDeskBarClient, punkSite: ptr IUnknown): HRESULT {.winapi, inline.} = self.lpVtbl.SetDeskBarSite(self, punkSite)
proc SetModeDBC*(self: ptr IDeskBarClient, dwMode: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetModeDBC(self, dwMode)
proc UIActivateDBC*(self: ptr IDeskBarClient, dwState: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.UIActivateDBC(self, dwState)
proc GetSize*(self: ptr IDeskBarClient, dwWhich: DWORD, prc: LPRECT): HRESULT {.winapi, inline.} = self.lpVtbl.GetSize(self, dwWhich, prc)
proc ApplyChanges*(self: ptr IActiveDesktop, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.ApplyChanges(self, dwFlags)
proc GetWallpaper*(self: ptr IActiveDesktop, pwszWallpaper: PWSTR, cchWallpaper: UINT, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetWallpaper(self, pwszWallpaper, cchWallpaper, dwFlags)
proc SetWallpaper*(self: ptr IActiveDesktop, pwszWallpaper: PCWSTR, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetWallpaper(self, pwszWallpaper, dwReserved)
proc GetWallpaperOptions*(self: ptr IActiveDesktop, pwpo: LPWALLPAPEROPT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetWallpaperOptions(self, pwpo, dwReserved)
proc SetWallpaperOptions*(self: ptr IActiveDesktop, pwpo: LPCWALLPAPEROPT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetWallpaperOptions(self, pwpo, dwReserved)
proc GetPattern*(self: ptr IActiveDesktop, pwszPattern: PWSTR, cchPattern: UINT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetPattern(self, pwszPattern, cchPattern, dwReserved)
proc SetPattern*(self: ptr IActiveDesktop, pwszPattern: PCWSTR, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetPattern(self, pwszPattern, dwReserved)
proc GetDesktopItemOptions*(self: ptr IActiveDesktop, pco: LPCOMPONENTSOPT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetDesktopItemOptions(self, pco, dwReserved)
proc SetDesktopItemOptions*(self: ptr IActiveDesktop, pco: LPCCOMPONENTSOPT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetDesktopItemOptions(self, pco, dwReserved)
proc AddDesktopItem*(self: ptr IActiveDesktop, pcomp: LPCCOMPONENT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.AddDesktopItem(self, pcomp, dwReserved)
proc AddDesktopItemWithUI*(self: ptr IActiveDesktop, hwnd: HWND, pcomp: LPCOMPONENT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.AddDesktopItemWithUI(self, hwnd, pcomp, dwReserved)
proc ModifyDesktopItem*(self: ptr IActiveDesktop, pcomp: LPCCOMPONENT, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.ModifyDesktopItem(self, pcomp, dwFlags)
proc RemoveDesktopItem*(self: ptr IActiveDesktop, pcomp: LPCCOMPONENT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveDesktopItem(self, pcomp, dwReserved)
proc GetDesktopItemCount*(self: ptr IActiveDesktop, pcItems: ptr int32, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetDesktopItemCount(self, pcItems, dwReserved)
proc GetDesktopItem*(self: ptr IActiveDesktop, nComponent: int32, pcomp: LPCOMPONENT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetDesktopItem(self, nComponent, pcomp, dwReserved)
proc GetDesktopItemByID*(self: ptr IActiveDesktop, dwID: ULONG_PTR, pcomp: LPCOMPONENT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetDesktopItemByID(self, dwID, pcomp, dwReserved)
proc GenerateDesktopItemHtml*(self: ptr IActiveDesktop, pwszFileName: PCWSTR, pcomp: LPCOMPONENT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GenerateDesktopItemHtml(self, pwszFileName, pcomp, dwReserved)
proc AddUrl*(self: ptr IActiveDesktop, hwnd: HWND, pszSource: PCWSTR, pcomp: LPCOMPONENT, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.AddUrl(self, hwnd, pszSource, pcomp, dwFlags)
proc GetDesktopItemBySource*(self: ptr IActiveDesktop, pwszSource: PCWSTR, pcomp: LPCOMPONENT, dwReserved: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetDesktopItemBySource(self, pwszSource, pcomp, dwReserved)
proc SetSafeMode*(self: ptr IActiveDesktopP, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetSafeMode(self, dwFlags)
proc EnsureUpdateHTML*(self: ptr IActiveDesktopP): HRESULT {.winapi, inline.} = self.lpVtbl.EnsureUpdateHTML(self)
proc SetScheme*(self: ptr IActiveDesktopP, pwszSchemeName: PCWSTR, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetScheme(self, pwszSchemeName, dwFlags)
proc GetScheme*(self: ptr IActiveDesktopP, pwszSchemeName: PWSTR, pdwcchBuffer: ptr DWORD, dwFlags: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetScheme(self, pwszSchemeName, pdwcchBuffer, dwFlags)
proc ReReadWallpaper*(self: ptr IADesktopP2): HRESULT {.winapi, inline.} = self.lpVtbl.ReReadWallpaper(self)
proc GetADObjectFlags*(self: ptr IADesktopP2, pdwFlags: ptr DWORD, dwMask: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetADObjectFlags(self, pdwFlags, dwMask)
proc UpdateAllDesktopSubscriptions*(self: ptr IADesktopP2): HRESULT {.winapi, inline.} = self.lpVtbl.UpdateAllDesktopSubscriptions(self)
proc MakeDynamicChanges*(self: ptr IADesktopP2, pOleObj: ptr IOleObject): HRESULT {.winapi, inline.} = self.lpVtbl.MakeDynamicChanges(self, pOleObj)
proc Initialize*(self: ptr IColumnProvider, psci: LPCSHCOLUMNINIT): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self, psci)
proc GetColumnInfo*(self: ptr IColumnProvider, dwIndex: DWORD, psci: ptr SHCOLUMNINFO): HRESULT {.winapi, inline.} = self.lpVtbl.GetColumnInfo(self, dwIndex, psci)
proc GetItemData*(self: ptr IColumnProvider, pscid: LPCSHCOLUMNID, pscd: LPCSHCOLUMNDATA, pvarData: ptr VARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.GetItemData(self, pscid, pscd, pvarData)
proc OnChange*(self: ptr IShellChangeNotify, lEvent: LONG, pidl1: PCIDLIST_ABSOLUTE, pidl2: PCIDLIST_ABSOLUTE): HRESULT {.winapi, inline.} = self.lpVtbl.OnChange(self, lEvent, pidl1, pidl2)
proc GetInfoTip*(self: ptr IQueryInfo, dwFlags: DWORD, ppwszTip: ptr PWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.GetInfoTip(self, dwFlags, ppwszTip)
proc GetInfoFlags*(self: ptr IQueryInfo, pdwFlags: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetInfoFlags(self, pdwFlags)
proc GetWindowLV*(self: ptr IDefViewFrame, phwnd: ptr HWND): HRESULT {.winapi, inline.} = self.lpVtbl.GetWindowLV(self, phwnd)
proc ReleaseWindowLV*(self: ptr IDefViewFrame): HRESULT {.winapi, inline.} = self.lpVtbl.ReleaseWindowLV(self)
proc GetShellFolder*(self: ptr IDefViewFrame, ppsf: ptr ptr IShellFolder): HRESULT {.winapi, inline.} = self.lpVtbl.GetShellFolder(self, ppsf)
proc OnSetTitle*(self: ptr IDocViewSite, pvTitle: ptr VARIANTARG): HRESULT {.winapi, inline.} = self.lpVtbl.OnSetTitle(self, pvTitle)
proc Initialize*(self: ptr IInitializeObject): HRESULT {.winapi, inline.} = self.lpVtbl.Initialize(self)
proc SetIconSize*(self: ptr IBanneredBar, iIcon: DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.SetIconSize(self, iIcon)
proc GetIconSize*(self: ptr IBanneredBar, piIcon: ptr DWORD): HRESULT {.winapi, inline.} = self.lpVtbl.GetIconSize(self, piIcon)
proc SetBitmap*(self: ptr IBanneredBar, hBitmap: HBITMAP): HRESULT {.winapi, inline.} = self.lpVtbl.SetBitmap(self, hBitmap)
proc GetBitmap*(self: ptr IBanneredBar, phBitmap: ptr HBITMAP): HRESULT {.winapi, inline.} = self.lpVtbl.GetBitmap(self, phBitmap)
proc MessageSFVCB*(self: ptr IShellFolderViewCB, uMsg: UINT, wParam: WPARAM, lParam: LPARAM): HRESULT {.winapi, inline.} = self.lpVtbl.MessageSFVCB(self, uMsg, wParam, lParam)
proc Rearrange*(self: ptr IShellFolderView, lParamSort: LPARAM): HRESULT {.winapi, inline.} = self.lpVtbl.Rearrange(self, lParamSort)
proc GetArrangeParam*(self: ptr IShellFolderView, plParamSort: ptr LPARAM): HRESULT {.winapi, inline.} = self.lpVtbl.GetArrangeParam(self, plParamSort)
proc ArrangeGrid*(self: ptr IShellFolderView): HRESULT {.winapi, inline.} = self.lpVtbl.ArrangeGrid(self)
proc AutoArrange*(self: ptr IShellFolderView): HRESULT {.winapi, inline.} = self.lpVtbl.AutoArrange(self)
proc GetAutoArrange*(self: ptr IShellFolderView): HRESULT {.winapi, inline.} = self.lpVtbl.GetAutoArrange(self)
proc AddObject*(self: ptr IShellFolderView, pidl: PUITEMID_CHILD, puItem: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.AddObject(self, pidl, puItem)
proc GetObject*(self: ptr IShellFolderView, ppidl: ptr PITEMID_CHILD, uItem: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetObject(self, ppidl, uItem)
proc RemoveObject*(self: ptr IShellFolderView, pidl: PUITEMID_CHILD, puItem: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.RemoveObject(self, pidl, puItem)
proc GetObjectCount*(self: ptr IShellFolderView, puCount: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetObjectCount(self, puCount)
proc SetObjectCount*(self: ptr IShellFolderView, uCount: UINT, dwFlags: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetObjectCount(self, uCount, dwFlags)
proc UpdateObject*(self: ptr IShellFolderView, pidlOld: PUITEMID_CHILD, pidlNew: PUITEMID_CHILD, puItem: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.UpdateObject(self, pidlOld, pidlNew, puItem)
proc RefreshObject*(self: ptr IShellFolderView, pidl: PUITEMID_CHILD, puItem: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.RefreshObject(self, pidl, puItem)
proc SetRedraw*(self: ptr IShellFolderView, bRedraw: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetRedraw(self, bRedraw)
proc GetSelectedCount*(self: ptr IShellFolderView, puSelected: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetSelectedCount(self, puSelected)
proc GetSelectedObjects*(self: ptr IShellFolderView, pppidl: ptr ptr PCUITEMID_CHILD, puItems: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetSelectedObjects(self, pppidl, puItems)
proc IsDropOnSource*(self: ptr IShellFolderView, pDropTarget: ptr IDropTarget): HRESULT {.winapi, inline.} = self.lpVtbl.IsDropOnSource(self, pDropTarget)
proc GetDragPoint*(self: ptr IShellFolderView, ppt: ptr POINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetDragPoint(self, ppt)
proc GetDropPoint*(self: ptr IShellFolderView, ppt: ptr POINT): HRESULT {.winapi, inline.} = self.lpVtbl.GetDropPoint(self, ppt)
proc MoveIcons*(self: ptr IShellFolderView, pDataObject: ptr IDataObject): HRESULT {.winapi, inline.} = self.lpVtbl.MoveIcons(self, pDataObject)
proc SetItemPos*(self: ptr IShellFolderView, pidl: PCUITEMID_CHILD, ppt: ptr POINT): HRESULT {.winapi, inline.} = self.lpVtbl.SetItemPos(self, pidl, ppt)
proc IsBkDropTarget*(self: ptr IShellFolderView, pDropTarget: ptr IDropTarget): HRESULT {.winapi, inline.} = self.lpVtbl.IsBkDropTarget(self, pDropTarget)
proc SetClipboard*(self: ptr IShellFolderView, bMove: WINBOOL): HRESULT {.winapi, inline.} = self.lpVtbl.SetClipboard(self, bMove)
proc SetPoints*(self: ptr IShellFolderView, pDataObject: ptr IDataObject): HRESULT {.winapi, inline.} = self.lpVtbl.SetPoints(self, pDataObject)
proc GetItemSpacing*(self: ptr IShellFolderView, pSpacing: ptr ITEMSPACING): HRESULT {.winapi, inline.} = self.lpVtbl.GetItemSpacing(self, pSpacing)
proc SetCallback*(self: ptr IShellFolderView, pNewCB: ptr IShellFolderViewCB, ppOldCB: ptr ptr IShellFolderViewCB): HRESULT {.winapi, inline.} = self.lpVtbl.SetCallback(self, pNewCB, ppOldCB)
proc Select*(self: ptr IShellFolderView, dwFlags: UINT): HRESULT {.winapi, inline.} = self.lpVtbl.Select(self, dwFlags)
proc QuerySupport*(self: ptr IShellFolderView, pdwSupport: ptr UINT): HRESULT {.winapi, inline.} = self.lpVtbl.QuerySupport(self, pdwSupport)
proc SetAutomationObject*(self: ptr IShellFolderView, pdisp: ptr IDispatch): HRESULT {.winapi, inline.} = self.lpVtbl.SetAutomationObject(self, pdisp)
proc ReadPropertyNPB*(self: ptr INamedPropertyBag, pszBagname: PCWSTR, pszPropName: PCWSTR, pVar: ptr PROPVARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.ReadPropertyNPB(self, pszBagname, pszPropName, pVar)
proc WritePropertyNPB*(self: ptr INamedPropertyBag, pszBagname: PCWSTR, pszPropName: PCWSTR, pVar: ptr PROPVARIANT): HRESULT {.winapi, inline.} = self.lpVtbl.WritePropertyNPB(self, pszBagname, pszPropName, pVar)
proc RemovePropertyNPB*(self: ptr INamedPropertyBag, pszBagname: PCWSTR, pszPropName: PCWSTR): HRESULT {.winapi, inline.} = self.lpVtbl.RemovePropertyNPB(self, pszBagname, pszPropName)
converter winimConverterIQueryAssociationsToIUnknown*(x: ptr IQueryAssociations): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFolderViewOCToIDispatch*(x: ptr IFolderViewOC): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterDShellFolderViewEventsToIDispatch*(x: ptr DShellFolderViewEvents): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterDFConstraintToIDispatch*(x: ptr DFConstraint): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterFolderToIDispatch*(x: ptr Folder): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterFolder2ToFolder*(x: ptr Folder2): ptr Folder = cast[ptr Folder](x)
converter winimConverterFolder2ToIDispatch*(x: ptr Folder2): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterFolder3ToFolder2*(x: ptr Folder3): ptr Folder2 = cast[ptr Folder2](x)
converter winimConverterFolder3ToFolder*(x: ptr Folder3): ptr Folder = cast[ptr Folder](x)
converter winimConverterFolder3ToIDispatch*(x: ptr Folder3): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterFolderItemToIDispatch*(x: ptr FolderItem): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterFolderItem2ToFolderItem*(x: ptr FolderItem2): ptr FolderItem = cast[ptr FolderItem](x)
converter winimConverterFolderItem2ToIDispatch*(x: ptr FolderItem2): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterFolderItemsToIDispatch*(x: ptr FolderItems): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterFolderItems2ToFolderItems*(x: ptr FolderItems2): ptr FolderItems = cast[ptr FolderItems](x)
converter winimConverterFolderItems2ToIDispatch*(x: ptr FolderItems2): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterFolderItems3ToFolderItems2*(x: ptr FolderItems3): ptr FolderItems2 = cast[ptr FolderItems2](x)
converter winimConverterFolderItems3ToFolderItems*(x: ptr FolderItems3): ptr FolderItems = cast[ptr FolderItems](x)
converter winimConverterFolderItems3ToIDispatch*(x: ptr FolderItems3): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterFolderItemVerbToIDispatch*(x: ptr FolderItemVerb): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterFolderItemVerbsToIDispatch*(x: ptr FolderItemVerbs): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellLinkDualToIDispatch*(x: ptr IShellLinkDual): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellLinkDual2ToIShellLinkDual*(x: ptr IShellLinkDual2): ptr IShellLinkDual = cast[ptr IShellLinkDual](x)
converter winimConverterIShellLinkDual2ToIDispatch*(x: ptr IShellLinkDual2): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellFolderViewDualToIDispatch*(x: ptr IShellFolderViewDual): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellFolderViewDual2ToIShellFolderViewDual*(x: ptr IShellFolderViewDual2): ptr IShellFolderViewDual = cast[ptr IShellFolderViewDual](x)
converter winimConverterIShellFolderViewDual2ToIDispatch*(x: ptr IShellFolderViewDual2): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellFolderViewDual3ToIShellFolderViewDual2*(x: ptr IShellFolderViewDual3): ptr IShellFolderViewDual2 = cast[ptr IShellFolderViewDual2](x)
converter winimConverterIShellFolderViewDual3ToIShellFolderViewDual*(x: ptr IShellFolderViewDual3): ptr IShellFolderViewDual = cast[ptr IShellFolderViewDual](x)
converter winimConverterIShellFolderViewDual3ToIDispatch*(x: ptr IShellFolderViewDual3): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellDispatchToIDispatch*(x: ptr IShellDispatch): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellDispatch2ToIShellDispatch*(x: ptr IShellDispatch2): ptr IShellDispatch = cast[ptr IShellDispatch](x)
converter winimConverterIShellDispatch2ToIDispatch*(x: ptr IShellDispatch2): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellDispatch3ToIShellDispatch2*(x: ptr IShellDispatch3): ptr IShellDispatch2 = cast[ptr IShellDispatch2](x)
converter winimConverterIShellDispatch3ToIShellDispatch*(x: ptr IShellDispatch3): ptr IShellDispatch = cast[ptr IShellDispatch](x)
converter winimConverterIShellDispatch3ToIDispatch*(x: ptr IShellDispatch3): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellDispatch4ToIShellDispatch3*(x: ptr IShellDispatch4): ptr IShellDispatch3 = cast[ptr IShellDispatch3](x)
converter winimConverterIShellDispatch4ToIShellDispatch2*(x: ptr IShellDispatch4): ptr IShellDispatch2 = cast[ptr IShellDispatch2](x)
converter winimConverterIShellDispatch4ToIShellDispatch*(x: ptr IShellDispatch4): ptr IShellDispatch = cast[ptr IShellDispatch](x)
converter winimConverterIShellDispatch4ToIDispatch*(x: ptr IShellDispatch4): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellDispatch5ToIShellDispatch4*(x: ptr IShellDispatch5): ptr IShellDispatch4 = cast[ptr IShellDispatch4](x)
converter winimConverterIShellDispatch5ToIShellDispatch3*(x: ptr IShellDispatch5): ptr IShellDispatch3 = cast[ptr IShellDispatch3](x)
converter winimConverterIShellDispatch5ToIShellDispatch2*(x: ptr IShellDispatch5): ptr IShellDispatch2 = cast[ptr IShellDispatch2](x)
converter winimConverterIShellDispatch5ToIShellDispatch*(x: ptr IShellDispatch5): ptr IShellDispatch = cast[ptr IShellDispatch](x)
converter winimConverterIShellDispatch5ToIDispatch*(x: ptr IShellDispatch5): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIShellDispatch6ToIShellDispatch5*(x: ptr IShellDispatch6): ptr IShellDispatch5 = cast[ptr IShellDispatch5](x)
converter winimConverterIShellDispatch6ToIShellDispatch4*(x: ptr IShellDispatch6): ptr IShellDispatch4 = cast[ptr IShellDispatch4](x)
converter winimConverterIShellDispatch6ToIShellDispatch3*(x: ptr IShellDispatch6): ptr IShellDispatch3 = cast[ptr IShellDispatch3](x)
converter winimConverterIShellDispatch6ToIShellDispatch2*(x: ptr IShellDispatch6): ptr IShellDispatch2 = cast[ptr IShellDispatch2](x)
converter winimConverterIShellDispatch6ToIShellDispatch*(x: ptr IShellDispatch6): ptr IShellDispatch = cast[ptr IShellDispatch](x)
converter winimConverterIShellDispatch6ToIDispatch*(x: ptr IShellDispatch6): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIFileSearchBandToIDispatch*(x: ptr IFileSearchBand): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIWebWizardHostToIDispatch*(x: ptr IWebWizardHost): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterINewWDEventsToIWebWizardHost*(x: ptr INewWDEvents): ptr IWebWizardHost = cast[ptr IWebWizardHost](x)
converter winimConverterINewWDEventsToIDispatch*(x: ptr INewWDEvents): ptr IDispatch = cast[ptr IDispatch](x)
converter winimConverterIAutoCompleteToIUnknown*(x: ptr IAutoComplete): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIAutoComplete2ToIAutoComplete*(x: ptr IAutoComplete2): ptr IAutoComplete = cast[ptr IAutoComplete](x)
converter winimConverterIAutoComplete2ToIUnknown*(x: ptr IAutoComplete2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumACStringToIEnumString*(x: ptr IEnumACString): ptr IEnumString = cast[ptr IEnumString](x)
converter winimConverterIDataObjectAsyncCapabilityToIUnknown*(x: ptr IDataObjectAsyncCapability): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIObjectArrayToIUnknown*(x: ptr IObjectArray): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIObjectCollectionToIObjectArray*(x: ptr IObjectCollection): ptr IObjectArray = cast[ptr IObjectArray](x)
converter winimConverterIObjectCollectionToIUnknown*(x: ptr IObjectCollection): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIContextMenuToIUnknown*(x: ptr IContextMenu): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIContextMenu2ToIContextMenu*(x: ptr IContextMenu2): ptr IContextMenu = cast[ptr IContextMenu](x)
converter winimConverterIContextMenu2ToIUnknown*(x: ptr IContextMenu2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIContextMenu3ToIContextMenu2*(x: ptr IContextMenu3): ptr IContextMenu2 = cast[ptr IContextMenu2](x)
converter winimConverterIContextMenu3ToIContextMenu*(x: ptr IContextMenu3): ptr IContextMenu = cast[ptr IContextMenu](x)
converter winimConverterIContextMenu3ToIUnknown*(x: ptr IContextMenu3): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExecuteCommandToIUnknown*(x: ptr IExecuteCommand): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPersistFolderToIPersist*(x: ptr IPersistFolder): ptr IPersist = cast[ptr IPersist](x)
converter winimConverterIRunnableTaskToIUnknown*(x: ptr IRunnableTask): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellTaskSchedulerToIUnknown*(x: ptr IShellTaskScheduler): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIQueryCodePageToIUnknown*(x: ptr IQueryCodePage): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPersistFolder2ToIPersistFolder*(x: ptr IPersistFolder2): ptr IPersistFolder = cast[ptr IPersistFolder](x)
converter winimConverterIPersistFolder2ToIPersist*(x: ptr IPersistFolder2): ptr IPersist = cast[ptr IPersist](x)
converter winimConverterIPersistFolder3ToIPersistFolder2*(x: ptr IPersistFolder3): ptr IPersistFolder2 = cast[ptr IPersistFolder2](x)
converter winimConverterIPersistFolder3ToIPersistFolder*(x: ptr IPersistFolder3): ptr IPersistFolder = cast[ptr IPersistFolder](x)
converter winimConverterIPersistFolder3ToIPersist*(x: ptr IPersistFolder3): ptr IPersist = cast[ptr IPersist](x)
converter winimConverterIPersistIDListToIPersist*(x: ptr IPersistIDList): ptr IPersist = cast[ptr IPersist](x)
converter winimConverterIEnumIDListToIUnknown*(x: ptr IEnumIDList): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumFullIDListToIUnknown*(x: ptr IEnumFullIDList): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIObjectWithFolderEnumModeToIUnknown*(x: ptr IObjectWithFolderEnumMode): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIParseAndCreateItemToIUnknown*(x: ptr IParseAndCreateItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellFolderToIUnknown*(x: ptr IShellFolder): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumExtraSearchToIUnknown*(x: ptr IEnumExtraSearch): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellFolder2ToIShellFolder*(x: ptr IShellFolder2): ptr IShellFolder = cast[ptr IShellFolder](x)
converter winimConverterIShellFolder2ToIUnknown*(x: ptr IShellFolder2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFolderViewOptionsToIUnknown*(x: ptr IFolderViewOptions): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellViewToIOleWindow*(x: ptr IShellView): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIShellView2ToIShellView*(x: ptr IShellView2): ptr IShellView = cast[ptr IShellView](x)
converter winimConverterIShellView2ToIOleWindow*(x: ptr IShellView2): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIShellView3ToIShellView2*(x: ptr IShellView3): ptr IShellView2 = cast[ptr IShellView2](x)
converter winimConverterIShellView3ToIShellView*(x: ptr IShellView3): ptr IShellView = cast[ptr IShellView](x)
converter winimConverterIShellView3ToIOleWindow*(x: ptr IShellView3): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIFolderViewToIUnknown*(x: ptr IFolderView): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterISearchBoxInfoToIUnknown*(x: ptr ISearchBoxInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFolderView2ToIFolderView*(x: ptr IFolderView2): ptr IFolderView = cast[ptr IFolderView](x)
converter winimConverterIFolderView2ToIUnknown*(x: ptr IFolderView2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFolderViewSettingsToIUnknown*(x: ptr IFolderViewSettings): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPreviewHandlerVisualsToIUnknown*(x: ptr IPreviewHandlerVisuals): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIVisualPropertiesToIUnknown*(x: ptr IVisualProperties): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICommDlgBrowserToIUnknown*(x: ptr ICommDlgBrowser): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICommDlgBrowser2ToICommDlgBrowser*(x: ptr ICommDlgBrowser2): ptr ICommDlgBrowser = cast[ptr ICommDlgBrowser](x)
converter winimConverterICommDlgBrowser2ToIUnknown*(x: ptr ICommDlgBrowser2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICommDlgBrowser3ToICommDlgBrowser2*(x: ptr ICommDlgBrowser3): ptr ICommDlgBrowser2 = cast[ptr ICommDlgBrowser2](x)
converter winimConverterICommDlgBrowser3ToICommDlgBrowser*(x: ptr ICommDlgBrowser3): ptr ICommDlgBrowser = cast[ptr ICommDlgBrowser](x)
converter winimConverterICommDlgBrowser3ToIUnknown*(x: ptr ICommDlgBrowser3): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIColumnManagerToIUnknown*(x: ptr IColumnManager): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFolderFilterSiteToIUnknown*(x: ptr IFolderFilterSite): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFolderFilterToIUnknown*(x: ptr IFolderFilter): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInputObjectSiteToIUnknown*(x: ptr IInputObjectSite): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInputObjectToIUnknown*(x: ptr IInputObject): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInputObject2ToIInputObject*(x: ptr IInputObject2): ptr IInputObject = cast[ptr IInputObject](x)
converter winimConverterIInputObject2ToIUnknown*(x: ptr IInputObject2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellIconToIUnknown*(x: ptr IShellIcon): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellBrowserToIOleWindow*(x: ptr IShellBrowser): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIProfferServiceToIUnknown*(x: ptr IProfferService): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellItemToIUnknown*(x: ptr IShellItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellItem2ToIShellItem*(x: ptr IShellItem2): ptr IShellItem = cast[ptr IShellItem](x)
converter winimConverterIShellItem2ToIUnknown*(x: ptr IShellItem2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellItemImageFactoryToIUnknown*(x: ptr IShellItemImageFactory): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIUserAccountChangeCallbackToIUnknown*(x: ptr IUserAccountChangeCallback): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumShellItemsToIUnknown*(x: ptr IEnumShellItems): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterITransferAdviseSinkToIUnknown*(x: ptr ITransferAdviseSink): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterITransferSourceToIUnknown*(x: ptr ITransferSource): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumResourcesToIUnknown*(x: ptr IEnumResources): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellItemResourcesToIUnknown*(x: ptr IShellItemResources): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterITransferDestinationToIUnknown*(x: ptr ITransferDestination): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIStreamAsyncToIStream*(x: ptr IStreamAsync): ptr IStream = cast[ptr IStream](x)
converter winimConverterIStreamUnbufferedInfoToIUnknown*(x: ptr IStreamUnbufferedInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileOperationProgressSinkToIUnknown*(x: ptr IFileOperationProgressSink): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellItemArrayToIUnknown*(x: ptr IShellItemArray): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInitializeWithItemToIUnknown*(x: ptr IInitializeWithItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIObjectWithSelectionToIUnknown*(x: ptr IObjectWithSelection): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIObjectWithBackReferencesToIUnknown*(x: ptr IObjectWithBackReferences): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPropertyUIToIUnknown*(x: ptr IPropertyUI): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICategoryProviderToIUnknown*(x: ptr ICategoryProvider): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICategorizerToIUnknown*(x: ptr ICategorizer): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDropTargetHelperToIUnknown*(x: ptr IDropTargetHelper): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDragSourceHelperToIUnknown*(x: ptr IDragSourceHelper): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDragSourceHelper2ToIDragSourceHelper*(x: ptr IDragSourceHelper2): ptr IDragSourceHelper = cast[ptr IDragSourceHelper](x)
converter winimConverterIDragSourceHelper2ToIUnknown*(x: ptr IDragSourceHelper2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellLinkAToIUnknown*(x: ptr IShellLinkA): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellLinkWToIUnknown*(x: ptr IShellLinkW): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellLinkDataListToIUnknown*(x: ptr IShellLinkDataList): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIResolveShellLinkToIUnknown*(x: ptr IResolveShellLink): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIActionProgressDialogToIUnknown*(x: ptr IActionProgressDialog): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIHWEventHandlerToIUnknown*(x: ptr IHWEventHandler): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIHWEventHandler2ToIHWEventHandler*(x: ptr IHWEventHandler2): ptr IHWEventHandler = cast[ptr IHWEventHandler](x)
converter winimConverterIHWEventHandler2ToIUnknown*(x: ptr IHWEventHandler2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIQueryCancelAutoPlayToIUnknown*(x: ptr IQueryCancelAutoPlay): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDynamicHWHandlerToIUnknown*(x: ptr IDynamicHWHandler): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIActionProgressToIUnknown*(x: ptr IActionProgress): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellExtInitToIUnknown*(x: ptr IShellExtInit): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellPropSheetExtToIUnknown*(x: ptr IShellPropSheetExt): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIRemoteComputerToIUnknown*(x: ptr IRemoteComputer): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIQueryContinueToIUnknown*(x: ptr IQueryContinue): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIObjectWithCancelEventToIUnknown*(x: ptr IObjectWithCancelEvent): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIUserNotificationToIUnknown*(x: ptr IUserNotification): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIUserNotificationCallbackToIUnknown*(x: ptr IUserNotificationCallback): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIUserNotification2ToIUnknown*(x: ptr IUserNotification2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIItemNameLimitsToIUnknown*(x: ptr IItemNameLimits): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterISearchFolderItemFactoryToIUnknown*(x: ptr ISearchFolderItemFactory): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExtractImageToIUnknown*(x: ptr IExtractImage): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExtractImage2ToIExtractImage*(x: ptr IExtractImage2): ptr IExtractImage = cast[ptr IExtractImage](x)
converter winimConverterIExtractImage2ToIUnknown*(x: ptr IExtractImage2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIThumbnailHandlerFactoryToIUnknown*(x: ptr IThumbnailHandlerFactory): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIParentAndItemToIUnknown*(x: ptr IParentAndItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDockingWindowToIOleWindow*(x: ptr IDockingWindow): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIDeskBandToIDockingWindow*(x: ptr IDeskBand): ptr IDockingWindow = cast[ptr IDockingWindow](x)
converter winimConverterIDeskBandToIOleWindow*(x: ptr IDeskBand): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIDeskBandInfoToIUnknown*(x: ptr IDeskBandInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDeskBand2ToIDeskBand*(x: ptr IDeskBand2): ptr IDeskBand = cast[ptr IDeskBand](x)
converter winimConverterIDeskBand2ToIDockingWindow*(x: ptr IDeskBand2): ptr IDockingWindow = cast[ptr IDockingWindow](x)
converter winimConverterIDeskBand2ToIOleWindow*(x: ptr IDeskBand2): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterITaskbarListToIUnknown*(x: ptr ITaskbarList): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterITaskbarList2ToITaskbarList*(x: ptr ITaskbarList2): ptr ITaskbarList = cast[ptr ITaskbarList](x)
converter winimConverterITaskbarList2ToIUnknown*(x: ptr ITaskbarList2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterITaskbarList3ToITaskbarList2*(x: ptr ITaskbarList3): ptr ITaskbarList2 = cast[ptr ITaskbarList2](x)
converter winimConverterITaskbarList3ToITaskbarList*(x: ptr ITaskbarList3): ptr ITaskbarList = cast[ptr ITaskbarList](x)
converter winimConverterITaskbarList3ToIUnknown*(x: ptr ITaskbarList3): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterITaskbarList4ToITaskbarList3*(x: ptr ITaskbarList4): ptr ITaskbarList3 = cast[ptr ITaskbarList3](x)
converter winimConverterITaskbarList4ToITaskbarList2*(x: ptr ITaskbarList4): ptr ITaskbarList2 = cast[ptr ITaskbarList2](x)
converter winimConverterITaskbarList4ToITaskbarList*(x: ptr ITaskbarList4): ptr ITaskbarList = cast[ptr ITaskbarList](x)
converter winimConverterITaskbarList4ToIUnknown*(x: ptr ITaskbarList4): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIStartMenuPinnedListToIUnknown*(x: ptr IStartMenuPinnedList): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICDBurnToIUnknown*(x: ptr ICDBurn): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWizardSiteToIUnknown*(x: ptr IWizardSite): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWizardExtensionToIUnknown*(x: ptr IWizardExtension): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWebWizardExtensionToIWizardExtension*(x: ptr IWebWizardExtension): ptr IWizardExtension = cast[ptr IWizardExtension](x)
converter winimConverterIWebWizardExtensionToIUnknown*(x: ptr IWebWizardExtension): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPublishingWizardToIWizardExtension*(x: ptr IPublishingWizard): ptr IWizardExtension = cast[ptr IWizardExtension](x)
converter winimConverterIPublishingWizardToIUnknown*(x: ptr IPublishingWizard): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFolderViewHostToIUnknown*(x: ptr IFolderViewHost): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExplorerBrowserEventsToIUnknown*(x: ptr IExplorerBrowserEvents): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExplorerBrowserToIUnknown*(x: ptr IExplorerBrowser): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIAccessibleObjectToIUnknown*(x: ptr IAccessibleObject): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIResultsFolderToIUnknown*(x: ptr IResultsFolder): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumObjectsToIUnknown*(x: ptr IEnumObjects): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIOperationsProgressDialogToIUnknown*(x: ptr IOperationsProgressDialog): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIIOCancelInformationToIUnknown*(x: ptr IIOCancelInformation): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileOperationToIUnknown*(x: ptr IFileOperation): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIObjectProviderToIUnknown*(x: ptr IObjectProvider): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINamespaceWalkCBToIUnknown*(x: ptr INamespaceWalkCB): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINamespaceWalkCB2ToINamespaceWalkCB*(x: ptr INamespaceWalkCB2): ptr INamespaceWalkCB = cast[ptr INamespaceWalkCB](x)
converter winimConverterINamespaceWalkCB2ToIUnknown*(x: ptr INamespaceWalkCB2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINamespaceWalkToIUnknown*(x: ptr INamespaceWalk): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIAutoCompleteDropDownToIUnknown*(x: ptr IAutoCompleteDropDown): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIBandSiteToIUnknown*(x: ptr IBandSite): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIModalWindowToIUnknown*(x: ptr IModalWindow): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICDBurnExtToIUnknown*(x: ptr ICDBurnExt): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIContextMenuSiteToIUnknown*(x: ptr IContextMenuSite): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumReadyCallbackToIUnknown*(x: ptr IEnumReadyCallback): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumerableViewToIUnknown*(x: ptr IEnumerableView): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInsertItemToIUnknown*(x: ptr IInsertItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIMenuBandToIUnknown*(x: ptr IMenuBand): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFolderBandPrivToIUnknown*(x: ptr IFolderBandPriv): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIRegTreeItemToIUnknown*(x: ptr IRegTreeItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIImageRecompressToIUnknown*(x: ptr IImageRecompress): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDeskBarToIOleWindow*(x: ptr IDeskBar): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIMenuPopupToIDeskBar*(x: ptr IMenuPopup): ptr IDeskBar = cast[ptr IDeskBar](x)
converter winimConverterIMenuPopupToIOleWindow*(x: ptr IMenuPopup): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIFileIsInUseToIUnknown*(x: ptr IFileIsInUse): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileDialogEventsToIUnknown*(x: ptr IFileDialogEvents): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileDialogToIModalWindow*(x: ptr IFileDialog): ptr IModalWindow = cast[ptr IModalWindow](x)
converter winimConverterIFileDialogToIUnknown*(x: ptr IFileDialog): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileSaveDialogToIFileDialog*(x: ptr IFileSaveDialog): ptr IFileDialog = cast[ptr IFileDialog](x)
converter winimConverterIFileSaveDialogToIModalWindow*(x: ptr IFileSaveDialog): ptr IModalWindow = cast[ptr IModalWindow](x)
converter winimConverterIFileSaveDialogToIUnknown*(x: ptr IFileSaveDialog): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileOpenDialogToIFileDialog*(x: ptr IFileOpenDialog): ptr IFileDialog = cast[ptr IFileDialog](x)
converter winimConverterIFileOpenDialogToIModalWindow*(x: ptr IFileOpenDialog): ptr IModalWindow = cast[ptr IModalWindow](x)
converter winimConverterIFileOpenDialogToIUnknown*(x: ptr IFileOpenDialog): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileDialogCustomizeToIUnknown*(x: ptr IFileDialogCustomize): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileDialogControlEventsToIUnknown*(x: ptr IFileDialogControlEvents): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileDialog2ToIFileDialog*(x: ptr IFileDialog2): ptr IFileDialog = cast[ptr IFileDialog](x)
converter winimConverterIFileDialog2ToIModalWindow*(x: ptr IFileDialog2): ptr IModalWindow = cast[ptr IModalWindow](x)
converter winimConverterIFileDialog2ToIUnknown*(x: ptr IFileDialog2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIApplicationAssociationRegistrationToIUnknown*(x: ptr IApplicationAssociationRegistration): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIApplicationAssociationRegistrationUIToIUnknown*(x: ptr IApplicationAssociationRegistrationUI): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDelegateFolderToIUnknown*(x: ptr IDelegateFolder): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIBrowserFrameOptionsToIUnknown*(x: ptr IBrowserFrameOptions): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINewWindowManagerToIUnknown*(x: ptr INewWindowManager): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIAttachmentExecuteToIUnknown*(x: ptr IAttachmentExecute): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellMenuCallbackToIUnknown*(x: ptr IShellMenuCallback): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellMenuToIUnknown*(x: ptr IShellMenu): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellRunDllToIUnknown*(x: ptr IShellRunDll): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIKnownFolderToIUnknown*(x: ptr IKnownFolder): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIKnownFolderManagerToIUnknown*(x: ptr IKnownFolderManager): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterISharingConfigurationManagerToIUnknown*(x: ptr ISharingConfigurationManager): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPreviousVersionsInfoToIUnknown*(x: ptr IPreviousVersionsInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIRelatedItemToIUnknown*(x: ptr IRelatedItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIIdentityNameToIRelatedItem*(x: ptr IIdentityName): ptr IRelatedItem = cast[ptr IRelatedItem](x)
converter winimConverterIIdentityNameToIUnknown*(x: ptr IIdentityName): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDelegateItemToIRelatedItem*(x: ptr IDelegateItem): ptr IRelatedItem = cast[ptr IRelatedItem](x)
converter winimConverterIDelegateItemToIUnknown*(x: ptr IDelegateItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICurrentItemToIRelatedItem*(x: ptr ICurrentItem): ptr IRelatedItem = cast[ptr IRelatedItem](x)
converter winimConverterICurrentItemToIUnknown*(x: ptr ICurrentItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterITransferMediumItemToIRelatedItem*(x: ptr ITransferMediumItem): ptr IRelatedItem = cast[ptr IRelatedItem](x)
converter winimConverterITransferMediumItemToIUnknown*(x: ptr ITransferMediumItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIUseToBrowseItemToIRelatedItem*(x: ptr IUseToBrowseItem): ptr IRelatedItem = cast[ptr IRelatedItem](x)
converter winimConverterIUseToBrowseItemToIUnknown*(x: ptr IUseToBrowseItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDisplayItemToIRelatedItem*(x: ptr IDisplayItem): ptr IRelatedItem = cast[ptr IRelatedItem](x)
converter winimConverterIDisplayItemToIUnknown*(x: ptr IDisplayItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIViewStateIdentityItemToIRelatedItem*(x: ptr IViewStateIdentityItem): ptr IRelatedItem = cast[ptr IRelatedItem](x)
converter winimConverterIViewStateIdentityItemToIUnknown*(x: ptr IViewStateIdentityItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPreviewItemToIRelatedItem*(x: ptr IPreviewItem): ptr IRelatedItem = cast[ptr IRelatedItem](x)
converter winimConverterIPreviewItemToIUnknown*(x: ptr IPreviewItem): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDestinationStreamFactoryToIUnknown*(x: ptr IDestinationStreamFactory): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINewMenuClientToIUnknown*(x: ptr INewMenuClient): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInitializeWithBindCtxToIUnknown*(x: ptr IInitializeWithBindCtx): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellItemFilterToIUnknown*(x: ptr IShellItemFilter): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINameSpaceTreeControlToIUnknown*(x: ptr INameSpaceTreeControl): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINameSpaceTreeControl2ToINameSpaceTreeControl*(x: ptr INameSpaceTreeControl2): ptr INameSpaceTreeControl = cast[ptr INameSpaceTreeControl](x)
converter winimConverterINameSpaceTreeControl2ToIUnknown*(x: ptr INameSpaceTreeControl2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINameSpaceTreeControlEventsToIUnknown*(x: ptr INameSpaceTreeControlEvents): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINameSpaceTreeControlDropHandlerToIUnknown*(x: ptr INameSpaceTreeControlDropHandler): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINameSpaceTreeAccessibleToIUnknown*(x: ptr INameSpaceTreeAccessible): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINameSpaceTreeControlCustomDrawToIUnknown*(x: ptr INameSpaceTreeControlCustomDraw): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINameSpaceTreeControlFolderCapabilitiesToIUnknown*(x: ptr INameSpaceTreeControlFolderCapabilities): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPreviewHandlerToIUnknown*(x: ptr IPreviewHandler): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPreviewHandlerFrameToIUnknown*(x: ptr IPreviewHandlerFrame): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterITrayDeskBandToIUnknown*(x: ptr ITrayDeskBand): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIBandHostToIUnknown*(x: ptr IBandHost): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExplorerPaneVisibilityToIUnknown*(x: ptr IExplorerPaneVisibility): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIContextMenuCBToIUnknown*(x: ptr IContextMenuCB): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDefaultExtractIconInitToIUnknown*(x: ptr IDefaultExtractIconInit): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExplorerCommandToIUnknown*(x: ptr IExplorerCommand): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExplorerCommandStateToIUnknown*(x: ptr IExplorerCommandState): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInitializeCommandToIUnknown*(x: ptr IInitializeCommand): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumExplorerCommandToIUnknown*(x: ptr IEnumExplorerCommand): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExplorerCommandProviderToIUnknown*(x: ptr IExplorerCommandProvider): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInitializeNetworkFolderToIUnknown*(x: ptr IInitializeNetworkFolder): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIOpenControlPanelToIUnknown*(x: ptr IOpenControlPanel): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIComputerInfoChangeNotifyToIUnknown*(x: ptr IComputerInfoChangeNotify): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileSystemBindDataToIUnknown*(x: ptr IFileSystemBindData): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileSystemBindData2ToIFileSystemBindData*(x: ptr IFileSystemBindData2): ptr IFileSystemBindData = cast[ptr IFileSystemBindData](x)
converter winimConverterIFileSystemBindData2ToIUnknown*(x: ptr IFileSystemBindData2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICustomDestinationListToIUnknown*(x: ptr ICustomDestinationList): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIApplicationDestinationsToIUnknown*(x: ptr IApplicationDestinations): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIApplicationDocumentListsToIUnknown*(x: ptr IApplicationDocumentLists): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIObjectWithAppUserModelIDToIUnknown*(x: ptr IObjectWithAppUserModelID): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIObjectWithProgIDToIUnknown*(x: ptr IObjectWithProgID): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIUpdateIDListToIUnknown*(x: ptr IUpdateIDList): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDesktopGadgetToIUnknown*(x: ptr IDesktopGadget): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDesktopWallpaperToIUnknown*(x: ptr IDesktopWallpaper): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIHomeGroupToIUnknown*(x: ptr IHomeGroup): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInitializeWithPropertyStoreToIUnknown*(x: ptr IInitializeWithPropertyStore): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIOpenSearchSourceToIUnknown*(x: ptr IOpenSearchSource): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellLibraryToIUnknown*(x: ptr IShellLibrary): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPlaybackManagerEventsToIUnknown*(x: ptr IPlaybackManagerEvents): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPlaybackManagerToIUnknown*(x: ptr IPlaybackManager): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDefaultFolderMenuInitializeToIUnknown*(x: ptr IDefaultFolderMenuInitialize): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIApplicationActivationManagerToIUnknown*(x: ptr IApplicationActivationManager): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIAssocHandlerInvokerToIUnknown*(x: ptr IAssocHandlerInvoker): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIAssocHandlerToIUnknown*(x: ptr IAssocHandler): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumAssocHandlersToIUnknown*(x: ptr IEnumAssocHandlers): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDataObjectProviderToIUnknown*(x: ptr IDataObjectProvider): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDataTransferManagerInteropToIUnknown*(x: ptr IDataTransferManagerInterop): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFrameworkInputPaneHandlerToIUnknown*(x: ptr IFrameworkInputPaneHandler): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFrameworkInputPaneToIUnknown*(x: ptr IFrameworkInputPane): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterISearchableApplicationToIUnknown*(x: ptr ISearchableApplication): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIAccessibilityDockingServiceCallbackToIUnknown*(x: ptr IAccessibilityDockingServiceCallback): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIAccessibilityDockingServiceToIUnknown*(x: ptr IAccessibilityDockingService): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIAppVisibilityEventsToIUnknown*(x: ptr IAppVisibilityEvents): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIAppVisibilityToIUnknown*(x: ptr IAppVisibility): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPackageExecutionStateChangeNotificationToIUnknown*(x: ptr IPackageExecutionStateChangeNotification): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIPackageDebugSettingsToIUnknown*(x: ptr IPackageDebugSettings): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExecuteCommandApplicationHostEnvironmentToIUnknown*(x: ptr IExecuteCommandApplicationHostEnvironment): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExecuteCommandHostToIUnknown*(x: ptr IExecuteCommandHost): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIApplicationDesignModeSettingsToIUnknown*(x: ptr IApplicationDesignModeSettings): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInitializeWithWindowToIUnknown*(x: ptr IInitializeWithWindow): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIHandlerInfoToIUnknown*(x: ptr IHandlerInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIHandlerActivationHostToIUnknown*(x: ptr IHandlerActivationHost): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExtractIconAToIUnknown*(x: ptr IExtractIconA): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIExtractIconWToIUnknown*(x: ptr IExtractIconW): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellIconOverlayIdentifierToIUnknown*(x: ptr IShellIconOverlayIdentifier): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellIconOverlayManagerToIUnknown*(x: ptr IShellIconOverlayManager): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellIconOverlayToIUnknown*(x: ptr IShellIconOverlay): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellExecuteHookAToIUnknown*(x: ptr IShellExecuteHookA): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellExecuteHookWToIUnknown*(x: ptr IShellExecuteHookW): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIURLSearchHookToIUnknown*(x: ptr IURLSearchHook): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterISearchContextToIUnknown*(x: ptr ISearchContext): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIURLSearchHook2ToIURLSearchHook*(x: ptr IURLSearchHook2): ptr IURLSearchHook = cast[ptr IURLSearchHook](x)
converter winimConverterIURLSearchHook2ToIUnknown*(x: ptr IURLSearchHook2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINewShortcutHookAToIUnknown*(x: ptr INewShortcutHookA): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINewShortcutHookWToIUnknown*(x: ptr INewShortcutHookW): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICopyHookAToIUnknown*(x: ptr ICopyHookA): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICopyHookWToIUnknown*(x: ptr ICopyHookW): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileViewerSiteToIUnknown*(x: ptr IFileViewerSite): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileViewerAToIUnknown*(x: ptr IFileViewerA): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIFileViewerWToIUnknown*(x: ptr IFileViewerW): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellDetailsToIUnknown*(x: ptr IShellDetails): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIObjMgrToIUnknown*(x: ptr IObjMgr): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterICurrentWorkingDirectoryToIUnknown*(x: ptr ICurrentWorkingDirectory): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIACListToIUnknown*(x: ptr IACList): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIACList2ToIACList*(x: ptr IACList2): ptr IACList = cast[ptr IACList](x)
converter winimConverterIACList2ToIUnknown*(x: ptr IACList2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIProgressDialogToIUnknown*(x: ptr IProgressDialog): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDockingWindowSiteToIOleWindow*(x: ptr IDockingWindowSite): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIDockingWindowFrameToIOleWindow*(x: ptr IDockingWindowFrame): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIThumbnailCaptureToIUnknown*(x: ptr IThumbnailCapture): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIEnumShellImageStoreToIUnknown*(x: ptr IEnumShellImageStore): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellImageStoreToIUnknown*(x: ptr IShellImageStore): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellFolderBandToIUnknown*(x: ptr IShellFolderBand): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDeskBarClientToIOleWindow*(x: ptr IDeskBarClient): ptr IOleWindow = cast[ptr IOleWindow](x)
converter winimConverterIActiveDesktopToIUnknown*(x: ptr IActiveDesktop): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIActiveDesktopPToIUnknown*(x: ptr IActiveDesktopP): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIADesktopP2ToIUnknown*(x: ptr IADesktopP2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIColumnProviderToIUnknown*(x: ptr IColumnProvider): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellChangeNotifyToIUnknown*(x: ptr IShellChangeNotify): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIQueryInfoToIUnknown*(x: ptr IQueryInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDefViewFrameToIUnknown*(x: ptr IDefViewFrame): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIDocViewSiteToIUnknown*(x: ptr IDocViewSite): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIInitializeObjectToIUnknown*(x: ptr IInitializeObject): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIBanneredBarToIUnknown*(x: ptr IBanneredBar): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellFolderViewCBToIUnknown*(x: ptr IShellFolderViewCB): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIShellFolderViewToIUnknown*(x: ptr IShellFolderView): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterINamedPropertyBagToIUnknown*(x: ptr INamedPropertyBag): ptr IUnknown = cast[ptr IUnknown](x)
when winimUnicode:
  type
    DRAGINFO* = DRAGINFOW
    LPDRAGINFO* = LPDRAGINFOW
    SHFILEOPSTRUCT* = SHFILEOPSTRUCTW
    LPSHFILEOPSTRUCT* = LPSHFILEOPSTRUCTW
    SHNAMEMAPPING* = SHNAMEMAPPINGW
    LPSHNAMEMAPPING* = LPSHNAMEMAPPINGW
    SHELLEXECUTEINFO* = SHELLEXECUTEINFOW
    LPSHELLEXECUTEINFO* = LPSHELLEXECUTEINFOW
    NOTIFYICONDATA* = NOTIFYICONDATAW
    PNOTIFYICONDATA* = PNOTIFYICONDATAW
    SHFILEINFO* = SHFILEINFOW
    OPEN_PRINTER_PROPS_INFO* = OPEN_PRINTER_PROPS_INFOW
    POPEN_PRINTER_PROPS_INFO* = POPEN_PRINTER_PROPS_INFOW
    IExtractIcon* = IExtractIconW
    LPEXTRACTICON* = LPEXTRACTICONW
    IShellExecuteHook* = IShellExecuteHookW
    INewShortcutHook* = INewShortcutHookW
    ICopyHook* = ICopyHookW
    LPCOPYHOOK* = LPCOPYHOOKW
    IFileViewer* = IFileViewerW
    LPFILEVIEWER* = LPFILEVIEWERW
    BROWSEINFO* = BROWSEINFOW
    PBROWSEINFO* = PBROWSEINFOW
    LPBROWSEINFO* = LPBROWSEINFOW
    FILEDESCRIPTOR* = FILEDESCRIPTORW
    LPFILEDESCRIPTOR* = LPFILEDESCRIPTORW
    FILEGROUPDESCRIPTOR* = FILEGROUPDESCRIPTORW
    LPFILEGROUPDESCRIPTOR* = LPFILEGROUPDESCRIPTORW
  const
    SZ_CONTENTTYPE_HTML* = SZ_CONTENTTYPE_HTMLW
    SZ_CONTENTTYPE_CDF* = SZ_CONTENTTYPE_CDFW
    IID_IFileViewer* = IID_IFileViewerW
    IID_IShellLink* = IID_IShellLinkW
    IID_IExtractIcon* = IID_IExtractIconW
    IID_IShellCopyHook* = IID_IShellCopyHookW
    IID_IShellExecuteHook* = IID_IShellExecuteHookW
    IID_INewShortcutHook* = IID_INewShortcutHookW
    IID_IUniformResourceLocator* = IID_IUniformResourceLocatorW
    GCS_VERB* = GCS_VERBW
    GCS_HELPTEXT* = GCS_HELPTEXTW
    GCS_VALIDATE* = GCS_VALIDATEW
    CMDSTR_NEWFOLDER* = CMDSTR_NEWFOLDERW
    CMDSTR_VIEWLIST* = CMDSTR_VIEWLISTW
    CMDSTR_VIEWDETAILS* = CMDSTR_VIEWDETAILSW
    BFFM_SETSTATUSTEXT* = BFFM_SETSTATUSTEXTW
    BFFM_SETSELECTION* = BFFM_SETSELECTIONW
    BFFM_VALIDATEFAILED* = BFFM_VALIDATEFAILEDW
    CFSTR_FILEDESCRIPTOR* = CFSTR_FILEDESCRIPTORW
    CFSTR_FILENAME* = CFSTR_FILENAMEW
    CFSTR_FILENAMEMAP* = CFSTR_FILENAMEMAPW
    CFSTR_INETURL* = CFSTR_INETURLW
    SHCNF_PATH* = SHCNF_PATHW
    SHCNF_PRINTER* = SHCNF_PRINTERW
    SHARD_PATH* = SHARD_PATHW
  proc StrFormatByteSize64*(qdw: LONGLONG, szBuf: LPWSTR, uiBufSize: UINT): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrFormatByteSizeW".}
  proc StrCat*(psz1: LPWSTR, psz2: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCatW".}
  proc StrCmp*(psz1: LPCWSTR, psz2: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpW".}
  proc StrCmpI*(psz1: LPCWSTR, psz2: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpIW".}
  proc StrCpy*(psz1: LPWSTR, psz2: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCpyW".}
  proc StrCpyN*(psz1: LPWSTR, psz2: LPCWSTR, cchMax: int32): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCpyNW".}
  proc DragQueryFile*(hDrop: HDROP, iFile: UINT, lpszFile: LPWSTR, cch: UINT): UINT {.winapi, stdcall, dynlib: "shell32", importc: "DragQueryFileW".}
  proc ShellExecute*(hwnd: HWND, lpOperation: LPCWSTR, lpFile: LPCWSTR, lpParameters: LPCWSTR, lpDirectory: LPCWSTR, nShowCmd: INT): HINSTANCE {.winapi, stdcall, dynlib: "shell32", importc: "ShellExecuteW".}
  proc FindExecutable*(lpFile: LPCWSTR, lpDirectory: LPCWSTR, lpResult: LPWSTR): HINSTANCE {.winapi, stdcall, dynlib: "shell32", importc: "FindExecutableW".}
  proc ShellAbout*(hWnd: HWND, szApp: LPCWSTR, szOtherStuff: LPCWSTR, hIcon: HICON): INT {.winapi, stdcall, dynlib: "shell32", importc: "ShellAboutW".}
  proc ExtractAssociatedIcon*(hInst: HINSTANCE, pszIconPath: LPWSTR, piIcon: ptr WORD): HICON {.winapi, stdcall, dynlib: "shell32", importc: "ExtractAssociatedIconW".}
  proc ExtractAssociatedIconEx*(hInst: HINSTANCE, pszIconPath: LPWSTR, piIconIndex: ptr WORD, piIconId: ptr WORD): HICON {.winapi, stdcall, dynlib: "shell32", importc: "ExtractAssociatedIconExW".}
  proc ExtractIcon*(hInst: HINSTANCE, pszExeFileName: LPCWSTR, nIconIndex: UINT): HICON {.winapi, stdcall, dynlib: "shell32", importc: "ExtractIconW".}
  proc DoEnvironmentSubst*(pszSrc: LPWSTR, cchSrc: UINT): DWORD {.winapi, stdcall, dynlib: "shell32", importc: "DoEnvironmentSubstW".}
  proc ExtractIconEx*(lpszFile: LPCWSTR, nIconIndex: int32, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIcons: UINT): UINT {.winapi, stdcall, dynlib: "shell32", importc: "ExtractIconExW".}
  proc SHFileOperation*(lpFileOp: LPSHFILEOPSTRUCTW): int32 {.winapi, stdcall, dynlib: "shell32", importc: "SHFileOperationW".}
  proc ShellExecuteEx*(pExecInfo: ptr SHELLEXECUTEINFOW): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "ShellExecuteExW".}
  proc SHQueryRecycleBin*(pszRootPath: LPCWSTR, pSHQueryRBInfo: LPSHQUERYRBINFO): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHQueryRecycleBinW".}
  proc SHEmptyRecycleBin*(hwnd: HWND, pszRootPath: LPCWSTR, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHEmptyRecycleBinW".}
  proc Shell_NotifyIcon*(dwMessage: DWORD, lpData: PNOTIFYICONDATAW): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "Shell_NotifyIconW".}
  proc SHGetFileInfo*(pszPath: LPCWSTR, dwFileAttributes: DWORD, psfi: ptr SHFILEINFOW, cbFileInfo: UINT, uFlags: UINT): DWORD_PTR {.winapi, stdcall, dynlib: "shell32", importc: "SHGetFileInfoW".}
  proc SHGetDiskFreeSpace*(pszDirectoryName: LPCWSTR, pulFreeBytesAvailableToCaller: ptr ULARGE_INTEGER, pulTotalNumberOfBytes: ptr ULARGE_INTEGER, pulTotalNumberOfFreeBytes: ptr ULARGE_INTEGER): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHGetDiskFreeSpaceExW".}
  proc SHGetDiskFreeSpaceEx*(pszDirectoryName: LPCWSTR, pulFreeBytesAvailableToCaller: ptr ULARGE_INTEGER, pulTotalNumberOfBytes: ptr ULARGE_INTEGER, pulTotalNumberOfFreeBytes: ptr ULARGE_INTEGER): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHGetDiskFreeSpaceExW".}
  proc SHGetNewLinkInfo*(pszLinkTo: LPCWSTR, pszDir: LPCWSTR, pszName: LPWSTR, pfMustCopy: ptr WINBOOL, uFlags: UINT): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHGetNewLinkInfoW".}
  proc SHInvokePrinterCommand*(hwnd: HWND, uAction: UINT, lpBuf1: LPCWSTR, lpBuf2: LPCWSTR, fModal: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHInvokePrinterCommandW".}
  proc ShellMessageBox*(hAppInst: HINSTANCE, hWnd: HWND, lpcText: LPCWSTR, lpcTitle: LPCWSTR, fuStyle: UINT): int32 {.winapi, xpincompatible, stdcall, dynlib: "shlwapi", importc: "ShellMessageBoxW".}
  proc IsLFNDrive*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "IsLFNDriveW".}
  proc SHEnumerateUnreadMailAccounts*(hKeyUser: HKEY, dwIndex: DWORD, pszMailAddress: LPWSTR, cchMailAddress: int32): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHEnumerateUnreadMailAccountsW".}
  proc SHGetUnreadMailCount*(hKeyUser: HKEY, pszMailAddress: LPCWSTR, pdwCount: ptr DWORD, pFileTime: ptr FILETIME, pszShellExecuteCommand: LPWSTR, cchShellExecuteCommand: int32): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHGetUnreadMailCountW".}
  proc SHSetUnreadMailCount*(pszMailAddress: LPCWSTR, dwCount: DWORD, pszShellExecuteCommand: LPCWSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHSetUnreadMailCountW".}
  proc StrRetToStr*(pstr: ptr STRRET, pidl: LPCITEMIDLIST, ppsz: ptr LPWSTR): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "StrRetToStrW".}
  proc StrRetToBuf*(pstr: ptr STRRET, pidl: LPCITEMIDLIST, pszBuf: LPWSTR, cchBuf: UINT): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "StrRetToBufW".}
  proc SHStrDup*(psz: LPCWSTR, ppwsz: ptr ptr WCHAR): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "SHStrDupW".}
  proc IsCharSpace*(wch: WCHAR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "IsCharSpaceW".}
  proc StrCmpC*(pszStr1: LPCWSTR, pszStr2: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpCW".}
  proc StrCmpIC*(pszStr1: LPCWSTR, pszStr2: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpICW".}
  proc StrChr*(lpStart: LPCWSTR, wMatch: WCHAR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrChrW".}
  proc StrRChr*(lpStart: LPCWSTR, lpEnd: LPCWSTR, wMatch: WCHAR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrRChrW".}
  proc StrChrI*(lpStart: LPCWSTR, wMatch: WCHAR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrChrIW".}
  proc StrRChrI*(lpStart: LPCWSTR, lpEnd: LPCWSTR, wMatch: WCHAR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrRChrIW".}
  proc StrCmpN*(lpStr1: LPCWSTR, lpStr2: LPCWSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpNW".}
  proc StrCmpNI*(lpStr1: LPCWSTR, lpStr2: LPCWSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpNIW".}
  proc StrStr*(lpFirst: LPCWSTR, lpSrch: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrStrW".}
  proc StrStrI*(lpFirst: LPCWSTR, lpSrch: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrStrIW".}
  proc StrDup*(lpSrch: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrDupW".}
  proc StrRStrI*(lpSource: LPCWSTR, lpLast: LPCWSTR, lpSrch: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrRStrIW".}
  proc StrCSpn*(lpStr: LPCWSTR, lpSet: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCSpnW".}
  proc StrCSpnI*(lpStr: LPCWSTR, lpSet: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCSpnIW".}
  proc StrSpn*(psz: LPCWSTR, pszSet: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrSpnW".}
  proc StrToInt*(lpSrc: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrToIntW".}
  proc StrPBrk*(psz: LPCWSTR, pszSet: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrPBrkW".}
  proc StrToIntEx*(pszString: LPCWSTR, dwFlags: DWORD, piRet: ptr int32): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "StrToIntExW".}
  proc StrToInt64Ex*(pszString: LPCWSTR, dwFlags: DWORD, pllRet: ptr LONGLONG): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "StrToInt64ExW".}
  proc StrFromTimeInterval*(pszOut: LPWSTR, cchMax: UINT, dwTimeMS: DWORD, digits: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrFromTimeIntervalW".}
  proc StrFormatByteSize*(qdw: LONGLONG, szBuf: LPWSTR, uiBufSize: UINT): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrFormatByteSizeW".}
  proc StrFormatKBSize*(qdw: LONGLONG, szBuf: LPWSTR, uiBufSize: UINT): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrFormatKBSizeW".}
  proc StrNCat*(psz1: LPWSTR, psz2: LPCWSTR, cchMax: int32): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrNCatW".}
  proc StrTrim*(psz: LPWSTR, pszTrimChars: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "StrTrimW".}
  proc StrCatBuff*(pszDest: LPWSTR, pszSrc: LPCWSTR, cchDestBuffSize: int32): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCatBuffW".}
  proc ChrCmpI*(w1: WCHAR, w2: WCHAR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "ChrCmpIW".}
  proc wvnsprintf*(lpOut: LPWSTR, cchLimitIn: int32, lpFmt: LPCWSTR, arglist: va_list): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "wvnsprintfW".}
  proc wnsprintf*(lpOut: LPWSTR, cchLimitIn: int32, lpFmt: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "wnsprintfW".}
  proc StrIsIntlEqual*(fCaseSens: WINBOOL, lpString1: LPCWSTR, lpString2: LPCWSTR, nChar: int32): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "StrIsIntlEqualW".}
  proc StrToLong*(lpSrc: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrToIntW".}
  proc StrNCmp*(lpStr1: LPCWSTR, lpStr2: LPCWSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpNW".}
  proc StrNCmpI*(lpStr1: LPCWSTR, lpStr2: LPCWSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpNIW".}
  proc StrNCpy*(psz1: LPWSTR, psz2: LPCWSTR, cchMax: int32): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCpyNW".}
  proc StrCatN*(psz1: LPWSTR, psz2: LPCWSTR, cchMax: int32): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrNCatW".}
  proc PathAddBackslash*(pszPath: LPWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathAddBackslashW".}
  proc PathAddExtension*(pszPath: LPWSTR, pszExt: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathAddExtensionW".}
  proc PathBuildRoot*(pszRoot: LPWSTR, iDrive: int32): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathBuildRootW".}
  proc PathCombine*(pszDest: LPWSTR, pszDir: LPCWSTR, pszFile: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCombineW".}
  proc PathFileExists*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFileExistsW".}
  proc PathFindExtension*(pszPath: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFindExtensionW".}
  proc PathFindFileName*(pszPath: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFindFileNameW".}
  proc PathFindNextComponent*(pszPath: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFindNextComponentW".}
  proc PathGetArgs*(pszPath: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathGetArgsW".}
  proc PathFindSuffixArray*(pszPath: LPCWSTR, apszSuffix: ptr LPCWSTR, iArraySize: int32): LPCWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFindSuffixArrayW".}
  proc PathIsLFNFileSpec*(lpName: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsLFNFileSpecW".}
  proc PathGetDriveNumber*(pszPath: LPCWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "PathGetDriveNumberW".}
  proc PathIsDirectory*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsDirectoryW".}
  proc PathIsDirectoryEmpty*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsDirectoryEmptyW".}
  proc PathIsFileSpec*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsFileSpecW".}
  proc PathIsPrefix*(pszPrefix: LPCWSTR, pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsPrefixW".}
  proc PathIsRelative*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsRelativeW".}
  proc PathIsRoot*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsRootW".}
  proc PathIsSameRoot*(pszPath1: LPCWSTR, pszPath2: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsSameRootW".}
  proc PathIsUNC*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsUNCW".}
  proc PathIsNetworkPath*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsNetworkPathW".}
  proc PathIsUNCServer*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsUNCServerW".}
  proc PathIsUNCServerShare*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsUNCServerShareW".}
  proc PathIsURL*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsURLW".}
  proc PathRemoveBackslash*(pszPath: LPWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRemoveBackslashW".}
  proc PathSkipRoot*(pszPath: LPCWSTR): LPWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathSkipRootW".}
  proc PathStripPath*(pszPath: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathStripPathW".}
  proc PathStripToRoot*(pszPath: LPWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathStripToRootW".}
  proc PathMakeSystemFolder*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathMakeSystemFolderW".}
  proc PathUnmakeSystemFolder*(pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathUnmakeSystemFolderW".}
  proc PathIsSystemFolder*(pszPath: LPCWSTR, dwAttrb: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsSystemFolderW".}
  proc PathUndecorate*(pszPath: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathUndecorateW".}
  proc PathUnExpandEnvStrings*(pszPath: LPCWSTR, pszBuf: LPWSTR, cchBuf: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathUnExpandEnvStringsW".}
  proc PathAppend*(pszPath: LPWSTR, pMore: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathAppendW".}
  proc PathCanonicalize*(pszBuf: LPWSTR, pszPath: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCanonicalizeW".}
  proc PathCompactPath*(hDC: HDC, pszPath: LPWSTR, dx: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCompactPathW".}
  proc PathCompactPathEx*(pszOut: LPWSTR, pszSrc: LPCWSTR, cchMax: UINT, dwFlags: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCompactPathExW".}
  proc PathCommonPrefix*(pszFile1: LPCWSTR, pszFile2: LPCWSTR, achPath: LPWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCommonPrefixW".}
  proc PathFindOnPath*(pszPath: LPWSTR, ppszOtherDirs: ptr LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFindOnPathW".}
  proc PathGetCharType*(ch: WCHAR): UINT {.winapi, stdcall, dynlib: "shlwapi", importc: "PathGetCharTypeW".}
  proc PathIsContentType*(pszPath: LPCWSTR, pszContentType: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsContentTypeW".}
  proc PathMakePretty*(pszPath: LPWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathMakePrettyW".}
  proc PathMatchSpec*(pszFile: LPCWSTR, pszSpec: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathMatchSpecW".}
  proc PathParseIconLocation*(pszIconFile: LPWSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "PathParseIconLocationW".}
  proc PathQuoteSpaces*(lpsz: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathQuoteSpacesW".}
  proc PathRelativePathTo*(pszPath: LPWSTR, pszFrom: LPCWSTR, dwAttrFrom: DWORD, pszTo: LPCWSTR, dwAttrTo: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRelativePathToW".}
  proc PathRemoveArgs*(pszPath: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRemoveArgsW".}
  proc PathRemoveBlanks*(pszPath: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRemoveBlanksW".}
  proc PathRemoveExtension*(pszPath: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRemoveExtensionW".}
  proc PathRemoveFileSpec*(pszPath: LPWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRemoveFileSpecW".}
  proc PathRenameExtension*(pszPath: LPWSTR, pszExt: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRenameExtensionW".}
  proc PathSearchAndQualify*(pszPath: LPCWSTR, pszBuf: LPWSTR, cchBuf: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathSearchAndQualifyW".}
  proc PathSetDlgItemPath*(hDlg: HWND, id: int32, pszPath: LPCWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathSetDlgItemPathW".}
  proc PathUnquoteSpaces*(lpsz: LPWSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathUnquoteSpacesW".}
  proc UrlCompare*(psz1: LPCWSTR, psz2: LPCWSTR, fIgnoreSlash: WINBOOL): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlCompareW".}
  proc UrlCombine*(pszBase: LPCWSTR, pszRelative: LPCWSTR, pszCombined: LPWSTR, pcchCombined: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlCombineW".}
  proc UrlCanonicalize*(pszUrl: LPCWSTR, pszCanonicalized: LPWSTR, pcchCanonicalized: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlCanonicalizeW".}
  proc UrlIsOpaque*(pszURL: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlIsOpaqueW".}
  proc UrlGetLocation*(psz1: LPCWSTR): LPCWSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlGetLocationW".}
  proc UrlUnescape*(pszUrl: LPWSTR, pszUnescaped: LPWSTR, pcchUnescaped: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlUnescapeW".}
  proc UrlEscape*(pszUrl: LPCWSTR, pszEscaped: LPWSTR, pcchEscaped: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlEscapeW".}
  proc UrlCreateFromPath*(pszPath: LPCWSTR, pszUrl: LPWSTR, pcchUrl: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlCreateFromPathW".}
  proc PathCreateFromUrl*(pszUrl: LPCWSTR, pszPath: LPWSTR, pcchPath: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCreateFromUrlW".}
  proc UrlHash*(pszUrl: LPCWSTR, pbHash: LPBYTE, cbHash: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlHashW".}
  proc UrlGetPart*(pszIn: LPCWSTR, pszOut: LPWSTR, pcchOut: LPDWORD, dwPart: DWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlGetPartW".}
  proc UrlApplyScheme*(pszIn: LPCWSTR, pszOut: LPWSTR, pcchOut: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlApplySchemeW".}
  proc UrlIs*(pszUrl: LPCWSTR, UrlIs: TURLIS): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlIsW".}
  proc SHDeleteEmptyKey*(hkey: HKEY, pszSubKey: LPCWSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHDeleteEmptyKeyW".}
  proc SHDeleteKey*(hkey: HKEY, pszSubKey: LPCWSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHDeleteKeyW".}
  proc SHDeleteValue*(hkey: HKEY, pszSubKey: LPCWSTR, pszValue: LPCWSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHDeleteValueW".}
  proc SHGetValue*(hkey: HKEY, pszSubKey: LPCWSTR, pszValue: LPCWSTR, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHGetValueW".}
  proc SHSetValue*(hkey: HKEY, pszSubKey: LPCWSTR, pszValue: LPCWSTR, dwType: DWORD, pvData: LPCVOID, cbData: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHSetValueW".}
  proc SHRegGetValue*(hkey: HKEY, pszSubKey: LPCWSTR, pszValue: LPCWSTR, dwFlags: SRRF, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegGetValueW".}
  proc SHQueryValueEx*(hkey: HKEY, pszValue: LPCWSTR, pdwReserved: ptr DWORD, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHQueryValueExW".}
  proc SHEnumKeyEx*(hkey: HKEY, dwIndex: DWORD, pszName: LPWSTR, pcchName: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHEnumKeyExW".}
  proc SHEnumValue*(hkey: HKEY, dwIndex: DWORD, pszValueName: LPWSTR, pcchValueName: LPDWORD, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHEnumValueW".}
  proc SHQueryInfoKey*(hkey: HKEY, pcSubKeys: LPDWORD, pcchMaxSubKeyLen: LPDWORD, pcValues: LPDWORD, pcchMaxValueNameLen: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHQueryInfoKeyW".}
  proc SHCopyKey*(hkeySrc: HKEY, wszSrcSubKey: LPCWSTR, hkeyDest: HKEY, fReserved: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHCopyKeyW".}
  proc SHRegGetPath*(hKey: HKEY, pcszSubKey: LPCWSTR, pcszValue: LPCWSTR, pszPath: LPWSTR, dwFlags: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegGetPathW".}
  proc SHRegSetPath*(hKey: HKEY, pcszSubKey: LPCWSTR, pcszValue: LPCWSTR, pcszPath: LPCWSTR, dwFlags: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegSetPathW".}
  proc SHRegCreateUSKey*(pwzPath: LPCWSTR, samDesired: REGSAM, hRelativeUSKey: HUSKEY, phNewUSKey: PHUSKEY, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegCreateUSKeyW".}
  proc SHRegOpenUSKey*(pwzPath: LPCWSTR, samDesired: REGSAM, hRelativeUSKey: HUSKEY, phNewUSKey: PHUSKEY, fIgnoreHKCU: WINBOOL): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegOpenUSKeyW".}
  proc SHRegQueryUSValue*(hUSKey: HUSKEY, pwzValue: LPCWSTR, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, fIgnoreHKCU: WINBOOL, pvDefaultData: pointer, dwDefaultDataSize: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegQueryUSValueW".}
  proc SHRegWriteUSValue*(hUSKey: HUSKEY, pwzValue: LPCWSTR, dwType: DWORD, pvData: pointer, cbData: DWORD, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegWriteUSValueW".}
  proc SHRegDeleteUSValue*(hUSKey: HUSKEY, pwzValue: LPCWSTR, delRegFlags: SHREGDEL_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegDeleteUSValueW".}
  proc SHRegDeleteEmptyUSKey*(hUSKey: HUSKEY, pwzSubKey: LPCWSTR, delRegFlags: SHREGDEL_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegDeleteEmptyUSKeyW".}
  proc SHRegEnumUSKey*(hUSKey: HUSKEY, dwIndex: DWORD, pwzName: LPWSTR, pcchName: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegEnumUSKeyW".}
  proc SHRegEnumUSValue*(hUSkey: HUSKEY, dwIndex: DWORD, pszValueName: LPWSTR, pcchValueName: LPDWORD, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegEnumUSValueW".}
  proc SHRegQueryInfoUSKey*(hUSKey: HUSKEY, pcSubKeys: LPDWORD, pcchMaxSubKeyLen: LPDWORD, pcValues: LPDWORD, pcchMaxValueNameLen: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegQueryInfoUSKeyW".}
  proc SHRegGetUSValue*(pwzSubKey: LPCWSTR, pwzValue: LPCWSTR, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, fIgnoreHKCU: WINBOOL, pvDefaultData: pointer, dwDefaultDataSize: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegGetUSValueW".}
  proc SHRegSetUSValue*(pwzSubKey: LPCWSTR, pwzValue: LPCWSTR, dwType: DWORD, pvData: pointer, cbData: DWORD, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegSetUSValueW".}
  proc SHRegGetInt*(hk: HKEY, pwzKey: LPCWSTR, iDefault: int32): int32 {.winapi, xpincompatible, stdcall, dynlib: "shlwapi", importc: "SHRegGetIntW".}
  proc SHRegGetBoolUSValue*(pszSubKey: LPCWSTR, pszValue: LPCWSTR, fIgnoreHKCU: WINBOOL, fDefault: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegGetBoolUSValueW".}
  proc AssocQueryString*(flags: ASSOCF, str: ASSOCSTR, pszAssoc: LPCWSTR, pszExtra: LPCWSTR, pszOut: LPWSTR, pcchOut: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "AssocQueryStringW".}
  proc AssocQueryStringByKey*(flags: ASSOCF, str: ASSOCSTR, hkAssoc: HKEY, pszExtra: LPCWSTR, pszOut: LPWSTR, pcchOut: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "AssocQueryStringByKeyW".}
  proc AssocQueryKey*(flags: ASSOCF, key: ASSOCKEY, pszAssoc: LPCWSTR, pszExtra: LPCWSTR, phkeyOut: ptr HKEY): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "AssocQueryKeyW".}
  proc SHOpenRegStream2*(hkey: HKEY, pszSubkey: LPCWSTR, pszValue: LPCWSTR, grfMode: DWORD): ptr IStream {.winapi, stdcall, dynlib: "shlwapi", importc: "SHOpenRegStream2W".}
  proc SHCreateStreamOnFile*(pszFile: LPCWSTR, grfMode: DWORD, ppstm: ptr ptr IStream): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "SHCreateStreamOnFileW".}
  proc SHOpenRegStream*(hkey: HKEY, pszSubkey: LPCWSTR, pszValue: LPCWSTR, grfMode: DWORD): ptr IStream {.winapi, stdcall, dynlib: "shlwapi", importc: "SHOpenRegStream2W".}
  proc GetAcceptLanguages*(psz: LPWSTR, pcch: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "GetAcceptLanguagesW".}
  proc SHGetIconOverlayIndex*(pszIconPath: LPCWSTR, iIconIndex: int32): int32 {.winapi, stdcall, dynlib: "shell32", importc: "SHGetIconOverlayIndexW".}
  proc ILCreateFromPath*(pszPath: PCWSTR): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc: "ILCreateFromPathW".}
  proc SHGetPathFromIDList*(pidl: PCIDLIST_ABSOLUTE, pszPath: LPWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHGetPathFromIDListW".}
  proc SHCreateDirectoryEx*(hwnd: HWND, pszPath: LPCWSTR, psa: ptr SECURITY_ATTRIBUTES): int32 {.winapi, stdcall, dynlib: "shell32", importc: "SHCreateDirectoryExW".}
  proc SHGetSpecialFolderPath*(hwnd: HWND, pszPath: LPWSTR, csidl: int32, fCreate: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHGetSpecialFolderPathW".}
  proc SHGetFolderPath*(hwnd: HWND, csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszPath: LPWSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHGetFolderPathW".}
  proc SHSetFolderPath*(csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszPath: LPCWSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc: "SHSetFolderPathW".}
  proc SHGetFolderPathAndSubDir*(hwnd: HWND, csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszSubDir: LPCWSTR, pszPath: LPWSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHGetFolderPathAndSubDirW".}
  proc SHBrowseForFolder*(lpbi: LPBROWSEINFOW): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc: "SHBrowseForFolderW".}
  proc SHUpdateImage*(pszHashItem: LPCWSTR, iIndex: int32, uFlags: UINT, iImageIndex: int32): void {.winapi, stdcall, dynlib: "shell32", importc: "SHUpdateImageW".}
  proc SHGetDataFromIDList*(psf: ptr IShellFolder, pidl: PCUITEMID_CHILD, nFormat: int32, pv: pointer, cb: int32): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHGetDataFromIDListW".}
  proc PathIsSlow*(pszFile: LPCWSTR, dwAttr: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "PathIsSlowW".}
  proc SHStartNetConnectionDialog*(hwnd: HWND, pszRemoteName: LPCWSTR, dwType: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHStartNetConnectionDialogW".}
  proc SHDefExtractIcon*(pszIconFile: LPCWSTR, iIndex: int32, uFlags: UINT, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIconSize: UINT): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHDefExtractIconW".}
  proc Shell_GetCachedImageIndex*(pszIconPath: LPCWSTR, iIconIndex: int32, uIconFlags: UINT): int32 {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc: "Shell_GetCachedImageIndexW".}
  proc SHOpenPropSheet*(pszCaption: LPCWSTR, ahkeys: ptr HKEY, ckeys: UINT, pclsidDefault: ptr CLSID, pdtobj: ptr IDataObject, psb: ptr IShellBrowser, pStartPage: LPCWSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHOpenPropSheetW".}
  proc SHPathPrepareForWrite*(hwnd: HWND, punkEnableModless: ptr IUnknown, pszPath: LPCWSTR, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHPathPrepareForWriteW".}
  proc SHCreateFileExtractIcon*(pszFile: LPCWSTR, dwFileAttributes: DWORD, riid: REFIID, ppv: ptr pointer): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHCreateFileExtractIconW".}
when winimAnsi:
  type
    DRAGINFO* = DRAGINFOA
    LPDRAGINFO* = LPDRAGINFOA
    SHFILEOPSTRUCT* = SHFILEOPSTRUCTA
    LPSHFILEOPSTRUCT* = LPSHFILEOPSTRUCTA
    SHNAMEMAPPING* = SHNAMEMAPPINGA
    LPSHNAMEMAPPING* = LPSHNAMEMAPPINGA
    SHELLEXECUTEINFO* = SHELLEXECUTEINFOA
    LPSHELLEXECUTEINFO* = LPSHELLEXECUTEINFOA
    NOTIFYICONDATA* = NOTIFYICONDATAA
    PNOTIFYICONDATA* = PNOTIFYICONDATAA
    SHFILEINFO* = SHFILEINFOA
    OPEN_PRINTER_PROPS_INFO* = OPEN_PRINTER_PROPS_INFOA
    POPEN_PRINTER_PROPS_INFO* = POPEN_PRINTER_PROPS_INFOA
    IExtractIcon* = IExtractIconA
    LPEXTRACTICON* = LPEXTRACTICONA
    IShellExecuteHook* = IShellExecuteHookA
    INewShortcutHook* = INewShortcutHookA
    ICopyHook* = ICopyHookA
    LPCOPYHOOK* = LPCOPYHOOKA
    IFileViewer* = IFileViewerA
    LPFILEVIEWER* = LPFILEVIEWERA
    BROWSEINFO* = BROWSEINFOA
    PBROWSEINFO* = PBROWSEINFOA
    LPBROWSEINFO* = LPBROWSEINFOA
    FILEDESCRIPTOR* = FILEDESCRIPTORA
    LPFILEDESCRIPTOR* = LPFILEDESCRIPTORA
    FILEGROUPDESCRIPTOR* = FILEGROUPDESCRIPTORA
    LPFILEGROUPDESCRIPTOR* = LPFILEGROUPDESCRIPTORA
  const
    SZ_CONTENTTYPE_HTML* = SZ_CONTENTTYPE_HTMLA
    SZ_CONTENTTYPE_CDF* = SZ_CONTENTTYPE_CDFA
    IID_IFileViewer* = IID_IFileViewerA
    IID_IShellLink* = IID_IShellLinkA
    IID_IExtractIcon* = IID_IExtractIconA
    IID_IShellCopyHook* = IID_IShellCopyHookA
    IID_IShellExecuteHook* = IID_IShellExecuteHookA
    IID_INewShortcutHook* = IID_INewShortcutHookA
    IID_IUniformResourceLocator* = IID_IUniformResourceLocatorA
    GCS_VERB* = GCS_VERBA
    GCS_HELPTEXT* = GCS_HELPTEXTA
    GCS_VALIDATE* = GCS_VALIDATEA
    CMDSTR_NEWFOLDER* = CMDSTR_NEWFOLDERA
    CMDSTR_VIEWLIST* = CMDSTR_VIEWLISTA
    CMDSTR_VIEWDETAILS* = CMDSTR_VIEWDETAILSA
    BFFM_SETSTATUSTEXT* = BFFM_SETSTATUSTEXTA
    BFFM_SETSELECTION* = BFFM_SETSELECTIONA
    BFFM_VALIDATEFAILED* = BFFM_VALIDATEFAILEDA
    CFSTR_FILEDESCRIPTOR* = CFSTR_FILEDESCRIPTORA
    CFSTR_FILENAME* = CFSTR_FILENAMEA
    CFSTR_FILENAMEMAP* = CFSTR_FILENAMEMAPA
    CFSTR_INETURL* = CFSTR_INETURLA
    SHCNF_PATH* = SHCNF_PATHA
    SHCNF_PRINTER* = SHCNF_PRINTERA
    SHARD_PATH* = SHARD_PATHA
  proc StrFormatByteSize64*(qdw: LONGLONG, szBuf: LPSTR, uiBufSize: UINT): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrFormatByteSize64A".}
  proc DragQueryFile*(hDrop: HDROP, iFile: UINT, lpszFile: LPSTR, cch: UINT): UINT {.winapi, stdcall, dynlib: "shell32", importc: "DragQueryFileA".}
  proc ShellExecute*(hwnd: HWND, lpOperation: LPCSTR, lpFile: LPCSTR, lpParameters: LPCSTR, lpDirectory: LPCSTR, nShowCmd: INT): HINSTANCE {.winapi, stdcall, dynlib: "shell32", importc: "ShellExecuteA".}
  proc FindExecutable*(lpFile: LPCSTR, lpDirectory: LPCSTR, lpResult: LPSTR): HINSTANCE {.winapi, stdcall, dynlib: "shell32", importc: "FindExecutableA".}
  proc ShellAbout*(hWnd: HWND, szApp: LPCSTR, szOtherStuff: LPCSTR, hIcon: HICON): INT {.winapi, stdcall, dynlib: "shell32", importc: "ShellAboutA".}
  proc ExtractAssociatedIcon*(hInst: HINSTANCE, pszIconPath: LPSTR, piIcon: ptr WORD): HICON {.winapi, stdcall, dynlib: "shell32", importc: "ExtractAssociatedIconA".}
  proc ExtractAssociatedIconEx*(hInst: HINSTANCE, pszIconPath: LPSTR, piIconIndex: ptr WORD, piIconId: ptr WORD): HICON {.winapi, stdcall, dynlib: "shell32", importc: "ExtractAssociatedIconExA".}
  proc ExtractIcon*(hInst: HINSTANCE, pszExeFileName: LPCSTR, nIconIndex: UINT): HICON {.winapi, stdcall, dynlib: "shell32", importc: "ExtractIconA".}
  proc DoEnvironmentSubst*(pszSrc: LPSTR, cchSrc: UINT): DWORD {.winapi, stdcall, dynlib: "shell32", importc: "DoEnvironmentSubstA".}
  proc ExtractIconEx*(lpszFile: LPCSTR, nIconIndex: int32, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIcons: UINT): UINT {.winapi, stdcall, dynlib: "shell32", importc: "ExtractIconExA".}
  proc SHFileOperation*(lpFileOp: LPSHFILEOPSTRUCTA): int32 {.winapi, stdcall, dynlib: "shell32", importc: "SHFileOperationA".}
  proc ShellExecuteEx*(pExecInfo: ptr SHELLEXECUTEINFOA): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "ShellExecuteExA".}
  proc SHQueryRecycleBin*(pszRootPath: LPCSTR, pSHQueryRBInfo: LPSHQUERYRBINFO): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHQueryRecycleBinA".}
  proc SHEmptyRecycleBin*(hwnd: HWND, pszRootPath: LPCSTR, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHEmptyRecycleBinA".}
  proc Shell_NotifyIcon*(dwMessage: DWORD, lpData: PNOTIFYICONDATAA): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "Shell_NotifyIconA".}
  proc SHGetFileInfo*(pszPath: LPCSTR, dwFileAttributes: DWORD, psfi: ptr SHFILEINFOA, cbFileInfo: UINT, uFlags: UINT): DWORD_PTR {.winapi, stdcall, dynlib: "shell32", importc: "SHGetFileInfoA".}
  proc SHGetDiskFreeSpace*(pszDirectoryName: LPCSTR, pulFreeBytesAvailableToCaller: ptr ULARGE_INTEGER, pulTotalNumberOfBytes: ptr ULARGE_INTEGER, pulTotalNumberOfFreeBytes: ptr ULARGE_INTEGER): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHGetDiskFreeSpaceExA".}
  proc SHGetDiskFreeSpaceEx*(pszDirectoryName: LPCSTR, pulFreeBytesAvailableToCaller: ptr ULARGE_INTEGER, pulTotalNumberOfBytes: ptr ULARGE_INTEGER, pulTotalNumberOfFreeBytes: ptr ULARGE_INTEGER): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHGetDiskFreeSpaceExA".}
  proc SHGetNewLinkInfo*(pszLinkTo: LPCSTR, pszDir: LPCSTR, pszName: LPSTR, pfMustCopy: ptr WINBOOL, uFlags: UINT): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHGetNewLinkInfoA".}
  proc SHInvokePrinterCommand*(hwnd: HWND, uAction: UINT, lpBuf1: LPCSTR, lpBuf2: LPCSTR, fModal: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHInvokePrinterCommandA".}
  proc ShellMessageBox*(hAppInst: HINSTANCE, hWnd: HWND, lpcText: LPCSTR, lpcTitle: LPCSTR, fuStyle: UINT): int32 {.winapi, xpincompatible, stdcall, dynlib: "shlwapi", importc: "ShellMessageBoxA".}
  proc IsLFNDrive*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "IsLFNDriveA".}
  proc StrRetToStr*(pstr: ptr STRRET, pidl: LPCITEMIDLIST, ppsz: ptr LPSTR): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "StrRetToStrA".}
  proc StrRetToBuf*(pstr: ptr STRRET, pidl: LPCITEMIDLIST, pszBuf: LPSTR, cchBuf: UINT): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "StrRetToBufA".}
  proc SHStrDup*(psz: LPCSTR, ppwsz: ptr ptr WCHAR): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "SHStrDupA".}
  proc IsCharSpace*(wch: CHAR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "IsCharSpaceA".}
  proc StrCmpC*(pszStr1: LPCSTR, pszStr2: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpCA".}
  proc StrCmpIC*(pszStr1: LPCSTR, pszStr2: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpICA".}
  proc StrChr*(lpStart: LPCSTR, wMatch: WORD): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrChrA".}
  proc StrRChr*(lpStart: LPCSTR, lpEnd: LPCSTR, wMatch: WORD): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrRChrA".}
  proc StrChrI*(lpStart: LPCSTR, wMatch: WORD): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrChrIA".}
  proc StrRChrI*(lpStart: LPCSTR, lpEnd: LPCSTR, wMatch: WORD): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrRChrIA".}
  proc StrCmpN*(lpStr1: LPCSTR, lpStr2: LPCSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpNA".}
  proc StrCmpNI*(lpStr1: LPCSTR, lpStr2: LPCSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpNIA".}
  proc StrStr*(lpFirst: LPCSTR, lpSrch: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrStrA".}
  proc StrStrI*(lpFirst: LPCSTR, lpSrch: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrStrIA".}
  proc StrDup*(lpSrch: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrDupA".}
  proc StrRStrI*(lpSource: LPCSTR, lpLast: LPCSTR, lpSrch: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrRStrIA".}
  proc StrCSpn*(lpStr: LPCSTR, lpSet: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCSpnA".}
  proc StrCSpnI*(lpStr: LPCSTR, lpSet: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCSpnIA".}
  proc StrSpn*(psz: LPCSTR, pszSet: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrSpnA".}
  proc StrToInt*(lpSrc: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrToIntA".}
  proc StrPBrk*(psz: LPCSTR, pszSet: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrPBrkA".}
  proc StrToIntEx*(pszString: LPCSTR, dwFlags: DWORD, piRet: ptr int32): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "StrToIntExA".}
  proc StrToInt64Ex*(pszString: LPCSTR, dwFlags: DWORD, pllRet: ptr LONGLONG): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "StrToInt64ExA".}
  proc StrFromTimeInterval*(pszOut: LPSTR, cchMax: UINT, dwTimeMS: DWORD, digits: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrFromTimeIntervalA".}
  proc StrFormatByteSize*(dw: DWORD, szBuf: LPSTR, uiBufSize: UINT): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrFormatByteSizeA".}
  proc StrFormatKBSize*(qdw: LONGLONG, szBuf: LPSTR, uiBufSize: UINT): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrFormatKBSizeA".}
  proc StrNCat*(psz1: LPSTR, psz2: LPCSTR, cchMax: int32): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrNCatA".}
  proc StrTrim*(psz: LPSTR, pszTrimChars: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "StrTrimA".}
  proc StrCatBuff*(pszDest: LPSTR, pszSrc: LPCSTR, cchDestBuffSize: int32): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCatBuffA".}
  proc ChrCmpI*(w1: WORD, w2: WORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "ChrCmpIA".}
  proc wvnsprintf*(lpOut: LPSTR, cchLimitIn: int32, lpFmt: LPCSTR, arglist: va_list): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "wvnsprintfA".}
  proc wnsprintf*(lpOut: LPSTR, cchLimitIn: int32, lpFmt: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "wnsprintfA".}
  proc StrIsIntlEqual*(fCaseSens: WINBOOL, lpString1: LPCSTR, lpString2: LPCSTR, nChar: int32): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "StrIsIntlEqualA".}
  proc StrToLong*(lpSrc: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrToIntA".}
  proc StrNCmp*(lpStr1: LPCSTR, lpStr2: LPCSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpNA".}
  proc StrNCmpI*(lpStr1: LPCSTR, lpStr2: LPCSTR, nChar: int32): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "StrCmpNIA".}
  proc StrCatN*(psz1: LPSTR, psz2: LPCSTR, cchMax: int32): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "StrNCatA".}
  proc PathAddBackslash*(pszPath: LPSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathAddBackslashA".}
  proc PathAddExtension*(pszPath: LPSTR, pszExt: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathAddExtensionA".}
  proc PathBuildRoot*(pszRoot: LPSTR, iDrive: int32): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathBuildRootA".}
  proc PathCombine*(pszDest: LPSTR, pszDir: LPCSTR, pszFile: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCombineA".}
  proc PathFileExists*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFileExistsA".}
  proc PathFindExtension*(pszPath: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFindExtensionA".}
  proc PathFindFileName*(pszPath: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFindFileNameA".}
  proc PathFindNextComponent*(pszPath: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFindNextComponentA".}
  proc PathGetArgs*(pszPath: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathGetArgsA".}
  proc PathFindSuffixArray*(pszPath: LPCSTR, apszSuffix: ptr LPCSTR, iArraySize: int32): LPCSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFindSuffixArrayA".}
  proc PathIsLFNFileSpec*(lpName: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsLFNFileSpecA".}
  proc PathGetDriveNumber*(pszPath: LPCSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "PathGetDriveNumberA".}
  proc PathIsDirectory*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsDirectoryA".}
  proc PathIsDirectoryEmpty*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsDirectoryEmptyA".}
  proc PathIsFileSpec*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsFileSpecA".}
  proc PathIsPrefix*(pszPrefix: LPCSTR, pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsPrefixA".}
  proc PathIsRelative*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsRelativeA".}
  proc PathIsRoot*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsRootA".}
  proc PathIsSameRoot*(pszPath1: LPCSTR, pszPath2: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsSameRootA".}
  proc PathIsUNC*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsUNCA".}
  proc PathIsNetworkPath*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsNetworkPathA".}
  proc PathIsUNCServer*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsUNCServerA".}
  proc PathIsUNCServerShare*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsUNCServerShareA".}
  proc PathIsURL*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsURLA".}
  proc PathRemoveBackslash*(pszPath: LPSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRemoveBackslashA".}
  proc PathSkipRoot*(pszPath: LPCSTR): LPSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "PathSkipRootA".}
  proc PathStripPath*(pszPath: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathStripPathA".}
  proc PathStripToRoot*(pszPath: LPSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathStripToRootA".}
  proc PathMakeSystemFolder*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathMakeSystemFolderA".}
  proc PathUnmakeSystemFolder*(pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathUnmakeSystemFolderA".}
  proc PathIsSystemFolder*(pszPath: LPCSTR, dwAttrb: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsSystemFolderA".}
  proc PathUndecorate*(pszPath: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathUndecorateA".}
  proc PathUnExpandEnvStrings*(pszPath: LPCSTR, pszBuf: LPSTR, cchBuf: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathUnExpandEnvStringsA".}
  proc PathAppend*(pszPath: LPSTR, pMore: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathAppendA".}
  proc PathCanonicalize*(pszBuf: LPSTR, pszPath: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCanonicalizeA".}
  proc PathCompactPath*(hDC: HDC, pszPath: LPSTR, dx: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCompactPathA".}
  proc PathCompactPathEx*(pszOut: LPSTR, pszSrc: LPCSTR, cchMax: UINT, dwFlags: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCompactPathExA".}
  proc PathCommonPrefix*(pszFile1: LPCSTR, pszFile2: LPCSTR, achPath: LPSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCommonPrefixA".}
  proc PathFindOnPath*(pszPath: LPSTR, ppszOtherDirs: ptr LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathFindOnPathA".}
  proc PathGetCharType*(ch: UCHAR): UINT {.winapi, stdcall, dynlib: "shlwapi", importc: "PathGetCharTypeA".}
  proc PathIsContentType*(pszPath: LPCSTR, pszContentType: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathIsContentTypeA".}
  proc PathMakePretty*(pszPath: LPSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathMakePrettyA".}
  proc PathMatchSpec*(pszFile: LPCSTR, pszSpec: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathMatchSpecA".}
  proc PathParseIconLocation*(pszIconFile: LPSTR): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "PathParseIconLocationA".}
  proc PathQuoteSpaces*(lpsz: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathQuoteSpacesA".}
  proc PathRelativePathTo*(pszPath: LPSTR, pszFrom: LPCSTR, dwAttrFrom: DWORD, pszTo: LPCSTR, dwAttrTo: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRelativePathToA".}
  proc PathRemoveArgs*(pszPath: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRemoveArgsA".}
  proc PathRemoveBlanks*(pszPath: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRemoveBlanksA".}
  proc PathRemoveExtension*(pszPath: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRemoveExtensionA".}
  proc PathRemoveFileSpec*(pszPath: LPSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRemoveFileSpecA".}
  proc PathRenameExtension*(pszPath: LPSTR, pszExt: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathRenameExtensionA".}
  proc PathSearchAndQualify*(pszPath: LPCSTR, pszBuf: LPSTR, cchBuf: UINT): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "PathSearchAndQualifyA".}
  proc PathSetDlgItemPath*(hDlg: HWND, id: int32, pszPath: LPCSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathSetDlgItemPathA".}
  proc PathUnquoteSpaces*(lpsz: LPSTR): void {.winapi, stdcall, dynlib: "shlwapi", importc: "PathUnquoteSpacesA".}
  proc UrlCompare*(psz1: LPCSTR, psz2: LPCSTR, fIgnoreSlash: WINBOOL): int32 {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlCompareA".}
  proc UrlCombine*(pszBase: LPCSTR, pszRelative: LPCSTR, pszCombined: LPSTR, pcchCombined: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlCombineA".}
  proc UrlCanonicalize*(pszUrl: LPCSTR, pszCanonicalized: LPSTR, pcchCanonicalized: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlCanonicalizeA".}
  proc UrlIsOpaque*(pszURL: LPCSTR): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlIsOpaqueA".}
  proc UrlGetLocation*(psz1: LPCSTR): LPCSTR {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlGetLocationA".}
  proc UrlUnescape*(pszUrl: LPSTR, pszUnescaped: LPSTR, pcchUnescaped: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlUnescapeA".}
  proc UrlEscape*(pszUrl: LPCSTR, pszEscaped: LPSTR, pcchEscaped: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlEscapeA".}
  proc UrlCreateFromPath*(pszPath: LPCSTR, pszUrl: LPSTR, pcchUrl: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlCreateFromPathA".}
  proc PathCreateFromUrl*(pszUrl: LPCSTR, pszPath: LPSTR, pcchPath: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "PathCreateFromUrlA".}
  proc UrlHash*(pszUrl: LPCSTR, pbHash: LPBYTE, cbHash: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlHashA".}
  proc UrlGetPart*(pszIn: LPCSTR, pszOut: LPSTR, pcchOut: LPDWORD, dwPart: DWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlGetPartA".}
  proc UrlApplyScheme*(pszIn: LPCSTR, pszOut: LPSTR, pcchOut: LPDWORD, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlApplySchemeA".}
  proc UrlIs*(pszUrl: LPCSTR, UrlIs: TURLIS): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "UrlIsA".}
  proc SHDeleteEmptyKey*(hkey: HKEY, pszSubKey: LPCSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHDeleteEmptyKeyA".}
  proc SHDeleteKey*(hkey: HKEY, pszSubKey: LPCSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHDeleteKeyA".}
  proc SHDeleteValue*(hkey: HKEY, pszSubKey: LPCSTR, pszValue: LPCSTR): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHDeleteValueA".}
  proc SHGetValue*(hkey: HKEY, pszSubKey: LPCSTR, pszValue: LPCSTR, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHGetValueA".}
  proc SHSetValue*(hkey: HKEY, pszSubKey: LPCSTR, pszValue: LPCSTR, dwType: DWORD, pvData: LPCVOID, cbData: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHSetValueA".}
  proc SHRegGetValue*(hkey: HKEY, pszSubKey: LPCSTR, pszValue: LPCSTR, dwFlags: SRRF, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegGetValueA".}
  proc SHQueryValueEx*(hkey: HKEY, pszValue: LPCSTR, pdwReserved: ptr DWORD, pdwType: ptr DWORD, pvData: pointer, pcbData: ptr DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHQueryValueExA".}
  proc SHEnumKeyEx*(hkey: HKEY, dwIndex: DWORD, pszName: LPSTR, pcchName: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHEnumKeyExA".}
  proc SHEnumValue*(hkey: HKEY, dwIndex: DWORD, pszValueName: LPSTR, pcchValueName: LPDWORD, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHEnumValueA".}
  proc SHQueryInfoKey*(hkey: HKEY, pcSubKeys: LPDWORD, pcchMaxSubKeyLen: LPDWORD, pcValues: LPDWORD, pcchMaxValueNameLen: LPDWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHQueryInfoKeyA".}
  proc SHCopyKey*(hkeySrc: HKEY, szSrcSubKey: LPCSTR, hkeyDest: HKEY, fReserved: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHCopyKeyA".}
  proc SHRegGetPath*(hKey: HKEY, pcszSubKey: LPCSTR, pcszValue: LPCSTR, pszPath: LPSTR, dwFlags: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegGetPathA".}
  proc SHRegSetPath*(hKey: HKEY, pcszSubKey: LPCSTR, pcszValue: LPCSTR, pcszPath: LPCSTR, dwFlags: DWORD): DWORD {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegSetPathA".}
  proc SHRegCreateUSKey*(pszPath: LPCSTR, samDesired: REGSAM, hRelativeUSKey: HUSKEY, phNewUSKey: PHUSKEY, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegCreateUSKeyA".}
  proc SHRegOpenUSKey*(pszPath: LPCSTR, samDesired: REGSAM, hRelativeUSKey: HUSKEY, phNewUSKey: PHUSKEY, fIgnoreHKCU: WINBOOL): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegOpenUSKeyA".}
  proc SHRegQueryUSValue*(hUSKey: HUSKEY, pszValue: LPCSTR, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, fIgnoreHKCU: WINBOOL, pvDefaultData: pointer, dwDefaultDataSize: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegQueryUSValueA".}
  proc SHRegWriteUSValue*(hUSKey: HUSKEY, pszValue: LPCSTR, dwType: DWORD, pvData: pointer, cbData: DWORD, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegWriteUSValueA".}
  proc SHRegDeleteUSValue*(hUSKey: HUSKEY, pszValue: LPCSTR, delRegFlags: SHREGDEL_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegDeleteUSValueA".}
  proc SHRegDeleteEmptyUSKey*(hUSKey: HUSKEY, pszSubKey: LPCSTR, delRegFlags: SHREGDEL_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegDeleteEmptyUSKeyA".}
  proc SHRegEnumUSKey*(hUSKey: HUSKEY, dwIndex: DWORD, pszName: LPSTR, pcchName: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegEnumUSKeyA".}
  proc SHRegEnumUSValue*(hUSkey: HUSKEY, dwIndex: DWORD, pszValueName: LPSTR, pcchValueName: LPDWORD, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegEnumUSValueA".}
  proc SHRegQueryInfoUSKey*(hUSKey: HUSKEY, pcSubKeys: LPDWORD, pcchMaxSubKeyLen: LPDWORD, pcValues: LPDWORD, pcchMaxValueNameLen: LPDWORD, enumRegFlags: SHREGENUM_FLAGS): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegQueryInfoUSKeyA".}
  proc SHRegGetUSValue*(pszSubKey: LPCSTR, pszValue: LPCSTR, pdwType: LPDWORD, pvData: pointer, pcbData: LPDWORD, fIgnoreHKCU: WINBOOL, pvDefaultData: pointer, dwDefaultDataSize: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegGetUSValueA".}
  proc SHRegSetUSValue*(pszSubKey: LPCSTR, pszValue: LPCSTR, dwType: DWORD, pvData: pointer, cbData: DWORD, dwFlags: DWORD): LONG {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegSetUSValueA".}
  proc SHRegGetBoolUSValue*(pszSubKey: LPCSTR, pszValue: LPCSTR, fIgnoreHKCU: WINBOOL, fDefault: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shlwapi", importc: "SHRegGetBoolUSValueA".}
  proc AssocQueryString*(flags: ASSOCF, str: ASSOCSTR, pszAssoc: LPCSTR, pszExtra: LPCSTR, pszOut: LPSTR, pcchOut: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "AssocQueryStringA".}
  proc AssocQueryStringByKey*(flags: ASSOCF, str: ASSOCSTR, hkAssoc: HKEY, pszExtra: LPCSTR, pszOut: LPSTR, pcchOut: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "AssocQueryStringByKeyA".}
  proc AssocQueryKey*(flags: ASSOCF, key: ASSOCKEY, pszAssoc: LPCSTR, pszExtra: LPCSTR, phkeyOut: ptr HKEY): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "AssocQueryKeyA".}
  proc SHOpenRegStream2*(hkey: HKEY, pszSubkey: LPCSTR, pszValue: LPCSTR, grfMode: DWORD): ptr IStream {.winapi, stdcall, dynlib: "shlwapi", importc: "SHOpenRegStream2A".}
  proc SHCreateStreamOnFile*(pszFile: LPCSTR, grfMode: DWORD, ppstm: ptr ptr IStream): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "SHCreateStreamOnFileA".}
  proc SHOpenRegStream*(hkey: HKEY, pszSubkey: LPCSTR, pszValue: LPCSTR, grfMode: DWORD): ptr IStream {.winapi, stdcall, dynlib: "shlwapi", importc: "SHOpenRegStream2A".}
  proc GetAcceptLanguages*(psz: LPSTR, pcch: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "shlwapi", importc: "GetAcceptLanguagesA".}
  proc SHGetIconOverlayIndex*(pszIconPath: LPCSTR, iIconIndex: int32): int32 {.winapi, stdcall, dynlib: "shell32", importc: "SHGetIconOverlayIndexA".}
  proc ILCreateFromPath*(pszPath: PCSTR): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc: "ILCreateFromPathA".}
  proc SHGetPathFromIDList*(pidl: PCIDLIST_ABSOLUTE, pszPath: LPSTR): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHGetPathFromIDListA".}
  proc SHCreateDirectoryEx*(hwnd: HWND, pszPath: LPCSTR, psa: ptr SECURITY_ATTRIBUTES): int32 {.winapi, stdcall, dynlib: "shell32", importc: "SHCreateDirectoryExA".}
  proc SHGetSpecialFolderPath*(hwnd: HWND, pszPath: LPSTR, csidl: int32, fCreate: WINBOOL): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "SHGetSpecialFolderPathA".}
  proc SHGetFolderPath*(hwnd: HWND, csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszPath: LPSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHGetFolderPathA".}
  proc SHSetFolderPath*(csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszPath: LPCSTR): HRESULT {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc: "SHSetFolderPathA".}
  proc SHGetFolderPathAndSubDir*(hwnd: HWND, csidl: int32, hToken: HANDLE, dwFlags: DWORD, pszSubDir: LPCSTR, pszPath: LPSTR): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHGetFolderPathAndSubDirA".}
  proc SHBrowseForFolder*(lpbi: LPBROWSEINFOA): PIDLIST_ABSOLUTE {.winapi, stdcall, dynlib: "shell32", importc: "SHBrowseForFolderA".}
  proc SHUpdateImage*(pszHashItem: LPCSTR, iIndex: int32, uFlags: UINT, iImageIndex: int32): void {.winapi, stdcall, dynlib: "shell32", importc: "SHUpdateImageA".}
  proc SHGetDataFromIDList*(psf: ptr IShellFolder, pidl: PCUITEMID_CHILD, nFormat: int32, pv: pointer, cb: int32): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHGetDataFromIDListA".}
  proc PathIsSlow*(pszFile: LPCSTR, dwAttr: DWORD): WINBOOL {.winapi, stdcall, dynlib: "shell32", importc: "PathIsSlowA".}
  proc SHDefExtractIcon*(pszIconFile: LPCSTR, iIndex: int32, uFlags: UINT, phiconLarge: ptr HICON, phiconSmall: ptr HICON, nIconSize: UINT): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHDefExtractIconA".}
  proc Shell_GetCachedImageIndex*(pszIconPath: LPCSTR, iIconIndex: int32, uIconFlags: UINT): int32 {.winapi, xpincompatible, stdcall, dynlib: "shell32", importc: "Shell_GetCachedImageIndexA".}
  proc SHPathPrepareForWrite*(hwnd: HWND, punkEnableModless: ptr IUnknown, pszPath: LPCSTR, dwFlags: DWORD): HRESULT {.winapi, stdcall, dynlib: "shell32", importc: "SHPathPrepareForWriteA".}
