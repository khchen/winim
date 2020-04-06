#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#====================================================================

import winim/com

var wmi = GetObject(r"winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
for i in wmi.execQuery("select * from win32_process"):
  echo i.handle, ", ", i.name
