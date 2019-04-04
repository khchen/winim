## ++ BUILD Version: 0001    // Increment this if a change has global effects
##
## Copyright (c) 2000 Microsoft Corporation
##
## Module Name:
##
##     wincred.h
##
## Abstract:
##
##     This module contains the public data structures and API definitions
##     needed for the Credential Manager.
##
##
## Author:
##
##
## Revision History:
##
## --

{. push winapi, importc, header:"<wincred.h>", dynlib:"advapi32.dll" .}

import winimbase
import windef
import security

## -----------------------------------------------------------------------------
##  Macros
## -----------------------------------------------------------------------------
##
##  Macro to determine whether CredUIPromptForCredentials should be called upon a failed
##       authentication attempt.
##
##  Implemented as a macro so that the caller can delay load credui.dll only if this
##       macro returns TRUE.
##
##  Include only status codes that imply the username/password are wrong or that the
##       password is expired.  In the former case, asking for a another username or password
##       is appropriate.  In the later case, we put up a different dialog asking the
##       user to change the password on the server.
##
##  Don't include status codes such as ERROR_ACCOUNT_DISABLED, ERROR_ACCOUNT_RESTRICTION,
##       ERROR_ACCOUNT_LOCKED_OUT, ERROR_ACCOUNT_EXPIRED, ERROR_LOGON_TYPE_NOT_GRANTED.
##       For those, the user isn't going to have another account so prompting him
##       won't help.
##
##  STATUS_DOWNGRADE_DETECTED is included to handle the case where a corporate laptop
##       is brought to another LAN.  A downgrade attack will indeed be detected,
##       but we want to popup UI to allow the user to connect to resources in the
##       other LAN.
##
##  STATUS_NO_SUCH_LOGON_SESSION and related error codes come from error mappings of
##       SEC_E_NO_CREDENTIALS and generally indicates that there are not credentials
##       available for SSO and some need to be provided.
##
##  STATUS_NO_SUCH_USER comes when a username is mistyped or a certificate credential is
##       used where a username/password credential is expected.
##
##  Don't use the CREDUIP_* macros directly.  Their definition is private to credui.dll.
##
##  Don't require ntstatus.h

const
  STATUS_LOGON_FAILURE* = NTSTATUS 0xC000006D ##  ntsubauth
  STATUS_WRONG_PASSWORD* = NTSTATUS 0xC000006A ##  ntsubauth
  STATUS_PASSWORD_EXPIRED* = NTSTATUS 0xC0000071 ##  ntsubauth
  STATUS_PASSWORD_MUST_CHANGE* = NTSTATUS 0xC0000224 ##  ntsubauth
  STATUS_ACCESS_DENIED* = NTSTATUS 0xC0000022
  STATUS_DOWNGRADE_DETECTED* = NTSTATUS 0xC0000388
  STATUS_AUTHENTICATION_FIREWALL_FAILED* = NTSTATUS 0xC0000413
  STATUS_ACCOUNT_DISABLED* = NTSTATUS 0xC0000072 ##  ntsubauth
  STATUS_ACCOUNT_RESTRICTION* = NTSTATUS 0xC000006E ##  ntsubauth
  STATUS_ACCOUNT_LOCKED_OUT* = NTSTATUS 0xC0000234 ##  ntsubauth
  STATUS_ACCOUNT_EXPIRED* = NTSTATUS 0xC0000193 ##  ntsubauth
  STATUS_LOGON_TYPE_NOT_GRANTED* = NTSTATUS 0xC000015B
  STATUS_NO_SUCH_LOGON_SESSION* = NTSTATUS 0xC000005F
  STATUS_NO_SUCH_USER* = NTSTATUS 0xC0000064 ##  ntsubauth

##  Don't require lmerr.h

const
  NERR_BASE* = 2100
  NERR_PasswordExpired* = (NERR_BASE + 142) ##  The password of this user has expired.

