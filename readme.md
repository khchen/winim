# Winim

Winim contains Windows API, struct, and constant definitions for Nim.
The definitions are translated from MinGW's Windows headers.

The module also include some Windows string type utilities and Windows COM support.
See winstr.nim and com.nim for details.

## Install
With git on windows:

    nimble install winim

Without git:

    1. Download and unzip this moudle (by click "Clone or download" button).
    2. Start a console, change current dir to the folder which include "winim.nimble" file.
       (for example: C:\winim-master\winim-master>)
    3. Run "nimble install"

## Usage
```nimrod
import winim # import all modules, except COM support and MSHTML.
```
or
```nimrod
import winim.lean # for core SDK only, this speed up compiling time.
```
or
```nimrod
import winim.mean # for core SDK + Shell + OLE API.
```
or
```nimrod
import winim.com # winim.mean + Windows COM support.
```

API modules can import one by one if needed, for example:
```nimrod
import winim.inc.windef
import winim.inc.winbase
import winim.inc.winuser
```
or
```nimrod
import winim.inc/[windef, winbase, winuser]
```

MSHTML module is too big. So it is not imported by default.
Add this module only if needed:
```nimrod
import winim.html
```

## Compile
    nim c source.nim
      add -d:winansi or -d:useWinAnsi for Ansi version (Unicode by default)
      add -d:win_no_discardable if not like discardable windows API
      add -d:lean same as import winim.lean
      add -d:mean same as import winim.mean
      add -d:win32_lean_and_mean same as import winim.mean
      add -d:mshtml same as import winim.html
      add -d:notrace disable COM objects trace. See com.nim for details.
      add -d:useWinXP for Windows XP compatibility.

## Examples

An hello world program:
```nimrod
import winim.lean
MessageBox(0, "Hello, world !", "Nim is Powerful", 0)
```

Write codes work under both unicode and ansi mode:
```nimrod
import winim.lean
# T macro generate unicode string or ansi string depend on conditional symbol: useWinAnsi.
MessageBox(0, T"Hello, world !", T"Nim is Powerful 中文測試", 0)
```

Example to use the IShellLink interface:
```nimrod
import os, winim.mean

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

Use COM objects like a script langauge:
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

## Docs
* https://khchen.github.io/winim/winim.html
* https://khchen.github.io/winim/utils.html
* https://khchen.github.io/winim/winstr.html
* https://khchen.github.io/winim/com.html

## License
Read license.txt for more details.

Copyright (c) 2016-2018 Kai-Hung Chen, Ward. All rights reserved.
