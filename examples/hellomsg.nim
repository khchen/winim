#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import winim

InitCommonControls() # Windows XP needs this
MessageBox(0, T"Hello, world !", T"Nim is Powerful", 0)