template CREDUIP_IS_USER_PASSWORD_ERROR*(Status: untyped): untyped =
  ((Status) == ERROR_LOGON_FAILURE or
      (Status) == HRESULT_FROM_WIN32(ERROR_LOGON_FAILURE) or
      (Status) == STATUS_LOGON_FAILURE or
      (Status) == HRESULT_FROM_NT(STATUS_LOGON_FAILURE) or
      (Status) == ERROR_ACCESS_DENIED or
      (Status) == HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED) or
      (Status) == STATUS_ACCESS_DENIED or
      (Status) == HRESULT_FROM_NT(STATUS_ACCESS_DENIED) or
      (Status) == ERROR_INVALID_PASSWORD or
      (Status) == HRESULT_FROM_WIN32(ERROR_INVALID_PASSWORD) or
      (Status) == STATUS_WRONG_PASSWORD or
      (Status) == HRESULT_FROM_NT(STATUS_WRONG_PASSWORD) or
      (Status) == STATUS_NO_SUCH_USER or
      (Status) == HRESULT_FROM_NT(STATUS_NO_SUCH_USER) or
      (Status) == ERROR_NO_SUCH_USER or
      (Status) == HRESULT_FROM_WIN32(ERROR_NO_SUCH_USER) or
      (Status) == ERROR_NO_SUCH_LOGON_SESSION or
      (Status) == HRESULT_FROM_WIN32(ERROR_NO_SUCH_LOGON_SESSION) or
      (Status) == STATUS_NO_SUCH_LOGON_SESSION or
      (Status) == HRESULT_FROM_NT(STATUS_NO_SUCH_LOGON_SESSION) or
      (Status) == SEC_E_NO_CREDENTIALS or (Status) == SEC_E_LOGON_DENIED or
      (Status) == SEC_E_NO_CONTEXT or (Status) == STATUS_NO_SECURITY_CONTEXT)

template CREDUIP_IS_DOWNGRADE_ERROR*(Status: untyped): untyped =
  ((Status) == ERROR_DOWNGRADE_DETECTED or
      (Status) == HRESULT_FROM_WIN32(ERROR_DOWNGRADE_DETECTED) or
      (Status) == STATUS_DOWNGRADE_DETECTED or
      (Status) == HRESULT_FROM_NT(STATUS_DOWNGRADE_DETECTED))

template CREDUIP_IS_EXPIRED_ERROR*(Status: untyped): untyped =
  ((Status) == ERROR_PASSWORD_EXPIRED or
      (Status) == HRESULT_FROM_WIN32(ERROR_PASSWORD_EXPIRED) or
      (Status) == STATUS_PASSWORD_EXPIRED or
      (Status) == HRESULT_FROM_NT(STATUS_PASSWORD_EXPIRED) or
      (Status) == ERROR_PASSWORD_MUST_CHANGE or
      (Status) == HRESULT_FROM_WIN32(ERROR_PASSWORD_MUST_CHANGE) or
      (Status) == STATUS_PASSWORD_MUST_CHANGE or
      (Status) == HRESULT_FROM_NT(STATUS_PASSWORD_MUST_CHANGE) or
      (Status) == NERR_PasswordExpired or
      (Status) == HRESULT_FROM_WIN32(NERR_PasswordExpired))

template CREDUI_IS_AUTHENTICATION_ERROR*(Status: untyped): untyped =
  (CREDUIP_IS_USER_PASSWORD_ERROR(Status) or
      CREDUIP_IS_DOWNGRADE_ERROR(Status) or CREDUIP_IS_EXPIRED_ERROR(Status))

template CREDUI_NO_PROMPT_AUTHENTICATION_ERROR*(Status: untyped): untyped =
  ((Status) == ERROR_AUTHENTICATION_FIREWALL_FAILED or
      (Status) == HRESULT_FROM_WIN32(ERROR_AUTHENTICATION_FIREWALL_FAILED) or
      (Status) == STATUS_AUTHENTICATION_FIREWALL_FAILED or
      (Status) == HRESULT_FROM_NT(STATUS_AUTHENTICATION_FIREWALL_FAILED) or
      (Status) == ERROR_ACCOUNT_DISABLED or
      (Status) == HRESULT_FROM_WIN32(ERROR_ACCOUNT_DISABLED) or
      (Status) == STATUS_ACCOUNT_DISABLED or
      (Status) == HRESULT_FROM_NT(STATUS_ACCOUNT_DISABLED) or
      (Status) == ERROR_ACCOUNT_RESTRICTION or
      (Status) == HRESULT_FROM_WIN32(ERROR_ACCOUNT_RESTRICTION) or
      (Status) == STATUS_ACCOUNT_RESTRICTION or
      (Status) == HRESULT_FROM_NT(STATUS_ACCOUNT_RESTRICTION) or
      (Status) == ERROR_ACCOUNT_LOCKED_OUT or
      (Status) == HRESULT_FROM_WIN32(ERROR_ACCOUNT_LOCKED_OUT) or
      (Status) == STATUS_ACCOUNT_LOCKED_OUT or
      (Status) == HRESULT_FROM_NT(STATUS_ACCOUNT_LOCKED_OUT) or
      (Status) == ERROR_ACCOUNT_EXPIRED or
      (Status) == HRESULT_FROM_WIN32(ERROR_ACCOUNT_EXPIRED) or
      (Status) == STATUS_ACCOUNT_EXPIRED or
      (Status) == HRESULT_FROM_NT(STATUS_ACCOUNT_EXPIRED) or
      (Status) == ERROR_LOGON_TYPE_NOT_GRANTED or
      (Status) == HRESULT_FROM_WIN32(ERROR_LOGON_TYPE_NOT_GRANTED) or
      (Status) == STATUS_LOGON_TYPE_NOT_GRANTED or
      (Status) == HRESULT_FROM_NT(STATUS_LOGON_TYPE_NOT_GRANTED))

