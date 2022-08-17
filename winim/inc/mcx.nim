#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2022 Ward
#
#====================================================================

{.push hint[Name]: off.}
import windef
#include <mcx.h>
type
  MODEMDEVCAPS* {.pure.} = object
    dwActualSize*: DWORD
    dwRequiredSize*: DWORD
    dwDevSpecificOffset*: DWORD
    dwDevSpecificSize*: DWORD
    dwModemProviderVersion*: DWORD
    dwModemManufacturerOffset*: DWORD
    dwModemManufacturerSize*: DWORD
    dwModemModelOffset*: DWORD
    dwModemModelSize*: DWORD
    dwModemVersionOffset*: DWORD
    dwModemVersionSize*: DWORD
    dwDialOptions*: DWORD
    dwCallSetupFailTimer*: DWORD
    dwInactivityTimeout*: DWORD
    dwSpeakerVolume*: DWORD
    dwSpeakerMode*: DWORD
    dwModemOptions*: DWORD
    dwMaxDTERate*: DWORD
    dwMaxDCERate*: DWORD
    abVariablePortion*: array[1, BYTE]
  PMODEMDEVCAPS* = ptr MODEMDEVCAPS
  LPMODEMDEVCAPS* = ptr MODEMDEVCAPS
  MODEMSETTINGS* {.pure.} = object
    dwActualSize*: DWORD
    dwRequiredSize*: DWORD
    dwDevSpecificOffset*: DWORD
    dwDevSpecificSize*: DWORD
    dwCallSetupFailTimer*: DWORD
    dwInactivityTimeout*: DWORD
    dwSpeakerVolume*: DWORD
    dwSpeakerMode*: DWORD
    dwPreferredModemOptions*: DWORD
    dwNegotiatedModemOptions*: DWORD
    dwNegotiatedDCERate*: DWORD
    abVariablePortion*: array[1, BYTE]
  PMODEMSETTINGS* = ptr MODEMSETTINGS
  LPMODEMSETTINGS* = ptr MODEMSETTINGS
