# Winim

Winim contains Windows API, struct, and constant definitions for Nim. The definitions are translated from MinGW's Windows headers.

The module also include some Windows string type utilities and Windows COM support. See winstr.nim and com.nim for details.

If you are looking for Windows GUI framework, try [wNim](https://github.com/khchen/wNim).

## Install
With git on windows:

    nimble install winim

Without git:

    1. Download and unzip this moudle (by click "Clone or download" button).
    2. Start a console, change current dir to the folder which include "winim.nimble" file.
       (for example: C:\winim-master\winim-master>)
    3. Run "nimble install"

## Usage
```nim
import winim # import all modules, except COM support.
```
or
```nim
import winim/lean # for core SDK only, this speed up compiling time.
```
or
```nim
import winim/mean # for core SDK + Shell + OLE API.
```
or
```nim
import winim/com # winim/mean + Windows COM support.
```

API modules can import one by one if needed, for example:
```nim
import winim/utils
import winim/winstr
import winim/inc/windef
import winim/inc/winbase
import winim/inc/winuser
```
or
```nim
import winim/[utils, winstr]
import winim/inc/[windef, winbase, winuser]
```

WinHTTP and WinINet module are incompatible with each other. So they are not imported by default. Add one of them if needed:
```nim
import winim/inc/winhttp
```
or
```nim
import winim/inc/wininet
```

MSHTML module is too big. So it is not imported by default.
Add this module only if needed:
```nim
import winim/inc/mshtml
```

## Compile
    nim c source.nim
      add -d:winansi or -d:useWinAnsi for Ansi version (Unicode by default)
      add -d:noDiscardableApi if not like discardable windows API
      add -d:noRes to disable the visual styles (not to link winim32.res or winim64.res).
      add -d:lean same as import winim/lean
      add -d:mean or -d:win32_lean_and_mean same as import winim/mean
      add -d:notrace disable COM objects trace. See com.nim for details.

## Examples

An hello world program:
```nim
import winim/lean
MessageBox(0, "Hello, world !", "Nim is Powerful", 0)
```

Write codes work under both unicode and ansi mode:
```nim
import winim/lean
# T macro generate unicode string or ansi string depend on conditional symbol: useWinAnsi.
MessageBox(0, T"Hello, world !", T"Nim is Powerful 中文測試", 0)
```

Example to use the IShellLink interface:
```nim
import os, winim/mean

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
```nim
import winim/com

comScript:
  var dict = CreateObject("Scripting.Dictionary")
  dict.add("a", "the")
  dict.add("b", item:="quick")
  dict.add(item:="fox", key:="c")
  dict.item(key:="c") = "dog"

  for key in dict:
    echo key, " => ", dict.item(key)
```

## Winimx

Winimx is a standalone tool to generate the minfied Winim module. It also can be used to generate the necessary definitions at compile time. For more information, see the [document](https://khchen.github.io/winim/winimx.html).

## Cross Compile

Windows programs using Winim module should be compiled successfully by gcc, tcc, vcc on Windows, and MinGW toolchain on Linux. The target file can be PE (32 bits) or PE+ (64 bits).

The suggested Nim compiler is amd64 version. You can download both mingw32 and mingw64 from the Nim's website and put them into nim\dist\mingw32 and nim\dist\mingw64. Modify the *nim.cfg*:

    @if windows:
      @if i386:
        gcc.path = r"$nim\dist\mingw32\bin"
      @else:
        gcc.path = r"$nim\dist\mingw64\bin"
      @end
    @end

Now, you can add --cpu:i386 for 32 bits target, and --cpu:amd64 for 64 bits target. To use tcc (Tiny C Compiler), [here](https://github.com/khchen/winim/tree/master/tcclib) are some more information.

To cross compile from Linux or macOS. Here is the [instruction](https://nim-lang.github.io/Nim/nimc.html#cross-compilation-for-windows).

## Docs
* https://khchen.github.io/winim/winim.html
* https://khchen.github.io/winim/winimx.html
* https://khchen.github.io/winim/utils.html
* https://khchen.github.io/winim/winstr.html
* https://khchen.github.io/winim/com.html

## License
Read license.txt for more details.

Copyright (c) 2016-2020 Kai-Hung Chen, Ward. All rights reserved.
