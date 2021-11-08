#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2021 Ward
#
#====================================================================

#include <vssym32.h>
#include <vsstyle.h>
type
  AEROWIZARDPARTS* = int32
  TITLEBARSTATES* = int32
  HEADERAREASTATES* = int32
  CONTENTAREASTATES* = int32
  BUTTONPARTS* = int32
  PUSHBUTTONSTATES* = int32
  RADIOBUTTONSTATES* = int32
  CHECKBOXSTATES* = int32
  GROUPBOXSTATES* = int32
  COMMANDLINKSTATES* = int32
  COMMANDLINKGLYPHSTATES* = int32
  COMBOBOXPARTS* = int32
  COMBOBOXSTYLESTATES* = int32
  DROPDOWNBUTTONRIGHTSTATES* = int32
  DROPDOWNBUTTONLEFTSTATES* = int32
  TRANSPARENTBACKGROUNDSTATES* = int32
  BORDERSTATES* = int32
  READONLYSTATES* = int32
  CUEBANNERSTATES* = int32
  COMMUNICATIONSPARTS* = int32
  TABSTATES* = int32
  CONTROLPANELPARTS* = int32
  HELPLINKSTATES* = int32
  TASKLINKSTATES* = int32
  CONTENTLINKSTATES* = int32
  SECTIONTITLELINKSTATES* = int32
  DATEPICKERPARTS* = int32
  DATETEXTSTATES* = int32
  DATEBORDERSTATES* = int32
  SHOWCALENDARBUTTONRIGHTSTATES* = int32
  DRAGDROPPARTS* = int32
  COPYSTATES* = int32
  MOVESTATES* = int32
  UPDATEMETADATASTATES* = int32
  CREATELINKSTATES* = int32
  WARNINGSTATES* = int32
  NONESTATES* = int32
  EDITPARTS* = int32
  EDITTEXTSTATES* = int32
  BACKGROUNDSTATES* = int32
  BACKGROUNDWITHBORDERSTATES* = int32
  EDITBORDER_NOSCROLLSTATES* = int32
  EDITBORDER_HSCROLLSTATES* = int32
  EDITBORDER_VSCROLLSTATES* = int32
  EDITBORDER_HVSCROLLSTATES* = int32
  EXPLORERBARPARTS* = int32
  HEADERCLOSESTATES* = int32
  HEADERPINSTATES* = int32
  IEBARMENUSTATES* = int32
  NORMALGROUPCOLLAPSESTATES* = int32
  NORMALGROUPEXPANDSTATES* = int32
  SPECIALGROUPCOLLAPSESTATES* = int32
  SPECIALGROUPEXPANDSTATES* = int32
  FLYOUTPARTS* = int32
  LABELSTATES* = int32
  LINKSTATES* = int32
  BODYSTATES* = int32
  LINKHEADERSTATES* = int32
  HEADERPARTS* = int32
  HEADERSTYLESTATES* = int32
  HEADERITEMSTATES* = int32
  HEADERITEMLEFTSTATES* = int32
  HEADERITEMRIGHTSTATES* = int32
  HEADERSORTARROWSTATES* = int32
  HEADERDROPDOWNSTATES* = int32
  HEADERDROPDOWNFILTERSTATES* = int32
  HEADEROVERFLOWSTATES* = int32
  LISTBOXPARTS* = int32
  BORDER_HSCROLLSTATES* = int32
  BORDER_HVSCROLLSTATES* = int32
  BORDER_NOSCROLLSTATES* = int32
  BORDER_VSCROLLSTATES* = int32
  ITEMSTATES* = int32
  LISTVIEWPARTS* = int32
  LISTITEMSTATES* = int32
  GROUPHEADERSTATES* = int32
  GROUPHEADERLINESTATES* = int32
  EXPANDBUTTONSTATES* = int32
  COLLAPSEBUTTONSTATES* = int32
  MENUPARTS* = int32
  BARBACKGROUNDSTATES* = int32
  BARITEMSTATES* = int32
  POPUPCHECKSTATES* = int32
  POPUPCHECKBACKGROUNDSTATES* = int32
  POPUPITEMSTATES* = int32
  POPUPSUBMENUSTATES* = int32
  SYSTEMCLOSESTATES* = int32
  SYSTEMMAXIMIZESTATES* = int32
  SYSTEMMINIMIZESTATES* = int32
  SYSTEMRESTORESTATES* = int32
  NAVIGATIONPARTS* = int32
  NAV_BACKBUTTONSTATES* = int32
  NAV_FORWARDBUTTONSTATES* = int32
  NAV_MENUBUTTONSTATES* = int32
  PROGRESSPARTS* = int32
  TRANSPARENTBARSTATES* = int32
  TRANSPARENTBARVERTSTATES* = int32
  FILLSTATES* = int32
  FILLVERTSTATES* = int32
  REBARPARTS* = int32
  CHEVRONSTATES* = int32
  CHEVRONVERTSTATES* = int32
  SPLITTERSTATES* = int32
  SPLITTERVERTSTATES* = int32
  SCROLLBARPARTS* = int32
  ARROWBTNSTATES* = int32
  SCROLLBARSTYLESTATES* = int32
  SIZEBOXSTATES* = int32
  SPINPARTS* = int32
  UPSTATES* = int32
  DOWNSTATES* = int32
  UPHORZSTATES* = int32
  DOWNHORZSTATES* = int32
  STATUSPARTS* = int32
  TABPARTS* = int32
  TABITEMSTATES* = int32
  TABITEMLEFTEDGESTATES* = int32
  TABITEMRIGHTEDGESTATES* = int32
  TABITEMBOTHEDGESTATES* = int32
  TOPTABITEMSTATES* = int32
  TOPTABITEMLEFTEDGESTATES* = int32
  TOPTABITEMRIGHTEDGESTATES* = int32
  TOPTABITEMBOTHEDGESTATES* = int32
  TASKDIALOGPARTS* = int32
  CONTENTPANESTATES* = int32
  EXPANDOBUTTONSTATES* = int32
  TEXTSTYLEPARTS* = int32
  HYPERLINKTEXTSTATES* = int32
  CONTROLLABELSTATES* = int32
  TOOLBARPARTS* = int32
  TOOLBARSTYLESTATES* = int32
  TOOLTIPPARTS* = int32
  CLOSESTATES* = int32
  STANDARDSTATES* = int32
  BALLOONSTATES* = int32
  BALLOONSTEMSTATES* = int32
  WRENCHSTATES* = int32
  TRACKBARPARTS* = int32
  TRACKBARSTYLESTATES* = int32
  TRACKSTATES* = int32
  TRACKVERTSTATES* = int32
  THUMBSTATES* = int32
  THUMBBOTTOMSTATES* = int32
  THUMBTOPSTATES* = int32
  THUMBVERTSTATES* = int32
  THUMBLEFTSTATES* = int32
  THUMBRIGHTSTATES* = int32
  TICSSTATES* = int32
  TICSVERTSTATES* = int32
  TREEVIEWPARTS* = int32
  TREEITEMSTATES* = int32
  GLYPHSTATES* = int32
  HOTGLYPHSTATES* = int32
  WINDOWPARTS* = int32
  FRAMESTATES* = int32
  CAPTIONSTATES* = int32
  MAXCAPTIONSTATES* = int32
  MINCAPTIONSTATES* = int32
  HORZSCROLLSTATES* = int32
  HORZTHUMBSTATES* = int32
  VERTSCROLLSTATES* = int32
  VERTTHUMBSTATES* = int32
  SYSBUTTONSTATES* = int32
  MINBUTTONSTATES* = int32
  MAXBUTTONSTATES* = int32
  RESTOREBUTTONSTATES* = int32
  HELPBUTTONSTATES* = int32
  CLOSEBUTTONSTATES* = int32
  BGTYPE* = int32
  IMAGELAYOUT* = int32
  BORDERTYPE* = int32
  FILLTYPE* = int32
  SIZINGTYPE* = int32
  HALIGN* = int32
  CONTENTALIGNMENT* = int32
  VALIGN* = int32
  OFFSETTYPE* = int32
  ICONEFFECT* = int32
  TEXTSHADOWTYPE* = int32
  GLYPHTYPE* = int32
  IMAGESELECTTYPE* = int32
  TRUESIZESCALINGTYPE* = int32
  GLYPHFONTSIZINGTYPE* = int32
  LINKPARTS* = int32
  HYPERLINKSTATES* = int32
  EMPTYMARKUPPARTS* = int32
  MARKUPTEXTSTATES* = int32
  STATICPARTS* = int32
  PAGEPARTS* = int32
  MONTHCALPARTS* = int32
  GRIDCELLBACKGROUNDSTATES* = int32
  GRIDCELLSTATES* = int32
  GRIDCELLUPPERSTATES* = int32
  TRAILINGGRIDCELLSTATES* = int32
  TRAILINGGRIDCELLUPPERSTATES* = int32
  NAVNEXTSTATES* = int32
  NAVPREVSTATES* = int32
  CLOCKPARTS* = int32
  CLOCKSTATES* = int32
  TRAYNOTIFYPARTS* = int32
  TASKBARPARTS* = int32
  TASKBANDPARTS* = int32
  STARTPANELPARTS* = int32
  MOREPROGRAMSTABSTATES* = int32
  SOFTWAREEXPLORERSTATES* = int32
  OPENBOXSTATES* = int32
  MOREPROGRAMSARROWSTATES* = int32
  MOREPROGRAMSARROWBACKSTATES* = int32
  LOGOFFBUTTONSSTATES* = int32
  MENUBANDPARTS* = int32
  MENUBANDSTATES* = int32
