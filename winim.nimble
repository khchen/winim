#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
#====================================================================

# Package

version       = "3.9.4"
author        = "Ward"
description   = "Winim - Windows API, COM, and CLR Module for Nim"
license       = "MIT"
skipDirs      = @["examples", "tests", "docs", "tcclib"]

# Dependencies

requires "nim >= 1.0.0"
from sugar import `=>`
from sequtils import map, concat


proc compile(file: string) =
  echo "compile: " & file
  exec "nim " & commandLineParams.join(" ") & " c " & file

# Examples

const exampleFiles = @[
  "fileopendialog",
  "getopenfilename",
  "hellomsg",
  "hellowin",
  "linedemo",
  "scrnsize",
  "shortcut",
  "uiautomation",
].map(f => "examples/" & f)

task example, "Build all the examples":
  for file in exampleFiles:
    compile file

# COM Examples

const comexampleFiles = @[
  "binary",
  "constants",
  "diskinfo",
  "Excel_Application1",
  "Excel_Application2",
  "InternetExplorer_Application",
  "MSXML_DOMDocument",
  "SAPI_SpVoice",
  "Scriptlet_TypeLib",
  "Shell_Application",
  "VBScript_RegExp",
  "WinHttp_WinHttpRequest",
  "winmgmts",
  "WScript",
  "nimDispatch/client",
  "nimDispatch/server",
  "threads/thread1",
  "threads/thread2",
  "threads/thread3",
  "threads/thread4",
].map(f => "examples/com/" & f)

task comexample, "Build all the COM examples":
  for file in comexampleFiles:
    compile file

# CLR Examples

const clrexampleFiles = @[
  "code_compiler",
  "misc_examples",
  "simple_gui",
  "splitter",
  "usage_demo1",
  "usage_demo2",
  "wpf",
].map(f => "examples/clr/" & f)

task clrexample, "Build all the CLR examples":
  for file in clrexampleFiles:
    compile file

# Sweep

task sweep, "Delete all the executable files":
  for file in concat(exampleFiles, comexampleFiles, clrexampleFiles):
    rmFile toExe file
  for file in ["tclr", "tcom", "tvariant", "twinstr"].map(f => "tests/" & f):
    rmFile toExe file