## -----------------------------------------------------------------------------
##  Structures
## -----------------------------------------------------------------------------
##
##  Credential Attribute
##
##  Maximum length of the various credential string fields (in characters)

const
  CRED_MAX_STRING_LENGTH* = 256

##  Maximum length of the UserName field.  The worst case is <User>@<DnsDomain>

const
  CRED_MAX_USERNAME_LENGTH* = (256 + 1 + 256)

##  Maximum length of the TargetName field for CRED_TYPE_GENERIC (in characters)

const
  CRED_MAX_GENERIC_TARGET_NAME_LENGTH* = 32767

##  Maximum length of the TargetName field for CRED_TYPE_DOMAIN_* (in characters)
##       Largest one is <DfsRoot>\<DfsShare>

const
  CRED_MAX_DOMAIN_TARGET_NAME_LENGTH* = (256 + 1 + 80)

##  Maximum length of a target namespace

const
  CRED_MAX_TARGETNAME_NAMESPACE_LENGTH* = (256)

##  Maximum length of a target attribute

const
  CRED_MAX_TARGETNAME_ATTRIBUTE_LENGTH* = (256)

##  Maximum size of the Credential Attribute Value field (in bytes)

const
  CRED_MAX_VALUE_SIZE* = (256)

##  Maximum number of attributes per credential

const
  CRED_MAX_ATTRIBUTES* = 64

type
  CREDENTIAL_ATTRIBUTEW* {.bycopy.} = object
    Keyword*: LPWSTR
    Flags*: DWORD
    ValueSize*: DWORD
    Value*: LPBYTE

  PCREDENTIAL_ATTRIBUTEW* = ptr CREDENTIAL_ATTRIBUTEW
  CREDENTIAL_ATTRIBUTE* = CREDENTIAL_ATTRIBUTEW
  PCREDENTIAL_ATTRIBUTE* = PCREDENTIAL_ATTRIBUTEW

##
##  Special values of the TargetName field
##

const
  CRED_SESSION_WILDCARD_NAME_W* = "*Session"
  CRED_UNIVERSAL_WILDCARD_W* = '*'
  CRED_SESSION_WILDCARD_NAME_LENGTH* = (CRED_SESSION_WILDCARD_NAME_W.len)
  CRED_TARGETNAME_DOMAIN_NAMESPACE_W* = "Domain"
  CRED_TARGETNAME_DOMAIN_NAMESPACE_LENGTH* = (CRED_TARGETNAME_DOMAIN_NAMESPACE_W.len)
  CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_W* = "LegacyGeneric"
  CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_LENGTH* = (CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_W.len)
  CRED_TARGETNAME_NAMESPACE_SEPERATOR_W* = ':'
  CRED_TARGETNAME_ATTRIBUTE_SEPERATOR_W* = '='
  CRED_TARGETNAME_DOMAIN_EXTENDED_USERNAME_SEPARATOR_W* = '|'
  CRED_TARGETNAME_ATTRIBUTE_TARGET_W* = "target"
  CRED_TARGETNAME_ATTRIBUTE_TARGET_LENGTH* = (CRED_TARGETNAME_ATTRIBUTE_TARGET_W.len)
  CRED_TARGETNAME_ATTRIBUTE_NAME_W* = "name"
  CRED_TARGETNAME_ATTRIBUTE_NAME_LENGTH* = (CRED_TARGETNAME_ATTRIBUTE_NAME_W.len)
  CRED_TARGETNAME_ATTRIBUTE_BATCH_W* = "batch"
  CRED_TARGETNAME_ATTRIBUTE_BATCH_LENGTH* = (CRED_TARGETNAME_ATTRIBUTE_BATCH_W.len)
  CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_W* = "interactive"
  CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_LENGTH* = (CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_W.len)
  CRED_TARGETNAME_ATTRIBUTE_SERVICE_W* = "service"
  CRED_TARGETNAME_ATTRIBUTE_SERVICE_LENGTH* = (CRED_TARGETNAME_ATTRIBUTE_SERVICE_W.len)
  CRED_TARGETNAME_ATTRIBUTE_NETWORK_W* = "network"
  CRED_TARGETNAME_ATTRIBUTE_NETWORK_LENGTH* = (CRED_TARGETNAME_ATTRIBUTE_NETWORK_W.len)
  CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_W* = "networkcleartext"
  CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_LENGTH* = (CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_W.len)
  CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_W* = "remoteinteractive"
  CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_LENGTH* = (CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_W.len)
  CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_W* = "cachedinteractive"
  CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_LENGTH* = (CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_W.len)

