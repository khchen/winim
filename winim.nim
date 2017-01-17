#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2017 Ward
#
#====================================================================

##  This module contains windows API and constant definitions.
##  Most definitions are translated from "D WinAPI programming" by Andrej Mitrovic.
##  Some others translated from MinGW's windows headers.
##
##  The module also include some windows string type utilities and COM support.
##  See winstr.nim and com.nim for details.
##
##  Usage:
##    .. code-block:: Nim
##       import winim
##       # or import winim.com for COM support.
##
##  To compile:
##    .. code-block:: Nim
##       nim c -d:release source.nim
##         add -d:winansi for ansi mode (unicode by default)
##         add -d:winstyle to enable windows visual styles
##         add -d:win_no_discardable if not like discardable windows API
##

{.deadCodeElim: on.}

import winim.winapi, winim.winstr
export winim.winapi, winim.winstr

static:
  when defined(winstyle):
    import os
    const winimPrivateDir = parentDir(currentSourcePath()) & r"\winim\"

    when defined(cpu64):
      const resourceFile = winimPrivateDir & "winim64.res"
    else:
      const resourceFile = winimPrivateDir & "winim32.res"

    {.passL: resourceFile.}


# todo: need more converter?
converter winim_converter*(x: bool): BOOL =
  result = if x: TRUE else: FALSE

converter winim_converter*(x: BOOL): bool =
  result = if x == FALSE: false else: true

converter winim_converter*[T: object](x: var T): ptr T =
  ## Pass an object by address if target is "ptr object". For example:
  ##
  ## .. code-block:: Nim
  ##    var msg: MSG
  ##    while GetMessage(msg, 0, 0, 0) != 0:
  ##      TranslateMessage(msg)
  ##      DispatchMessage(msg)

  result = x.addr

proc `&`*[T](x: var T): ptr T {.inline.} =
  ## Use `&` like it in C/C++ to get address for anything.

  result = x.addr


# todo: is there a better implement?
template `&`*(name: object): ptr type(name) =
  ## Template to get pointer for const object. For example:
  ##
  ## .. code-block:: Nim
  ##    # pUk is "ptr IUnknown" for some object
  ##    var pDisp: ptr IDispatch
  ##    pUk.QueryInterface(&IID_IDispatch, &pDisp)

  when not declared(`ConstAddr name`):
    proc `ConstAddr name`(): ptr type(name) =
      var
        globalPtr {.global.}: ptr type(name)
        globalVar {.global.}: type(name)

      if globalPtr == nil:
        globalVar = name
        globalPtr = globalVar.addr

      result = globalPtr

  `ConstAddr name`()

when isMainModule:
  discard MessageBox(0, T"Hello, world !", T"Nim is Powerful", 0)
