# Winim

Winim contains windows API and constant definitions for Nim.
Most definitions are translated from "D WinAPI programming" by Andrej Mitrovic.
Some others translated from MinGW's windows headers.

The module also include some windows string type utilities and windows COM support.
See winstr.nim and com.nim for details.

## Install
    nimble install winim

## Usage
```nimrod
import winim
```
or
```nimrod
import winim.com # for windows COM support.
```
## Compile
    nim c -d:release source.nim
      add -d:winansi for ansi mode (unicode by default)
      add -d:win_no_discardable if not like discardable windows API

## Examples

An hello world program:
```nimrod
import winim
MessageBox(0, "Hello, world !", "Nim is Powerful", 0)
```
Write codes work under both unicode and ansi mode:
```nimrod
import winim
# T macro generate unicode string or ansi string depend on conditional symbol: winansi.
MessageBox(0, T"Hello, world !", T"Nim is Powerful 中文測試", 0)
```
Example to use the IID_IShellLink interface:
```nimrod
import os, winim

var
  pIL: ptr IShellLink
  pPF: ptr IPersistFile

try:
  CoInitialize(nil)

  if CoCreateInstance(&CLSID_ShellLink, nil, CLSCTX_LOCAL_SERVER, &IID_IShellLink, cast[ptr PVOID](&pIL)).FAILED: raise
  defer: pIL.Release()

  if pIL.QueryInterface(&IID_IPersistFile, cast[ptr PVOID](&pPF)).FAILED: raise
  defer: pPF.Release()

  if pIL.SetPath(getAppFilename()).FAILED or pPF.Save("link.lnk", true).FAILED: raise

except:
  echo "something wrong !!"
```

Use COM object like a script langauge:
```nimrod
import winim.com

comScript:
  var dict = CreateObject("Scripting.Dictionary")
  dict.add("a", "the")
  dict.add("b", "quick")
  dict.add("c", "fox")
  dict.item("c") = "dog" # this line needs comScript macro

  for key in dict:
    echo key, " => ", dict.item(key)
```

## License
Read license.txt for more details.

Copyright (c) 2016-2017 Kai-Hung Chen (Ward). All rights reserved.
