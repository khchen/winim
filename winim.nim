#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

## Winim provides Windows SDK APIs, structs, and constant definitions for Nim.
## It also provides Windows string utilities, Windows COM, legacy .NET
## Framework, and modern .NET support. For compatibility, Winim uses only
## signed integer types.
##
## Usage:
##
## .. code-block:: Nim
##    import winim # Import all modules except COM support.
##    import winim/lean # Import the core SDK only; this speeds up compilation.
##    import winim/com # Windows COM support.
##    import winim/clr # Windows legacy .NET Framework support.
##    import winim/dotnet # Modern .NET support.
##
## API modules can also be imported individually, for example:
##
## .. code-block:: Nim
##    import winim/winstr
##    import winim/inc/[windef, winbase, winuser]
##
## Compile:
##
## .. code-block:: Nim
##    nim c source.nim
##      add -d:winansi or -d:useWinAnsi for the ANSI version (Unicode by default)
##      add -d:noDiscardableApi if you do not want discardable Windows APIs
##      add -d:noRes to disable visual styles
##      add -d:lean or -d:mean to select a smaller import set
##      add -d:notrace to disable COM object tracing
##      add -d:webview2=lib to use the static WebView2 loader
##      add -d:webview2=dll_file_name to select a loader DLL

when defined(lean):
  import winim/[core]
  export core
elif defined(mean) or defined(win32_lean_and_mean):
  import winim/[core, shell, ole]
  export core, shell, ole
else:
  import winim/[core, shell, net, ole, extra]
  export core, shell, net, ole, extra

import winim/[utils, winstr]
export utils, winstr
