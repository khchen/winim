#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

##  This module contains utilities for making Winim development easier.

import inc/windef

# todo: need more converter?

converter winimConverterBooleanToBOOL*(x: bool): BOOL =
  ## Converts between Windows' BOOL/WINBOOL and Nim's Boolean type.

  result = if x: TRUE else: FALSE

converter winimConverterBOOLToBoolean*(x: BOOL): bool =
  ## Converts between Windows' BOOL/WINBOOL and Nim's Boolean type.

  result = if x == FALSE: false else: true

converter winimConverterVarObjectToPtrObject*[T: object](x: var T): ptr T =
  ## Pass an object by address if the target is "ptr object". For example:
  ##
  ## .. code-block:: Nim
  ##    var msg: MSG
  ##    while GetMessage(msg, 0, 0, 0) != 0:
  ##      TranslateMessage(msg)
  ##      DispatchMessage(msg)

  result = x.addr

proc `&`*[T](x: var T): ptr T {.inline.} =
  ## Use `&` as in C/C++ to get the address of anything.

  result = x.addr

when not compiles(unsafeaddr GUID_NULL):
  proc `&`*(x: object): ptr type(x) {.importc: "&", nodecl.}
    ## Use `&` to get a pointer for a const object. For example:
    ##
    ## .. code-block:: Nim
    ##    # pUk is "ptr IUnknown" for some object
    ##    var pDisp: ptr IDispatch
    ##    pUk.QueryInterface(&IID_IDispatch, &pDisp)

else:
  template `&`*(x: object): ptr type(x) = unsafeaddr x
    ## Use `&` to get a pointer for a const object. For example:
    ##
    ## .. code-block:: Nim
    ##    # pUk is "ptr IUnknown" for some object
    ##    var pDisp: ptr IDispatch
    ##    pUk.QueryInterface(&IID_IDispatch, &pDisp)
