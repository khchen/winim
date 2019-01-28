#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#
#====================================================================

##  This module contains Windows API, struct, and constant definitions.
##  The definitions are translated from MinGW's Windows headers.
##
##  The module also include some windows string type utilities and COM support.
##  See utils.nim, winstr.nim, and com.nim for details.
##
##  Usage:
##    .. code-block:: Nim
##       import winim # impore all modules, except COM support and MSHTML
##       # or import winim/lean for core SDK only
##       # or import winim/mean for core SDK + Shell + OLE
##       # or import winim/com for core SDK + Shell + OLE + COM support
##       # add import winim/html for MSHTML
##
##  To compile:
##    .. code-block:: Nim
##       nim c source.nim
##         add -d:winansi or -d:useWinAnsi for Ansi version (Unicode by default)
##         add -d:win_no_discardable if not like discardable windows API
##         add -d:lean same as import winim/lean
##         add -d:mean same as import winim/mean
##         add -d:win32_lean_and_mean same as import winim/mean
##         add -d:mshtml same as import winim/html
##         add -d:notrace disable COM objects trace. See com.nim for details.
##         add -d:useWinXP for Windows XP compatibility.

{.deadCodeElim: on.}

when defined(lean):
  import winim/[core]
  export core
elif defined(mean) or defined(win32_lean_and_mean):
  import winim/[core, shell, ole]
  export core, shell, ole
else:
  import winim/[core, shell, net, ole, extra]
  export core, shell, net, ole, extra

when defined(mshtml):
  import winim/html
  export html

import winim/[utils, winstr]
export utils, winstr

when isMainModule:
  discard MessageBox(0, T"Hello, world !", T"Nim is Powerful", 0)
