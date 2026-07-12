#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import winim/com

var obj = GetObject("nimDispatch")
echo obj.getString()
obj.setString("new string is hello world")
echo obj.getString()
obj.exit()
