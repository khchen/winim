#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#====================================================================

import winim/com

var obj = CreateObject("Shell.Application")
obj.MinimizeAll
obj.FileRun
obj.ControlPanelItem "INETCPL.cpl"

var oFolder = obj.BrowseForFolder(0, "Select a Folder", 0, r"c:\")
for i in oFolder.Items:
  echo i
