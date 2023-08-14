#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
#====================================================================

import winim/com

var wmi = GetObject(r"winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
for i in wmi.execQuery("select * from win32_process"):
  echo i.handle, ", ", i.name
