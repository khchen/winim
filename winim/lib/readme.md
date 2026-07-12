# Winim Library Files

This directory contains support files used when building Winim programs.

- `WebView2LoaderStatic32.lib` and `WebView2LoaderStatic64.lib` are the original Microsoft WebView2 static loader libraries used by VCC.
- `WebView2LoaderStatic32Alt.lib` and `WebView2LoaderStatic64Alt.lib` are non-MSVC-compatible libraries with the required COFF relocation changes.
- `WebView2Abi.c` provides the non-MSVC ABI bridge for the WebView2 static loader. It selects the x86 or x64 implementation at compile time.
- `winim32.res` and `winim64.res` contain the resources used by non-MSVC builds.
- `winimvcc.res` contains the resources used by Visual C++ builds.

VCC uses the original libraries; non-MSVC compilers use the `*Alt.lib` variants and `WebView2Abi.c`. The patch changes selected COFF relocations and removes MSVC-only `.drectve` contents; it does not change WebView2 behavior or APIs.


The WebView2 static loader libraries remove the need to ship `WebView2Loader.dll` with the application. A compatible WebView2 Runtime is still required on the target system.