##
##  Add\Extract Logon type from flags
##

const
  CRED_LOGON_TYPES_MASK* = 0x0000F000

template CredAppendLogonTypeToFlags*(Flags, LogonType: untyped): untyped =
  (Flags) = (Flags) or ((LogonType) shl 12)

template CredGetLogonTypeFromFlags*(Flags: untyped): untyped =
  ((SECURITY_LOGON_TYPE)(((Flags) and CRED_LOGON_TYPES_MASK) shr 12))

template CredRemoveLogonTypeFromFlags*(Flags: untyped): untyped =
  (Flags) = (Flags) and not CRED_LOGON_TYPES_MASK

##
##  Values of the Credential Flags field.
##

const
  CRED_FLAGS_PASSWORD_FOR_CERT* = 0x00000001
  CRED_FLAGS_PROMPT_NOW* = 0x00000002
  CRED_FLAGS_USERNAME_TARGET* = 0x00000004
  CRED_FLAGS_OWF_CRED_BLOB* = 0x00000008
  CRED_FLAGS_REQUIRE_CONFIRMATION* = 0x00000010

##
##   Valid only for return and only with CredReadDomainCredentials().
##   Indicates credential was returned due to wildcard match
##   of targetname with credential.
##

const
  CRED_FLAGS_WILDCARD_MATCH* = 0x00000020

##
##  Valid only for return
##  Indicates that the credential is VSM protected
##

const
  CRED_FLAGS_VSM_PROTECTED* = 0x00000040
  CRED_FLAGS_NGC_CERT* = 0x00000080

##
##  Mask of all valid flags
##

const
  CRED_FLAGS_VALID_FLAGS* = 0x0000F0FF

##
##   Bit mask for only those flags which can be passed to the credman
##   APIs.
##

const
  CRED_FLAGS_VALID_INPUT_FLAGS* = 0x0000F09F

##
##  Values of the Credential Type field.
##

const
  CRED_TYPE_GENERIC* = 1
  CRED_TYPE_DOMAIN_PASSWORD* = 2
  CRED_TYPE_DOMAIN_CERTIFICATE* = 3
  CRED_TYPE_DOMAIN_VISIBLE_PASSWORD* = 4
  CRED_TYPE_GENERIC_CERTIFICATE* = 5
  CRED_TYPE_DOMAIN_EXTENDED* = 6
  CRED_TYPE_MAXIMUM* = 7
  CRED_TYPE_MAXIMUM_EX* = (CRED_TYPE_MAXIMUM + 1000) ##  Allow new applications to run on old OSes

##
##  Maximum size of the CredBlob field (in bytes)
##

const
  CRED_MAX_CREDENTIAL_BLOB_SIZE* = (5 * 512)

##
##  Values of the Credential Persist field
##

const
  CRED_PERSIST_NONE* = 0
  CRED_PERSIST_SESSION* = 1
  CRED_PERSIST_LOCAL_MACHINE* = 2
  CRED_PERSIST_ENTERPRISE* = 3

##
##  A credential
##

type
  CREDENTIALW* {.bycopy.} = object
    Flags*: DWORD
    Type*: DWORD
    TargetName*: LPWSTR
    Comment*: LPWSTR
    LastWritten*: FILETIME
    CredentialBlobSize*: DWORD
    CredentialBlob*: LPBYTE
    Persist*: DWORD
    AttributeCount*: DWORD
    Attributes*: PCREDENTIAL_ATTRIBUTEW
    TargetAlias*: LPWSTR
    UserName*: LPWSTR

  PCREDENTIALW* = ptr CREDENTIALW
  CREDENTIAL* = CREDENTIALW
  PCREDENTIAL* = PCREDENTIALW

##
##  Value of the Flags field in CREDENTIAL_TARGET_INFORMATION
##

