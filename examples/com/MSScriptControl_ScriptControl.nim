#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import strformat
import winim/com

when defined(cpu64):
  {.fatal: "ScriptControl only support windows i386 version.".}

var obj = CreateObject("MSScriptControl.ScriptControl")
obj.allowUI = true
obj.useSafeSubset = false

obj.language = "JavaScript"
var exp = "Math.pow(5, 2) * Math.PI"
var answer = obj.eval(exp)
var msg = fmt"{exp} = {$answer}"

obj.language = "VBScript"
var title = "Windows COM for Nim"
var vbs = fmt"""
    MsgBox("This is a VBScript message box." & vbCRLF & "{msg}", vbOKOnly, "{title}")
  """

obj.eval(vbs)

try:
  obj.eval "MsgBox()"
except COMException:
  echo fmt"Error: ""{getCurrentExceptionMsg()}"""
