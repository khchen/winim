#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import winim/com
converter pointerConverter(x: ptr): ptr PVOID = cast[ptr PVOID](x)

CoInitialize(nil)

try:
  var shell = CreateObject("Shell.Application")
  shell.FileRun
  Sleep(1000)

  var
    uia: ptr IUIAutomation
    desktop: ptr IUIAutomationElement
    cond: ptr IUIAutomationCondition
    edit: ptr IUIAutomationElement
    value: ptr IUIAutomationValuePattern
    ok: ptr IUIAutomationElement
    invoke: ptr IUIAutomationInvokePattern

  CoCreateInstance(&CLSID_CUIAutomation, NULL, CLSCTX_ALL, &IID_IUIAutomation, &uia)
  if uia.isNil: raise

  uia.GetRootElement(&desktop)
  if desktop.isNil: raise

  uia.CreatePropertyCondition(UIA_AutomationIdPropertyId, toVariant("12298"), &cond)
  if cond.isNil: raise

  desktop.FindFirst(TreeScope_Descendants, cond, &edit)
  if edit.isNil: raise

  edit.GetCurrentPattern(UIA_ValuePatternId, cast[ptr ptr IUnknown](&value))
  if value.isNil: raise

  value.SetValue("notepad.exe")

  uia.CreatePropertyCondition(UIA_AutomationIdPropertyId, toVariant("1"), &cond)
  if cond.isNil: raise

  desktop.FindFirst(TreeScope_Descendants, cond, &ok)
  if ok.isNil: raise

  ok.GetCurrentPattern(UIA_InvokePatternId, cast[ptr ptr IUnknown](&invoke))
  if invoke.isNil: raise

  invoke.Invoke()

except CatchableError, ReraiseDefect:
  echo "Something went wrong!"

finally:
  CoUninitialize()
