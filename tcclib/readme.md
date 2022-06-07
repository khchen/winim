## How to Compile Winim by Tiny C Compiler

To compile Winim by TCC, of course you need to download the TCC.

* http://download.savannah.gnu.org/releases/tinycc/

You will need the following files:

    tcc-0.9.XX-win32-bin.zip
    tcc-0.9.XX-win64-bin.zip
    winapi-full-for-0.9.XX.zip

I suggest put these files into nim\dist, and then modify the
*nim.cfg*. Here is the example:

    @if windows:
      @if i386:
        gcc.path = r"$nim\dist\mingw32\bin"
        tcc.path = r"$nim\dist\tcc32"
      @else:
        gcc.path = r"$nim\dist\mingw64\bin"
        tcc.path = r"$nim\dist\tcc64"
      @end
    @end

Now, you can try to compile Winim program by TCC:

    nim c --cc:tcc --cpu:i386 example.nim

or

    nim c --cc:tcc --cpu:amd64 example.nim

**If you enconter an error message about "ftelli64", replace the file
*libtcc1-64.a* and then try again.**

## How to Add the Resource Files

Winim module links winim32.res or winim64.res by default to force Windows
system using ComCtl32.dll version 6, aka enabling the Visual Styles
(Since Winim 3.0, you can add -d:noRes to disable it).

Tiny C Compiler supports COFF format res file. However, the problem is
it supports only one res file. So, if you add another resource file
in your code, for example: `{.link "myapp.res".}`, the program will fail
to execute because it miss the winim32.res or winim64.res. This problem
won't happen in gcc or vcc because they both support multiple res files.

How the resolve it? You need to enable the visual style by your self.
Here are the steps to do.

1. Prepare the manifest file. For example:
```
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
<assemblyIdentity
    version="1.0.0.0"
    processorArchitecture="*"
    name="CompanyName.ProductName.YourApplication"
    type="win32"
/>
<description>Your application description here.</description>
<dependency>
    <dependentAssembly>
        <assemblyIdentity
            type="win32"
            name="Microsoft.Windows.Common-Controls"
            version="6.0.0.0"
            processorArchitecture="*"
            publicKeyToken="6595b64144ccf1df"
            language="*"
        />
    </dependentAssembly>
</dependency>
</assembly>
```

2. Prepare the rc file. For example:
```
1 24 "myapp.manifest"
1000 ICON "myapp.ico"
```

3. Compile the rc file by windres (the tool should be in the gcc path).
```
windres -O coff myapp.rc -o myapp.res
```

4. Request TCC to link this file by add following line in nim code:
```
{.link "myapp.res".}
```

That's all. More informations:

https://docs.microsoft.com/en-us/windows/desktop/controls/cookbook-overview
https://github.com/Amorph/tcc/blob/master/win32/tcc-win32.txt

## License
Copyright (c) 2016-2022 Kai-Hung Chen, Ward. All rights reserved.
