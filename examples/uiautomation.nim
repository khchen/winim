#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
#====================================================================

import winim/com
import osproc

converter pointerConverter(x: ptr): ptr PVOID = cast[ptr PVOID](x)

var className, propertyId: string

CoInitialize(nil)

try:
  # using write.exe instead of notepad.exe in Windows 11
  discard startProcess("write.exe")
  (className, propertyId) = ("WordPadClass", "59648")

except OSError:
  discard startProcess("notepad.exe")
  (className, propertyId) = ("Notepad", "15")

finally:
  Sleep(1000)

try:
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

  uia.CreatePropertyCondition(UIA_ClassNamePropertyId, toVariant(className), &cond)
  if cond.isNil: raise

  desktop.FindFirst(TreeScope_Descendants, cond, &notepad)
  if notepad.isNil: raise

  uia.CreatePropertyCondition(UIA_AutomationIdPropertyId, toVariant(propertyId), &cond)
  if cond.isNil: raise

  notepad.FindFirst(TreeScope_Descendants, cond, &edit)
  if edit.isNil: raise

  edit.GetCurrentPattern(UIA_ValuePatternId, cast[ptr ptr IUnknown](&value))
  if value.isNil: raise

  value.SetValue("Hello World")

except CatchableError, ReraiseDefect:
  echo "something wrong !"

finally:
  CoUninitialize()
