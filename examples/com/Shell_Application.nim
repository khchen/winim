#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
#====================================================================

import winim/com

var obj = CreateObject("Shell.Application")
obj.MinimizeAll
obj.FileRun
obj.ControlPanelItem "INETCPL.cpl"

comScript:
  var oFolder = obj.BrowseForFolder(Title:="Select a Folder", RootFolder:=r"c:\")
  if not oFolder.isNull:
    for i in oFolder.Items:
      echo i
