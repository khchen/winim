#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2022 Ward
#
#====================================================================
import winimbase
import windef
import wincrypt
#include <msi.h>
type
  MSIHANDLE* = int32
  INSTALLMESSAGE* = int32
  INSTALLUILEVEL* = int32
  INSTALLSTATE* = int32
  USERINFOSTATE* = int32
  INSTALLLEVEL* = int32
  REINSTALLMODE* = int32
  INSTALLLOGMODE* = int32
  INSTALLLOGATTRIBUTES* = int32
  INSTALLFEATUREATTRIBUTE* = int32
  INSTALLMODE* = int32
  MSIPATCHSTATE* = int32
  MSIINSTALLCONTEXT* = int32
  MSIPATCHDATATYPE* = int32
  PMSIPATCHDATATYPE* = ptr int32
  SCRIPTFLAGS* = int32
  ADVERTISEFLAGS* = int32
  INSTALLTYPE* = int32
  MSIARCHITECTUREFLAGS* = int32
  MSIOPENPACKAGEFLAGS* = int32
  MSIADVERTISEOPTIONFLAGS* = int32
  MSISOURCETYPE* = int32
  MSICODE* = int32
  MSITRANSACTION* = int32
  MSITRANSACTIONSTATE* = int32
  INSTALLUI_HANDLER_RECORD* = proc (pvContext: LPVOID, iMessageType: UINT, hRecord: MSIHANDLE): int32 {.stdcall.}
  PINSTALLUI_HANDLER_RECORD* = ptr INSTALLUI_HANDLER_RECORD
  MSIPATCHSEQUENCEINFOA* {.pure.} = object
    szPatchData*: LPCSTR
    ePatchDataType*: MSIPATCHDATATYPE
    dwOrder*: DWORD
    uStatus*: UINT
  PMSIPATCHSEQUENCEINFOA* = ptr MSIPATCHSEQUENCEINFOA
  MSIPATCHSEQUENCEINFOW* {.pure.} = object
    szPatchData*: LPCWSTR
    ePatchDataType*: MSIPATCHDATATYPE
    dwOrder*: DWORD
    uStatus*: UINT
  PMSIPATCHSEQUENCEINFOW* = ptr MSIPATCHSEQUENCEINFOW
  MSIFILEHASHINFO* {.pure.} = object
    dwFileHashInfoSize*: ULONG
    dwData*: array[4, ULONG]
  PMSIFILEHASHINFO* = ptr MSIFILEHASHINFO
