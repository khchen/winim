#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#
#====================================================================

import windef
#include <subauth.h>
type
  NETLOGON_LOGON_INFO_CLASS* = int32
  SAM_HANDLE* = PVOID
  PSAM_HANDLE* = ptr PVOID
  OLD_LARGE_INTEGER* {.pure.} = object
    LowPart*: ULONG
    HighPart*: LONG
  POLD_LARGE_INTEGER* = ptr OLD_LARGE_INTEGER
  LOGON_HOURS* {.pure.} = object
    UnitsPerWeek*: USHORT
    LogonHours*: PUCHAR
  PLOGON_HOURS* = ptr LOGON_HOURS
  SR_SECURITY_DESCRIPTOR* {.pure.} = object
    Length*: ULONG
    SecurityDescriptor*: PUCHAR
  PSR_SECURITY_DESCRIPTOR* = ptr SR_SECURITY_DESCRIPTOR
  USER_ALL_INFORMATION* {.pure.} = object
    LastLogon*: LARGE_INTEGER
    LastLogoff*: LARGE_INTEGER
    PasswordLastSet*: LARGE_INTEGER
    AccountExpires*: LARGE_INTEGER
    PasswordCanChange*: LARGE_INTEGER
    PasswordMustChange*: LARGE_INTEGER
    UserName*: UNICODE_STRING
    FullName*: UNICODE_STRING
    HomeDirectory*: UNICODE_STRING
    HomeDirectoryDrive*: UNICODE_STRING
    ScriptPath*: UNICODE_STRING
    ProfilePath*: UNICODE_STRING
    AdminComment*: UNICODE_STRING
    WorkStations*: UNICODE_STRING
    UserComment*: UNICODE_STRING
    Parameters*: UNICODE_STRING
    LmPassword*: UNICODE_STRING
    NtPassword*: UNICODE_STRING
    PrivateData*: UNICODE_STRING
    SecurityDescriptor*: SR_SECURITY_DESCRIPTOR
    UserId*: ULONG
    PrimaryGroupId*: ULONG
    UserAccountControl*: ULONG
    WhichFields*: ULONG
    LogonHours*: LOGON_HOURS
    BadPasswordCount*: USHORT
    LogonCount*: USHORT
    CountryCode*: USHORT
    CodePage*: USHORT
    LmPasswordPresent*: BOOLEAN
    NtPasswordPresent*: BOOLEAN
    PasswordExpired*: BOOLEAN
    PrivateDataSensitive*: BOOLEAN
  PUSER_ALL_INFORMATION* = ptr USER_ALL_INFORMATION
const
  CLEAR_BLOCK_LENGTH* = 8
type
  CLEAR_BLOCK* {.pure.} = object
    data*: array[CLEAR_BLOCK_LENGTH, CHAR]
  PCLEAR_BLOCK* = ptr CLEAR_BLOCK
const
  CYPHER_BLOCK_LENGTH* = 8