const
  CRED_TI_SERVER_FORMAT_UNKNOWN* = 0x00000001
  CRED_TI_DOMAIN_FORMAT_UNKNOWN* = 0x00000002
  CRED_TI_ONLY_PASSWORD_REQUIRED* = 0x00000004
  CRED_TI_USERNAME_TARGET* = 0x00000008
  CRED_TI_CREATE_EXPLICIT_CRED* = 0x00000010
  CRED_TI_WORKGROUP_MEMBER* = 0x00000020
  CRED_TI_DNSTREE_IS_DFS_SERVER* = 0x00000040
  CRED_TI_VALID_FLAGS* = 0x0000F07F

##
##  A credential target
##

type
  CREDENTIAL_TARGET_INFORMATIONA* {.bycopy.} = object
    TargetName*: LPSTR
    NetbiosServerName*: LPSTR
    DnsServerName*: LPSTR
    NetbiosDomainName*: LPSTR
    DnsDomainName*: LPSTR
    DnsTreeName*: LPSTR
    PackageName*: LPSTR
    Flags*: ULONG
    CredTypeCount*: DWORD
    CredTypes*: LPDWORD

  PCREDENTIAL_TARGET_INFORMATIONA* = ptr CREDENTIAL_TARGET_INFORMATIONA
  CREDENTIAL_TARGET_INFORMATIONW* {.bycopy.} = object
    TargetName*: LPWSTR
    NetbiosServerName*: LPWSTR
    DnsServerName*: LPWSTR
    NetbiosDomainName*: LPWSTR
    DnsDomainName*: LPWSTR
    DnsTreeName*: LPWSTR
    PackageName*: LPWSTR
    Flags*: ULONG
    CredTypeCount*: DWORD
    CredTypes*: LPDWORD

  PCREDENTIAL_TARGET_INFORMATIONW* = ptr CREDENTIAL_TARGET_INFORMATIONW
  CREDENTIAL_TARGET_INFORMATION* = CREDENTIAL_TARGET_INFORMATIONW
  PCREDENTIAL_TARGET_INFORMATION* = PCREDENTIAL_TARGET_INFORMATIONW

##
##  Certificate credential information
##
##  The cbSize should be the size of the structure, sizeof(CERT_CREDENTIAL_INFO),
##  rgbHashofCert is the hash of the cert which is to be used as the credential.
##

const
  CERT_HASH_LENGTH* = 20

type
  CERT_CREDENTIAL_INFO* {.bycopy.} = object
    cbSize*: ULONG
    rgbHashOfCert*: array[CERT_HASH_LENGTH, UCHAR]

  PCERT_CREDENTIAL_INFO* = ptr CERT_CREDENTIAL_INFO

##
##  Username Target credential information
##
##  This credential can be pass to LsaLogonUser to ask it to find a credential with a
##  TargetName of UserName.
##

type
  USERNAME_TARGET_CREDENTIAL_INFO* {.bycopy.} = object
    UserName*: LPWSTR

  PUSERNAME_TARGET_CREDENTIAL_INFO* = ptr USERNAME_TARGET_CREDENTIAL_INFO

##
##  Marshaled credential blob information.
##

type
  BINARY_BLOB_CREDENTIAL_INFO* {.bycopy.} = object
    cbBlob*: ULONG
    pbBlob*: LPBYTE

  PBINARY_BLOB_CREDENTIAL_INFO* = ptr BINARY_BLOB_CREDENTIAL_INFO

##
##  Credential type for credential marshaling routines
##

type
  CRED_MARSHAL_TYPE* = enum
    CertCredential = 1, UsernameTargetCredential, BinaryBlobCredential, UsernameForPackedCredentials, ##  internal only, reserved
    BinaryBlobForSystem       ##  internal only, via CredProtectEx
  PCRED_MARSHAL_TYPE* = ptr CRED_MARSHAL_TYPE


##
##  Protection type for credential providers secret protection routines
##

type
  CRED_PROTECTION_TYPE* = enum
    CredUnprotected, CredUserProtection, CredTrustedProtection,
    CredForSystemProtection
  PCRED_PROTECTION_TYPE* = ptr CRED_PROTECTION_TYPE


##
##  Values for authentication buffers packing
##

const
  CRED_PACK_PROTECTED_CREDENTIALS* = 0x00000001
  CRED_PACK_WOW_BUFFER* = 0x00000002
  CRED_PACK_GENERIC_CREDENTIALS* = 0x00000004
  CRED_PACK_ID_PROVIDER_CREDENTIALS* = 0x00000008

##
##  Credential UI info
##