const
  NTDDI_WIN2K* = 0x05000000
  NTDDI_WINXP* = 0x05010000
  NTDDI_WINXPSP2* = 0x05010200
  NTDDI_WS03SP1* = 0x05020100
  NTDDI_VISTA* = 0x06000000
  NTDDI_VISTASP1* = 0x06000100
  MAX_GUID_CHARS* = 38
  INSTALLMESSAGE_FATALEXIT* = 0x00000000
  INSTALLMESSAGE_ERROR* = 0x01000000
  INSTALLMESSAGE_WARNING* = 0x02000000
  INSTALLMESSAGE_USER* = 0x03000000
  INSTALLMESSAGE_INFO* = 0x04000000
  INSTALLMESSAGE_FILESINUSE* = 0x05000000
  INSTALLMESSAGE_RESOLVESOURCE* = 0x06000000
  INSTALLMESSAGE_OUTOFDISKSPACE* = 0x07000000
  INSTALLMESSAGE_ACTIONSTART* = 0x08000000
  INSTALLMESSAGE_ACTIONDATA* = 0x09000000
  INSTALLMESSAGE_PROGRESS* = 0x0A000000
  INSTALLMESSAGE_COMMONDATA* = 0x0B000000
  INSTALLMESSAGE_INITIALIZE* = 0x0C000000
  INSTALLMESSAGE_TERMINATE* = 0x0D000000
  INSTALLMESSAGE_SHOWDIALOG* = 0x0E000000
  INSTALLMESSAGE_RMFILESINUSE* = 0x19000000
  INSTALLMESSAGE_INSTALLSTART* = 0x1A000000
  INSTALLMESSAGE_INSTALLEND* = 0x1B000000
  INSTALLUILEVEL_NOCHANGE* = 0
  INSTALLUILEVEL_DEFAULT* = 1
  INSTALLUILEVEL_NONE* = 2
  INSTALLUILEVEL_BASIC* = 3
  INSTALLUILEVEL_REDUCED* = 4
  INSTALLUILEVEL_FULL* = 5
  INSTALLUILEVEL_ENDDIALOG* = 0x80
  INSTALLUILEVEL_PROGRESSONLY* = 0x40
  INSTALLUILEVEL_HIDECANCEL* = 0x20
  INSTALLUILEVEL_SOURCERESONLY* = 0x100
  INSTALLSTATE_NOTUSED* = -7
  INSTALLSTATE_BADCONFIG* = -6
  INSTALLSTATE_INCOMPLETE* = -5
  INSTALLSTATE_SOURCEABSENT* = -4
  INSTALLSTATE_MOREDATA* = -3
  INSTALLSTATE_INVALIDARG* = -2
  INSTALLSTATE_UNKNOWN* = -1
  INSTALLSTATE_BROKEN* = 0
  INSTALLSTATE_ADVERTISED* = 1
  INSTALLSTATE_REMOVED* = 1
  INSTALLSTATE_ABSENT* = 2
  INSTALLSTATE_LOCAL* = 3
  INSTALLSTATE_SOURCE* = 4
  INSTALLSTATE_DEFAULT* = 5
  USERINFOSTATE_MOREDATA* = -3
  USERINFOSTATE_INVALIDARG* = -2
  USERINFOSTATE_UNKNOWN* = -1
  USERINFOSTATE_ABSENT* = 0
  USERINFOSTATE_PRESENT* = 1
  INSTALLLEVEL_DEFAULT* = 0
  INSTALLLEVEL_MINIMUM* = 1
  INSTALLLEVEL_MAXIMUM* = 0xffff
  REINSTALLMODE_REPAIR* = 0x00000001
  REINSTALLMODE_FILEMISSING* = 0x00000002
  REINSTALLMODE_FILEOLDERVERSION* = 0x00000004
  REINSTALLMODE_FILEEQUALVERSION* = 0x00000008
  REINSTALLMODE_FILEEXACT* = 0x00000010
  REINSTALLMODE_FILEVERIFY* = 0x00000020
  REINSTALLMODE_FILEREPLACE* = 0x00000040
  REINSTALLMODE_MACHINEDATA* = 0x00000080
  REINSTALLMODE_USERDATA* = 0x00000100
  REINSTALLMODE_SHORTCUT* = 0x00000200
  REINSTALLMODE_PACKAGE* = 0x00000400
  INSTALLLOGMODE_FATALEXIT* = 1 shl (INSTALLMESSAGE_FATALEXIT shr 24)
  INSTALLLOGMODE_ERROR* = 1 shl (INSTALLMESSAGE_ERROR shr 24)
  INSTALLLOGMODE_WARNING* = 1 shl (INSTALLMESSAGE_WARNING shr 24)
  INSTALLLOGMODE_USER* = 1 shl (INSTALLMESSAGE_USER shr 24)
  INSTALLLOGMODE_INFO* = 1 shl (INSTALLMESSAGE_INFO shr 24)
  INSTALLLOGMODE_RESOLVESOURCE* = 1 shl (INSTALLMESSAGE_RESOLVESOURCE shr 24)
  INSTALLLOGMODE_OUTOFDISKSPACE* = 1 shl (INSTALLMESSAGE_OUTOFDISKSPACE shr 24)
  INSTALLLOGMODE_ACTIONSTART* = 1 shl (INSTALLMESSAGE_ACTIONSTART shr 24)
  INSTALLLOGMODE_ACTIONDATA* = 1 shl (INSTALLMESSAGE_ACTIONDATA shr 24)
  INSTALLLOGMODE_COMMONDATA* = 1 shl (INSTALLMESSAGE_COMMONDATA shr 24)
  INSTALLLOGMODE_PROPERTYDUMP* = 1 shl (INSTALLMESSAGE_PROGRESS shr 24)
  INSTALLLOGMODE_VERBOSE* = 1 shl (INSTALLMESSAGE_INITIALIZE shr 24)
  INSTALLLOGMODE_EXTRADEBUG* = 1 shl (INSTALLMESSAGE_TERMINATE shr 24)
  INSTALLLOGMODE_LOGONLYONERROR* = 1 shl (INSTALLMESSAGE_SHOWDIALOG shr 24)
  INSTALLLOGMODE_PROGRESS* = 1 shl (INSTALLMESSAGE_PROGRESS shr 24)
  INSTALLLOGMODE_INITIALIZE* = 1 shl (INSTALLMESSAGE_INITIALIZE shr 24)
  INSTALLLOGMODE_TERMINATE* = 1 shl (INSTALLMESSAGE_TERMINATE shr 24)
  INSTALLLOGMODE_SHOWDIALOG* = 1 shl (INSTALLMESSAGE_SHOWDIALOG shr 24)
  INSTALLLOGMODE_FILESINUSE* = 1 shl (INSTALLMESSAGE_FILESINUSE shr 24)
  INSTALLLOGMODE_RMFILESINUSE* = 1 shl (INSTALLMESSAGE_RMFILESINUSE shr 24)
  INSTALLLOGMODE_INSTALLSTART* = 1 shl (INSTALLMESSAGE_INSTALLSTART shr 24)
  INSTALLLOGMODE_INSTALLEND* = 1 shl (INSTALLMESSAGE_INSTALLEND shr 24)
  INSTALLLOGATTRIBUTES_APPEND* = 1 shl 0
  INSTALLLOGATTRIBUTES_FLUSHEACHLINE* = 1 shl 1
  INSTALLFEATUREATTRIBUTE_FAVORLOCAL* = 1 shl 0
  INSTALLFEATUREATTRIBUTE_FAVORSOURCE* = 1 shl 1
  INSTALLFEATUREATTRIBUTE_FOLLOWPARENT* = 1 shl 2
  INSTALLFEATUREATTRIBUTE_FAVORADVERTISE* = 1 shl 3
  INSTALLFEATUREATTRIBUTE_DISALLOWADVERTISE* = 1 shl 4
  INSTALLFEATUREATTRIBUTE_NOUNSUPPORTEDADVERTISE* = 1 shl 5
  INSTALLMODE_NODETECTION_ANY* = -4
  INSTALLMODE_NOSOURCERESOLUTION* = -3
  INSTALLMODE_NODETECTION* = -2
  INSTALLMODE_EXISTING* = -1
  INSTALLMODE_DEFAULT* = 0
  MSIPATCHSTATE_INVALID* = 0
  MSIPATCHSTATE_APPLIED* = 1
  MSIPATCHSTATE_SUPERSEDED* = 2
  MSIPATCHSTATE_OBSOLETED* = 4
  MSIPATCHSTATE_REGISTERED* = 8
  MSIPATCHSTATE_ALL* = MSIPATCHSTATE_APPLIED or MSIPATCHSTATE_SUPERSEDED or MSIPATCHSTATE_OBSOLETED or MSIPATCHSTATE_REGISTERED
  MSIINSTALLCONTEXT_FIRSTVISIBLE* = 0
  MSIINSTALLCONTEXT_NONE* = 0
  MSIINSTALLCONTEXT_USERMANAGED* = 1
  MSIINSTALLCONTEXT_USERUNMANAGED* = 2
  MSIINSTALLCONTEXT_MACHINE* = 4
  MSIINSTALLCONTEXT_ALL* = MSIINSTALLCONTEXT_USERMANAGED or MSIINSTALLCONTEXT_USERUNMANAGED or MSIINSTALLCONTEXT_MACHINE
  MSIINSTALLCONTEXT_ALLUSERMANAGED* = 8
  MSIPATCH_DATATYPE_PATCHFILE* = 0
  MSIPATCH_DATATYPE_XMLPATH* = 1
  MSIPATCH_DATATYPE_XMLBLOB* = 2
  MAX_FEATURE_CHARS* = 38
  INSTALLPROPERTY_PACKAGENAME* = "PackageName"
  INSTALLPROPERTY_TRANSFORMS* = "Transforms"
  INSTALLPROPERTY_LANGUAGE* = "Language"
  INSTALLPROPERTY_PRODUCTNAME* = "ProductName"
  INSTALLPROPERTY_ASSIGNMENTTYPE* = "AssignmentType"
  INSTALLPROPERTY_INSTANCETYPE* = "InstanceType"
  INSTALLPROPERTY_AUTHORIZED_LUA_APP* = "AuthorizedLUAApp"
  INSTALLPROPERTY_PACKAGECODE* = "PackageCode"
  INSTALLPROPERTY_VERSION* = "Version"
  INSTALLPROPERTY_PRODUCTICON* = "ProductIcon"
  INSTALLPROPERTY_INSTALLEDPRODUCTNAME* = "InstalledProductName"
  INSTALLPROPERTY_VERSIONSTRING* = "VersionString"
  INSTALLPROPERTY_HELPLINK* = "HelpLink"
  INSTALLPROPERTY_HELPTELEPHONE* = "HelpTelephone"
  INSTALLPROPERTY_INSTALLLOCATION* = "InstallLocation"
  INSTALLPROPERTY_INSTALLSOURCE* = "InstallSource"
  INSTALLPROPERTY_INSTALLDATE* = "InstallDate"
  INSTALLPROPERTY_PUBLISHER* = "Publisher"
  INSTALLPROPERTY_LOCALPACKAGE* = "LocalPackage"
  INSTALLPROPERTY_URLINFOABOUT* = "URLInfoAbout"
  INSTALLPROPERTY_URLUPDATEINFO* = "URLUpdateInfo"
  INSTALLPROPERTY_VERSIONMINOR* = "VersionMinor"
  INSTALLPROPERTY_VERSIONMAJOR* = "VersionMajor"
  INSTALLPROPERTY_PRODUCTID* = "ProductID"
  INSTALLPROPERTY_REGCOMPANY* = "RegCompany"
  INSTALLPROPERTY_REGOWNER* = "RegOwner"
  INSTALLPROPERTY_UNINSTALLABLE* = "Uninstallable"
  INSTALLPROPERTY_PRODUCTSTATE* = "State"
  INSTALLPROPERTY_PATCHSTATE* = "State"
  INSTALLPROPERTY_PATCHTYPE* = "PatchType"
  INSTALLPROPERTY_LUAENABLED* = "LUAEnabled"
  INSTALLPROPERTY_DISPLAYNAME* = "DisplayName"
  INSTALLPROPERTY_MOREINFOURL* = "MoreInfoUR"
  INSTALLPROPERTY_LASTUSEDSOURCE* = "LastUsedSource"
  INSTALLPROPERTY_LASTUSEDTYPE* = "LastUsedType"
  INSTALLPROPERTY_MEDIAPACKAGEPATH* = "MediaPackagePath"
  INSTALLPROPERTY_DISKPROMPT* = "DiskPrompt"
  SCRIPTFLAGS_CACHEINFO* = 0x00000001
  SCRIPTFLAGS_SHORTCUTS* = 0x00000004
  SCRIPTFLAGS_MACHINEASSIGN* = 0x00000008
  SCRIPTFLAGS_REGDATA_CNFGINFO* = 0x00000020
  SCRIPTFLAGS_VALIDATE_TRANSFORMS_LIST* = 0x00000040
  SCRIPTFLAGS_REGDATA_CLASSINFO* = 0x00000080
  SCRIPTFLAGS_REGDATA_EXTENSIONINFO* = 0x00000100
  SCRIPTFLAGS_REGDATA_APPINFO* = SCRIPTFLAGS_REGDATA_CLASSINFO or SCRIPTFLAGS_REGDATA_EXTENSIONINFO
  SCRIPTFLAGS_REGDATA* = SCRIPTFLAGS_REGDATA_APPINFO or SCRIPTFLAGS_REGDATA_CNFGINFO
  ADVERTISEFLAGS_MACHINEASSIGN* = 0
  ADVERTISEFLAGS_USERASSIGN* = 1
  INSTALLTYPE_DEFAULT* = 0
  INSTALLTYPE_NETWORK_IMAGE* = 1
  INSTALLTYPE_SINGLE_INSTANCE* = 2
  MSIARCHITECTUREFLAGS_X86* = 0x00000001
  MSIARCHITECTUREFLAGS_IA64* = 0x00000002
  MSIARCHITECTUREFLAGS_AMD64* = 0x00000004
  MSIOPENPACKAGEFLAGS_IGNOREMACHINESTATE* = 0x00000001
  MSIADVERTISEOPTIONFLAGS_INSTANCE* = 0x00000001
  MSISOURCETYPE_UNKNOWN* = 0x00000000
  MSISOURCETYPE_NETWORK* = 0x00000001
  MSISOURCETYPE_URL* = 0x00000002
  MSISOURCETYPE_MEDIA* = 0x00000004
  MSICODE_PRODUCT* = 0x00000000
  MSICODE_PATCH* = 0x40000000
  MSITRANSACTION_CHAIN_EMBEDDEDUI* = 0x00000001
  MSITRANSACTION_JOIN_EXISTING_EMBEDDEDUI* = 0x00000002
  MSITRANSACTIONSTATE_ROLLBACK* = 0x00000000
  MSITRANSACTIONSTATE_COMMIT* = 0x00000001
  MSIASSEMBLYINFO_NETASSEMBLY* = 0
  MSIASSEMBLYINFO_WIN32ASSEMBLY* = 1
  MSI_INVALID_HASH_IS_FATAL* = 0x1
  ERROR_PATCH_REMOVAL_UNSUPPORTED* = 1646
  ERROR_UNKNOWN_PATCH* = 1647
  ERROR_PATCH_NO_SEQUENCE* = 1648
  ERROR_PATCH_REMOVAL_DISALLOWED* = 1649
  ERROR_INVALID_PATCH_XML* = 1650
  ERROR_PATCH_MANAGED_ADVERTISED_PRODUCT* = 1651
  ERROR_INSTALL_SERVICE_SAFEBOOT* = 1652
  ERROR_ROLLBACK_DISABLED* = 1653
