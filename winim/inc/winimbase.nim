#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import macros

when not defined(noRes):
  import os

  when defined(cpu64):
    {.link: currentSourcePath().parentDir & "/../lib/winim64.res".}

  else:
    {.link: currentSourcePath().parentDir & "/../lib/winim32.res".}

macro winapi*(x: untyped): untyped =
  when not defined(noDiscardableApi):
    x.addPragma(newIdentNode("discardable"))

  result = x

proc discardable*[T](x: T): T {.discardable, inline.} = x

const
  winimAnsi* = defined(useWinAnsi) or defined(winansi)
  winimUnicode* = not winimAnsi
  winimCpu64* = defined(cpu64)
  winimCpu32* = not defined(cpu64)
