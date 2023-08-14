#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
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
