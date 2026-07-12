<!--
#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================
-->

Version 4.0.0
-------------
* Requires Nim compiler 2.0 or later **(Breaking Change)**.
* Remove `setOpenArrayStringable` **(Breaking Change)**.
* Add support for modern .NET through `winim/dotnet`.
* Add the WebView2 module and static loader support for VCC and GCC compilers.
* Add ownership-taking `adoptCom`/`adoptVariant` APIs to `winim/com`.
* Improve the robustness of `winim/winstr`, `winim/com`, and `winim/clr`.
* Update and expand the examples, including dotnet and WebView2.
* Remove `tcclib` related directories.

Version 3.9.4
-------------
* Update for Nim Compiler 2.2.
* Merge pull requests #93 and #94. Thanks to retsyo.

Version 3.9.3
-------------
* Fix destructor compatibility.

Version 3.9.2
-------------
* Update for Nim Compiler 2.0.
* Fix examples/uiautomation.nim (does not work on Windows 11).

Version 3.9.1
-------------
* Remove {.deadCodeElim.} and {.push hint[Name]:off.} pragmas.
* Remove deprecated bare except and unnamed break in code.
* Remove warning about an unlisted exception.

Version 3.9.0
-------------
* Remove annoying hints for symbol names in Nim Compiler 1.7.1 devel.
* Add msi module (#85).
* Add the IMethodInfo to mscoree.nim (#87).
* Fix MIB_TCPROW2 in iphlpapi.nim (#88).
* Fix examples/clr/simple_gui.nim (#89).

Version 3.8.1
-------------
* winim/clr: `[]` (syntactic sugar for toObject) caused conflicts too often; fixed.
* winim/winstr: Converters for WideCString were seldom used and led to bugs; removed.
* winim/winstr: Add some procs to convert between WideCString and wstring.

Version 3.8.0
-------------
* winim/clr: CLRVariant can be converted to a .NET object automatically in `invoke`.
* winim/clr: Improved iterator(items/pairs) to iterate over System.Array, Enumerable,
  Collection, etc.
* winim/clr: Remove syntax sugar for x.toObject(string) (almost useless).

Version 3.7.2
-------------
* winim/clr: Add the `OptionalParamBinding` binding flag so that calling methods with
  parameters that have default values is easier.

Version 3.7.1
-------------
* Fix #77.

Version 3.7.0
-------------
* Because implicit conversion to 'cstring' will become an error in the future,
  winim no longer uses cstring in type definitions. All 'LPSTR' and similar
  types are redefined to 'ptr char' now. Passing strings to the Windows API is still
  easy via winstr module **(Breaking Change)**.
* Fix #71.

Version 3.6.1
-------------
* Remove winimx module and related examples.

Version 3.6.0
-------------
* Add the mscoree and winim/clr modules. They provide Windows Common Language Runtime
  (CLR) support for Winim, allowing Nim to interact with the Windows .NET Framework.
* Add examples/clr.
* Add tests/clr_test.nim.

Version 3.5.0
-------------
* Add the uiautomation and dwmapi modules.
* Add examples/uiautomation.nim
* winstr: Add support for openArray and UncheckedArray.
* winstr: Add setOpenArrayStringable() to overwrite the default behavior for `$`.
* winstr: Improve the compile-time Unicode string generator.
* winstr: Remove seldom-used converters that convert arrays to pointers.
* winimx: Fix support for the Visual C compiler.

Version 3.4.3
-------------
* Add prebuilt resource file for vcc.

Version 3.4.2
-------------
* Don't maintain compatibility with Nim Compiler 0.19 anymore.
* Use int64 instead of uint64 for compatibility.
* Fix bugs.

Version 3.4.1
-------------
* Update for Nim Compiler 1.4.0.
* Fix #58 and #59.
* winimx: Reduce database size by using json module instead of marshal module.

Version 3.4.0
-------------
* com: Functions related to methods and properties can accept a `table constructor`
  (syntactic sugar for string-variant pairs array) as named arguments.
  Furthermore, `comScript` macro can translate nim's named arguments to table
  constructor syntax. In summary, method calls in a comScript block work like a
  scripting language that accepts named arguments for method calls (use *:=* as
  assignment to avoid syntax conflict).
* com: Objects and variants work fine with --gc:arc now. Since programs
  compiled by --gc:arc always clean up all resources before they exit, COM_FullRelease()
  exists but does nothing in this mode.
* Add com_test.nim.

Version 3.3.5
-------------
* winimx: Allows the output module to be marked as "used" with the `used` pragma.

Version 3.3.4
-------------
* Update for Nim Compiler 1.3.5 (devel).

Version 3.3.3
-------------
* com: Add the COMBinary type and support for converting between variant and binary data.
* examples/com: Add binary.nim.
* Fix some incorrect alignments and struct sizes.
* Fix #49.

Version 3.3.2
-------------
* com: Add isNull() to test null variant (VT_NULL).
* com: Null variant can convert to empty string instead of raising an error.
* examples/com: Add diskinfo.nim.

Version 3.3.1
-------------
* winstr: Fix bug.

Version 3.3.0
-------------
* Rewrite winim/winstr for --gc:arc.

Version 3.2.4
-------------
* Add {.gcsafe.} pragma block to COM methods indirect call.
* examples/com/nimDispatch: Rename files and add client.nim.

Version 3.2.3
-------------
* Update for Nim Compiler 0.20.99 (devel).
* Fix "imported and not used" warnings.

Version 3.2.2
-------------
* winimx: Allow wildcards and directory traversal.
* Fix bugs.

Version 3.2.1
-------------
* winstr: Remove TChar (already defined in windef).
* winimx: Fix support for the Visual C compiler and i386 (x86) mode.
* Remove miniz dependency.

Version 3.2.0
-------------
* objbase: Add "exdispid.h".
* mshtml: Add "mshtmhst.h".
* Add some missing converters for interfaces.

Version 3.1.1
-------------
* Update for Nim Compiler 0.20.0.
* winstr: Remove unnecessary asterisk.

Version 3.1.0
-------------
* Add wincred module.

Version 3.0.0
-------------
* Add winimx tool to generate the minified winim module.
* Add -d:noRes to disable the visual styles.
* Don't maintain compatibility with Nim Compiler 0.18 anymore.
* Remove -d:useWinXP (useless under Nim Compiler >= 0.19).

Version 2.6.1
-------------
* Update for Nim Compiler 0.19.9 again.
* Remove -d:mshtml (not so useful)
* Small change for new winimx tool.

Version 2.6.0
-------------
* Update for Nim Compiler 0.19.9.
* Add wincodec module.

Version 2.5.2
-------------
* commctrl: Add "commoncontrols.h".

Version 2.5.1
-------------
* Update for Nim Compiler 0.19.

Version 2.5.0
-------------
* winstr: Fix the nil issue for strings in the development compiler. It no longer
  allows nil for strings. This change may break code that relies on different
  behavior between nil and empty strings.

Version 2.4.4
-------------
* Fix a bug caused by incorrect use of sizeof().

Version 2.4.3
-------------
* com: Call CoInitialize() only when needed. This allows users to select a
  different apartment or call OleInitialize().
* winbase: Add InterlockedXXX functions.
* example: Add the nimDispatch example. It creates an IDispatch object in the
  local "running object table (ROT)", enabling RPC through a COM object.

Version 2.4.2
-------------
* winuser: Fix bugs about MAKEINTRESOURCE template.
* commctrl: Fix bugs in templates that use NULL for handles (should be 0).

Version 2.4.1
-------------
* com: Fix a critical bug related to the dot operator.

Version 2.4.0
-------------
* Using '/' instead of '.' to import paths.
* com: Add `[]` and `[]=` to access com object.
* com: Add ability to access COM object constants.
* winstr: Add TString and TChar.

Version 2.3.0
-------------
* Add a var-version access proc for nested structs/unions.
  It will be used in this situation:
    ```nim
    var insert: TVINSERTSTRUCT
    insert.item.mask = TVIF_TEXT or TVIF_PARAM
    ```
* Fix some literal constants with the 'U' suffix.

Version 2.2.0
-------------
* Fix converter ambiguity problems.
* Add -d:useWinXP for Windows XP compatibility.

Version 2.1.0
-------------
* Ready for Nim compiler version 0.18.1.
* Remove some APIs that Windows 7 does not support to avoid
  "could not import" error messages.

Version 2.0.0
-------------
* Ready for Nim compiler version 0.18.0.
* All Windows API and constant definitions are now translated from MinGW's
  header files. Winim no longer depends on "D WinAPI programming".
* API modules can import one by one if needed.
  Ex: import winim.inc.winuser
* Add the lean module for importing only the core Windows SDK, and the mean module
  for the core, Shell, and OLE APIs.
  Use import winim.lean or -d:lean to switch.
* Add -d:useWinAnsi to use the ANSI versions of the Windows API.
* Add -d:mshtml or import winim.html or winim.inc.mshtml for MSHTML.
  (The file size is too large, so add it only if needed.)
* Remove -d:winstyle (always enabled)
* winstr: add toHex, nullTerminate, nullTerminated, `<<<`, `>>>`,
  mlen, mIndex, etc. Also fix some bugs.
* com: add multithreading support.

Version 1.2.1
--------------
* winapi: Add double quotes to the resource file.
* winapi: Fix bug about GetWindowLongPtr and NMHDR etc.

Version 1.2.0
-------------
* winapi: Redefine constants as int literals where possible.
* winapi: Convert enum to const definition
* winapi: Add more definitions in shobjidl.h, propsys.h, shtypes.h,
  and structuredquerycondition.h
* com: Improve error messages for COMError exceptions.

Version 1.1.0
-------------
* winapi: Add -d:winstyle to enable Windows visual styles.

Version 1.0.0
-------------
* Initial release
