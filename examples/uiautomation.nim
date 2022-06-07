#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2022 Ward
#
#====================================================================

import winim/com
import osproc

converter pointerConverter(x: ptr): ptr PVOID = cast[ptr PVOID](x)

try:
  CoInitialize(nil)
  discard startProcess("notepad.exe")

  var
    uia: ptr IUIAutomation
    desktop: ptr IUIAutomationElement
    cond: ptr IUIAutomationCondition
    notepad: ptr IUIAutomationElement
    edit: ptr IUIAutomationElement
    value: ptr IUIAutomationValuePattern

  CoCreateInstance(&CLSID_CUIAutomation, NULL, CLSCTX_ALL, &IID_IUIAutomation, &uia)
  if uia.isNil: raise

  uia.GetRootElement(&desktop)
  if desktop.isNil: raise

  uia.CreatePropertyCondition(UIA_ClassNamePropertyId, toVariant("Notepad"), &cond)
  if cond.isNil: raise

  desktop.FindFirst(TreeScope_Descendants, cond, &notepad)
  if notepad.isNil: raise

  uia.CreatePropertyCondition(UIA_AutomationIdPropertyId, toVariant("15"), &cond)
  if cond.isNil: raise

  notepad.FindFirst(TreeScope_Descendants, cond, &edit)
  if edit.isNil: raise

  edit.GetCurrentPattern(UIA_ValuePatternId, cast[ptr ptr IUnknown](&value))
  if value.isNil: raise

  value.SetValue("Hello World")

except:
  echo "something wrong !"

finally:
  CoUninitialize()
