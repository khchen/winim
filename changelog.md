Version 3.4.1
-------------
* Update for Nim Compiler 1.4.0.
* Fix #58 and #59.
* winimx: Reduce database size by using json module instead of marshal module.

Version 3.4.0
-------------
* com: Methods and properties related functions can accept `table constructor`
  (syntactic sugar for string-variant pairs array) as named arguments.
  Furthermore, `comScript` macro can translate nim's named arguments to table
  constructor syntax. In summary, method call in comScript block works like the
  script language that accepts named arguments for method call (use *:=* as
  assignment to avoid syntax conflict).
* com: Objects and variants work fine with --gc:arc now. Since the programs
  compiled by --gc:arc always clean all the resource before they end, COM_FullRelease()
  is exists but just does nothing in this mode.
* Add com_test.nim.

Version 3.3.5
-------------
* winimx: Able to mark the output module as "used" by used pragma.

Version 3.3.4
-------------
* Update for Nim Compiler 1.3.5 (devel).

Version 3.3.3
-------------
* com: Add COMBinary type and support to convert between variant and binary data.
* examples/com: Add binary.nim.
* Fix some incorrect alignment and struct size.
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
* examples/com/nimDispatch: rename files and add client.nim.

Version 3.2.3
-------------
* Update for Nim Compiler 0.20.99 (devel).
* Fix "imported and not used" warnings.

Version 3.2.2
-------------
* winimx: Allow wildcard and walking over the directory.
* Fix bugs.

Version 3.2.1
-------------
* winstr: Remove TChar (already defined in windef).
* winimx: Fix support for visual c compiler and i386 (x86) mode.
* Remove miniz dependency.

Version 3.2.0
-------------
* objbase: Add "exdispid.h".
* mshtml: Add "mshtmhst.h".
* Add some missing converter for interface.

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
* winstr: Fix nil issue for string in devel compiler. Now it won't
  allow nil for string anymore. This change maybe break the code
  if it has different behavior between nil and empty string.
* Add support to Tiny C Compiler. See readme in tcclib.

Version 2.4.4
-------------
* Fix bug about using sizeof() incorrectly.

Version 2.4.3
-------------
* com: call CoInitialize() only when needed. This allow the user to
  selects different apartment or OleInitialize().
* winbase: Add InterlockedXXX functions.
* example: Add nimDispatch example. It create a IDispatch object on
  local "running object table (ROT)". So that RPC via COM object is
  achieved.

Version 2.4.2
-------------
* winuser: Fix bugs about MAKEINTRESOURCE template.
* commctrl: Fix bugs about templates use NULL for handle (should be 0).

Version 2.4.1
-------------
* com: A critical bug about dot operator fixed.

Version 2.4.0
-------------
* Using '/' instead of '.' to import paths.
* com: Add `[]` and `[]=` to access com object.
* com: Add ability to access COM object constants.
* winstr: Add TString and TChar.

Version 2.3.0
-------------
* Add var version access proc for nested struct/union.
  It will be used in this situation:
    ```nimrod
    var insert: TVINSERTSTRUCT
    insert.item.mask = TVIF_TEXT or TVIF_PARAM
    ```
* Fix some literal constant with 'U' suffix.

Version 2.2.0
-------------
* Fix converter ambiguous problems.
* Add -d:useWinXP for Windows XP compatibility.

Version 2.1.0
-------------
* Ready for Nim compiler version 0.18.1.
* Remove some APIs that Windows 7 not supports to avoid
  "could not import" error message.

Version 2.0.0
-------------
* Ready for Nim compiler version 0.18.0.
* All windows API and constant definitions are translated from MinGW's
  headers files now. Not depends on "D WinAPI programming" anymore.
* API modules can import one by one if needed.
  Ex: import winim.inc.winuser
* Add lean module for import core Windows SDK only, mean module
  for core + Shell + OLE API.
  Use import winim.lean or -d:lean to switch.
* Add -d:useWinAnsi to use the Ansi versions of the Windows API.
* Add -d:mshtml or import winim.html or winim.inc.mshtml for MSHTML.
  (file size is too big, add only if needed.)
* Remove -d:winstyle (always enabled)
* winstr: add toHex, nullTerminate, nullTerminated, `<<<`, `>>>`,
  mlen, mIndex, etc. Also fix some bugs.
* com: add multithreads support.

Version 1.2.1
--------------
* winapi: Add double quotes to resource file
* winapi: Fix bug about GetWindowLongPtr and NMHDR etc.

Version 1.2.0
-------------
* winapi: Redefine const to int literals if possible
* winapi: Convert enum to const definition
* winapi: Add more definition in shobjidl.h, propsys.h, shtypes.h,
  and structuredquerycondition.h
* com: Better error message on COMError exception

Version 1.1.0
-------------
* winapi: Add -d:winstyle to enable windows visual styles

Version 1.0.0
-------------
* Initial release
