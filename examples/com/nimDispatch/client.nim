#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
#====================================================================

import winim/com

var obj = GetObject("nimDispatch")
echo obj.getString()
obj.setString("new string is hello world")
echo obj.getString()
obj.exit()
