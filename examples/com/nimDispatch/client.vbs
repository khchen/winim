'====================================================================
'
'         Winim - Windows API, COM, and .NET Binding for Nim
'                   Copyright (c) Chen Kai-Hung
'
'====================================================================

Set obj = GetObject("nimDispatch")
WScript.Echo obj.GetString
obj.SetString("new string is hello world")
WScript.Echo obj.GetString
obj.exit