type
  CREDUI_INFOW* {.bycopy.} = object
    cbSize*: DWORD
    hwndParent*: HWND
    pszMessageText*: PCWSTR
    pszCaptionText*: PCWSTR
    hbmBanner*: HBITMAP

  PCREDUI_INFOW* = ptr CREDUI_INFOW
  CREDUI_INFO* = CREDUI_INFOW
  PCREDUI_INFO* = PCREDUI_INFOW

## -----------------------------------------------------------------------------
##  Values
## -----------------------------------------------------------------------------
##  String length limits:

const
  CREDUI_MAX_MESSAGE_LENGTH* = 1024
  CREDUI_MAX_CAPTION_LENGTH* = 128
  CREDUI_MAX_GENERIC_TARGET_LENGTH* = CRED_MAX_GENERIC_TARGET_NAME_LENGTH
  CREDUI_MAX_DOMAIN_TARGET_LENGTH* = CRED_MAX_DOMAIN_TARGET_NAME_LENGTH

##
##   Username can be in <domain>\<user> or <user>@<domain>
##   Length in characters, not including NULL termination.
##

const
  CREDUI_MAX_USERNAME_LENGTH* = CRED_MAX_USERNAME_LENGTH
  CREDUI_MAX_PASSWORD_LENGTH* = (512 div 2)

##   Packed credential returned by SspiEncodeAuthIdentityAsStrings().
##   Length in characters, not including NULL termination.
##

const
  CREDUI_MAX_PACKED_CREDENTIALS_LENGTH* = ((MAXUSHORT div 2) - 2)

##  maximum length in bytes for binary credential blobs

const
  CREDUI_MAX_CREDENTIALS_BLOB_SIZE* = (MAXUSHORT)

##
##  Flags for CredUIPromptForCredentials and/or CredUICmdLinePromptForCredentials
##

const
  CREDUI_FLAGS_INCORRECT_PASSWORD* = 0x00000001
  CREDUI_FLAGS_DO_NOT_PERSIST* = 0x00000002
  CREDUI_FLAGS_REQUEST_ADMINISTRATOR* = 0x00000004
  CREDUI_FLAGS_EXCLUDE_CERTIFICATES* = 0x00000008
  CREDUI_FLAGS_REQUIRE_CERTIFICATE* = 0x00000010
  CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX* = 0x00000040
  CREDUI_FLAGS_ALWAYS_SHOW_UI* = 0x00000080
  CREDUI_FLAGS_REQUIRE_SMARTCARD* = 0x00000100
  CREDUI_FLAGS_PASSWORD_ONLY_OK* = 0x00000200
  CREDUI_FLAGS_VALIDATE_USERNAME* = 0x00000400
  CREDUI_FLAGS_COMPLETE_USERNAME* = 0x00000800
  CREDUI_FLAGS_PERSIST* = 0x00001000
  CREDUI_FLAGS_SERVER_CREDENTIAL* = 0x00004000
  CREDUI_FLAGS_EXPECT_CONFIRMATION* = 0x00020000
  CREDUI_FLAGS_GENERIC_CREDENTIALS* = 0x00040000
  CREDUI_FLAGS_USERNAME_TARGET_CREDENTIALS* = 0x00080000
  CREDUI_FLAGS_KEEP_USERNAME* = 0x00100000

##
##  Mask of flags valid for CredUIPromptForCredentials
##

const
  CREDUI_FLAGS_PROMPT_VALID* = (CREDUI_FLAGS_INCORRECT_PASSWORD or
      CREDUI_FLAGS_DO_NOT_PERSIST or CREDUI_FLAGS_REQUEST_ADMINISTRATOR or
      CREDUI_FLAGS_EXCLUDE_CERTIFICATES or CREDUI_FLAGS_REQUIRE_CERTIFICATE or
      CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX or CREDUI_FLAGS_ALWAYS_SHOW_UI or
      CREDUI_FLAGS_REQUIRE_SMARTCARD or CREDUI_FLAGS_PASSWORD_ONLY_OK or
      CREDUI_FLAGS_VALIDATE_USERNAME or CREDUI_FLAGS_COMPLETE_USERNAME or
      CREDUI_FLAGS_PERSIST or CREDUI_FLAGS_SERVER_CREDENTIAL or
      CREDUI_FLAGS_EXPECT_CONFIRMATION or CREDUI_FLAGS_GENERIC_CREDENTIALS or
      CREDUI_FLAGS_USERNAME_TARGET_CREDENTIALS or CREDUI_FLAGS_KEEP_USERNAME)