type
  CYPHER_BLOCK* {.pure.} = object
    data*: array[CYPHER_BLOCK_LENGTH, CHAR]
  PCYPHER_BLOCK* = ptr CYPHER_BLOCK
  LM_OWF_PASSWORD* {.pure.} = object
    data*: array[2, CYPHER_BLOCK]
  PLM_OWF_PASSWORD* = ptr LM_OWF_PASSWORD
  LM_CHALLENGE* = CLEAR_BLOCK
  PLM_CHALLENGE* = ptr LM_CHALLENGE
  NT_OWF_PASSWORD* = LM_OWF_PASSWORD
  PNT_OWF_PASSWORD* = ptr NT_OWF_PASSWORD
  NT_CHALLENGE* = LM_CHALLENGE
  PNT_CHALLENGE* = ptr NT_CHALLENGE
  USER_SESSION_KEY* {.pure.} = object
    data*: array[2, CYPHER_BLOCK]
  PUSER_SESSION_KEY* = ptr USER_SESSION_KEY
  NETLOGON_LOGON_IDENTITY_INFO* {.pure.} = object
    LogonDomainName*: UNICODE_STRING
    ParameterControl*: ULONG
    LogonId*: OLD_LARGE_INTEGER
    UserName*: UNICODE_STRING
    Workstation*: UNICODE_STRING
  PNETLOGON_LOGON_IDENTITY_INFO* = ptr NETLOGON_LOGON_IDENTITY_INFO
  NETLOGON_INTERACTIVE_INFO* {.pure.} = object
    Identity*: NETLOGON_LOGON_IDENTITY_INFO
    LmOwfPassword*: LM_OWF_PASSWORD
    NtOwfPassword*: NT_OWF_PASSWORD
  PNETLOGON_INTERACTIVE_INFO* = ptr NETLOGON_INTERACTIVE_INFO
  NETLOGON_SERVICE_INFO* {.pure.} = object
    Identity*: NETLOGON_LOGON_IDENTITY_INFO
    LmOwfPassword*: LM_OWF_PASSWORD
    NtOwfPassword*: NT_OWF_PASSWORD
  PNETLOGON_SERVICE_INFO* = ptr NETLOGON_SERVICE_INFO
  NETLOGON_NETWORK_INFO* {.pure.} = object
    Identity*: NETLOGON_LOGON_IDENTITY_INFO
    LmChallenge*: LM_CHALLENGE
    NtChallengeResponse*: STRING
    LmChallengeResponse*: STRING
  PNETLOGON_NETWORK_INFO* = ptr NETLOGON_NETWORK_INFO
  NETLOGON_GENERIC_INFO* {.pure.} = object
    Identity*: NETLOGON_LOGON_IDENTITY_INFO
    PackageName*: UNICODE_STRING
    DataLength*: ULONG
    LogonData*: PUCHAR
  PNETLOGON_GENERIC_INFO* = ptr NETLOGON_GENERIC_INFO
  MSV1_0_VALIDATION_INFO* {.pure.} = object
    LogoffTime*: LARGE_INTEGER
    KickoffTime*: LARGE_INTEGER
    LogonServer*: UNICODE_STRING
    LogonDomainName*: UNICODE_STRING
    SessionKey*: USER_SESSION_KEY
    Authoritative*: BOOLEAN
    UserFlags*: ULONG
    WhichFields*: ULONG
    UserId*: ULONG
  PMSV1_0_VALIDATION_INFO* = ptr MSV1_0_VALIDATION_INFO