type
  INSTALLUI_HANDLERA* = proc (pvContext: LPVOID, iMessageType: UINT, szMessage: LPCSTR): int32 {.stdcall.}
  INSTALLUI_HANDLERW* = proc (pvContext: LPVOID, iMessageType: UINT, szMessage: LPCWSTR): int32 {.stdcall.}
proc MsiCloseHandle*(hAny: MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiCloseAllHandles*(): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSetInternalUI*(dwUILevel: INSTALLUILEVEL, phWnd: ptr HWND): INSTALLUILEVEL {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSetExternalUIA*(puiHandler: INSTALLUI_HANDLERA, dwMessageFilter: DWORD, pvContext: LPVOID): INSTALLUI_HANDLERA {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSetExternalUIW*(puiHandler: INSTALLUI_HANDLERW, dwMessageFilter: DWORD, pvContext: LPVOID): INSTALLUI_HANDLERW {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSetExternalUIRecord*(puiHandler: INSTALLUI_HANDLER_RECORD, dwMessageFilter: DWORD, pvContext: LPVOID, ppuiPrevHandler: PINSTALLUI_HANDLER_RECORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnableLogA*(dwLogMode: DWORD, szLogFile: LPCSTR, dwLogAttributes: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnableLogW*(dwLogMode: DWORD, szLogFile: LPCWSTR, dwLogAttributes: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiQueryProductStateA*(szProduct: LPCSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiQueryProductStateW*(szProduct: LPCWSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetProductInfoA*(szProduct: LPCSTR, szAttribute: LPCSTR, lpValueBuf: LPSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetProductInfoW*(szProduct: LPCWSTR, szAttribute: LPCWSTR, lpValueBuf: LPWSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetProductInfoExA*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, szProperty: LPCSTR, szValue: LPSTR, pcchValue: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetProductInfoExW*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, szProperty: LPCWSTR, szValue: LPWSTR, pcchValue: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiInstallProductA*(szPackagePath: LPCSTR, szCommandLine: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiInstallProductW*(szPackagePath: LPCWSTR, szCommandLine: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiConfigureProductA*(szProduct: LPCSTR, iInstallLevel: int32, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiConfigureProductW*(szProduct: LPCWSTR, iInstallLevel: int32, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiConfigureProductExA*(szProduct: LPCSTR, iInstallLevel: int32, eInstallState: INSTALLSTATE, szCommandLine: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiConfigureProductExW*(szProduct: LPCWSTR, iInstallLevel: int32, eInstallState: INSTALLSTATE, szCommandLine: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiReinstallProductA*(szProduct: LPCSTR, szReinstallMode: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiReinstallProductW*(szProduct: LPCWSTR, szReinstallMode: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiAdvertiseProductExA*(szPackagePath: LPCSTR, szScriptfilePath: LPCSTR, szTransforms: LPCSTR, lgidLanguage: LANGID, dwPlatform: DWORD, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiAdvertiseProductExW*(szPackagePath: LPCWSTR, szScriptfilePath: LPCWSTR, szTransforms: LPCWSTR, lgidLanguage: LANGID, dwPlatform: DWORD, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiAdvertiseProductA*(szPackagePath: LPCSTR, szScriptfilePath: LPCSTR, szTransforms: LPCSTR, lgidLanguage: LANGID): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiAdvertiseProductW*(szPackagePath: LPCWSTR, szScriptfilePath: LPCWSTR, szTransforms: LPCWSTR, lgidLanguage: LANGID): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiProcessAdvertiseScriptA*(szScriptFile: LPCSTR, szIconFolder: LPCSTR, hRegData: HKEY, fShortcuts: WINBOOL, fRemoveItems: WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiProcessAdvertiseScriptW*(szScriptFile: LPCWSTR, szIconFolder: LPCWSTR, hRegData: HKEY, fShortcuts: WINBOOL, fRemoveItems: WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiAdvertiseScriptA*(szScriptFile: LPCSTR, dwFlags: DWORD, phRegData: PHKEY, fRemoveItems: WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiAdvertiseScriptW*(szScriptFile: LPCWSTR, dwFlags: DWORD, phRegData: PHKEY, fRemoveItems: WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetProductInfoFromScriptA*(szScriptFile: LPCSTR, lpProductBuf39: LPSTR, plgidLanguage: ptr LANGID, pdwVersion: ptr DWORD, lpNameBuf: LPSTR, pcchNameBuf: ptr DWORD, lpPackageBuf: LPSTR, pcchPackageBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetProductInfoFromScriptW*(szScriptFile: LPCWSTR, lpProductBuf39: LPWSTR, plgidLanguage: ptr LANGID, pdwVersion: ptr DWORD, lpNameBuf: LPWSTR, pcchNameBuf: ptr DWORD, lpPackageBuf: LPWSTR, pcchPackageBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetProductCodeA*(szComponent: LPCSTR, lpBuf39: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetProductCodeW*(szComponent: LPCWSTR, lpBuf39: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetUserInfoA*(szProduct: LPCSTR, lpUserNameBuf: LPSTR, pcchUserNameBuf: ptr DWORD, lpOrgNameBuf: LPSTR, pcchOrgNameBuf: ptr DWORD, lpSerialBuf: LPSTR, pcchSerialBuf: ptr DWORD): USERINFOSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetUserInfoW*(szProduct: LPCWSTR, lpUserNameBuf: LPWSTR, pcchUserNameBuf: ptr DWORD, lpOrgNameBuf: LPWSTR, pcchOrgNameBuf: ptr DWORD, lpSerialBuf: LPWSTR, pcchSerialBuf: ptr DWORD): USERINFOSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiCollectUserInfoA*(szProduct: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiCollectUserInfoW*(szProduct: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiApplyPatchA*(szPatchPackage: LPCSTR, szInstallPackage: LPCSTR, eInstallType: INSTALLTYPE, szCommandLine: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiApplyPatchW*(szPatchPackage: LPCWSTR, szInstallPackage: LPCWSTR, eInstallType: INSTALLTYPE, szCommandLine: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetPatchInfoA*(szPatch: LPCSTR, szAttribute: LPCSTR, lpValueBuf: LPSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetPatchInfoW*(szPatch: LPCWSTR, szAttribute: LPCWSTR, lpValueBuf: LPWSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumPatchesA*(szProduct: LPCSTR, iPatchIndex: DWORD, lpPatchBuf: LPSTR, lpTransformsBuf: LPSTR, pcchTransformsBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumPatchesW*(szProduct: LPCWSTR, iPatchIndex: DWORD, lpPatchBuf: LPWSTR, lpTransformsBuf: LPWSTR, pcchTransformsBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiRemovePatchesA*(szPatchList: LPCSTR, szProductCode: LPCSTR, eUninstallType: INSTALLTYPE, szPropertyList: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiRemovePatchesW*(szPatchList: LPCWSTR, szProductCode: LPCWSTR, eUninstallType: INSTALLTYPE, szPropertyList: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiExtractPatchXMLDataA*(szPatchPath: LPCSTR, dwReserved: DWORD, szXMLData: LPSTR, pcchXMLData: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiExtractPatchXMLDataW*(szPatchPath: LPCWSTR, dwReserved: DWORD, szXMLData: LPWSTR, pcchXMLData: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetPatchInfoExA*(szPatchCode: LPCSTR, szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, szProperty: LPCSTR, lpValue: LPSTR, pcchValue: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetPatchInfoExW*(szPatchCode: LPCWSTR, szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, szProperty: LPCWSTR, lpValue: LPWSTR, pcchValue: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiApplyMultiplePatchesA*(szPatchPackages: LPCSTR, szProductCode: LPCSTR, szPropertiesList: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiApplyMultiplePatchesW*(szPatchPackages: LPCWSTR, szProductCode: LPCWSTR, szPropertiesList: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiDeterminePatchSequenceA*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, cPatchInfo: DWORD, pPatchInfo: PMSIPATCHSEQUENCEINFOA): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiDeterminePatchSequenceW*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, cPatchInfo: DWORD, pPatchInfo: PMSIPATCHSEQUENCEINFOW): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiDetermineApplicablePatchesA*(szProductPackagePath: LPCSTR, cPatchInfo: DWORD, pPatchInfo: PMSIPATCHSEQUENCEINFOA): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiDetermineApplicablePatchesW*(szProductPackagePath: LPCWSTR, cPatchInfo: DWORD, pPatchInfo: PMSIPATCHSEQUENCEINFOW): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumPatchesExA*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: DWORD, dwFilter: DWORD, dwIndex: DWORD, szPatchCode: ptr CHAR, szTargetProductCode: ptr CHAR, pdwTargetProductContext: ptr MSIINSTALLCONTEXT, szTargetUserSid: LPSTR, pcchTargetUserSid: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumPatchesExW*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: DWORD, dwFilter: DWORD, dwIndex: DWORD, szPatchCode: ptr WCHAR, szTargetProductCode: ptr WCHAR, pdwTargetProductContext: ptr MSIINSTALLCONTEXT, szTargetUserSid: LPWSTR, pcchTargetUserSid: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiQueryFeatureStateA*(szProduct: LPCSTR, szFeature: LPCSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiQueryFeatureStateW*(szProduct: LPCWSTR, szFeature: LPCWSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiQueryFeatureStateExA*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, szFeature: LPCSTR, pdwState: ptr INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiQueryFeatureStateExW*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, szFeature: LPCWSTR, pdwState: ptr INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiUseFeatureA*(szProduct: LPCSTR, szFeature: LPCSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiUseFeatureW*(szProduct: LPCWSTR, szFeature: LPCWSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiUseFeatureExA*(szProduct: LPCSTR, szFeature: LPCSTR, dwInstallMode: DWORD, dwReserved: DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiUseFeatureExW*(szProduct: LPCWSTR, szFeature: LPCWSTR, dwInstallMode: DWORD, dwReserved: DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetFeatureUsageA*(szProduct: LPCSTR, szFeature: LPCSTR, pdwUseCount: ptr DWORD, pwDateUsed: ptr WORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetFeatureUsageW*(szProduct: LPCWSTR, szFeature: LPCWSTR, pdwUseCount: ptr DWORD, pwDateUsed: ptr WORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiConfigureFeatureA*(szProduct: LPCSTR, szFeature: LPCSTR, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiConfigureFeatureW*(szProduct: LPCWSTR, szFeature: LPCWSTR, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiReinstallFeatureA*(szProduct: LPCSTR, szFeature: LPCSTR, dwReinstallMode: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiReinstallFeatureW*(szProduct: LPCWSTR, szFeature: LPCWSTR, dwReinstallMode: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiProvideComponentA*(szProduct: LPCSTR, szFeature: LPCSTR, szComponent: LPCSTR, dwInstallMode: DWORD, lpPathBuf: LPSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiProvideComponentW*(szProduct: LPCWSTR, szFeature: LPCWSTR, szComponent: LPCWSTR, dwInstallMode: DWORD, lpPathBuf: LPWSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiProvideQualifiedComponentA*(szCategory: LPCSTR, szQualifier: LPCSTR, dwInstallMode: DWORD, lpPathBuf: LPSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiProvideQualifiedComponentW*(szCategory: LPCWSTR, szQualifier: LPCWSTR, dwInstallMode: DWORD, lpPathBuf: LPWSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiProvideQualifiedComponentExA*(szCategory: LPCSTR, szQualifier: LPCSTR, dwInstallMode: DWORD, szProduct: LPCSTR, dwUnused1: DWORD, dwUnused2: DWORD, lpPathBuf: LPSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiProvideQualifiedComponentExW*(szCategory: LPCWSTR, szQualifier: LPCWSTR, dwInstallMode: DWORD, szProduct: LPCWSTR, dwUnused1: DWORD, dwUnused2: DWORD, lpPathBuf: LPWSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetComponentPathA*(szProduct: LPCSTR, szComponent: LPCSTR, lpPathBuf: LPSTR, pcchBuf: ptr DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetComponentPathW*(szProduct: LPCWSTR, szComponent: LPCWSTR, lpPathBuf: LPWSTR, pcchBuf: ptr DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiProvideAssemblyA*(szAssemblyName: LPCSTR, szAppContext: LPCSTR, dwInstallMode: DWORD, dwAssemblyInfo: DWORD, lpPathBuf: LPSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiProvideAssemblyW*(szAssemblyName: LPCWSTR, szAppContext: LPCWSTR, dwInstallMode: DWORD, dwAssemblyInfo: DWORD, lpPathBuf: LPWSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiQueryComponentStateA*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, szComponentCode: LPCSTR, pdwState: ptr INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiQueryComponentStateW*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, szComponentCode: LPCWSTR, pdwState: ptr INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumProductsA*(iProductIndex: DWORD, lpProductBuf: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumProductsW*(iProductIndex: DWORD, lpProductBuf: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumProductsExA*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: DWORD, dwIndex: DWORD, szInstalledProductCode: ptr CHAR, pdwInstalledContext: ptr MSIINSTALLCONTEXT, szSid: LPSTR, pcchSid: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumProductsExW*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: DWORD, dwIndex: DWORD, szInstalledProductCode: ptr WCHAR, pdwInstalledContext: ptr MSIINSTALLCONTEXT, szSid: LPWSTR, pcchSid: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumRelatedProductsA*(lpUpgradeCode: LPCSTR, dwReserved: DWORD, iProductIndex: DWORD, lpProductBuf: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumRelatedProductsW*(lpUpgradeCode: LPCWSTR, dwReserved: DWORD, iProductIndex: DWORD, lpProductBuf: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumFeaturesA*(szProduct: LPCSTR, iFeatureIndex: DWORD, lpFeatureBuf: LPSTR, lpParentBuf: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumFeaturesW*(szProduct: LPCWSTR, iFeatureIndex: DWORD, lpFeatureBuf: LPWSTR, lpParentBuf: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumComponentsA*(iComponentIndex: DWORD, lpComponentBuf: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumComponentsW*(iComponentIndex: DWORD, lpComponentBuf: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumClientsA*(szComponent: LPCSTR, iProductIndex: DWORD, lpProductBuf: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumClientsW*(szComponent: LPCWSTR, iProductIndex: DWORD, lpProductBuf: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumComponentQualifiersA*(szComponent: LPCSTR, iIndex: DWORD, lpQualifierBuf: LPSTR, pcchQualifierBuf: ptr DWORD, lpApplicationDataBuf: LPSTR, pcchApplicationDataBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEnumComponentQualifiersW*(szComponent: LPCWSTR, iIndex: DWORD, lpQualifierBuf: LPWSTR, pcchQualifierBuf: ptr DWORD, lpApplicationDataBuf: LPWSTR, pcchApplicationDataBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiOpenProductA*(szProduct: LPCSTR, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiOpenProductW*(szProduct: LPCWSTR, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiOpenPackageA*(szPackagePath: LPCSTR, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiOpenPackageW*(szPackagePath: LPCWSTR, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiOpenPackageExA*(szPackagePath: LPCSTR, dwOptions: DWORD, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiOpenPackageExW*(szPackagePath: LPCWSTR, dwOptions: DWORD, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetPatchFileListA*(szProductCode: LPCSTR, szPatchPackages: LPCSTR, pcFiles: LPDWORD, pphFileRecords: ptr ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetPatchFileListW*(szProductCode: LPCWSTR, szPatchPackages: LPCWSTR, pcFiles: LPDWORD, pphFileRecords: ptr ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetProductPropertyA*(hProduct: MSIHANDLE, szProperty: LPCSTR, lpValueBuf: LPSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetProductPropertyW*(hProduct: MSIHANDLE, szProperty: LPCWSTR, lpValueBuf: LPWSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiVerifyPackageA*(szPackagePath: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiVerifyPackageW*(szPackagePath: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetFeatureInfoA*(hProduct: MSIHANDLE, szFeature: LPCSTR, lpAttributes: ptr DWORD, lpTitleBuf: LPSTR, pcchTitleBuf: ptr DWORD, lpHelpBuf: LPSTR, pcchHelpBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetFeatureInfoW*(hProduct: MSIHANDLE, szFeature: LPCWSTR, lpAttributes: ptr DWORD, lpTitleBuf: LPWSTR, pcchTitleBuf: ptr DWORD, lpHelpBuf: LPWSTR, pcchHelpBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiInstallMissingComponentA*(szProduct: LPCSTR, szComponent: LPCSTR, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiInstallMissingComponentW*(szProduct: LPCWSTR, szComponent: LPCWSTR, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiInstallMissingFileA*(szProduct: LPCSTR, szFile: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiInstallMissingFileW*(szProduct: LPCWSTR, szFile: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiLocateComponentA*(szComponent: LPCSTR, lpPathBuf: LPSTR, pcchBuf: ptr DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiLocateComponentW*(szComponent: LPCWSTR, lpPathBuf: LPWSTR, pcchBuf: ptr DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListClearAllA*(szProduct: LPCSTR, szUserName: LPCSTR, dwReserved: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListClearAllW*(szProduct: LPCWSTR, szUserName: LPCWSTR, dwReserved: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListAddSourceA*(szProduct: LPCSTR, szUserName: LPCSTR, dwReserved: DWORD, szSource: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListAddSourceW*(szProduct: LPCWSTR, szUserName: LPCWSTR, dwReserved: DWORD, szSource: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListForceResolutionA*(szProduct: LPCSTR, szUserName: LPCSTR, dwReserved: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListForceResolutionW*(szProduct: LPCWSTR, szUserName: LPCWSTR, dwReserved: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListAddSourceExA*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szSource: LPCSTR, dwIndex: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListAddSourceExW*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szSource: LPCWSTR, dwIndex: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListAddMediaDiskA*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwDiskId: DWORD, szVolumeLabel: LPCSTR, szDiskPrompt: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListAddMediaDiskW*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwDiskId: DWORD, szVolumeLabel: LPCWSTR, szDiskPrompt: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListClearSourceA*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szSource: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListClearSourceW*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szSource: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListClearMediaDiskA*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwDiskId: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListClearMediaDiskW*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwDiskId: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListClearAllExA*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListClearAllExW*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListForceResolutionExA*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListForceResolutionExW*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListSetInfoA*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szProperty: LPCSTR, szValue: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListSetInfoW*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szProperty: LPCWSTR, szValue: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListGetInfoA*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szProperty: LPCSTR, szValue: LPSTR, pcchValue: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListGetInfoW*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szProperty: LPCWSTR, szValue: LPWSTR, pcchValue: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListEnumSourcesA*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwIndex: DWORD, szSource: LPSTR, pcchSource: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListEnumSourcesW*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwIndex: DWORD, szSource: LPWSTR, pcchSource: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListEnumMediaDisksA*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwIndex: DWORD, pdwDiskId: LPDWORD, szVolumeLabel: LPSTR, pcchVolumeLabel: LPDWORD, szDiskPrompt: LPSTR, pcchDiskPrompt: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiSourceListEnumMediaDisksW*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwIndex: DWORD, pdwDiskId: LPDWORD, szVolumeLabel: LPWSTR, pcchVolumeLabel: LPDWORD, szDiskPrompt: LPWSTR, pcchDiskPrompt: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetFileVersionA*(szFilePath: LPCSTR, lpVersionBuf: LPSTR, pcchVersionBuf: ptr DWORD, lpLangBuf: LPSTR, pcchLangBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetFileVersionW*(szFilePath: LPCWSTR, lpVersionBuf: LPWSTR, pcchVersionBuf: ptr DWORD, lpLangBuf: LPWSTR, pcchLangBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetFileHashA*(szFilePath: LPCSTR, dwOptions: DWORD, pHash: PMSIFILEHASHINFO): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetFileHashW*(szFilePath: LPCWSTR, dwOptions: DWORD, pHash: PMSIFILEHASHINFO): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetFileSignatureInformationA*(szSignedObjectPath: LPCSTR, dwFlags: DWORD, ppcCertContext: ptr PCCERT_CONTEXT, pbHashData: ptr BYTE, pcbHashData: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetFileSignatureInformationW*(szSignedObjectPath: LPCWSTR, dwFlags: DWORD, ppcCertContext: ptr PCCERT_CONTEXT, pbHashData: ptr BYTE, pcbHashData: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetShortcutTargetA*(szShortcutPath: LPCSTR, szProductCode: LPSTR, szFeatureId: LPSTR, szComponentCode: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiGetShortcutTargetW*(szShortcutPath: LPCWSTR, szProductCode: LPWSTR, szFeatureId: LPWSTR, szComponentCode: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiIsProductElevatedA*(szProduct: LPCSTR, pfElevated: ptr WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiIsProductElevatedW*(szProduct: LPCWSTR, pfElevated: ptr WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiNotifySidChangeA*(pOldSid: LPCSTR, pNewSid: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiNotifySidChangeW*(pOldSid: LPCWSTR, pNewSid: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiBeginTransactionA*(szName: LPCSTR, dwTransactionAttributes: DWORD, phTransactionHandle: ptr MSIHANDLE, phChangeOfOwnerEvent: ptr HANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiBeginTransactionW*(szName: LPCWSTR, dwTransactionAttributes: DWORD, phTransactionHandle: ptr MSIHANDLE, phChangeOfOwnerEvent: ptr HANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiEndTransaction*(dwTransactionState: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc.}
proc MsiJoinTransaction*(hTransactionHandle: MSIHANDLE, dwTransactionAttributes: DWORD, phChangeOfOwnerEvent: ptr HANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc.}
when winimUnicode:
  type
    INSTALLUI_HANDLER* = INSTALLUI_HANDLERW
    MSIPATCHSEQUENCEINFO* = MSIPATCHSEQUENCEINFOW
    PMSIPATCHSEQUENCEINFO* = PMSIPATCHSEQUENCEINFOW
  proc MsiSetExternalUI*(puiHandler: INSTALLUI_HANDLERW, dwMessageFilter: DWORD, pvContext: LPVOID): INSTALLUI_HANDLERW {.winapi, stdcall, dynlib: "msi", importc: "MsiSetExternalUIW".}
  proc MsiEnableLog*(dwLogMode: DWORD, szLogFile: LPCWSTR, dwLogAttributes: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnableLogW".}
  proc MsiQueryProductState*(szProduct: LPCWSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiQueryProductStateW".}
  proc MsiGetProductInfo*(szProduct: LPCWSTR, szAttribute: LPCWSTR, lpValueBuf: LPWSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetProductInfoW".}
  proc MsiGetProductInfoEx*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, szProperty: LPCWSTR, szValue: LPWSTR, pcchValue: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetProductInfoExW".}
  proc MsiInstallProduct*(szPackagePath: LPCWSTR, szCommandLine: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiInstallProductW".}
  proc MsiConfigureProduct*(szProduct: LPCWSTR, iInstallLevel: int32, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiConfigureProductW".}
  proc MsiConfigureProductEx*(szProduct: LPCWSTR, iInstallLevel: int32, eInstallState: INSTALLSTATE, szCommandLine: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiConfigureProductExW".}
  proc MsiReinstallProduct*(szProduct: LPCWSTR, szReinstallMode: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiReinstallProductW".}
  proc MsiAdvertiseProductEx*(szPackagePath: LPCWSTR, szScriptfilePath: LPCWSTR, szTransforms: LPCWSTR, lgidLanguage: LANGID, dwPlatform: DWORD, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiAdvertiseProductExW".}
  proc MsiAdvertiseProduct*(szPackagePath: LPCWSTR, szScriptfilePath: LPCWSTR, szTransforms: LPCWSTR, lgidLanguage: LANGID): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiAdvertiseProductW".}
  proc MsiProcessAdvertiseScript*(szScriptFile: LPCWSTR, szIconFolder: LPCWSTR, hRegData: HKEY, fShortcuts: WINBOOL, fRemoveItems: WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiProcessAdvertiseScriptW".}
  proc MsiAdvertiseScript*(szScriptFile: LPCWSTR, dwFlags: DWORD, phRegData: PHKEY, fRemoveItems: WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiAdvertiseScriptW".}
  proc MsiGetProductInfoFromScript*(szScriptFile: LPCWSTR, lpProductBuf39: LPWSTR, plgidLanguage: ptr LANGID, pdwVersion: ptr DWORD, lpNameBuf: LPWSTR, pcchNameBuf: ptr DWORD, lpPackageBuf: LPWSTR, pcchPackageBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetProductInfoFromScriptW".}
  proc MsiGetProductCode*(szComponent: LPCWSTR, lpBuf39: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetProductCodeW".}
  proc MsiGetUserInfo*(szProduct: LPCWSTR, lpUserNameBuf: LPWSTR, pcchUserNameBuf: ptr DWORD, lpOrgNameBuf: LPWSTR, pcchOrgNameBuf: ptr DWORD, lpSerialBuf: LPWSTR, pcchSerialBuf: ptr DWORD): USERINFOSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiGetUserInfoW".}
  proc MsiCollectUserInfo*(szProduct: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiCollectUserInfoW".}
  proc MsiApplyPatch*(szPatchPackage: LPCWSTR, szInstallPackage: LPCWSTR, eInstallType: INSTALLTYPE, szCommandLine: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiApplyPatchW".}
  proc MsiGetPatchInfo*(szPatch: LPCWSTR, szAttribute: LPCWSTR, lpValueBuf: LPWSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetPatchInfoW".}
  proc MsiEnumPatches*(szProduct: LPCWSTR, iPatchIndex: DWORD, lpPatchBuf: LPWSTR, lpTransformsBuf: LPWSTR, pcchTransformsBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumPatchesW".}
  proc MsiRemovePatches*(szPatchList: LPCWSTR, szProductCode: LPCWSTR, eUninstallType: INSTALLTYPE, szPropertyList: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiRemovePatchesW".}
  proc MsiExtractPatchXMLData*(szPatchPath: LPCWSTR, dwReserved: DWORD, szXMLData: LPWSTR, pcchXMLData: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiExtractPatchXMLDataW".}
  proc MsiGetPatchInfoEx*(szPatchCode: LPCWSTR, szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, szProperty: LPCWSTR, lpValue: LPWSTR, pcchValue: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetPatchInfoExW".}
  proc MsiApplyMultiplePatches*(szPatchPackages: LPCWSTR, szProductCode: LPCWSTR, szPropertiesList: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiApplyMultiplePatchesW".}
  proc MsiDeterminePatchSequence*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, cPatchInfo: DWORD, pPatchInfo: PMSIPATCHSEQUENCEINFOW): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiDeterminePatchSequenceW".}
  proc MsiDetermineApplicablePatches*(szProductPackagePath: LPCWSTR, cPatchInfo: DWORD, pPatchInfo: PMSIPATCHSEQUENCEINFOW): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiDetermineApplicablePatchesW".}
  proc MsiEnumPatchesEx*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: DWORD, dwFilter: DWORD, dwIndex: DWORD, szPatchCode: ptr WCHAR, szTargetProductCode: ptr WCHAR, pdwTargetProductContext: ptr MSIINSTALLCONTEXT, szTargetUserSid: LPWSTR, pcchTargetUserSid: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumPatchesExW".}
  proc MsiQueryFeatureState*(szProduct: LPCWSTR, szFeature: LPCWSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiQueryFeatureStateW".}
  proc MsiQueryFeatureStateEx*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, szFeature: LPCWSTR, pdwState: ptr INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiQueryFeatureStateExW".}
  proc MsiUseFeature*(szProduct: LPCWSTR, szFeature: LPCWSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiUseFeatureW".}
  proc MsiUseFeatureEx*(szProduct: LPCWSTR, szFeature: LPCWSTR, dwInstallMode: DWORD, dwReserved: DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiUseFeatureExW".}
  proc MsiGetFeatureUsage*(szProduct: LPCWSTR, szFeature: LPCWSTR, pdwUseCount: ptr DWORD, pwDateUsed: ptr WORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetFeatureUsageW".}
  proc MsiConfigureFeature*(szProduct: LPCWSTR, szFeature: LPCWSTR, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiConfigureFeatureW".}
  proc MsiReinstallFeature*(szProduct: LPCWSTR, szFeature: LPCWSTR, dwReinstallMode: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiReinstallFeatureW".}
  proc MsiProvideComponent*(szProduct: LPCWSTR, szFeature: LPCWSTR, szComponent: LPCWSTR, dwInstallMode: DWORD, lpPathBuf: LPWSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiProvideComponentW".}
  proc MsiProvideQualifiedComponent*(szCategory: LPCWSTR, szQualifier: LPCWSTR, dwInstallMode: DWORD, lpPathBuf: LPWSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiProvideQualifiedComponentW".}
  proc MsiProvideQualifiedComponentEx*(szCategory: LPCWSTR, szQualifier: LPCWSTR, dwInstallMode: DWORD, szProduct: LPCWSTR, dwUnused1: DWORD, dwUnused2: DWORD, lpPathBuf: LPWSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiProvideQualifiedComponentExW".}
  proc MsiGetComponentPath*(szProduct: LPCWSTR, szComponent: LPCWSTR, lpPathBuf: LPWSTR, pcchBuf: ptr DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiGetComponentPathW".}
  proc MsiProvideAssembly*(szAssemblyName: LPCWSTR, szAppContext: LPCWSTR, dwInstallMode: DWORD, dwAssemblyInfo: DWORD, lpPathBuf: LPWSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiProvideAssemblyW".}
  proc MsiQueryComponentState*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, szComponentCode: LPCWSTR, pdwState: ptr INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiQueryComponentStateW".}
  proc MsiEnumProducts*(iProductIndex: DWORD, lpProductBuf: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumProductsW".}
  proc MsiEnumProductsEx*(szProductCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: DWORD, dwIndex: DWORD, szInstalledProductCode: ptr WCHAR, pdwInstalledContext: ptr MSIINSTALLCONTEXT, szSid: LPWSTR, pcchSid: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumProductsExW".}
  proc MsiEnumRelatedProducts*(lpUpgradeCode: LPCWSTR, dwReserved: DWORD, iProductIndex: DWORD, lpProductBuf: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumRelatedProductsW".}
  proc MsiEnumFeatures*(szProduct: LPCWSTR, iFeatureIndex: DWORD, lpFeatureBuf: LPWSTR, lpParentBuf: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumFeaturesW".}
  proc MsiEnumComponents*(iComponentIndex: DWORD, lpComponentBuf: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumComponentsW".}
  proc MsiEnumClients*(szComponent: LPCWSTR, iProductIndex: DWORD, lpProductBuf: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumClientsW".}
  proc MsiEnumComponentQualifiers*(szComponent: LPCWSTR, iIndex: DWORD, lpQualifierBuf: LPWSTR, pcchQualifierBuf: ptr DWORD, lpApplicationDataBuf: LPWSTR, pcchApplicationDataBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumComponentQualifiersW".}
  proc MsiOpenProduct*(szProduct: LPCWSTR, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiOpenProductW".}
  proc MsiOpenPackage*(szPackagePath: LPCWSTR, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiOpenPackageW".}
  proc MsiOpenPackageEx*(szPackagePath: LPCWSTR, dwOptions: DWORD, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiOpenPackageExW".}
  proc MsiGetPatchFileList*(szProductCode: LPCWSTR, szPatchPackages: LPCWSTR, pcFiles: LPDWORD, pphFileRecords: ptr ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetPatchFileListW".}
  proc MsiGetProductProperty*(hProduct: MSIHANDLE, szProperty: LPCWSTR, lpValueBuf: LPWSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetProductPropertyW".}
  proc MsiVerifyPackage*(szPackagePath: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiVerifyPackageW".}
  proc MsiGetFeatureInfo*(hProduct: MSIHANDLE, szFeature: LPCWSTR, lpAttributes: ptr DWORD, lpTitleBuf: LPWSTR, pcchTitleBuf: ptr DWORD, lpHelpBuf: LPWSTR, pcchHelpBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetFeatureInfoW".}
  proc MsiInstallMissingComponent*(szProduct: LPCWSTR, szComponent: LPCWSTR, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiInstallMissingComponentW".}
  proc MsiInstallMissingFile*(szProduct: LPCWSTR, szFile: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiInstallMissingFileW".}
  proc MsiLocateComponent*(szComponent: LPCWSTR, lpPathBuf: LPWSTR, pcchBuf: ptr DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiLocateComponentW".}
  proc MsiSourceListClearAll*(szProduct: LPCWSTR, szUserName: LPCWSTR, dwReserved: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListClearAllW".}
  proc MsiSourceListAddSource*(szProduct: LPCWSTR, szUserName: LPCWSTR, dwReserved: DWORD, szSource: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListAddSourceW".}
  proc MsiSourceListForceResolution*(szProduct: LPCWSTR, szUserName: LPCWSTR, dwReserved: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListForceResolutionW".}
  proc MsiSourceListAddSourceEx*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szSource: LPCWSTR, dwIndex: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListAddSourceExW".}
  proc MsiSourceListAddMediaDisk*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwDiskId: DWORD, szVolumeLabel: LPCWSTR, szDiskPrompt: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListAddMediaDiskW".}
  proc MsiSourceListClearSource*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szSource: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListClearSourceW".}
  proc MsiSourceListClearMediaDisk*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwDiskId: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListClearMediaDiskW".}
  proc MsiSourceListClearAllEx*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListClearAllExW".}
  proc MsiSourceListForceResolutionEx*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListForceResolutionExW".}
  proc MsiSourceListSetInfo*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szProperty: LPCWSTR, szValue: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListSetInfoW".}
  proc MsiSourceListGetInfo*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szProperty: LPCWSTR, szValue: LPWSTR, pcchValue: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListGetInfoW".}
  proc MsiSourceListEnumSources*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwIndex: DWORD, szSource: LPWSTR, pcchSource: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListEnumSourcesW".}
  proc MsiSourceListEnumMediaDisks*(szProductCodeOrPatchCode: LPCWSTR, szUserSid: LPCWSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwIndex: DWORD, pdwDiskId: LPDWORD, szVolumeLabel: LPWSTR, pcchVolumeLabel: LPDWORD, szDiskPrompt: LPWSTR, pcchDiskPrompt: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListEnumMediaDisksW".}
  proc MsiGetFileVersion*(szFilePath: LPCWSTR, lpVersionBuf: LPWSTR, pcchVersionBuf: ptr DWORD, lpLangBuf: LPWSTR, pcchLangBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetFileVersionW".}
  proc MsiGetFileHash*(szFilePath: LPCWSTR, dwOptions: DWORD, pHash: PMSIFILEHASHINFO): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetFileHashW".}
  proc MsiGetFileSignatureInformation*(szSignedObjectPath: LPCWSTR, dwFlags: DWORD, ppcCertContext: ptr PCCERT_CONTEXT, pbHashData: ptr BYTE, pcbHashData: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetFileSignatureInformationW".}
  proc MsiGetShortcutTarget*(szShortcutPath: LPCWSTR, szProductCode: LPWSTR, szFeatureId: LPWSTR, szComponentCode: LPWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetShortcutTargetW".}
  proc MsiIsProductElevated*(szProduct: LPCWSTR, pfElevated: ptr WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiIsProductElevatedW".}
  proc MsiNotifySidChange*(pOldSid: LPCWSTR, pNewSid: LPCWSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiNotifySidChangeW".}
  proc MsiBeginTransaction*(szName: LPCWSTR, dwTransactionAttributes: DWORD, phTransactionHandle: ptr MSIHANDLE, phChangeOfOwnerEvent: ptr HANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiBeginTransactionW".}
when winimAnsi:
  type
    INSTALLUI_HANDLER* = INSTALLUI_HANDLERA
    MSIPATCHSEQUENCEINFO* = MSIPATCHSEQUENCEINFOA
    PMSIPATCHSEQUENCEINFO* = PMSIPATCHSEQUENCEINFOA
  proc MsiSetExternalUI*(puiHandler: INSTALLUI_HANDLERA, dwMessageFilter: DWORD, pvContext: LPVOID): INSTALLUI_HANDLERA {.winapi, stdcall, dynlib: "msi", importc: "MsiSetExternalUIA".}
  proc MsiEnableLog*(dwLogMode: DWORD, szLogFile: LPCSTR, dwLogAttributes: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnableLogA".}
  proc MsiQueryProductState*(szProduct: LPCSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiQueryProductStateA".}
  proc MsiGetProductInfo*(szProduct: LPCSTR, szAttribute: LPCSTR, lpValueBuf: LPSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetProductInfoA".}
  proc MsiGetProductInfoEx*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, szProperty: LPCSTR, szValue: LPSTR, pcchValue: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetProductInfoExA".}
  proc MsiInstallProduct*(szPackagePath: LPCSTR, szCommandLine: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiInstallProductA".}
  proc MsiConfigureProduct*(szProduct: LPCSTR, iInstallLevel: int32, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiConfigureProductA".}
  proc MsiConfigureProductEx*(szProduct: LPCSTR, iInstallLevel: int32, eInstallState: INSTALLSTATE, szCommandLine: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiConfigureProductExA".}
  proc MsiReinstallProduct*(szProduct: LPCSTR, szReinstallMode: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiReinstallProductA".}
  proc MsiAdvertiseProductEx*(szPackagePath: LPCSTR, szScriptfilePath: LPCSTR, szTransforms: LPCSTR, lgidLanguage: LANGID, dwPlatform: DWORD, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiAdvertiseProductExA".}
  proc MsiAdvertiseProduct*(szPackagePath: LPCSTR, szScriptfilePath: LPCSTR, szTransforms: LPCSTR, lgidLanguage: LANGID): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiAdvertiseProductA".}
  proc MsiProcessAdvertiseScript*(szScriptFile: LPCSTR, szIconFolder: LPCSTR, hRegData: HKEY, fShortcuts: WINBOOL, fRemoveItems: WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiProcessAdvertiseScriptA".}
  proc MsiAdvertiseScript*(szScriptFile: LPCSTR, dwFlags: DWORD, phRegData: PHKEY, fRemoveItems: WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiAdvertiseScriptA".}
  proc MsiGetProductInfoFromScript*(szScriptFile: LPCSTR, lpProductBuf39: LPSTR, plgidLanguage: ptr LANGID, pdwVersion: ptr DWORD, lpNameBuf: LPSTR, pcchNameBuf: ptr DWORD, lpPackageBuf: LPSTR, pcchPackageBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetProductInfoFromScriptA".}
  proc MsiGetProductCode*(szComponent: LPCSTR, lpBuf39: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetProductCodeA".}
  proc MsiGetUserInfo*(szProduct: LPCSTR, lpUserNameBuf: LPSTR, pcchUserNameBuf: ptr DWORD, lpOrgNameBuf: LPSTR, pcchOrgNameBuf: ptr DWORD, lpSerialBuf: LPSTR, pcchSerialBuf: ptr DWORD): USERINFOSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiGetUserInfoA".}
  proc MsiCollectUserInfo*(szProduct: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiCollectUserInfoA".}
  proc MsiApplyPatch*(szPatchPackage: LPCSTR, szInstallPackage: LPCSTR, eInstallType: INSTALLTYPE, szCommandLine: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiApplyPatchA".}
  proc MsiGetPatchInfo*(szPatch: LPCSTR, szAttribute: LPCSTR, lpValueBuf: LPSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetPatchInfoA".}
  proc MsiEnumPatches*(szProduct: LPCSTR, iPatchIndex: DWORD, lpPatchBuf: LPSTR, lpTransformsBuf: LPSTR, pcchTransformsBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumPatchesA".}
  proc MsiRemovePatches*(szPatchList: LPCSTR, szProductCode: LPCSTR, eUninstallType: INSTALLTYPE, szPropertyList: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiRemovePatchesA".}
  proc MsiExtractPatchXMLData*(szPatchPath: LPCSTR, dwReserved: DWORD, szXMLData: LPSTR, pcchXMLData: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiExtractPatchXMLDataA".}
  proc MsiGetPatchInfoEx*(szPatchCode: LPCSTR, szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, szProperty: LPCSTR, lpValue: LPSTR, pcchValue: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetPatchInfoExA".}
  proc MsiApplyMultiplePatches*(szPatchPackages: LPCSTR, szProductCode: LPCSTR, szPropertiesList: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiApplyMultiplePatchesA".}
  proc MsiDeterminePatchSequence*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, cPatchInfo: DWORD, pPatchInfo: PMSIPATCHSEQUENCEINFOA): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiDeterminePatchSequenceA".}
  proc MsiDetermineApplicablePatches*(szProductPackagePath: LPCSTR, cPatchInfo: DWORD, pPatchInfo: PMSIPATCHSEQUENCEINFOA): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiDetermineApplicablePatchesA".}
  proc MsiEnumPatchesEx*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: DWORD, dwFilter: DWORD, dwIndex: DWORD, szPatchCode: ptr CHAR, szTargetProductCode: ptr CHAR, pdwTargetProductContext: ptr MSIINSTALLCONTEXT, szTargetUserSid: LPSTR, pcchTargetUserSid: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumPatchesExA".}
  proc MsiQueryFeatureState*(szProduct: LPCSTR, szFeature: LPCSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiQueryFeatureStateA".}
  proc MsiQueryFeatureStateEx*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, szFeature: LPCSTR, pdwState: ptr INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiQueryFeatureStateExA".}
  proc MsiUseFeature*(szProduct: LPCSTR, szFeature: LPCSTR): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiUseFeatureA".}
  proc MsiUseFeatureEx*(szProduct: LPCSTR, szFeature: LPCSTR, dwInstallMode: DWORD, dwReserved: DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiUseFeatureExA".}
  proc MsiGetFeatureUsage*(szProduct: LPCSTR, szFeature: LPCSTR, pdwUseCount: ptr DWORD, pwDateUsed: ptr WORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetFeatureUsageA".}
  proc MsiConfigureFeature*(szProduct: LPCSTR, szFeature: LPCSTR, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiConfigureFeatureA".}
  proc MsiReinstallFeature*(szProduct: LPCSTR, szFeature: LPCSTR, dwReinstallMode: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiReinstallFeatureA".}
  proc MsiProvideComponent*(szProduct: LPCSTR, szFeature: LPCSTR, szComponent: LPCSTR, dwInstallMode: DWORD, lpPathBuf: LPSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiProvideComponentA".}
  proc MsiProvideQualifiedComponent*(szCategory: LPCSTR, szQualifier: LPCSTR, dwInstallMode: DWORD, lpPathBuf: LPSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiProvideQualifiedComponentA".}
  proc MsiProvideQualifiedComponentEx*(szCategory: LPCSTR, szQualifier: LPCSTR, dwInstallMode: DWORD, szProduct: LPCSTR, dwUnused1: DWORD, dwUnused2: DWORD, lpPathBuf: LPSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiProvideQualifiedComponentExA".}
  proc MsiGetComponentPath*(szProduct: LPCSTR, szComponent: LPCSTR, lpPathBuf: LPSTR, pcchBuf: ptr DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiGetComponentPathA".}
  proc MsiProvideAssembly*(szAssemblyName: LPCSTR, szAppContext: LPCSTR, dwInstallMode: DWORD, dwAssemblyInfo: DWORD, lpPathBuf: LPSTR, pcchPathBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiProvideAssemblyA".}
  proc MsiQueryComponentState*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, szComponentCode: LPCSTR, pdwState: ptr INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiQueryComponentStateA".}
  proc MsiEnumProducts*(iProductIndex: DWORD, lpProductBuf: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumProductsA".}
  proc MsiEnumProductsEx*(szProductCode: LPCSTR, szUserSid: LPCSTR, dwContext: DWORD, dwIndex: DWORD, szInstalledProductCode: ptr CHAR, pdwInstalledContext: ptr MSIINSTALLCONTEXT, szSid: LPSTR, pcchSid: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumProductsExA".}
  proc MsiEnumRelatedProducts*(lpUpgradeCode: LPCSTR, dwReserved: DWORD, iProductIndex: DWORD, lpProductBuf: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumRelatedProductsA".}
  proc MsiEnumFeatures*(szProduct: LPCSTR, iFeatureIndex: DWORD, lpFeatureBuf: LPSTR, lpParentBuf: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumFeaturesA".}
  proc MsiEnumComponents*(iComponentIndex: DWORD, lpComponentBuf: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumComponentsA".}
  proc MsiEnumClients*(szComponent: LPCSTR, iProductIndex: DWORD, lpProductBuf: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumClientsA".}
  proc MsiEnumComponentQualifiers*(szComponent: LPCSTR, iIndex: DWORD, lpQualifierBuf: LPSTR, pcchQualifierBuf: ptr DWORD, lpApplicationDataBuf: LPSTR, pcchApplicationDataBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiEnumComponentQualifiersA".}
  proc MsiOpenProduct*(szProduct: LPCSTR, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiOpenProductA".}
  proc MsiOpenPackage*(szPackagePath: LPCSTR, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiOpenPackageA".}
  proc MsiOpenPackageEx*(szPackagePath: LPCSTR, dwOptions: DWORD, hProduct: ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiOpenPackageExA".}
  proc MsiGetPatchFileList*(szProductCode: LPCSTR, szPatchPackages: LPCSTR, pcFiles: LPDWORD, pphFileRecords: ptr ptr MSIHANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetPatchFileListA".}
  proc MsiGetProductProperty*(hProduct: MSIHANDLE, szProperty: LPCSTR, lpValueBuf: LPSTR, pcchValueBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetProductPropertyA".}
  proc MsiVerifyPackage*(szPackagePath: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiVerifyPackageA".}
  proc MsiGetFeatureInfo*(hProduct: MSIHANDLE, szFeature: LPCSTR, lpAttributes: ptr DWORD, lpTitleBuf: LPSTR, pcchTitleBuf: ptr DWORD, lpHelpBuf: LPSTR, pcchHelpBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetFeatureInfoA".}
  proc MsiInstallMissingComponent*(szProduct: LPCSTR, szComponent: LPCSTR, eInstallState: INSTALLSTATE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiInstallMissingComponentA".}
  proc MsiInstallMissingFile*(szProduct: LPCSTR, szFile: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiInstallMissingFileA".}
  proc MsiLocateComponent*(szComponent: LPCSTR, lpPathBuf: LPSTR, pcchBuf: ptr DWORD): INSTALLSTATE {.winapi, stdcall, dynlib: "msi", importc: "MsiLocateComponentA".}
  proc MsiSourceListClearAll*(szProduct: LPCSTR, szUserName: LPCSTR, dwReserved: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListClearAllA".}
  proc MsiSourceListAddSource*(szProduct: LPCSTR, szUserName: LPCSTR, dwReserved: DWORD, szSource: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListAddSourceA".}
  proc MsiSourceListForceResolution*(szProduct: LPCSTR, szUserName: LPCSTR, dwReserved: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListForceResolutionA".}
  proc MsiSourceListAddSourceEx*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szSource: LPCSTR, dwIndex: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListAddSourceExA".}
  proc MsiSourceListAddMediaDisk*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwDiskId: DWORD, szVolumeLabel: LPCSTR, szDiskPrompt: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListAddMediaDiskA".}
  proc MsiSourceListClearSource*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szSource: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListClearSourceA".}
  proc MsiSourceListClearMediaDisk*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwDiskId: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListClearMediaDiskA".}
  proc MsiSourceListClearAllEx*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListClearAllExA".}
  proc MsiSourceListForceResolutionEx*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListForceResolutionExA".}
  proc MsiSourceListSetInfo*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szProperty: LPCSTR, szValue: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListSetInfoA".}
  proc MsiSourceListGetInfo*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, szProperty: LPCSTR, szValue: LPSTR, pcchValue: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListGetInfoA".}
  proc MsiSourceListEnumSources*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwIndex: DWORD, szSource: LPSTR, pcchSource: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListEnumSourcesA".}
  proc MsiSourceListEnumMediaDisks*(szProductCodeOrPatchCode: LPCSTR, szUserSid: LPCSTR, dwContext: MSIINSTALLCONTEXT, dwOptions: DWORD, dwIndex: DWORD, pdwDiskId: LPDWORD, szVolumeLabel: LPSTR, pcchVolumeLabel: LPDWORD, szDiskPrompt: LPSTR, pcchDiskPrompt: LPDWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiSourceListEnumMediaDisksA".}
  proc MsiGetFileVersion*(szFilePath: LPCSTR, lpVersionBuf: LPSTR, pcchVersionBuf: ptr DWORD, lpLangBuf: LPSTR, pcchLangBuf: ptr DWORD): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetFileVersionA".}
  proc MsiGetFileHash*(szFilePath: LPCSTR, dwOptions: DWORD, pHash: PMSIFILEHASHINFO): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetFileHashA".}
  proc MsiGetFileSignatureInformation*(szSignedObjectPath: LPCSTR, dwFlags: DWORD, ppcCertContext: ptr PCCERT_CONTEXT, pbHashData: ptr BYTE, pcbHashData: ptr DWORD): HRESULT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetFileSignatureInformationA".}
  proc MsiGetShortcutTarget*(szShortcutPath: LPCSTR, szProductCode: LPSTR, szFeatureId: LPSTR, szComponentCode: LPSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiGetShortcutTargetA".}
  proc MsiIsProductElevated*(szProduct: LPCSTR, pfElevated: ptr WINBOOL): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiIsProductElevatedA".}
  proc MsiNotifySidChange*(pOldSid: LPCSTR, pNewSid: LPCSTR): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiNotifySidChangeA".}
  proc MsiBeginTransaction*(szName: LPCSTR, dwTransactionAttributes: DWORD, phTransactionHandle: ptr MSIHANDLE, phChangeOfOwnerEvent: ptr HANDLE): UINT {.winapi, stdcall, dynlib: "msi", importc: "MsiBeginTransactionA".}
