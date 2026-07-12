<!--
#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================
-->

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/khchen0915?country.x=TW&locale.x=zh_TW)

# Winim
Winim contains Windows SDK APIs, structs, and constant definitions for Nim. It also includes Windows string-type utilities, Windows COM, legacy .NET Framework, and modern .NET support.

For historical reasons and compatibility, winim only uses signed integer types. For example:
```nim
type
  UINT* = int32
  DWORD* = int32
  QWORD* = int64
  UINT_PTR* = int64
```

If you are looking for a Windows GUI framework, try [wNim](https://github.com/khchen/wNim).

## Install
With Git on Windows:

    nimble install winim

Without Git:

    1. Download and unzip this module (by clicking the "Code" button).
    2. Open a console and change the current directory to the folder that contains the "winim.nimble" file.
       (for example: C:\winim-master\winim-master>)
    3. Run "nimble install"

## Usage
```nim
import winim # Import all modules except COM support.
```
Or
```nim
import winim/lean # Import the core SDK only; this speeds up compilation.
```
Or
```nim
import winim/com # Windows COM support.
```
Or
```nim
import winim/clr # Windows legacy .NET Framework support.
```
Or
```nim
import winim/dotnet # Modern .NET support.
```

API modules can be imported one by one if needed, for example:
```nim
import winim/winstr
import winim/inc/[windef, winbase, winuser]
```

The WinHTTP and WinINet modules are incompatible with each other, so they are not imported by default. Add either module if needed:
```nim
import winim/inc/winhttp
```
Or
```nim
import winim/inc/wininet
```

The MSHTML module is too large, so it is not imported by default.
Import it only if needed:
```nim
import winim/inc/mshtml
```

## Compile
    nim c source.nim
      add -d:winansi or -d:useWinAnsi for the ANSI version (Unicode by default)
      add -d:noDiscardableApi if you do not want discardable Windows APIs
      add -d:noRes to disable the visual styles (so that winim32.res or winim64.res is not linked).
      add -d:lean, the same as importing winim/lean
      add -d:mean or -d:win32_lean_and_mean, the same as importing winim/mean
      add -d:notrace to disable COM object tracing. See com.nim for details.
      add -d:webview2=lib to use the static WebView2 loader, or
          -d:webview2=dll_file_name to select a loader DLL.

## Examples
A Hello World program:
```nim
import winim/lean
MessageBox(0, "Hello, world!", "Nim is powerful", 0)
```

Write code that works under both Unicode and ANSI modes:
```nim
import winim/lean
# The T macro generates a Unicode or ANSI string depending on the conditional symbol `useWinAnsi`.
MessageBox(0, T"Hello, world!", T"Nim is powerful 中文測試", 0)
```

Use COM objects like a scripting language:
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

Interact with the Windows .NET Framework:
```nim
import winim/clr
block:
  clrStart()
  defer: clrClose()

  let core = load("mscorlib")
  let random = core.new("System.Random")
  echo random.Next()
```

Interact with modern .NET:
```nim
import winim/dotnet
block:
  dotnetStart()
  defer: dotnetClose()

  let core = load("System.Private.CoreLib")
  let random = core.new("System.Random")
  echo random.Next()
```

## WebView2
Winim includes WebView2 API bindings in `winim/inc/webview2`. The Evergreen WebView2 Runtime must be installed on the target machine.
The default build loads `WebView2Loader.dll` beside the executable. Add
`-d:webview2=lib` to use the static loader:

    nim c -d:webview2=lib examples/webview2/webview2.nim

You can also select a loader DLL with `-d:webview2=dll_file_name`. A modern
.NET WebView2 example is also available at
`examples/webview2/dotnet_webview2.nim`.

More examples: https://github.com/khchen/winim/tree/master/examples.

## Cross-Compilation
Programs using the Winim module should compile successfully with GCC and VCC on Windows, and with the MinGW toolchain on Linux. The target can be a 32-bit PE or 64-bit PE+ file.

The amd64 version of the Nim compiler is recommended. You can download both the mingw32 and mingw64 toolchains from the Nim website and put them into nim\dist\mingw32 and nim\dist\mingw64. Modify *nim.cfg*:

    @if windows:
      @if i386:
        gcc.path = r"$nim\dist\mingw32\bin"
      @else:
        gcc.path = r"$nim\dist\mingw64\bin"
      @end
    @end

You can now add --cpu:i386 for a 32-bit target or --cpu:amd64 for a 64-bit target.

To cross-compile from Linux or macOS, see [these instructions](https://nim-lang.github.io/Nim/nimc.html#cross-compilation-for-windows).

## Docs
* https://khchen.github.io/winim/winim.html
* https://khchen.github.io/winim/utils.html
* https://khchen.github.io/winim/winstr.html
* https://khchen.github.io/winim/com.html
* https://khchen.github.io/winim/clr.html
* https://khchen.github.io/winim/dotnet.html

## License
See license.txt for more details.

Copyright (c) Chen Kai-Hung. All rights reserved.

## Donate
If this project helps you save development time, you can buy me a cup of coffee. :)

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://paypal.me/khchen0915?country.x=TW&locale.x=zh_TW)
