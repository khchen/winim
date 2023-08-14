#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
#====================================================================

import winim/com

var obj = CreateObject("SAPI.SpVoice")
obj.speak "Nim is a statically typed, imperative programming language."
