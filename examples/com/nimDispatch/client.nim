#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2021 Ward
#
#====================================================================

import winim/com

var obj = GetObject("nimDispatch")
echo obj.getString()
obj.setString("new string is hello world")
echo obj.getString()
obj.exit()
