#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import winim/com

var obj = CreateObject("SAPI.SpVoice")
obj.speak "Nim is a statically typed, imperative programming language."
