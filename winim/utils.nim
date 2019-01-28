#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#====================================================================

##  This module contains utilities for happily coding.

{.deadCodeElim: on.}

import inc/windef

# todo: need more converter?

converter winimConverterBooleanToBOOL*(x: bool): BOOL =
  ## Converter between Windows' BOOL/WINBOOL and Nim's boolean type

  result = if x: TRUE else: FALSE

converter winimConverterBOOLToBoolean*(x: BOOL): bool =
  ## Converter between Windows' BOOL/WINBOOL and Nim's boolean type

  result = if x == FALSE: false else: true

converter winimConverterVarObjectToPtrObject*[T: object](x: var T): ptr T =
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