##
##  Flags for CredUIPromptForWindowsCredentials and CPUS_CREDUI Usage Scenarios
##

const
  CREDUIWIN_GENERIC* = 0x00000001
  CREDUIWIN_CHECKBOX* = 0x00000002
  CREDUIWIN_AUTHPACKAGE_ONLY* = 0x00000010
  CREDUIWIN_IN_CRED_ONLY* = 0x00000020
  CREDUIWIN_ENUMERATE_ADMINS* = 0x00000100
  CREDUIWIN_ENUMERATE_CURRENT_USER* = 0x00000200
  CREDUIWIN_SECURE_PROMPT* = 0x00001000
  CREDUIWIN_PREPROMPTING* = 0x00002000
  CREDUIWIN_PACK_32_WOW* = 0x10000000
  CREDUIWIN_VALID_FLAGS* = (CREDUIWIN_GENERIC or CREDUIWIN_CHECKBOX or
      CREDUIWIN_AUTHPACKAGE_ONLY or CREDUIWIN_IN_CRED_ONLY or
      CREDUIWIN_ENUMERATE_ADMINS or CREDUIWIN_ENUMERATE_CURRENT_USER or
      CREDUIWIN_SECURE_PROMPT or CREDUIWIN_PREPROMPTING or CREDUIWIN_PACK_32_WOW)

## -----------------------------------------------------------------------------
##  Functions
## -----------------------------------------------------------------------------
##
##  Values of flags to CredWrite and CredWriteDomainCredentials
##

const
  CRED_PRESERVE_CREDENTIAL_BLOB* = 0x00000001

proc CredWriteW*(Credential: PCREDENTIALW; Flags: DWORD): BOOL
proc CredReadW*(TargetName: LPCWSTR; Type: DWORD; Flags: DWORD;
               Credential: ptr PCREDENTIALW): BOOL
##
##  Values of flags to CredEnumerate
##

const
  CRED_ENUMERATE_ALL_CREDENTIALS* = 0x00000001

proc CredEnumerateW*(Filter: LPCWSTR; Flags: DWORD; Count: ptr DWORD;
                    Credential: ptr ptr PCREDENTIALW): BOOL
proc CredWriteDomainCredentialsW*(TargetInfo: PCREDENTIAL_TARGET_INFORMATIONW;
                                 Credential: PCREDENTIALW; Flags: DWORD): BOOL
##
##  Values of flags to CredReadDomainCredentials
##

const
  CRED_CACHE_TARGET_INFORMATION* = 0x00000001

proc CredReadDomainCredentialsW*(TargetInfo: PCREDENTIAL_TARGET_INFORMATIONW;
                                Flags: DWORD; Count: ptr DWORD;
                                Credential: ptr ptr PCREDENTIALW): BOOL
proc CredDeleteW*(TargetName: LPCWSTR; Type: DWORD; Flags: DWORD): BOOL
proc CredRenameW*(OldTargetName: LPCWSTR; NewTargetName: LPCWSTR; Type: DWORD;
                 Flags: DWORD): BOOL
##
##  Values of flags to CredGetTargetInfo
##

const
  CRED_ALLOW_NAME_RESOLUTION* = 0x00000001

proc CredGetTargetInfoW*(TargetName: LPCWSTR; Flags: DWORD;
                        TargetInfo: ptr PCREDENTIAL_TARGET_INFORMATIONW): BOOL
proc CredMarshalCredentialW*(CredType: CRED_MARSHAL_TYPE; Credential: PVOID;
                            MarshaledCredential: ptr LPWSTR): BOOL
proc CredUnmarshalCredentialW*(MarshaledCredential: LPCWSTR;
                              CredType: PCRED_MARSHAL_TYPE; Credential: ptr PVOID): BOOL
proc CredIsMarshaledCredentialW*(MarshaledCredential: LPCWSTR): BOOL
proc CredUnPackAuthenticationBufferW*(dwFlags: DWORD; pAuthBuffer: PVOID;
                                     cbAuthBuffer: DWORD; pszUserName: LPWSTR;
                                     pcchMaxUserName: ptr DWORD;
                                     pszDomainName: LPWSTR;
                                     pcchMaxDomainName: ptr DWORD;
                                     pszPassword: LPWSTR;
                                     pcchMaxPassword: ptr DWORD): BOOL
proc CredPackAuthenticationBufferW*(dwFlags: DWORD; pszUserName: LPWSTR;
                                   pszPassword: LPWSTR; pPackedCredentials: PBYTE;
                                   pcbPackedCredentials: ptr DWORD): BOOL
