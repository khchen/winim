#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#====================================================================

import winim/com

var obj = GetObject(r"winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
for i in obj.execQuery("select * from win32_process"):
  echo i.handle, ", ", i.name
