#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import winim/com

let word = CreateObject("Word.Application")
for name in word.WdLineSpacing:
  echo name, ": ", word.WdLineSpacing[name]

echo word.WdLineSpacing.wdLineSpaceExactly

word.Quit
COM_FullRelease()
