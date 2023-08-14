#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
#====================================================================

import winim/com

var obj = CreateObject("WinHttp.WinHttpRequest.5.1")
obj.open("get", "http://www.google.com")
obj.send()
echo obj.responseText
