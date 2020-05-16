#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import winim/com

var obj = CreateObject("SAPI.SpVoice")
obj.speak "Nim is a statically typed, imperative programming language."