const
  DIALOPTION_BILLING* = 0x00000040
  DIALOPTION_QUIET* = 0x00000080
  DIALOPTION_DIALTONE* = 0x00000100
  MDMVOLFLAG_LOW* = 0x00000001
  MDMVOLFLAG_MEDIUM* = 0x00000002
  MDMVOLFLAG_HIGH* = 0x00000004
  MDMVOL_LOW* = 0x00000000
  MDMVOL_MEDIUM* = 0x00000001
  MDMVOL_HIGH* = 0x00000002
  MDMSPKRFLAG_OFF* = 0x00000001
  MDMSPKRFLAG_DIAL* = 0x00000002
  MDMSPKRFLAG_ON* = 0x00000004
  MDMSPKRFLAG_CALLSETUP* = 0x00000008
  MDMSPKR_OFF* = 0x00000000
  MDMSPKR_DIAL* = 0x00000001
  MDMSPKR_ON* = 0x00000002
  MDMSPKR_CALLSETUP* = 0x00000003
  MDM_COMPRESSION* = 0x00000001
  MDM_ERROR_CONTROL* = 0x00000002
  MDM_FORCED_EC* = 0x00000004
  MDM_CELLULAR* = 0x00000008
  MDM_FLOWCONTROL_HARD* = 0x00000010
  MDM_FLOWCONTROL_SOFT* = 0x00000020
  MDM_CCITT_OVERRIDE* = 0x00000040
  MDM_SPEED_ADJUST* = 0x00000080
  MDM_TONE_DIAL* = 0x00000100
  MDM_BLIND_DIAL* = 0x00000200
  MDM_V23_OVERRIDE* = 0x00000400
  MDM_DIAGNOSTICS* = 0x00000800
  MDM_MASK_BEARERMODE* = 0x0000f000
  MDM_SHIFT_BEARERMODE* = 12
  MDM_MASK_PROTOCOLID* = 0x000f0000
  MDM_SHIFT_PROTOCOLID* = 16
  MDM_MASK_PROTOCOLDATA* = 0x0ff00000
  MDM_SHIFT_PROTOCOLDATA* = 20
  MDM_MASK_PROTOCOLINFO* = MDM_MASK_PROTOCOLID or MDM_MASK_PROTOCOLDATA
  MDM_SHIFT_PROTOCOLINFO* = MDM_SHIFT_PROTOCOLID
  MDM_MASK_EXTENDEDINFO* = MDM_MASK_BEARERMODE or MDM_MASK_PROTOCOLINFO
  MDM_SHIFT_EXTENDEDINFO* = MDM_SHIFT_BEARERMODE
  MDM_BEARERMODE_ANALOG* = 0x0
  MDM_BEARERMODE_ISDN* = 0x1
  MDM_BEARERMODE_GSM* = 0x2
  MDM_PROTOCOLID_DEFAULT* = 0x0
  MDM_PROTOCOLID_HDLCPPP* = 0x1
  MDM_PROTOCOLID_V128* = 0x2
  MDM_PROTOCOLID_X75* = 0x3
  MDM_PROTOCOLID_V110* = 0x4
  MDM_PROTOCOLID_V120* = 0x5
  MDM_PROTOCOLID_AUTO* = 0x6
  MDM_PROTOCOLID_ANALOG* = 0x7
  MDM_PROTOCOLID_GPRS* = 0x8
  MDM_PROTOCOLID_PIAFS* = 0x9
  MDM_SHIFT_HDLCPPP_SPEED* = 0x0
  MDM_MASK_HDLCPPP_SPEED* = 0x7
  MDM_HDLCPPP_SPEED_DEFAULT* = 0x0
  MDM_HDLCPPP_SPEED_64K* = 0x1
  MDM_HDLCPPP_SPEED_56K* = 0x2
  MDM_SHIFT_HDLCPPP_AUTH* = 0x3
  MDM_MASK_HDLCPPP_AUTH* = 0x7 shl 3
  MDM_HDLCPPP_AUTH_DEFAULT* = 0x0
  MDM_HDLCPPP_AUTH_NONE* = 0x1
  MDM_HDLCPPP_AUTH_PAP* = 0x2
  MDM_HDLCPPP_AUTH_CHAP* = 0x3
  MDM_HDLCPPP_AUTH_MSCHAP* = 0x4
  MDM_SHIFT_HDLCPPP_ML* = 0x6
  MDM_MASK_HDLCPPP_ML* = 0x3 shl 6
  MDM_HDLCPPP_ML_DEFAULT* = 0x0
  MDM_HDLCPPP_ML_NONE* = 0x1
  MDM_HDLCPPP_ML_2* = 0x2
  MDM_SHIFT_V120_SPEED* = 0x0
  MDM_MASK_V120_SPEED* = 0x7
  MDM_V120_SPEED_DEFAULT* = 0x0
  MDM_V120_SPEED_64K* = 0x1
  MDM_V120_SPEED_56K* = 0x2
  MDM_SHIFT_V120_ML* = 0x6
  MDM_MASK_V120_ML* = 0x3 shl 6
  MDM_V120_ML_DEFAULT* = 0x0
  MDM_V120_ML_NONE* = 0x1
  MDM_V120_ML_2* = 0x2
  MDM_SHIFT_X75_DATA* = 0x0
  MDM_MASK_X75_DATA* = 0x7
  MDM_X75_DATA_DEFAULT* = 0x0
  MDM_X75_DATA_64K* = 0x1
  MDM_X75_DATA_128K* = 0x2
  MDM_X75_DATA_T_70* = 0x3
  MDM_X75_DATA_BTX* = 0x4
  MDM_SHIFT_V110_SPEED* = 0x0
  MDM_MASK_V110_SPEED* = 0xf
  MDM_V110_SPEED_DEFAULT* = 0x0
  MDM_V110_SPEED_1DOT2K* = 0x1
  MDM_V110_SPEED_2DOT4K* = 0x2
  MDM_V110_SPEED_4DOT8K* = 0x3
  MDM_V110_SPEED_9DOT6K* = 0x4
  MDM_V110_SPEED_12DOT0K* = 0x5
  MDM_V110_SPEED_14DOT4K* = 0x6
  MDM_V110_SPEED_19DOT2K* = 0x7
  MDM_V110_SPEED_28DOT8K* = 0x8
  MDM_V110_SPEED_38DOT4K* = 0x9
  MDM_V110_SPEED_57DOT6K* = 0xA
  MDM_SHIFT_AUTO_SPEED* = 0x0
  MDM_MASK_AUTO_SPEED* = 0x7
  MDM_AUTO_SPEED_DEFAULT* = 0x0
  MDM_SHIFT_AUTO_ML* = 0x6
  MDM_MASK_AUTO_ML* = 0x3 shl 6
  MDM_AUTO_ML_DEFAULT* = 0x0
  MDM_AUTO_ML_NONE* = 0x1
  MDM_AUTO_ML_2* = 0x2
  MDM_ANALOG_RLP_ON* = 0x0
  MDM_ANALOG_RLP_OFF* = 0x1
  MDM_ANALOG_V34* = 0x2
  MDM_PIAFS_INCOMING* = 0
  MDM_PIAFS_OUTGOING* = 1
  MDM_PROTOCOL_HDLCPPP_64K* = 0x00110000
  MDM_PROTOCOL_HDLCPPP_56K* = 0x00210000
  MDM_PROTOCOL_HDLCPPP_112K* = 0x08210000
  MDM_PROTOCOL_HDLCPPP_112K_PAP* = 0x09210000
  MDM_PROTOCOL_HDLCPPP_112K_CHAP* = 0x09A10000
  MDM_PROTOCOL_HDLCPPP_112K_MSCHAP* = 0x0A210000
  MDM_PROTOCOL_HDLCPPP_128K* = 0x08110000
  MDM_PROTOCOL_HDLCPPP_128K_PAP* = 0x09110000
  MDM_PROTOCOL_HDLCPPP_128K_CHAP* = 0x09910000
  MDM_PROTOCOL_HDLCPPP_128K_MSCHAP* = 0x0A110000
  MDM_PROTOCOL_V120_64K* = 0x04150000
  MDM_PROTOCOL_V120_56K* = 0x04250000
  MDM_PROTOCOL_V120_112K* = 0x08250000
  MDM_PROTOCOL_V120_128K* = 0x08150000
  MDM_PROTOCOL_X75_64K* = 0x00130000
  MDM_PROTOCOL_X75_128K* = 0x00230000
  MDM_PROTOCOL_X75_T_70* = 0x00330000
  MDM_PROTOCOL_X75_BTX* = 0x00430000
  MDM_PROTOCOL_V110_1DOT2K* = 0x00140000
  MDM_PROTOCOL_V110_2DOT4K* = 0x00240000
  MDM_PROTOCOL_V110_4DOT8K* = 0x00340000
  MDM_PROTOCOL_V110_9DOT6K* = 0x00440000
  MDM_PROTOCOL_V110_12DOT0K* = 0x00540000
  MDM_PROTOCOL_V110_14DOT4K* = 0x00640000
  MDM_PROTOCOL_V110_19DOT2K* = 0x00740000
  MDM_PROTOCOL_V110_28DOT8K* = 0x00840000
  MDM_PROTOCOL_V110_38DOT4K* = 0x00940000
  MDM_PROTOCOL_V110_57DOT6K* = 0x00A40000
  MDM_PROTOCOL_AUTO_1CH* = 0x04060000
  MDM_PROTOCOL_AUTO_2CH* = 0x08060000
  MDM_PROTOCOL_ANALOG_RLP* = 0x00070000
  MDM_PROTOCOL_ANALOG_NRLP* = 0x00170000
  MDM_PROTOCOL_ANALOG_V34* = 0x00270000
  MDM_PROTOCOL_GPRS* = 0x00080000
  MDM_PROTOCOL_PIAFS_INCOMING* = 0x00090000
  MDM_PROTOCOL_PIAFS_OUTGOING* = 0x00190000
