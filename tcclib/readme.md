## How to Compiler by TCC (Tiny C Compiler)

To compiler winim by TCC, of course you need to download the TCC compiler.

* http://download.savannah.gnu.org/releases/tinycc/

You will need the following files:

    tcc-0.9.XX-win32-bin.zip
    tcc-0.9.XX-win64-bin.zip
    winapi-full-for-0.9.XX.zip

I suggest put these files into nim\dist, and then modify the
nim.cfg. Here is the example:

    @if i386:
      gcc.path = r"$nim\dist\mingw32\bin"
      tcc.path = r"$nim\dist\tcc32"
    @else:
      gcc.path = r"$nim\dist\mingw64\bin"
      tcc.path = r"$nim\dist\tcc64"
    @end

And the, you can compile winim program by TCC:

    nim c --cc:tcc --cpu:i386 example.nim

or

    nim c --cc:tcc --cpu:amd64 example.nim

**If you enconter an error message about "ftelli64", replace the file
*libtcc1-64.a* and the try again.**

## License
Copyright (c) 2016-2018 Kai-Hung Chen, Ward. All rights reserved.
