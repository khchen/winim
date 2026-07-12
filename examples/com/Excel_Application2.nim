#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import strutils
import winim/com

comScript:
  var obj = CreateObject("Excel.Application")
  obj.visible = true
  obj.workbooks.add()
  obj.displayalerts = false

  var
    s1 = "the quick fox jumps over the lazy brown dog".split(" ")
    s2 = @[@[1, 2], @[3, 4, 5, 6, 7], @[8, 9, 10, 11], @[12], @[13, 14, 15]]

  obj.activeSheet.range("A1:E6").clear()
  obj.activeSheet.range("A1:I1") = s1 # this converts a seq to a 1D SAFEARRAY
  obj.activeSheet.range("A2:E6") = s2 # this converts a seq to a 2D SAFEARRAY

  COM_FullRelease()
