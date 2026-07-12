#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

# Package
version       = "4.0.0"
author        = "Chen Kai-Hung"
description   = "Winim - Windows API, COM, and .NET Module for Nim"
license       = "MIT"
skipDirs      = @["examples", "tests", "docs"]

# Dependencies
requires "nim >= 2.0.0"

# Tests
task test, "Runs the test suite":
  exec "nim r tests/winstr"
  exec "nim r tests/variant"
  exec "nim r tests/com"
  exec "nim r tests/clr"
  exec "nim r tests/dotnet"

# Examples
task example, "Build all the examples":
  exec "nim c examples/fileopendialog"
  exec "nim c examples/getopenfilename"
  exec "nim c examples/hellomsg"
  exec "nim c examples/hellowin"
  exec "nim c examples/linedemo"
  exec "nim c examples/scrnsize"
  exec "nim c examples/shortcut"
  exec "nim c examples/uiautomation"

  exec "nim c examples/clr/code_compiler"
  exec "nim c examples/clr/simple_gui"
  exec "nim c examples/clr/splitter"
  exec "nim c examples/clr/usage_demo1"
  exec "nim c examples/clr/usage_demo2"
  exec "nim c examples/clr/wpf"

  exec "nim c examples/com/binary"
  exec "nim c examples/com/constants"
  exec "nim c examples/com/diskinfo"
  exec "nim c examples/com/Excel_Application1"
  exec "nim c examples/com/Excel_Application2"
  exec "nim c examples/com/InternetExplorer_Application"
  exec "nim c examples/com/MSXML_DOMDocument"
  exec "nim c examples/com/Run_JavaScript"
  exec "nim c examples/com/SAPI_SpVoice"
  exec "nim c examples/com/Scriptlet_TypeLib"
  exec "nim c examples/com/Shell_Application"
  exec "nim c examples/com/VBScript_RegExp"
  exec "nim c examples/com/WinHttp_WinHttpRequest"
  exec "nim c examples/com/winmgmts"
  exec "nim c examples/com/WScript"
  exec "nim c examples/com/nimDispatch/client"
  exec "nim c examples/com/nimDispatch/server"
  exec "nim c examples/com/threads/thread1"
  exec "nim c examples/com/threads/thread2"
  exec "nim c examples/com/threads/thread3"
  exec "nim c examples/com/threads/thread4"

  exec "nim c examples/dotnet/async_download"
  exec "nim c examples/dotnet/dotnet_browser"
  exec "nim c examples/dotnet/simple_gui"
  exec "nim c examples/dotnet/usage_demo"
  exec "nim c examples/dotnet/wpf"

  exec "nim c examples/webview2/dotnet_webview2"
  when defined(cpu64):
    exec "nim c -d:webview2=WebView2Loader64 examples/webview2/webview2"
  else:
    exec "nim c -d:webview2=WebView2Loader32 --cpu:i386 examples/webview2/webview2"

# Cleanup
task cleanup, "Delete all executable files under the project directory":
  exec "cmd.exe /d /c del /s /q /f *.exe"
