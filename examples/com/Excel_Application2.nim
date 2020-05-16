#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import strutils
import winim/com

comScript:
  var obj = CreateObject("Excel.Application")
  obj.visible = true
  obj.workbooks.add()

  var
    s1 = "the quick fox jumps over the lazy brown dog".split(" ")
    s2 = @[@[1, 2], @[3, 4, 5, 6, 7], @[8, 9, 10, 11], @[12], @[13, 14, 15]]

  obj.activeSheet.range("A1:E6").clear()
  obj.activeSheet.range("A1:I1") = s1 # this convert seq to 1D safearray
  obj.activeSheet.range("A2:E6") = s2 # this convert seq to 2D safearray

  COM_FullRelease()
