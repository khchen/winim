#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2018 Ward
#
#====================================================================

import macros, os

static:
  const winimPrivateDir = parentDir(currentSourcePath()) & r"\..\lib\"

  when defined(cpu64):
    const resourceFile = winimPrivateDir & "winim64.res"
  else:
    const resourceFile = winimPrivateDir & "winim32.res"

  {.link: resourceFile.}

macro winapi*(x: untyped): untyped =
  when not defined(win_no_discardable):
    x.addPragma(newIdentNode("discardable"))

  result = x

macro xpincompatible*(x: untyped): untyped =
  when defined(useWinXP):
    discard
  else:
    result = x

proc discardable*[T](x: T): T {.discardable, inline.} = x

const
  winimAnsi* = defined(useWinAnsi) or defined(winansi)
  winimUnicode* = not winimAnsi
  winimCpu64* = defined(cpu64)
  winimCpu32* = not defined(cpu64)
