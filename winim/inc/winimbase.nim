#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import macros

const webview2 {.strdefine.}: string = ""
const webview2LoaderDllName* =
  if webview2.len == 0 or webview2 == "true":
    "WebView2Loader.dll"
  elif webview2 == "lib":
    ""
  else:
    webview2

when webview2LoaderDllName.len == 0:
  import std/os
  when defined(vcc):
    const webview2StaticLoader =
      if defined(cpu64):
        "WebView2LoaderStatic64.lib"
      else:
        "WebView2LoaderStatic32.lib"
  else:
    const webview2StaticLoader =
      if defined(cpu64):
        "WebView2LoaderStatic64Alt.lib"
      else:
        "WebView2LoaderStatic32Alt.lib"
  {.passl: parentDir(currentSourcePath) / "../lib" / webview2StaticLoader.}

  when defined(vcc):
    {.passl: "advapi32.lib".}

  elif defined(gcc) or defined(clang) or defined(tcc):
    {.compile: "../lib/WebView2Abi.c".}
    {.passl: "-ladvapi32".}
    {.passl: "-lole32".}
    {.passl: "-luser32".}
    {.passl: "-lshlwapi".}

  else:
    {.error: "webview2=lib requires a supported compiler".}

when not defined(noRes):
  when defined(vcc):
    {.link: "../lib/winimvcc.res".}

  elif defined(cpu64):
    {.link: "../lib/winim64.res".}

  else:
    {.link: "../lib/winim32.res".}

macro winapi*(x: untyped): untyped =
  when not defined(noDiscardableApi):
    x.addPragma(newIdentNode("discardable"))

  result = x

macro wv2api*(x: untyped): untyped =
  when not defined(noDiscardableApi):
    x.addPragma(newIdentNode("discardable"))

  if webview2LoaderDllName.len != 0:
    x.addPragma(newTree(nnkExprColonExpr, newIdentNode("dynlib"),
      newIdentNode("webview2LoaderDllName")))

  result = x

proc discardable*[T](x: T): T {.discardable, inline.} = x

macro DEFINE_GUID*(guid: string): untyped =
  const
    ranges = [0..7, 9..12, 14..17, 19..20, 21..22, 24..25, 26..27, 28..29, 30..31, 32..33, 34..35]
    parts = ["'i32, 0x", ", 0x", ", [0x", "'u8, 0x", ", 0x", ", 0x", ", 0x", ", 0x", ", 0x", ", 0x", "])"]

  let guid = guid.strVal
  assert guid.len == 36

  var code = "DEFINE_GUID(0x"
  for i in 0..10:
    code.add guid[ranges[i]]
    code.add parts[i]
  result = parseStmt(code)

const
  winimAnsi* = defined(useWinAnsi) or defined(winansi)
  winimUnicode* = not winimAnsi
  winimCpu64* = defined(cpu64)
  winimCpu32* = not defined(cpu64)