proc CredProtectW*(fAsSelf: BOOL; pszCredentials: LPWSTR; cchCredentials: DWORD;
                  pszProtectedCredentials: LPWSTR; pcchMaxChars: ptr DWORD;
                  ProtectionType: ptr CRED_PROTECTION_TYPE): BOOL
const
  CRED_PROTECT_AS_SELF* = 0x00000001
  CRED_PROTECT_TO_SYSTEM* = 0x00000002
  CRED_PROTECT_VALID_FLAGS* = (CRED_PROTECT_AS_SELF or CRED_PROTECT_TO_SYSTEM)

proc CredProtectEx*(Flags: ULONG; pszCredentials: LPWSTR; cchCredentials: DWORD;
                   pszProtectedCredentials: LPWSTR; pcchMaxChars: ptr DWORD;
                   ProtectionType: ptr CRED_PROTECTION_TYPE): BOOL
proc CredUnprotectW*(fAsSelf: BOOL; pszProtectedCredentials: LPWSTR;
                    cchProtectedCredentials: DWORD; pszCredentials: LPWSTR;
                    pcchMaxChars: ptr DWORD): BOOL
const
  CRED_UNPROTECT_AS_SELF* = 0x00000001
  CRED_UNPROTECT_ALLOW_TO_SYSTEM* = 0x00000002
  CRED_UNPROTECT_VALID_FLAGS* = (
    CRED_UNPROTECT_AS_SELF or CRED_UNPROTECT_ALLOW_TO_SYSTEM)

proc CredUnprotectEx*(Flags: ULONG; pszProtectedCredentials: LPWSTR;
                     cchProtectedCredentials: DWORD; pszCredentials: LPWSTR;
                     pcchMaxChars: ptr DWORD): BOOL
proc CredIsProtectedW*(pszProtectedCredentials: LPWSTR;
                      pProtectionType: ptr CRED_PROTECTION_TYPE): BOOL
proc CredFindBestCredentialW*(TargetName: LPCWSTR; Type: DWORD; Flags: DWORD;
                             Credential: ptr PCREDENTIALW): BOOL
proc CredGetSessionTypes*(MaximumPersistCount: DWORD; MaximumPersist: LPDWORD): BOOL
proc CredFree*(Buffer: PVOID): VOID
proc CredUIPromptForCredentialsW*(pUiInfo: PCREDUI_INFOW; pszTargetName: PCWSTR;
                                 pContext: PCtxtHandle; dwAuthError: DWORD;
                                 pszUserName: PWSTR; ulUserNameBufferSize: ULONG;
                                 pszPassword: PWSTR; ulPasswordBufferSize: ULONG;
                                 save: ptr BOOL; dwFlags: DWORD): DWORD
proc CredUIPromptForWindowsCredentialsW*(pUiInfo: PCREDUI_INFOW;
                                        dwAuthError: DWORD;
                                        pulAuthPackage: ptr ULONG;
                                        pvInAuthBuffer: LPCVOID;
                                        ulInAuthBufferSize: ULONG;
                                        ppvOutAuthBuffer: ptr LPVOID;
                                        pulOutAuthBufferSize: ptr ULONG;
                                        pfSave: ptr BOOL; dwFlags: DWORD): DWORD
proc CredUIParseUserNameW*(UserName: PCWSTR; user: ptr WCHAR; userBufferSize: ULONG;
                          domain: ptr WCHAR; domainBufferSize: ULONG): DWORD
proc CredUICmdLinePromptForCredentialsW*(pszTargetName: PCWSTR;
                                        pContext: PCtxtHandle; dwAuthError: DWORD;
                                        UserName: PWSTR; ulUserBufferSize: ULONG;
                                        pszPassword: PWSTR;
                                        ulPasswordBufferSize: ULONG;
                                        pfSave: PBOOL; dwFlags: DWORD): DWORD
##
##  Call this API with bConfirm set to TRUE to confirm that the credential (previously created
##  via CredUIGetCredentials or CredUIPromptForCredentials worked, or with bConfirm set to FALSE
##  to indicate it didn't

proc CredUIConfirmCredentialsW*(pszTargetName: PCWSTR; bConfirm: BOOL): DWORD
proc CredUIStoreSSOCredW*(pszRealm: PCWSTR; pszUsername: PCWSTR; pszPassword: PCWSTR;
                         bPersist: BOOL): DWORD
proc CredUIReadSSOCredW*(pszRealm: PCWSTR; ppszUsername: ptr PWSTR): DWORD

{. pop .}
