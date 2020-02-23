#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#====================================================================

import winim/com

var obj = CreateObject("WinHttp.WinHttpRequest.5.1")
obj.open("get", "http://www.google.com")
obj.send()
echo obj.responseText
