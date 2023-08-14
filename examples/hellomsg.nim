#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
#====================================================================

import winim

InitCommonControls() # Windows XP needs this
MessageBox(0, T"Hello, world !", T"Nim is Powerful", 0)
