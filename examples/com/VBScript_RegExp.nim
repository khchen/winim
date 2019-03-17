#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#====================================================================

import strformat
import winim/com

var obj = CreateObject("VBScript.RegExp")
obj.pattern = r"\wo\w"
obj.ignoreCase = true
obj.global = true

for match in obj.execute("the quick brown fox jumps over the lazy dog"):
  echo match
  echo fmt"FirstIndex: {$match.firstIndex}, Length: {$match.length}, Value: {$match.value}"