const
  USER_ACCOUNT_DISABLED* = 0x00000001
  USER_HOME_DIRECTORY_REQUIRED* = 0x00000002
  USER_PASSWORD_NOT_REQUIRED* = 0x00000004
  USER_TEMP_DUPLICATE_ACCOUNT* = 0x00000008
  USER_NORMAL_ACCOUNT* = 0x00000010
  USER_MNS_LOGON_ACCOUNT* = 0x00000020
  USER_INTERDOMAIN_TRUST_ACCOUNT* = 0x00000040
  USER_WORKSTATION_TRUST_ACCOUNT* = 0x00000080
  USER_SERVER_TRUST_ACCOUNT* = 0x00000100
  USER_DONT_EXPIRE_PASSWORD* = 0x00000200
  USER_ACCOUNT_AUTO_LOCKED* = 0x00000400
  USER_ENCRYPTED_TEXT_PASSWORD_ALLOWED* = 0x00000800
  USER_SMARTCARD_REQUIRED* = 0x00001000
  USER_TRUSTED_FOR_DELEGATION* = 0x00002000
  USER_NOT_DELEGATED* = 0x00004000
  USER_USE_DES_KEY_ONLY* = 0x00008000
  USER_DONT_REQUIRE_PREAUTH* = 0x00010000
  USER_PASSWORD_EXPIRED* = 0x00020000
  USER_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION* = 0x00040000
  USER_NO_AUTH_DATA_REQUIRED* = 0x00080000
  NEXT_FREE_ACCOUNT_CONTROL_BIT* = USER_NO_AUTH_DATA_REQUIRED shl 1
  USER_MACHINE_ACCOUNT_MASK* = USER_INTERDOMAIN_TRUST_ACCOUNT or USER_WORKSTATION_TRUST_ACCOUNT or USER_SERVER_TRUST_ACCOUNT
  USER_ACCOUNT_TYPE_MASK* = USER_TEMP_DUPLICATE_ACCOUNT or USER_NORMAL_ACCOUNT or USER_MACHINE_ACCOUNT_MASK
  USER_COMPUTED_ACCOUNT_CONTROL_BITS* = USER_ACCOUNT_AUTO_LOCKED or USER_PASSWORD_EXPIRED
  SAM_DAYS_PER_WEEK* = 7
  SAM_HOURS_PER_WEEK* = 24*SAM_DAYS_PER_WEEK
  SAM_MINUTES_PER_WEEK* = 60*SAM_HOURS_PER_WEEK
  USER_ALL_PARAMETERS* = 0x00200000
  USER_SESSION_KEY_LENGTH* = CYPHER_BLOCK_LENGTH*2
  netlogonInteractiveInformation* = 1
  netlogonNetworkInformation* = 2
  netlogonServiceInformation* = 3
  netlogonGenericInformation* = 4
  netlogonInteractiveTransitiveInformation* = 5
  netlogonNetworkTransitiveInformation* = 6
  netlogonServiceTransitiveInformation* = 7
  MSV1_0_PASSTHRU* = 0x01
  MSV1_0_GUEST_LOGON* = 0x02
  MSV1_0_VALIDATION_LOGOFF_TIME* = 0x00000001
  MSV1_0_VALIDATION_KICKOFF_TIME* = 0x00000002
  MSV1_0_VALIDATION_LOGON_SERVER* = 0x00000004
  MSV1_0_VALIDATION_LOGON_DOMAIN* = 0x00000008
  MSV1_0_VALIDATION_SESSION_KEY* = 0x00000010
  MSV1_0_VALIDATION_USER_FLAGS* = 0x00000020
  MSV1_0_VALIDATION_USER_ID* = 0x00000040
  MSV1_0_SUBAUTH_ACCOUNT_DISABLED* = 0x00000001
  MSV1_0_SUBAUTH_PASSWORD* = 0x00000002
  MSV1_0_SUBAUTH_WORKSTATIONS* = 0x00000004
  MSV1_0_SUBAUTH_LOGON_HOURS* = 0x00000008
  MSV1_0_SUBAUTH_ACCOUNT_EXPIRY* = 0x00000010
  MSV1_0_SUBAUTH_PASSWORD_EXPIRY* = 0x00000020
  MSV1_0_SUBAUTH_ACCOUNT_TYPE* = 0x00000040
  MSV1_0_SUBAUTH_LOCKOUT* = 0x00000080
type
  Msv1_0SubAuthenticationRoutine* = proc (LogonLevel: NETLOGON_LOGON_INFO_CLASS, LogonInformation: PVOID, Flags: ULONG, UserAll: PUSER_ALL_INFORMATION, WhichFields: PULONG, UserFlags: PULONG, Authoritative: PBOOLEAN, LogoffTime: PLARGE_INTEGER, KickoffTime: PLARGE_INTEGER): NTSTATUS {.stdcall.}
  Msv1_0SubAuthenticationRoutineEx* = proc (LogonLevel: NETLOGON_LOGON_INFO_CLASS, LogonInformation: PVOID, Flags: ULONG, UserAll: PUSER_ALL_INFORMATION, UserHandle: SAM_HANDLE, ValidationInfo: PMSV1_0_VALIDATION_INFO, ActionsPerformed: PULONG): NTSTATUS {.stdcall.}
  Msv1_0SubAuthenticationRoutineGeneric* = proc (SubmitBuffer: PVOID, SubmitBufferLength: ULONG, ReturnBufferLength: PULONG, ReturnBuffer: ptr PVOID): NTSTATUS {.stdcall.}
  Msv1_0SubAuthenticationFilter* = proc (LogonLevel: NETLOGON_LOGON_INFO_CLASS, LogonInformation: PVOID, Flags: ULONG, UserAll: PUSER_ALL_INFORMATION, WhichFields: PULONG, UserFlags: PULONG, Authoritative: PBOOLEAN, LogoffTime: PLARGE_INTEGER, KickoffTime: PLARGE_INTEGER): NTSTATUS {.stdcall.}