const
  TMTVS_RESERVEDLOW* = 100000
  TMTVS_RESERVEDHIGH* = 19999
  VSCLASS_AEROWIZARDSTYLE* = "AEROWIZARDSTYLE"
  VSCLASS_AEROWIZARD* = "AEROWIZARD"
  AW_TITLEBAR* = 1
  AW_HEADERAREA* = 2
  AW_CONTENTAREA* = 3
  AW_COMMANDAREA* = 4
  AW_BUTTON* = 5
  AW_S_TITLEBAR_ACTIVE* = 1
  AW_S_TITLEBAR_INACTIVE* = 2
  AW_S_HEADERAREA_NOMARGIN* = 1
  AW_S_CONTENTAREA_NOMARGIN* = 1
  VSCLASS_BUTTONSTYLE* = "BUTTONSTYLE"
  VSCLASS_BUTTON* = "BUTTON"
  BP_PUSHBUTTON* = 1
  BP_RADIOBUTTON* = 2
  BP_CHECKBOX* = 3
  BP_GROUPBOX* = 4
  BP_USERBUTTON* = 5
  BP_COMMANDLINK* = 6
  BP_COMMANDLINKGLYPH* = 7
  PBS_NORMAL* = 1
  PBS_HOT* = 2
  PBS_PRESSED* = 3
  PBS_DISABLED* = 4
  PBS_DEFAULTED* = 5
  PBS_DEFAULTED_ANIMATING* = 6
  RBS_UNCHECKEDNORMAL* = 1
  RBS_UNCHECKEDHOT* = 2
  RBS_UNCHECKEDPRESSED* = 3
  RBS_UNCHECKEDDISABLED* = 4
  RBS_CHECKEDNORMAL* = 5
  RBS_CHECKEDHOT* = 6
  RBS_CHECKEDPRESSED* = 7
  RBS_CHECKEDDISABLED* = 8
  CBS_UNCHECKEDNORMAL* = 1
  CBS_UNCHECKEDHOT* = 2
  CBS_UNCHECKEDPRESSED* = 3
  CBS_UNCHECKEDDISABLED* = 4
  CBS_CHECKEDNORMAL* = 5
  CBS_CHECKEDHOT* = 6
  CBS_CHECKEDPRESSED* = 7
  CBS_CHECKEDDISABLED* = 8
  CBS_MIXEDNORMAL* = 9
  CBS_MIXEDHOT* = 10
  CBS_MIXEDPRESSED* = 11
  CBS_MIXEDDISABLED* = 12
  CBS_IMPLICITNORMAL* = 13
  CBS_IMPLICITHOT* = 14
  CBS_IMPLICITPRESSED* = 15
  CBS_IMPLICITDISABLED* = 16
  CBS_EXCLUDEDNORMAL* = 17
  CBS_EXCLUDEDHOT* = 18
  CBS_EXCLUDEDPRESSED* = 19
  CBS_EXCLUDEDDISABLED* = 20
  GBS_NORMAL* = 1
  GBS_DISABLED* = 2
  CMDLS_NORMAL* = 1
  CMDLS_HOT* = 2
  CMDLS_PRESSED* = 3
  CMDLS_DISABLED* = 4
  CMDLS_DEFAULTED* = 5
  CMDLS_DEFAULTED_ANIMATING* = 6
  CMDLGS_NORMAL* = 1
  CMDLGS_HOT* = 2
  CMDLGS_PRESSED* = 3
  CMDLGS_DISABLED* = 4
  CMDLGS_DEFAULTED* = 5
  VSCLASS_COMBOBOXSTYLE* = "COMBOBOXSTYLE"
  VSCLASS_COMBOBOX* = "COMBOBOX"
  CP_DROPDOWNBUTTON* = 1
  CP_BACKGROUND* = 2
  CP_TRANSPARENTBACKGROUND* = 3
  CP_BORDER* = 4
  CP_READONLY* = 5
  CP_DROPDOWNBUTTONRIGHT* = 6
  CP_DROPDOWNBUTTONLEFT* = 7
  CP_CUEBANNER* = 8
  CBXS_NORMAL* = 1
  CBXS_HOT* = 2
  CBXS_PRESSED* = 3
  CBXS_DISABLED* = 4
  CBXSR_NORMAL* = 1
  CBXSR_HOT* = 2
  CBXSR_PRESSED* = 3
  CBXSR_DISABLED* = 4
  CBXSL_NORMAL* = 1
  CBXSL_HOT* = 2
  CBXSL_PRESSED* = 3
  CBXSL_DISABLED* = 4
  CBTBS_NORMAL* = 1
  CBTBS_HOT* = 2
  CBTBS_DISABLED* = 3
  CBTBS_FOCUSED* = 4
  CBB_NORMAL* = 1
  CBB_HOT* = 2
  CBB_FOCUSED* = 3
  CBB_DISABLED* = 4
  CBRO_NORMAL* = 1
  CBRO_HOT* = 2
  CBRO_PRESSED* = 3
  CBRO_DISABLED* = 4
  CBCB_NORMAL* = 1
  CBCB_HOT* = 2
  CBCB_PRESSED* = 3
  CBCB_DISABLED* = 4
  VSCLASS_COMMUNICATIONSSTYLE* = "COMMUNICATIONSSTYLE"
  VSCLASS_COMMUNICATIONS* = "COMMUNICATIONS"
  CSST_TAB* = 1
  CSTB_NORMAL* = 1
  CSTB_HOT* = 2
  CSTB_SELECTED* = 3
  VSCLASS_CONTROLPANELSTYLE* = "CONTROLPANELSTYLE"
  VSCLASS_CONTROLPANEL* = "CONTROLPANE"
  CPANEL_NAVIGATIONPANE* = 1
  CPANEL_CONTENTPANE* = 2
  CPANEL_NAVIGATIONPANELABEL* = 3
  CPANEL_CONTENTPANELABEL* = 4
  CPANEL_TITLE* = 5
  CPANEL_BODYTEXT* = 6
  CPANEL_HELPLINK* = 7
  CPANEL_TASKLINK* = 8
  CPANEL_GROUPTEXT* = 9
  CPANEL_CONTENTLINK* = 10
  CPANEL_SECTIONTITLELINK* = 11
  CPANEL_LARGECOMMANDAREA* = 12
  CPANEL_SMALLCOMMANDAREA* = 13
  CPANEL_BUTTON* = 14
  CPANEL_MESSAGETEXT* = 15
  CPANEL_NAVIGATIONPANELINE* = 16
  CPANEL_CONTENTPANELINE* = 17
  CPANEL_BANNERAREA* = 18
  CPANEL_BODYTITLE* = 19
  CPHL_NORMAL* = 1
  CPHL_HOT* = 2
  CPHL_PRESSED* = 3
  CPHL_DISABLED* = 4
  CPTL_NORMAL* = 1
  CPTL_HOT* = 2
  CPTL_PRESSED* = 3
  CPTL_DISABLED* = 4
  CPTL_PAGE* = 5
  CPCL_NORMAL* = 1
  CPCL_HOT* = 2
  CPCL_PRESSED* = 3
  CPCL_DISABLED* = 4
  CPSTL_NORMAL* = 1
  CPSTL_HOT* = 2
  VSCLASS_DATEPICKERSTYLE* = "DATEPICKERSTYLE"
  VSCLASS_DATEPICKER* = "DATEPICKER"
  DP_DATETEXT* = 1
  DP_DATEBORDER* = 2
  DP_SHOWCALENDARBUTTONRIGHT* = 3
  DPDT_NORMAL* = 1
  DPDT_DISABLED* = 2
  DPDT_SELECTED* = 3
  DPDB_NORMAL* = 1
  DPDB_HOT* = 2
  DPDB_FOCUSED* = 3
  DPDB_DISABLED* = 4
  DPSCBR_NORMAL* = 1
  DPSCBR_HOT* = 2
  DPSCBR_PRESSED* = 3
  DPSCBR_DISABLED* = 4
  VSCLASS_DRAGDROPSTYLE* = "DRAGDROPSTYLE"
  VSCLASS_DRAGDROP* = "DRAGDROP"
  DD_COPY* = 1
  DD_MOVE* = 2
  DD_UPDATEMETADATA* = 3
  DD_CREATELINK* = 4
  DD_WARNING* = 5
  DD_NONE* = 6
  DD_IMAGEBG* = 7
  DD_TEXTBG* = 8
  DDCOPY_HIGHLIGHT* = 1
  DDCOPY_NOHIGHLIGHT* = 2
  DDMOVE_HIGHLIGHT* = 1
  DDMOVE_NOHIGHLIGHT* = 2
  DDUPDATEMETADATA_HIGHLIGHT* = 1
  DDUPDATEMETADATA_NOHIGHLIGHT* = 2
  DDCREATELINK_HIGHLIGHT* = 1
  DDCREATELINK_NOHIGHLIGHT* = 2
  DDWARNING_HIGHLIGHT* = 1
  DDWARNING_NOHIGHLIGHT* = 2
  DDNONE_HIGHLIGHT* = 1
  DDNONE_NOHIGHLIGHT* = 2
  VSCLASS_EDITSTYLE* = "EDITSTYLE"
  VSCLASS_EDIT* = "EDIT"
  EP_EDITTEXT* = 1
  EP_CARET* = 2
  EP_BACKGROUND* = 3
  EP_PASSWORD* = 4
  EP_BACKGROUNDWITHBORDER* = 5
  EP_EDITBORDER_NOSCROLL* = 6
  EP_EDITBORDER_HSCROLL* = 7
  EP_EDITBORDER_VSCROLL* = 8
  EP_EDITBORDER_HVSCROLL* = 9
  ETS_NORMAL* = 1
  ETS_HOT* = 2
  ETS_SELECTED* = 3
  ETS_DISABLED* = 4
  ETS_FOCUSED* = 5
  ETS_READONLY* = 6
  ETS_ASSIST* = 7
  ETS_CUEBANNER* = 8
  EBS_NORMAL* = 1
  EBS_HOT* = 2
  EBS_DISABLED* = 3
  EBS_FOCUSED* = 4
  EBS_READONLY* = 5
  EBS_ASSIST* = 6
  EBWBS_NORMAL* = 1
  EBWBS_HOT* = 2
  EBWBS_DISABLED* = 3
  EBWBS_FOCUSED* = 4
  EPSN_NORMAL* = 1
  EPSN_HOT* = 2
  EPSN_FOCUSED* = 3
  EPSN_DISABLED* = 4
  EPSH_NORMAL* = 1
  EPSH_HOT* = 2
  EPSH_FOCUSED* = 3
  EPSH_DISABLED* = 4
  EPSV_NORMAL* = 1
  EPSV_HOT* = 2
  EPSV_FOCUSED* = 3
  EPSV_DISABLED* = 4
  EPSHV_NORMAL* = 1
  EPSHV_HOT* = 2
  EPSHV_FOCUSED* = 3
  EPSHV_DISABLED* = 4
  VSCLASS_EXPLORERBARSTYLE* = "EXPLORERBARSTYLE"
  VSCLASS_EXPLORERBAR* = "EXPLORERBAR"
  EBP_HEADERBACKGROUND* = 1
  EBP_HEADERCLOSE* = 2
  EBP_HEADERPIN* = 3
  EBP_IEBARMENU* = 4
  EBP_NORMALGROUPBACKGROUND* = 5
  EBP_NORMALGROUPCOLLAPSE* = 6
  EBP_NORMALGROUPEXPAND* = 7
  EBP_NORMALGROUPHEAD* = 8
  EBP_SPECIALGROUPBACKGROUND* = 9
  EBP_SPECIALGROUPCOLLAPSE* = 10
  EBP_SPECIALGROUPEXPAND* = 11
  EBP_SPECIALGROUPHEAD* = 12
  EBHC_NORMAL* = 1
  EBHC_HOT* = 2
  EBHC_PRESSED* = 3
  EBHP_NORMAL* = 1
  EBHP_HOT* = 2
  EBHP_PRESSED* = 3
  EBHP_SELECTEDNORMAL* = 4
  EBHP_SELECTEDHOT* = 5
  EBHP_SELECTEDPRESSED* = 6
  EBM_NORMAL* = 1
  EBM_HOT* = 2
  EBM_PRESSED* = 3
  EBNGC_NORMAL* = 1
  EBNGC_HOT* = 2
  EBNGC_PRESSED* = 3
  EBNGE_NORMAL* = 1
  EBNGE_HOT* = 2
  EBNGE_PRESSED* = 3
  EBSGC_NORMAL* = 1
  EBSGC_HOT* = 2
  EBSGC_PRESSED* = 3
  EBSGE_NORMAL* = 1
  EBSGE_HOT* = 2
  EBSGE_PRESSED* = 3
  VSCLASS_FLYOUTSTYLE* = "FLYOUTSTYLE"
  VSCLASS_FLYOUT* = "FLYOUT"
  FLYOUT_HEADER* = 1
  FLYOUT_BODY* = 2
  FLYOUT_LABEL* = 3
  FLYOUT_LINK* = 4
  FLYOUT_DIVIDER* = 5
  FLYOUT_WINDOW* = 6
  FLYOUT_LINKAREA* = 7
  FLYOUT_LINKHEADER* = 8
  FLS_NORMAL* = 1
  FLS_SELECTED* = 2
  FLS_EMPHASIZED* = 3
  FLS_DISABLED* = 4
  FLYOUTLINK_NORMAL* = 1
  FLYOUTLINK_HOVER* = 2
  FBS_NORMAL* = 1
  FBS_EMPHASIZED* = 2
  FLH_NORMAL* = 1
  FLH_HOVER* = 2
  VSCLASS_HEADERSTYLE* = "HEADERSTYLE"
  VSCLASS_HEADER* = "HEADER"
  HP_HEADERITEM* = 1
  HP_HEADERITEMLEFT* = 2
  HP_HEADERITEMRIGHT* = 3
  HP_HEADERSORTARROW* = 4
  HP_HEADERDROPDOWN* = 5
  HP_HEADERDROPDOWNFILTER* = 6
  HP_HEADEROVERFLOW* = 7
  HBG_DETAILS* = 1
  HBG_ICON* = 2
  HIS_NORMAL* = 1
  HIS_HOT* = 2
  HIS_PRESSED* = 3
  HIS_SORTEDNORMAL* = 4
  HIS_SORTEDHOT* = 5
  HIS_SORTEDPRESSED* = 6
  HIS_ICONNORMAL* = 7
  HIS_ICONHOT* = 8
  HIS_ICONPRESSED* = 9
  HIS_ICONSORTEDNORMAL* = 10
  HIS_ICONSORTEDHOT* = 11
  HIS_ICONSORTEDPRESSED* = 12
  HILS_NORMAL* = 1
  HILS_HOT* = 2
  HILS_PRESSED* = 3
  HIRS_NORMAL* = 1
  HIRS_HOT* = 2
  HIRS_PRESSED* = 3
  HSAS_SORTEDUP* = 1
  HSAS_SORTEDDOWN* = 2
  HDDS_NORMAL* = 1
  HDDS_SOFTHOT* = 2
  HDDS_HOT* = 3
  HDDFS_NORMAL* = 1
  HDDFS_SOFTHOT* = 2
  HDDFS_HOT* = 3
  HOFS_NORMAL* = 1
  HOFS_HOT* = 2
  VSCLASS_LISTBOXSTYLE* = "LISTBOXSTYLE"
  VSCLASS_LISTBOX* = "LISTBOX"
  LBCP_BORDER_HSCROLL* = 1
  LBCP_BORDER_HVSCROLL* = 2
  LBCP_BORDER_NOSCROLL* = 3
  LBCP_BORDER_VSCROLL* = 4
  LBCP_ITEM* = 5
  LBPSH_NORMAL* = 1
  LBPSH_FOCUSED* = 2
  LBPSH_HOT* = 3
  LBPSH_DISABLED* = 4
  LBPSHV_NORMAL* = 1
  LBPSHV_FOCUSED* = 2
  LBPSHV_HOT* = 3
  LBPSHV_DISABLED* = 4
  LBPSN_NORMAL* = 1
  LBPSN_FOCUSED* = 2
  LBPSN_HOT* = 3
  LBPSN_DISABLED* = 4
  LBPSV_NORMAL* = 1
  LBPSV_FOCUSED* = 2
  LBPSV_HOT* = 3
  LBPSV_DISABLED* = 4
  LBPSI_HOT* = 1
  LBPSI_HOTSELECTED* = 2
  LBPSI_SELECTED* = 3
  LBPSI_SELECTEDNOTFOCUS* = 4
  VSCLASS_LISTVIEWSTYLE* = "LISTVIEWSTYLE"
  VSCLASS_LISTVIEW* = "LISTVIEW"
  LVP_LISTITEM* = 1
  LVP_LISTGROUP* = 2
  LVP_LISTDETAIL* = 3
  LVP_LISTSORTEDDETAIL* = 4
  LVP_EMPTYTEXT* = 5
  LVP_GROUPHEADER* = 6
  LVP_GROUPHEADERLINE* = 7
  LVP_EXPANDBUTTON* = 8
  LVP_COLLAPSEBUTTON* = 9
  LVP_COLUMNDETAIL* = 10
  LISS_NORMAL* = 1
  LISS_HOT* = 2
  LISS_SELECTED* = 3
  LISS_DISABLED* = 4
  LISS_SELECTEDNOTFOCUS* = 5
  LISS_HOTSELECTED* = 6
  LVGH_OPEN* = 1
  LVGH_OPENHOT* = 2
  LVGH_OPENSELECTED* = 3
  LVGH_OPENSELECTEDHOT* = 4
  LVGH_OPENSELECTEDNOTFOCUSED* = 5
  LVGH_OPENSELECTEDNOTFOCUSEDHOT* = 6
  LVGH_OPENMIXEDSELECTION* = 7
  LVGH_OPENMIXEDSELECTIONHOT* = 8
  LVGH_CLOSE* = 9
  LVGH_CLOSEHOT* = 10
  LVGH_CLOSESELECTED* = 11
  LVGH_CLOSESELECTEDHOT* = 12
  LVGH_CLOSESELECTEDNOTFOCUSED* = 13
  LVGH_CLOSESELECTEDNOTFOCUSEDHOT* = 14
  LVGH_CLOSEMIXEDSELECTION* = 15
  LVGH_CLOSEMIXEDSELECTIONHOT* = 16
  LVGHL_OPEN* = 1
  LVGHL_OPENHOT* = 2
  LVGHL_OPENSELECTED* = 3
  LVGHL_OPENSELECTEDHOT* = 4
  LVGHL_OPENSELECTEDNOTFOCUSED* = 5
  LVGHL_OPENSELECTEDNOTFOCUSEDHOT* = 6
  LVGHL_OPENMIXEDSELECTION* = 7
  LVGHL_OPENMIXEDSELECTIONHOT* = 8
  LVGHL_CLOSE* = 9
  LVGHL_CLOSEHOT* = 10
  LVGHL_CLOSESELECTED* = 11
  LVGHL_CLOSESELECTEDHOT* = 12
  LVGHL_CLOSESELECTEDNOTFOCUSED* = 13
  LVGHL_CLOSESELECTEDNOTFOCUSEDHOT* = 14
  LVGHL_CLOSEMIXEDSELECTION* = 15
  LVGHL_CLOSEMIXEDSELECTIONHOT* = 16
  LVEB_NORMAL* = 1
  LVEB_HOVER* = 2
  LVEB_PUSHED* = 3
  LVCB_NORMAL* = 1
  LVCB_HOVER* = 2
  LVCB_PUSHED* = 3
  VSCLASS_MENUSTYLE* = "MENUSTYLE"
  VSCLASS_MENU* = "MENU"
  MENU_MENUITEM_TMSCHEMA* = 1
  MENU_MENUDROPDOWN_TMSCHEMA* = 2
  MENU_MENUBARITEM_TMSCHEMA* = 3
  MENU_MENUBARDROPDOWN_TMSCHEMA* = 4
  MENU_CHEVRON_TMSCHEMA* = 5
  MENU_SEPARATOR_TMSCHEMA* = 6
  MENU_BARBACKGROUND* = 7
  MENU_BARITEM* = 8
  MENU_POPUPBACKGROUND* = 9
  MENU_POPUPBORDERS* = 10
  MENU_POPUPCHECK* = 11
  MENU_POPUPCHECKBACKGROUND* = 12
  MENU_POPUPGUTTER* = 13
  MENU_POPUPITEM* = 14
  MENU_POPUPSEPARATOR* = 15
  MENU_POPUPSUBMENU* = 16
  MENU_SYSTEMCLOSE* = 17
  MENU_SYSTEMMAXIMIZE* = 18
  MENU_SYSTEMMINIMIZE* = 19
  MENU_SYSTEMRESTORE* = 20
  MB_ACTIVE* = 1
  MB_INACTIVE* = 2
  MBI_NORMAL* = 1
  MBI_HOT* = 2
  MBI_PUSHED* = 3
  MBI_DISABLED* = 4
  MBI_DISABLEDHOT* = 5
  MBI_DISABLEDPUSHED* = 6
  MC_CHECKMARKNORMAL* = 1
  MC_CHECKMARKDISABLED* = 2
  MC_BULLETNORMAL* = 3
  MC_BULLETDISABLED* = 4
  MCB_DISABLED* = 1
  MCB_NORMAL* = 2
  MCB_BITMAP* = 3
  MPI_NORMAL* = 1
  MPI_HOT* = 2
  MPI_DISABLED* = 3
  MPI_DISABLEDHOT* = 4
  MSM_NORMAL* = 1
  MSM_DISABLED* = 2
  MSYSC_NORMAL* = 1
  MSYSC_DISABLED* = 2
  MSYSMX_NORMAL* = 1
  MSYSMX_DISABLED* = 2
  MSYSMN_NORMAL* = 1
  MSYSMN_DISABLED* = 2
  MSYSR_NORMAL* = 1
  MSYSR_DISABLED* = 2
  VSCLASS_NAVIGATION* = "NAVIGATION"
  NAV_BACKBUTTON* = 1
  NAV_FORWARDBUTTON* = 2
  NAV_MENUBUTTON* = 3
  NAV_BB_NORMAL* = 1
  NAV_BB_HOT* = 2
  NAV_BB_PRESSED* = 3
  NAV_BB_DISABLED* = 4
  NAV_FB_NORMAL* = 1
  NAV_FB_HOT* = 2
  NAV_FB_PRESSED* = 3
  NAV_FB_DISABLED* = 4
  NAV_MB_NORMAL* = 1
  NAV_MB_HOT* = 2
  NAV_MB_PRESSED* = 3
  NAV_MB_DISABLED* = 4
  VSCLASS_PROGRESSSTYLE* = "PROGRESSSTYLE"
  VSCLASS_PROGRESS* = "PROGRESS"
  PP_BAR* = 1
  PP_BARVERT* = 2
  PP_CHUNK* = 3
  PP_CHUNKVERT* = 4
  PP_FILL* = 5
  PP_FILLVERT* = 6
  PP_PULSEOVERLAY* = 7
  PP_MOVEOVERLAY* = 8
  PP_PULSEOVERLAYVERT* = 9
  PP_MOVEOVERLAYVERT* = 10
  PP_TRANSPARENTBAR* = 11
  PP_TRANSPARENTBARVERT* = 12
  PBBS_NORMAL* = 1
  PBBS_PARTIAL* = 2
  PBBVS_NORMAL* = 1
  PBBVS_PARTIAL* = 2
  PBFS_NORMAL* = 1
  PBFS_ERROR* = 2
  PBFS_PAUSED* = 3
  PBFS_PARTIAL* = 4
  PBFVS_NORMAL* = 1
  PBFVS_ERROR* = 2
  PBFVS_PAUSED* = 3
  PBFVS_PARTIAL* = 4
  VSCLASS_REBARSTYLE* = "REBARSTYLE"
  VSCLASS_REBAR* = "REBAR"
  RP_GRIPPER* = 1
  RP_GRIPPERVERT* = 2
  RP_BAND* = 3
  RP_CHEVRON* = 4
  RP_CHEVRONVERT* = 5
  RP_BACKGROUND* = 6
  RP_SPLITTER* = 7
  RP_SPLITTERVERT* = 8
  CHEVS_NORMAL* = 1
  CHEVS_HOT* = 2
  CHEVS_PRESSED* = 3
  CHEVSV_NORMAL* = 1
  CHEVSV_HOT* = 2
  CHEVSV_PRESSED* = 3
  SPLITS_NORMAL* = 1
  SPLITS_HOT* = 2
  SPLITS_PRESSED* = 3
  SPLITSV_NORMAL* = 1
  SPLITSV_HOT* = 2
  SPLITSV_PRESSED* = 3
  VSCLASS_SCROLLBARSTYLE* = "SCROLLBARSTYLE"
  VSCLASS_SCROLLBAR* = "SCROLLBAR"
  SBP_ARROWBTN* = 1
  SBP_THUMBBTNHORZ* = 2
  SBP_THUMBBTNVERT* = 3
  SBP_LOWERTRACKHORZ* = 4
  SBP_UPPERTRACKHORZ* = 5
  SBP_LOWERTRACKVERT* = 6
  SBP_UPPERTRACKVERT* = 7
  SBP_GRIPPERHORZ* = 8
  SBP_GRIPPERVERT* = 9
  SBP_SIZEBOX* = 10
  ABS_UPNORMAL* = 1
  ABS_UPHOT* = 2
  ABS_UPPRESSED* = 3
  ABS_UPDISABLED* = 4
  ABS_DOWNNORMAL* = 5
  ABS_DOWNHOT* = 6
  ABS_DOWNPRESSED* = 7
  ABS_DOWNDISABLED* = 8
  ABS_LEFTNORMAL* = 9
  ABS_LEFTHOT* = 10
  ABS_LEFTPRESSED* = 11
  ABS_LEFTDISABLED* = 12
  ABS_RIGHTNORMAL* = 13
  ABS_RIGHTHOT* = 14
  ABS_RIGHTPRESSED* = 15
  ABS_RIGHTDISABLED* = 16
  ABS_UPHOVER* = 17
  ABS_DOWNHOVER* = 18
  ABS_LEFTHOVER* = 19
  ABS_RIGHTHOVER* = 20
  SCRBS_NORMAL* = 1
  SCRBS_HOT* = 2
  SCRBS_PRESSED* = 3
  SCRBS_DISABLED* = 4
  SCRBS_HOVER* = 5
  SZB_RIGHTALIGN* = 1
  SZB_LEFTALIGN* = 2
  SZB_TOPRIGHTALIGN* = 3
  SZB_TOPLEFTALIGN* = 4
  SZB_HALFBOTTOMRIGHTALIGN* = 5
  SZB_HALFBOTTOMLEFTALIGN* = 6
  SZB_HALFTOPRIGHTALIGN* = 7
  SZB_HALFTOPLEFTALIGN* = 8
  VSCLASS_SPINSTYLE* = "SPINSTYLE"
  VSCLASS_SPIN* = "SPIN"
  SPNP_UP* = 1
  SPNP_DOWN* = 2
  SPNP_UPHORZ* = 3
  SPNP_DOWNHORZ* = 4
  UPS_NORMAL* = 1
  UPS_HOT* = 2
  UPS_PRESSED* = 3
  UPS_DISABLED* = 4
  DNS_NORMAL* = 1
  DNS_HOT* = 2
  DNS_PRESSED* = 3
  DNS_DISABLED* = 4
  UPHZS_NORMAL* = 1
  UPHZS_HOT* = 2
  UPHZS_PRESSED* = 3
  UPHZS_DISABLED* = 4
  DNHZS_NORMAL* = 1
  DNHZS_HOT* = 2
  DNHZS_PRESSED* = 3
  DNHZS_DISABLED* = 4
  VSCLASS_STATUSSTYLE* = "STATUSSTYLE"
  VSCLASS_STATUS* = "STATUS"
  SP_PANE* = 1
  SP_GRIPPERPANE* = 2
  SP_GRIPPER* = 3
  VSCLASS_TABSTYLE* = "TABSTYLE"
  VSCLASS_TAB* = "TAB"
  TABP_TABITEM* = 1
  TABP_TABITEMLEFTEDGE* = 2
  TABP_TABITEMRIGHTEDGE* = 3
  TABP_TABITEMBOTHEDGE* = 4
  TABP_TOPTABITEM* = 5
  TABP_TOPTABITEMLEFTEDGE* = 6
  TABP_TOPTABITEMRIGHTEDGE* = 7
  TABP_TOPTABITEMBOTHEDGE* = 8
  TABP_PANE* = 9
  TABP_BODY* = 10
  TABP_AEROWIZARDBODY* = 11
  TIS_NORMAL* = 1
  TIS_HOT* = 2
  TIS_SELECTED* = 3
  TIS_DISABLED* = 4
  TIS_FOCUSED* = 5
  TILES_NORMAL* = 1
  TILES_HOT* = 2
  TILES_SELECTED* = 3
  TILES_DISABLED* = 4
  TILES_FOCUSED* = 5
  TIRES_NORMAL* = 1
  TIRES_HOT* = 2
  TIRES_SELECTED* = 3
  TIRES_DISABLED* = 4
  TIRES_FOCUSED* = 5
  TIBES_NORMAL* = 1
  TIBES_HOT* = 2
  TIBES_SELECTED* = 3
  TIBES_DISABLED* = 4
  TIBES_FOCUSED* = 5
  TTIS_NORMAL* = 1
  TTIS_HOT* = 2
  TTIS_SELECTED* = 3
  TTIS_DISABLED* = 4
  TTIS_FOCUSED* = 5
  TTILES_NORMAL* = 1
  TTILES_HOT* = 2
  TTILES_SELECTED* = 3
  TTILES_DISABLED* = 4
  TTILES_FOCUSED* = 5
  TTIRES_NORMAL* = 1
  TTIRES_HOT* = 2
  TTIRES_SELECTED* = 3
  TTIRES_DISABLED* = 4
  TTIRES_FOCUSED* = 5
  TTIBES_NORMAL* = 1
  TTIBES_HOT* = 2
  TTIBES_SELECTED* = 3
  TTIBES_DISABLED* = 4
  TTIBES_FOCUSED* = 5
  VSCLASS_TASKDIALOGSTYLE* = "TASKDIALOGSTYLE"
  VSCLASS_TASKDIALOG* = "TASKDIALOG"
  TDLG_PRIMARYPANEL* = 1
  TDLG_MAININSTRUCTIONPANE* = 2
  TDLG_MAINICON* = 3
  TDLG_CONTENTPANE* = 4
  TDLG_CONTENTICON* = 5
  TDLG_EXPANDEDCONTENT* = 6
  TDLG_COMMANDLINKPANE* = 7
  TDLG_SECONDARYPANEL* = 8
  TDLG_CONTROLPANE* = 9
  TDLG_BUTTONSECTION* = 10
  TDLG_BUTTONWRAPPER* = 11
  TDLG_EXPANDOTEXT* = 12
  TDLG_EXPANDOBUTTON* = 13
  TDLG_VERIFICATIONTEXT* = 14
  TDLG_FOOTNOTEPANE* = 15
  TDLG_FOOTNOTEAREA* = 16
  TDLG_FOOTNOTESEPARATOR* = 17
  TDLG_EXPANDEDFOOTERAREA* = 18
  TDLG_PROGRESSBAR* = 19
  TDLG_IMAGEALIGNMENT* = 20
  TDLG_RADIOBUTTONPANE* = 21
  TDLGCPS_STANDALONE* = 1
  TDLGEBS_NORMAL* = 1
  TDLGEBS_HOVER* = 2
  TDLGEBS_PRESSED* = 3
  TDLGEBS_EXPANDEDNORMAL* = 4
  TDLGEBS_EXPANDEDHOVER* = 5
  TDLGEBS_EXPANDEDPRESSED* = 6
  VSCLASS_TEXTSTYLE* = "TEXTSTYLE"
  TEXT_MAININSTRUCTION* = 1
  TEXT_INSTRUCTION* = 2
  TEXT_BODYTITLE* = 3
  TEXT_BODYTEXT* = 4
  TEXT_SECONDARYTEXT* = 5
  TEXT_HYPERLINKTEXT* = 6
  TEXT_EXPANDED* = 7
  TEXT_LABEL* = 8
  TEXT_CONTROLLABEL* = 9
  TS_HYPERLINK_NORMAL* = 1
  TS_HYPERLINK_HOT* = 2
  TS_HYPERLINK_PRESSED* = 3
  TS_HYPERLINK_DISABLED* = 4
  TS_CONTROLLABEL_NORMAL* = 1
  TS_CONTROLLABEL_DISABLED* = 2
  VSCLASS_TOOLBARSTYLE* = "TOOLBARSTYLE"
  VSCLASS_TOOLBAR* = "TOOLBAR"
  TP_BUTTON* = 1
  TP_DROPDOWNBUTTON* = 2
  TP_SPLITBUTTON* = 3
  TP_SPLITBUTTONDROPDOWN* = 4
  TP_SEPARATOR* = 5
  TP_SEPARATORVERT* = 6
  TP_DROPDOWNBUTTONGLYPH* = 7
  TS_NORMAL* = 1
  TS_HOT* = 2
  TS_PRESSED* = 3
  TS_DISABLED* = 4
  TS_CHECKED* = 5
  TS_HOTCHECKED* = 6
  TS_NEARHOT* = 7
  TS_OTHERSIDEHOT* = 8
  VSCLASS_TOOLTIPSTYLE* = "TOOLTIPSTYLE"
  VSCLASS_TOOLTIP* = "TOOLTIP"
  TTP_STANDARD* = 1
  TTP_STANDARDTITLE* = 2
  TTP_BALLOON* = 3
  TTP_BALLOONTITLE* = 4
  TTP_CLOSE* = 5
  TTP_BALLOONSTEM* = 6
  TTP_WRENCH* = 7
  TTCS_NORMAL* = 1
  TTCS_HOT* = 2
  TTCS_PRESSED* = 3
  TTSS_NORMAL* = 1
  TTSS_LINK* = 2
  TTBS_NORMAL* = 1
  TTBS_LINK* = 2
  TTBSS_POINTINGUPLEFTWALL* = 1
  TTBSS_POINTINGUPCENTERED* = 2
  TTBSS_POINTINGUPRIGHTWALL* = 3
  TTBSS_POINTINGDOWNRIGHTWALL* = 4
  TTBSS_POINTINGDOWNCENTERED* = 5
  TTBSS_POINTINGDOWNLEFTWALL* = 6
  TTWS_NORMAL* = 1
  TTWS_HOT* = 2
  TTWS_PRESSED* = 3
  VSCLASS_TRACKBARSTYLE* = "TRACKBARSTYLE"
  VSCLASS_TRACKBAR* = "TRACKBAR"
  TKP_TRACK* = 1
  TKP_TRACKVERT* = 2
  TKP_THUMB* = 3
  TKP_THUMBBOTTOM* = 4
  TKP_THUMBTOP* = 5
  TKP_THUMBVERT* = 6
  TKP_THUMBLEFT* = 7
  TKP_THUMBRIGHT* = 8
  TKP_TICS* = 9
  TKP_TICSVERT* = 10
  TKS_NORMAL* = 1
  TRS_NORMAL* = 1
  TRVS_NORMAL* = 1
  TUS_NORMAL* = 1
  TUS_HOT* = 2
  TUS_PRESSED* = 3
  TUS_FOCUSED* = 4
  TUS_DISABLED* = 5
  TUBS_NORMAL* = 1
  TUBS_HOT* = 2
  TUBS_PRESSED* = 3
  TUBS_FOCUSED* = 4
  TUBS_DISABLED* = 5
  TUTS_NORMAL* = 1
  TUTS_HOT* = 2
  TUTS_PRESSED* = 3
  TUTS_FOCUSED* = 4
  TUTS_DISABLED* = 5
  TUVS_NORMAL* = 1
  TUVS_HOT* = 2
  TUVS_PRESSED* = 3
  TUVS_FOCUSED* = 4
  TUVS_DISABLED* = 5
  TUVLS_NORMAL* = 1
  TUVLS_HOT* = 2
  TUVLS_PRESSED* = 3
  TUVLS_FOCUSED* = 4
  TUVLS_DISABLED* = 5
  TUVRS_NORMAL* = 1
  TUVRS_HOT* = 2
  TUVRS_PRESSED* = 3
  TUVRS_FOCUSED* = 4
  TUVRS_DISABLED* = 5
  TSS_NORMAL* = 1
  TSVS_NORMAL* = 1
  VSCLASS_TREEVIEWSTYLE* = "TREEVIEWSTYLE"
  VSCLASS_TREEVIEW* = "TREEVIEW"
  TVP_TREEITEM* = 1
  TVP_GLYPH* = 2
  TVP_BRANCH* = 3
  TVP_HOTGLYPH* = 4
  TREIS_NORMAL* = 1
  TREIS_HOT* = 2
  TREIS_SELECTED* = 3
  TREIS_DISABLED* = 4
  TREIS_SELECTEDNOTFOCUS* = 5
  TREIS_HOTSELECTED* = 6
  GLPS_CLOSED* = 1
  GLPS_OPENED* = 2
  HGLPS_CLOSED* = 1
  HGLPS_OPENED* = 2
  VSCLASS_WINDOWSTYLE* = "WINDOWSTYLE"
  VSCLASS_WINDOW* = "WINDOW"
  WP_CAPTION* = 1
  WP_SMALLCAPTION* = 2
  WP_MINCAPTION* = 3
  WP_SMALLMINCAPTION* = 4
  WP_MAXCAPTION* = 5
  WP_SMALLMAXCAPTION* = 6
  WP_FRAMELEFT* = 7
  WP_FRAMERIGHT* = 8
  WP_FRAMEBOTTOM* = 9
  WP_SMALLFRAMELEFT* = 10
  WP_SMALLFRAMERIGHT* = 11
  WP_SMALLFRAMEBOTTOM* = 12
  WP_SYSBUTTON* = 13
  WP_MDISYSBUTTON* = 14
  WP_MINBUTTON* = 15
  WP_MDIMINBUTTON* = 16
  WP_MAXBUTTON* = 17
  WP_CLOSEBUTTON* = 18
  WP_SMALLCLOSEBUTTON* = 19
  WP_MDICLOSEBUTTON* = 20
  WP_RESTOREBUTTON* = 21
  WP_MDIRESTOREBUTTON* = 22
  WP_HELPBUTTON* = 23
  WP_MDIHELPBUTTON* = 24
  WP_HORZSCROLL* = 25
  WP_HORZTHUMB* = 26
  WP_VERTSCROLL* = 27
  WP_VERTTHUMB* = 28
  WP_DIALOG* = 29
  WP_CAPTIONSIZINGTEMPLATE* = 30
  WP_SMALLCAPTIONSIZINGTEMPLATE* = 31
  WP_FRAMELEFTSIZINGTEMPLATE* = 32
  WP_SMALLFRAMELEFTSIZINGTEMPLATE* = 33
  WP_FRAMERIGHTSIZINGTEMPLATE* = 34
  WP_SMALLFRAMERIGHTSIZINGTEMPLATE* = 35
  WP_FRAMEBOTTOMSIZINGTEMPLATE* = 36
  WP_SMALLFRAMEBOTTOMSIZINGTEMPLATE* = 37
  WP_FRAME* = 38
  FS_ACTIVE* = 1
  FS_INACTIVE* = 2
  CS_ACTIVE* = 1
  CS_INACTIVE* = 2
  CS_DISABLED* = 3
  MXCS_ACTIVE* = 1
  MXCS_INACTIVE* = 2
  MXCS_DISABLED* = 3
  MNCS_ACTIVE* = 1
  MNCS_INACTIVE* = 2
  MNCS_DISABLED* = 3
  HSS_NORMAL* = 1
  HSS_HOT* = 2
  HSS_PUSHED* = 3
  HSS_DISABLED* = 4
  HTS_NORMAL* = 1
  HTS_HOT* = 2
  HTS_PUSHED* = 3
  HTS_DISABLED* = 4
  VSS_NORMAL* = 1
  VSS_HOT* = 2
  VSS_PUSHED* = 3
  VSS_DISABLED* = 4
  VTS_NORMAL* = 1
  VTS_HOT* = 2
  VTS_PUSHED* = 3
  VTS_DISABLED* = 4
  SBS_NORMAL* = 1
  SBS_HOT* = 2
  SBS_PUSHED* = 3
  SBS_DISABLED* = 4
  MINBS_NORMAL* = 1
  MINBS_HOT* = 2
  MINBS_PUSHED* = 3
  MINBS_DISABLED* = 4
  MAXBS_NORMAL* = 1
  MAXBS_HOT* = 2
  MAXBS_PUSHED* = 3
  MAXBS_DISABLED* = 4
  RBS_NORMAL* = 1
  RBS_HOT* = 2
  RBS_PUSHED* = 3
  RBS_DISABLED* = 4
  HBS_NORMAL* = 1
  HBS_HOT* = 2
  HBS_PUSHED* = 3
  HBS_DISABLED* = 4
  CBS_NORMAL* = 1
  CBS_HOT* = 2
  CBS_PUSHED* = 3
  CBS_DISABLED* = 4
  BT_IMAGEFILE* = 0
  BT_BORDERFILL* = 1
  BT_NONE* = 2
  IL_VERTICAL* = 0
  IL_HORIZONTAL* = 1
  BT_RECT* = 0
  BT_ROUNDRECT* = 1
  BT_ELLIPSE* = 2
  FT_SOLID* = 0
  FT_VERTGRADIENT* = 1
  FT_HORZGRADIENT* = 2
  FT_RADIALGRADIENT* = 3
  FT_TILEIMAGE* = 4
  ST_TRUESIZE* = 0
  ST_STRETCH* = 1
  ST_TILE* = 2
  HA_LEFT* = 0
  HA_CENTER* = 1
  HA_RIGHT* = 2
  CA_LEFT* = 0
  CA_CENTER* = 1
  CA_RIGHT* = 2
  VA_TOP* = 0
  VA_CENTER* = 1
  VA_BOTTOM* = 2
  OT_TOPLEFT* = 0
  OT_TOPRIGHT* = 1
  OT_TOPMIDDLE* = 2
  OT_BOTTOMLEFT* = 3
  OT_BOTTOMRIGHT* = 4
  OT_BOTTOMMIDDLE* = 5
  OT_MIDDLELEFT* = 6
  OT_MIDDLERIGHT* = 7
  OT_LEFTOFCAPTION* = 8
  OT_RIGHTOFCAPTION* = 9
  OT_LEFTOFLASTBUTTON* = 10
  OT_RIGHTOFLASTBUTTON* = 11
  OT_ABOVELASTBUTTON* = 12
  OT_BELOWLASTBUTTON* = 13
  ICE_NONE* = 0
  ICE_GLOW* = 1
  ICE_SHADOW* = 2
  ICE_PULSE* = 3
  ICE_ALPHA* = 4
  TST_NONE* = 0
  TST_SINGLE* = 1
  TST_CONTINUOUS* = 2
  GT_NONE* = 0
  GT_IMAGEGLYPH* = 1
  GT_FONTGLYPH* = 2
  IST_NONE* = 0
  IST_SIZE* = 1
  IST_DPI* = 2
  TSST_NONE* = 0
  TSST_SIZE* = 1
  TSST_DPI* = 2
  GFST_NONE* = 0
  GFST_SIZE* = 1
  GFST_DPI* = 2
  TMT_RESERVEDLOW* = 0
  TMT_RESERVEDHIGH* = 7999
  TMT_DIBDATA* = 2
  TMT_GLYPHDIBDATA* = 8
  TMT_ENUM* = 200
  TMT_STRING* = 201
  TMT_INT* = 202
  TMT_BOOL* = 203
  TMT_COLOR* = 204
  TMT_MARGINS* = 205
  TMT_FILENAME* = 206
  TMT_SIZE* = 207
  TMT_POSITION* = 208
  TMT_RECT* = 209
  TMT_FONT* = 210
  TMT_INTLIST* = 211
  TMT_HBITMAP* = 212
  TMT_DISKSTREAM* = 213
  TMT_STREAM* = 214
  TMT_BITMAPREF* = 215
  TMT_COLORSCHEMES* = 401
  TMT_SIZES* = 402
  TMT_CHARSET* = 403
  TMT_NAME* = 600
  TMT_DISPLAYNAME* = 601
  TMT_TOOLTIP* = 602
  TMT_COMPANY* = 603
  TMT_AUTHOR* = 604
  TMT_COPYRIGHT* = 605
  TMT_URL* = 606
  TMT_VERSION* = 607
  TMT_DESCRIPTION* = 608
  TMT_FIRST_RCSTRING_NAME* = TMT_DISPLAYNAME
  TMT_LAST_RCSTRING_NAME* = TMT_DESCRIPTION
  TMT_CAPTIONFONT* = 801
  TMT_SMALLCAPTIONFONT* = 802
  TMT_MENUFONT* = 803
  TMT_STATUSFONT* = 804
  TMT_MSGBOXFONT* = 805
  TMT_ICONTITLEFONT* = 806
  TMT_HEADING1FONT* = 807
  TMT_HEADING2FONT* = 808
  TMT_BODYFONT* = 809
  TMT_FIRSTFONT* = TMT_CAPTIONFONT
  TMT_LASTFONT* = TMT_BODYFONT
  TMT_FLATMENUS* = 1001
  TMT_FIRSTBOOL* = TMT_FLATMENUS
  TMT_LASTBOOL* = TMT_FLATMENUS
  TMT_SIZINGBORDERWIDTH* = 1201
  TMT_SCROLLBARWIDTH* = 1202
  TMT_SCROLLBARHEIGHT* = 1203
  TMT_CAPTIONBARWIDTH* = 1204
  TMT_CAPTIONBARHEIGHT* = 1205
  TMT_SMCAPTIONBARWIDTH* = 1206
  TMT_SMCAPTIONBARHEIGHT* = 1207
  TMT_MENUBARWIDTH* = 1208
  TMT_MENUBARHEIGHT* = 1209
  TMT_PADDEDBORDERWIDTH* = 1210
  TMT_FIRSTSIZE* = TMT_SIZINGBORDERWIDTH
  TMT_LASTSIZE* = TMT_PADDEDBORDERWIDTH
  TMT_MINCOLORDEPTH* = 1301
  TMT_FIRSTINT* = TMT_MINCOLORDEPTH
  TMT_LASTINT* = TMT_MINCOLORDEPTH
  TMT_CSSNAME* = 1401
  TMT_XMLNAME* = 1402
  TMT_LASTUPDATED* = 1403
  TMT_ALIAS* = 1404
  TMT_FIRSTSTRING* = TMT_CSSNAME
  TMT_LASTSTRING* = TMT_ALIAS
  TMT_SCROLLBAR* = 1601
  TMT_BACKGROUND* = 1602
  TMT_ACTIVECAPTION* = 1603
  TMT_INACTIVECAPTION* = 1604
  TMT_MENU* = 1605
  TMT_WINDOW* = 1606
  TMT_WINDOWFRAME* = 1607
  TMT_MENUTEXT* = 1608
  TMT_WINDOWTEXT* = 1609
  TMT_CAPTIONTEXT* = 1610
  TMT_ACTIVEBORDER* = 1611
  TMT_INACTIVEBORDER* = 1612
  TMT_APPWORKSPACE* = 1613
  TMT_HIGHLIGHT* = 1614
  TMT_HIGHLIGHTTEXT* = 1615
  TMT_BTNFACE* = 1616
  TMT_BTNSHADOW* = 1617
  TMT_GRAYTEXT* = 1618
  TMT_BTNTEXT* = 1619
  TMT_INACTIVECAPTIONTEXT* = 1620
  TMT_BTNHIGHLIGHT* = 1621
  TMT_DKSHADOW3D* = 1622
  TMT_LIGHT3D* = 1623
  TMT_INFOTEXT* = 1624
  TMT_INFOBK* = 1625
  TMT_BUTTONALTERNATEFACE* = 1626
  TMT_HOTTRACKING* = 1627
  TMT_GRADIENTACTIVECAPTION* = 1628
  TMT_GRADIENTINACTIVECAPTION* = 1629
  TMT_MENUHILIGHT* = 1630
  TMT_MENUBAR* = 1631
  TMT_FIRSTCOLOR* = TMT_SCROLLBAR
  TMT_LASTCOLOR* = TMT_MENUBAR
  TMT_FROMHUE1* = 1801
  TMT_FROMHUE2* = 1802
  TMT_FROMHUE3* = 1803
  TMT_FROMHUE4* = 1804
  TMT_FROMHUE5* = 1805
  TMT_TOHUE1* = 1806
  TMT_TOHUE2* = 1807
  TMT_TOHUE3* = 1808
  TMT_TOHUE4* = 1809
  TMT_TOHUE5* = 1810
  TMT_FROMCOLOR1* = 2001
  TMT_FROMCOLOR2* = 2002
  TMT_FROMCOLOR3* = 2003
  TMT_FROMCOLOR4* = 2004
  TMT_FROMCOLOR5* = 2005
  TMT_TOCOLOR1* = 2006
  TMT_TOCOLOR2* = 2007
  TMT_TOCOLOR3* = 2008
  TMT_TOCOLOR4* = 2009
  TMT_TOCOLOR5* = 2010
  TMT_TRANSPARENT* = 2201
  TMT_AUTOSIZE* = 2202
  TMT_BORDERONLY* = 2203
  TMT_COMPOSITED* = 2204
  TMT_BGFILL* = 2205
  TMT_GLYPHTRANSPARENT* = 2206
  TMT_GLYPHONLY* = 2207
  TMT_ALWAYSSHOWSIZINGBAR* = 2208
  TMT_MIRRORIMAGE* = 2209
  TMT_UNIFORMSIZING* = 2210
  TMT_INTEGRALSIZING* = 2211
  TMT_SOURCEGROW* = 2212
  TMT_SOURCESHRINK* = 2213
  TMT_DRAWBORDERS* = 2214
  TMT_NOETCHEDEFFECT* = 2215
  TMT_TEXTAPPLYOVERLAY* = 2216
  TMT_TEXTGLOW* = 2217
  TMT_TEXTITALIC* = 2218
  TMT_COMPOSITEDOPAQUE* = 2219
  TMT_LOCALIZEDMIRRORIMAGE* = 2220
  TMT_IMAGECOUNT* = 2401
  TMT_ALPHALEVEL* = 2402
  TMT_BORDERSIZE* = 2403
  TMT_ROUNDCORNERWIDTH* = 2404
  TMT_ROUNDCORNERHEIGHT* = 2405
  TMT_GRADIENTRATIO1* = 2406
  TMT_GRADIENTRATIO2* = 2407
  TMT_GRADIENTRATIO3* = 2408
  TMT_GRADIENTRATIO4* = 2409
  TMT_GRADIENTRATIO5* = 2410
  TMT_PROGRESSCHUNKSIZE* = 2411
  TMT_PROGRESSSPACESIZE* = 2412
  TMT_SATURATION* = 2413
  TMT_TEXTBORDERSIZE* = 2414
  TMT_ALPHATHRESHOLD* = 2415
  TMT_WIDTH* = 2416
  TMT_HEIGHT* = 2417
  TMT_GLYPHINDEX* = 2418
  TMT_TRUESIZESTRETCHMARK* = 2419
  TMT_MINDPI1* = 2420
  TMT_MINDPI2* = 2421
  TMT_MINDPI3* = 2422
  TMT_MINDPI4* = 2423
  TMT_MINDPI5* = 2424
  TMT_TEXTGLOWSIZE* = 2425
  TMT_FRAMESPERSECOND* = 2426
  TMT_PIXELSPERFRAME* = 2427
  TMT_ANIMATIONDELAY* = 2428
  TMT_GLOWINTENSITY* = 2429
  TMT_OPACITY* = 2430
  TMT_COLORIZATIONCOLOR* = 2431
  TMT_COLORIZATIONOPACITY* = 2432
  TMT_GLYPHFONT* = 2601
  TMT_IMAGEFILE* = 3001
  TMT_IMAGEFILE1* = 3002
  TMT_IMAGEFILE2* = 3003
  TMT_IMAGEFILE3* = 3004
  TMT_IMAGEFILE4* = 3005
  TMT_IMAGEFILE5* = 3006
  TMT_GLYPHIMAGEFILE* = 3008
  TMT_TEXT* = 3201
  TMT_CLASSICVALUE* = 3202
  TMT_OFFSET* = 3401
  TMT_TEXTSHADOWOFFSET* = 3402
  TMT_MINSIZE* = 3403
  TMT_MINSIZE1* = 3404
  TMT_MINSIZE2* = 3405
  TMT_MINSIZE3* = 3406
  TMT_MINSIZE4* = 3407
  TMT_MINSIZE5* = 3408
  TMT_NORMALSIZE* = 3409
  TMT_SIZINGMARGINS* = 3601
  TMT_CONTENTMARGINS* = 3602
  TMT_CAPTIONMARGINS* = 3603
  TMT_BORDERCOLOR* = 3801
  TMT_FILLCOLOR* = 3802
  TMT_TEXTCOLOR* = 3803
  TMT_EDGELIGHTCOLOR* = 3804
  TMT_EDGEHIGHLIGHTCOLOR* = 3805
  TMT_EDGESHADOWCOLOR* = 3806
  TMT_EDGEDKSHADOWCOLOR* = 3807
  TMT_EDGEFILLCOLOR* = 3808
  TMT_TRANSPARENTCOLOR* = 3809
  TMT_GRADIENTCOLOR1* = 3810
  TMT_GRADIENTCOLOR2* = 3811
  TMT_GRADIENTCOLOR3* = 3812
  TMT_GRADIENTCOLOR4* = 3813
  TMT_GRADIENTCOLOR5* = 3814
  TMT_SHADOWCOLOR* = 3815
  TMT_GLOWCOLOR* = 3816
  TMT_TEXTBORDERCOLOR* = 3817
  TMT_TEXTSHADOWCOLOR* = 3818
  TMT_GLYPHTEXTCOLOR* = 3819
  TMT_GLYPHTRANSPARENTCOLOR* = 3820
  TMT_FILLCOLORHINT* = 3821
  TMT_BORDERCOLORHINT* = 3822
  TMT_ACCENTCOLORHINT* = 3823
  TMT_TEXTCOLORHINT* = 3824
  TMT_HEADING1TEXTCOLOR* = 3825
  TMT_HEADING2TEXTCOLOR* = 3826
  TMT_BODYTEXTCOLOR* = 3827
  TMT_BGTYPE* = 4001
  TMT_BORDERTYPE* = 4002
  TMT_FILLTYPE* = 4003
  TMT_SIZINGTYPE* = 4004
  TMT_HALIGN* = 4005
  TMT_CONTENTALIGNMENT* = 4006
  TMT_VALIGN* = 4007
  TMT_OFFSETTYPE* = 4008
  TMT_ICONEFFECT* = 4009
  TMT_TEXTSHADOWTYPE* = 4010
  TMT_IMAGELAYOUT* = 4011
  TMT_GLYPHTYPE* = 4012
  TMT_IMAGESELECTTYPE* = 4013
  TMT_GLYPHFONTSIZINGTYPE* = 4014
  TMT_TRUESIZESCALINGTYPE* = 4015
  TMT_USERPICTURE* = 5001
  TMT_DEFAULTPANESIZE* = 5002
  TMT_BLENDCOLOR* = 5003
  TMT_CUSTOMSPLITRECT* = 5004
  TMT_ANIMATIONBUTTONRECT* = 5005
  TMT_ANIMATIONDURATION* = 5006
  TMT_TRANSITIONDURATIONS* = 6000
  TMT_SCALEDBACKGROUND* = 7001
  TMT_ATLASIMAGE* = 8000
  TMT_ATLASINPUTIMAGE* = 8001
  TMT_ATLASRECT* = 8002
  VSCLASS_LINK* = "LINK"
  LP_HYPERLINK* = 1
  HLS_NORMALTEXT* = 1
  HLS_LINKTEXT* = 2
  VSCLASS_EMPTYMARKUP* = "EMPTYMARKUP"
  EMP_MARKUPTEXT* = 1
  EMT_NORMALTEXT* = 1
  EMT_LINKTEXT* = 2
  VSCLASS_STATIC* = "STATIC"
  STAT_TEXT* = 1
  VSCLASS_PAGE* = "PAGE"
  PGRP_UP* = 1
  PGRP_DOWN* = 2
  PGRP_UPHORZ* = 3
  PGRP_DOWNHORZ* = 4
  VSCLASS_MONTHCAL* = "MONTHCA"
  MC_BACKGROUND* = 1
  MC_BORDERS* = 2
  MC_GRIDBACKGROUND* = 3
  MC_COLHEADERSPLITTER* = 4
  MC_GRIDCELLBACKGROUND* = 5
  MC_GRIDCELL* = 6
  MC_GRIDCELLUPPER* = 7
  MC_TRAILINGGRIDCELL* = 8
  MC_TRAILINGGRIDCELLUPPER* = 9
  MC_NAVNEXT* = 10
  MC_NAVPREV* = 11
  MCGCB_SELECTED* = 1
  MCGCB_HOT* = 2
  MCGCB_SELECTEDHOT* = 3
  MCGCB_SELECTEDNOTFOCUSED* = 4
  MCGCB_TODAY* = 5
  MCGC_HOT* = 1
  MCGC_HASSTATE* = 2
  MCGC_HASSTATEHOT* = 3
  MCGC_TODAY* = 4
  MCGCU_HOT* = 1
  MCGCU_HASSTATE* = 2
  MCGCU_HASSTATEHOT* = 3
  MCTGC_HOT* = 1
  MCTGC_HASSTATE* = 2
  MCTGC_HASSTATEHOT* = 3
  MCTGC_TODAY* = 4
  MCTGCU_HOT* = 1
  MCTGCU_HASSTATE* = 2
  MCTGCU_HASSTATEHOT* = 3
  MCNN_NORMAL* = 1
  MCNN_HOT* = 2
  MCNN_PRESSED* = 3
  MCNN_DISABLED* = 4
  MCNP_NORMAL* = 1
  MCNP_HOT* = 2
  MCNP_PRESSED* = 3
  MCNP_DISABLED* = 4
  VSCLASS_CLOCK* = "CLOCK"
  CLP_TIME* = 1
  CLS_NORMAL* = 1
  CLS_HOT* = 2
  CLS_PRESSED* = 3
  VSCLASS_TRAYNOTIFY* = "TRAYNOTIFY"
  TNP_BACKGROUND* = 1
  TNP_ANIMBACKGROUND* = 2
  VSCLASS_TASKBAR* = "TASKBAR"
  TBP_BACKGROUNDBOTTOM* = 1
  TBP_BACKGROUNDRIGHT* = 2
  TBP_BACKGROUNDTOP* = 3
  TBP_BACKGROUNDLEFT* = 4
  TBP_SIZINGBARBOTTOM* = 5
  TBP_SIZINGBARRIGHT* = 6
  TBP_SIZINGBARTOP* = 7
  TBP_SIZINGBARLEFT* = 8
  VSCLASS_TASKBAND* = "TASKBAND"
  TDP_GROUPCOUNT* = 1
  TDP_FLASHBUTTON* = 2
  TDP_FLASHBUTTONGROUPMENU* = 3
  VSCLASS_STARTPANEL* = "STARTPANE"
  SPP_USERPANE* = 1
  SPP_MOREPROGRAMS* = 2
  SPP_MOREPROGRAMSARROW* = 3
  SPP_PROGLIST* = 4
  SPP_PROGLISTSEPARATOR* = 5
  SPP_PLACESLIST* = 6
  SPP_PLACESLISTSEPARATOR* = 7
  SPP_LOGOFF* = 8
  SPP_LOGOFFBUTTONS* = 9
  SPP_USERPICTURE* = 10
  SPP_PREVIEW* = 11
  SPP_MOREPROGRAMSTAB* = 12
  SPP_NSCHOST* = 13
  SPP_SOFTWAREEXPLORER* = 14
  SPP_OPENBOX* = 15
  SPP_SEARCHVIEW* = 16
  SPP_MOREPROGRAMSARROWBACK* = 17
  SPP_TOPMATCH* = 18
  SPP_LOGOFFSPLITBUTTONDROPDOWN* = 19
  SPMPT_NORMAL* = 1
  SPMPT_HOT* = 2
  SPMPT_SELECTED* = 3
  SPMPT_DISABLED* = 4
  SPMPT_FOCUSED* = 5
  SPSE_NORMAL* = 1
  SPSE_HOT* = 2
  SPSE_SELECTED* = 3
  SPSE_DISABLED* = 4
  SPSE_FOCUSED* = 5
  SPOB_NORMAL* = 1
  SPOB_HOT* = 2
  SPOB_SELECTED* = 3
  SPOB_DISABLED* = 4
  SPOB_FOCUSED* = 5
  SPS_NORMAL* = 1
  SPS_HOT* = 2
  SPS_PRESSED* = 3
  SPSB_NORMAL* = 1
  SPSB_HOT* = 2
  SPSB_PRESSED* = 3
  SPLS_NORMAL* = 1
  SPLS_HOT* = 2
  SPLS_PRESSED* = 3
  VSCLASS_MENUBAND* = "MENUBAND"
  MDP_NEWAPPBUTTON* = 1
  MDP_SEPERATOR* = 2
  MDS_NORMAL* = 1
  MDS_HOT* = 2
  MDS_PRESSED* = 3
  MDS_DISABLED* = 4
  MDS_CHECKED* = 5
  MDS_HOTCHECKED* = 6
