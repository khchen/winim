#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

{.push hint[XDeclaredButNotUsed]: off.}

import winim/dotnet
import std/[base64, os, strformat, strutils, tempfiles, unittest]

suite "Test Suites for winim/dotnet":
  # Avoid unittest pragma name collisions.
  const
    on = true
    off = false

  setup:
    var cleanupFiles: seq[string] = @[]

    proc writeTrackedFile(path, content: string) =
      cleanupFiles.add(path)
      writeFile(path, content)

    proc frameworkAssembly(name: string): string =
      let info = dotnetRuntimeInfo()
      result = info.dotnetRoot / "shared" / info.frameworkName / info.frameworkVersion / name
      doAssert fileExists(result), "framework assembly not found: " & name

  teardown:
    for index in countdown(cleanupFiles.high, 0):
      if fileExists(cleanupFiles[index]):
        removeFile(cleanupFiles[index])

  test "Startup and Host Lifecycle":
    let
      missingConfig = genTempPath("winim-dotnet-missing-runtimeconfig-", ".json")
      invalidVersionConfig = genTempPath("winim-dotnet-invalid-framework-version-", ".json")
      missingHostfxr = genTempPath("winim-dotnet-missing-hostfxr-", ".dll")

    writeTrackedFile(invalidVersionConfig, """{"runtimeOptions":{"framework":{"name":"Microsoft.NETCore.App","version":"99.99.999"}}}""")
    expect DotnetError: dotnetStart(missingConfig)
    expect DotnetError: dotnetStart(invalidVersionConfig)
    expect DotnetError: dotnetStart("", missingHostfxr)

    dotnetClose()
    expect DotnetError: loadAssembly("missing.dll")

    dotnetStart()
    defer: dotnetClose()

    let info = dotnetRuntimeInfo()
    check:
      info.runtimeConfigGenerated
      info.runtimeConfigPath.len != 0
      not fileExists(info.runtimeConfigPath)
      info.frameworkName == "Microsoft.NETCore.App"
      info.frameworkVersion.len != 0
      dirExists(info.dotnetRoot / "shared" / info.frameworkName / info.frameworkVersion)
      fileExists(info.hostfxrPath)
      dirExists(info.dotnetRoot)

    let builder = newObject("System.Text.StringBuilder")
    dotnetStart()
    check $builder == ""
    expect DotnetError: dotnetStart(missingConfig)

    dotnetClose()
    dotnetClose()
    expect DotnetError: loadAssembly("missing.dll")
    expect DotnetError: discard dotnetRuntimeInfo()

    dotnetStart()
    check dotnetRuntimeInfo().frameworkName == "Microsoft.NETCore.App"

    let
      activeVersion = info.frameworkVersion
      hostfxrPath = info.hostfxrPath
      dotnetRoot = info.dotnetRoot
      configText = fmt"""{{"runtimeOptions":{{"frameworks":[{{"name":"Microsoft.NETCore.App","version":"{activeVersion}"}}]}}}}"""
      configPath = genTempPath("winim-dotnet-explicit-", ".runtimeconfig.json")
      systemRoot = getEnv("SystemRoot")
      invalidHostfxr = systemRoot / "System32" / "kernel32.dll"

    writeTrackedFile(configPath, configText)
    dotnetClose()
    dotnetStart(configPath)
    let explicitInfo = dotnetRuntimeInfo()
    check:
      not explicitInfo.runtimeConfigGenerated
      explicitInfo.runtimeConfigPath == absolutePath(configPath)
      explicitInfo.frameworkName == "Microsoft.NETCore.App"
      explicitInfo.frameworkVersion == activeVersion
    let runtimeAssembly = load("System.Runtime")
    check:
      runtimeAssembly.name == "System.Runtime"
      fileExists(runtimeAssembly.path)
    dotnetStart(configPath)
    check dotnetRuntimeInfo().runtimeConfigPath == absolutePath(configPath)
    dotnetClose()

    expect DotnetError: dotnetStart("", hostfxrPath, dotnetRoot, "Microsoft.NETCore.App\"", activeVersion)
    expect DotnetError: dotnetStart("", hostfxrPath, dotnetRoot, "Microsoft.NETCore.App", activeVersion & "\"")

    dotnetStart("", "", dotnetRoot, "Microsoft.NETCore.App", activeVersion)
    let rootOnlyInfo = dotnetRuntimeInfo()
    check:
      rootOnlyInfo.hostfxrPath == hostfxrPath
      rootOnlyInfo.dotnetRoot == absolutePath(dotnetRoot)
    dotnetClose()

    dotnetStart("", hostfxrPath, dotnetRoot, "Microsoft.NETCore.App", activeVersion)
    let overriddenInfo = dotnetRuntimeInfo()
    check:
      overriddenInfo.runtimeConfigGenerated
      overriddenInfo.hostfxrPath == hostfxrPath
      overriddenInfo.dotnetRoot == absolutePath(dotnetRoot)
      overriddenInfo.frameworkVersion == activeVersion
    dotnetClose()

    dotnetStart("", splitFile(hostfxrPath).dir, dotnetRoot, "Microsoft.NETCore.App", activeVersion)
    check dotnetRuntimeInfo().hostfxrPath == hostfxrPath
    dotnetClose()

    if fileExists(invalidHostfxr):
      expect DotnetError: dotnetStart("", invalidHostfxr)

  test "Loading, Binding, and Types":
    block:
      dotnetStart()
      defer: dotnetClose()

      let
        coreAssemblyPath = frameworkAssembly("System.Private.CoreLib.dll")
        loaded = load(coreAssemblyPath, "System.GC", "Collect", "System.Action")
        loadedMethod = getMethod("System.GC", "Collect", "System.Action")
        collectionsPath = frameworkAssembly("System.Collections.dll")
        concurrentPath = frameworkAssembly("System.Collections.Concurrent.dll")
        concurrentBytes = readFile(concurrentPath)
        missingAssembly = genTempPath("winim-dotnet-missing-assembly-", ".dll")

      asProc[proc() {.stdcall.}](loaded)()
      loadAssembly(collectionsPath)
      loadAssembly(concurrentBytes.toOpenArrayByte(0, concurrentBytes.len - 1))
      asProc[proc() {.stdcall.}](loadedMethod)()

      check:
        loaded.address != nil
        loadedMethod.address != nil

      expect DotnetError: load(coreAssemblyPath, "System.GC", "Collect")
      expect DotnetError: getMethod("System.GC", "Collect")
      expect DotnetError: loadAssembly(missingAssembly)

    block:
      dotnetStart()
      defer: dotnetClose()

      type
        AddMethod = proc(left, right: int32): int32 {.stdcall.}

      const
        DotnetFixtureAssemblyBase64 = """TVqQAAMAAAAEAAAA//8AALgAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAA4fug4AtAnNIbgBTM0hVGhpcyBwcm9ncmFtIGNhbm5vdCBiZSBydW4gaW4gRE9TIG1vZGUuDQ0KJAAAAAAAAABQRQAATAEDACmxeGoAAAAAAAAAAOAAIiALATAAABQAAAAGAAAAAAAA8jMAAAAgAAAAQAAAAAAAEAAgAAAAAgAABAAAAAAAAAAEAAAAAAAAAACAAAAAAgAAAAAAAAMAQIUAABAAABAAAAAAEAAAEAAAAAAAABAAAAAAAAAAAAAAAJ8zAABPAAAAAEAAANACAAAAAAAAAAAAAAAAAAAAAAAAAGAAAAwAAAAkMgAAOAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAACAAAAAAAAAAAAAAACCAAAEgAAAAAAAAAAAAAAC50ZXh0AAAA+BMAAAAgAAAAFAAAAAIAAAAAAAAAAAAAAAAAACAAAGAucnNyYwAAANACAAAAQAAAAAQAAAAWAAAAAAAAAAAAAAAAAABAAABALnJlbG9jAAAMAAAAAGAAAAACAAAAGgAAAAAAAAAAAAAAAAAAQAAAQgAAAAAAAAAAAAAAAAAAAADTMwAAAAAAAEgAAAACAAUANCIAAPAPAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD4CKAoAAAoAAgN9AQAABComAnsBAAAEA1gqHgJ7AgAABCoiAgN9AgAABCo+Ahl9AgAABAIoCgAACgAqHgJ7AwAABCoiAgN9AwAABCpOAnIBAABwfQMAAAQCKA0AAAYAKj4CKAoAAAoAAgN9BQAABCoTMAIAHwAAAAEAABEAfgQAAAQXWIAEAAAEH1MCewUAAARzCwAACgorAAYqPgIoCgAACgACA30HAAAEKjICewcAAARzLQAABiouchEAAHBzDAAACnoiAigKAAAKACoKGCoeA4wYAAABKi5yTQAAcHMNAAAKei5ymQAAcHMMAAAKehp+CQAABCoeAoAJAAAEKhICA1gqGnLFAABwKhpyzQAAcCoOHyoqLnLbAABwcwwAAAp6Jh94AnMLAAAKKjIgQX4AAAJzCwAACio6H0UCcwsAAApzDAAACnoKAyo6HYAIAAAEHwuACQAABCpaAhV9CwAABAIoCgAACgACA30KAAAEKjICewsAAASMGAAAASoAABMwAwBAAAAAAgAAEQACAnsLAAAEF1h9CwAABAJ7CgAABCwLAnsLAAAEF/4BKwEWCgYsC3L7AABwcwwAAAp6AnsLAAAEGf4ECysAByoiAhV9CwAABCo2fgYAAAQXWIAGAAAEKgBCU0pCAQABAAAAAAAMAAAAdjQuMC4zMDMxOQAAAAAFAGwAAAAsBwAAI34AAJgHAABYBQAAI1N0cmluZ3MAAAAA8AwAADABAAAjVVMAIA4AABAAAAAjR1VJRAAAADAOAADAAQAAI0Jsb2IAAAAAAAAAAgAAAVcXogEJAgAAAPoBMwAWAAABAAAAGQAAAA0AAAALAAAAMQAAACUAAAAFAAAADQAAABYAAAACAAAABgAAAAkAAAAMAAAAAQAAAAEAAAABAAAAAAD8AgEAAAAAAAYATQLSAwYAiwLSAwYAzQGgAw8A8gMAAAYANQLSAwYANgOzAwYAEwKzAwYAiQEdAwYAnAQdAwYAuwQdAwYA0AIdAwYAsgHSAwYAmwGgAwYA4QGgAwYAzgBFBAYAeQNFBAYAGgEdAwYA/AEkAwYAbQKzAwYAOgEdAwYA7ALSAwYAtwIdAwYAXwMdAwYAAQAdAwYASAMdAwAAAAARAAAAAAABAAEAAQEAAG4BUwEhAAEAAQABAQAAegFTASEAAQAFAAEBEABwBFMBJQABAAkAAQAQAJIEUwElAAIACwABARAAfgRTARQAAwAOAAEBEAAdBVMBJQAEABEAAQEQAPIAUwElAAYAEwABARAABwFTASUACAAVAAEBEADaAFMBJQAIABcAAQEQACYBUwElAAgAGwCBARAAZARTASUACAAfAAMBEACIAwAAJQAKAC0ABgCpAjkAAQBeADkAAQBeADwAFgAdBDkAIQDJAjkAFgD2BDkAIQCYAD8AFgBSADkAEQB4ADkAIQCYAD8AAQAsBTkAAAAAAAMAhhiTA0IAAQAAAAAAAwDGAccASAADAAAAAAADAMYBwgBOAAUAAAAAAAMAxgG4AFgACQAAAAAAAwCGGJMDQgAKAAAAAAADAMYBxwBeAAwAAAAAAAMAxgHCAGIADAAAAAAAAwDGAbgAWAAOAFAgAAAAAIYYkwMBAA8AYCAAAAAAhgA2AGoAEABqIAAAAACGCCsEXgARAHIgAAAAAIYIOAQBABEAeyAAAAAAhhiTAwYAEgCLIAAAAACGCCsEbwASAJMgAAAAAIYIOAQcABIAnCAAAAAAhhiTAwYAEwCwIAAAAACGGJMDAQATAMAgAAAAAMYAtQJvABQA6yAAAAAAhhiTA3MAFAD7IAAAAADmAYUDeAAVAAghAAAAAOYBhQN4ABUAFCEAAAAAhhiTAwYAFQAdIQAAAACGCOwEXgAVACAhAAAAAIYIFAN9ABUAKCEAAAAA5gGFA3gAFgAUIQAAAACGGJMDBgAWADQhAAAAAIYI7AReABYAHSEAAAAAhgi+Al4AFgAgIQAAAACGCBQDfQAWABQhAAAAAIYYkwMGABcAQCEAAAAAlggyBYIAFwBHIQAAAACWCEUFhgAXAE8hAAAAAJYAOgCLABgAVCEAAAAAlgDnApEAGgBbIQAAAACWAOcClgAbAGIhAAAAAJYAFgSCABwAZiEAAAAAlgBFAIIAHAByIQAAAACWABMFkQAcAHwhAAAAAJYABwCRAB0AiSEAAAAAlgCtAIYAHgCYIQAAAACWAM8EmwAfAJghAAAAAJYACwSbACEATyEAAAAAlgA2AIsAIwCbIQAAAACRGJkDoQAlAKohAAAAAIYYkwNzACUAwSEAAAAA5gngBKUAJgDQIQAAAADmAQoFqQAmABwiAAAAAOYBqgQGACYAJSIAAAAA5gFmAQYAJgAAAAEAowQAAAIApgAAAAEAsAQAAAIAtQQAAAEAsAQAAAIAtQQAAAMA3gIAAAQAowQAAAEAyAQAAAEAowQAAAIApgAAAAEA3gIAAAIAowQAAAEAyAQAAAEArwIAAAEAAwUAAAEArwIAAAEArwIAAAEAyQIAAAEAmAAAAAEALAUAAAEALAUAAAEArwIAAAEAsAQAAAIAtQQAAAEArwIAAAEArwIAAAEAyQIAAAEAWAQAAAEAyQIAAAEAGgAAAAIAAQQAAAEAGgAAAAIAAQQAAAEAsAQAAAIAtQQAAAEAmAAIAD0ACQA9AAoAPQANAEEADQBFAAkAkwMBABEAkwMGABkAkwMKACkAkwMBADkAkwMQAGEAkwMGAHEAkwMWAJEAkwMcAJkAkwMGAEkAkwMGALEAkwMlALkAkwMcAMkAkwMcACcAIwC3AS4ACwDCAC4AEwDLAC4AGwDqAEEAMwDzAEEAOwCbAUMAKwCkAWEAMwDzAGEAOwCbAWMAKwCkASEBMwDzACEBOwCbAUMBQwCtAWABMwDzAGMBQwCtAYABMwDzAMABMwDzAOABMwDzAOADMwDzAAAEMwDzAEAFSwDzAGAFSwD4ACEAKwAFAAEABgACAAoAAwALAAUADAAIAA0ACQAAADwErQAAADwEsQAAAP0ErQAAABgDtQAAAP0ErQAAAMICrQAAABgDtQAAAEkFugAAAOQEvgACAAsAAwABAAwAAwACAA4ABQABAA8ABQACABcABwACABgACQACABsACwACABwADQACAB0ADwACAB8AEQABACAAEQACAC4AEwAEgAAAAAAAAAAAAAAAAAAAAAA/AQAACAAAAAAAAAAAAAAAMAAfAAAAAAANAAgAAAAASW50MzIATGFyZ2VVdGY4ADxNb2R1bGU+AGRhdGEAU3lzdGVtLlByaXZhdGUuQ29yZUxpYgBBZGQAQWRkTWFuYWdlZABUaHJvd01hbmFnZWQAU3RhdGljRmllbGQAPENvbnRyb2xzPmtfX0JhY2tpbmdGaWVsZAA8U3RhdGljUHJvcGVydHk+a19fQmFja2luZ0ZpZWxkAHRocm93T25TZWNvbmQAbWV0aG9kAFRocm93TGFyZ2UARW5kSW52b2tlAEJlZ2luSW52b2tlAElFbnVtZXJhYmxlAE1pc3NpbmdNZXRob2RFbnVtZXJhYmxlAERpc3Bvc2FibGVFbnVtZXJhYmxlAFRocm93aW5nRW51bWVyYWJsZQBJRGlzcG9zYWJsZQBDb3VudEVycm9ySW5kZXhhYmxlAFR5cGUAV2luaW0uRG90bmV0Rml4dHVyZQBXaW5pbURvdG5ldEZpeHR1cmUARGlzcG9zZQBBZGREZWxlZ2F0ZQBOb0FyZ3NEZWxlZ2F0ZQBNdWx0aWNhc3REZWxlZ2F0ZQBEZWJ1Z2dlckJyb3dzYWJsZVN0YXRlAENvbXBpbGVyR2VuZXJhdGVkQXR0cmlidXRlAERlYnVnZ2FibGVBdHRyaWJ1dGUARGVidWdnZXJCcm93c2FibGVBdHRyaWJ1dGUARGVmYXVsdE1lbWJlckF0dHJpYnV0ZQBVbm1hbmFnZWRGdW5jdGlvblBvaW50ZXJBdHRyaWJ1dGUAUmVmU2FmZXR5UnVsZXNBdHRyaWJ1dGUAQ29tcGlsYXRpb25SZWxheGF0aW9uc0F0dHJpYnV0ZQBVbm1hbmFnZWRDYWxsZXJzT25seUF0dHJpYnV0ZQBSdW50aW1lQ29tcGF0aWJpbGl0eUF0dHJpYnV0ZQBWYWx1ZQB2YWx1ZQBUb1N0cmluZwBnZXRfTGVuZ3RoAGxlbmd0aABBc3luY0NhbGxiYWNrAGNhbGxiYWNrAFBpY2sAQ2FsbENvbnZTdGRjYWxsAFdpbmltLkRvdG5ldEZpeHR1cmUuZGxsAGdldF9JdGVtAFN5c3RlbQBTeXN0ZW0uUmVmbGVjdGlvbgBDYWxsaW5nQ29udmVudGlvbgBNaXNzaW5nTWV0aG9kRXhjZXB0aW9uAEludmFsaWRPcGVyYXRpb25FeGNlcHRpb24ASUVudW1lcmF0b3IAR2V0RW51bWVyYXRvcgAuY3RvcgAuY2N0b3IAU3lzdGVtLkRpYWdub3N0aWNzAFN5c3RlbS5SdW50aW1lLkludGVyb3BTZXJ2aWNlcwBTeXN0ZW0uUnVudGltZS5Db21waWxlclNlcnZpY2VzAERlYnVnZ2luZ01vZGVzAHNpemVCeXRlcwBDb3VudEJ5dGVzAE5vQXJncwBUb1N0cmluZ0NhbGxzAGdldF9Db250cm9scwBzZXRfQ29udHJvbHMAU3lzdGVtLkNvbGxlY3Rpb25zAHJlcGV0aXRpb25zAEVudHJ5UG9pbnRzAEZpeHR1cmVPYmplY3QARGVyaXZlZE1lbWJlck9iamVjdABCYXNlTWVtYmVyT2JqZWN0AG9iamVjdABSZXNldABsZWZ0AHJpZ2h0AElBc3luY1Jlc3VsdAByZXN1bHQARGVmYXVsdENvbXBvbmVudABnZXRfQ3VycmVudABnZXRfQ291bnQARGlzcG9zZUNvdW50AGFtb3VudABNb3ZlTmV4dABMYXJnZVRleHQAU2lkZUVmZmVjdFRleHQAaW5kZXgAZ2V0X1N0YXRpY1Byb3BlcnR5AHNldF9TdGF0aWNQcm9wZXJ0eQAAD2QAZQByAGkAdgBlAGQAADtmAGkAeAB0AHUAcgBlACAARwBlAHQARQBuAHUAbQBlAHIAYQB0AG8AcgAgAGYAYQBpAGwAdQByAGUAAEtmAGkAeAB0AHUAcgBlACAAbQBhAG4AYQBnAGUAZAAgAEcA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cwBzAGUAbQBiAGwAeQAgAFYAZQByAHMAaQBvAG4AAAAwAC4AMAAuADAALgAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMAAADAAAAPQzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=="""
        fixtureTypeName = "WinimDotnetFixture.EntryPoints, Winim.DotnetFixture"
        fixtureSideEffectTypeName = "WinimDotnetFixture.SideEffectText, Winim.DotnetFixture"
        fixtureAmbiguousTypeName = "WinimDotnetFixture.DerivedMemberObject, Winim.DotnetFixture"
        fixtureThrowingEnumerableTypeName = "WinimDotnetFixture.ThrowingEnumerable, Winim.DotnetFixture"
        fixtureMissingMethodEnumerableTypeName = "WinimDotnetFixture.MissingMethodEnumerable, Winim.DotnetFixture"
        fixtureCountErrorIndexableTypeName = "WinimDotnetFixture.CountErrorIndexable, Winim.DotnetFixture"
        fixtureBytes = decode(DotnetFixtureAssemblyBase64)

      loadAssembly(fixtureBytes.toOpenArrayByte(0, fixtureBytes.len - 1))
      let
        addMethod = getMethod(fixtureTypeName, "Add", UnmanagedCallersOnly)
        entryPoints = newClass(fixtureTypeName)
        sideEffectClass = newClass(fixtureSideEffectTypeName)
        sideEffect = newObject(fixtureSideEffectTypeName, 65_537)
        throwingEnumerable = newObject(fixtureThrowingEnumerableTypeName)
        missingMethodEnumerable = newObject(fixtureMissingMethodEnumerableTypeName)
        countErrorIndexable = newObject(fixtureCountErrorIndexableTypeName)
        ambiguousObject = newObject(fixtureAmbiguousTypeName)

      entryPoints.dotnetSet("StaticField", 9)
      entryPoints.setProperty("StaticProperty", 13)
      sideEffectClass.ToStringCalls = 0
      ambiguousObject.setProperty("Controls", "updated")

      let
        changedField = entryPoints.getProperty("StaticField")
        changedProperty = entryPoints.getProperty("StaticProperty")
        picked = entryPoints.invoke("Pick", 7)
        multibyteText = $entryPoints.invoke("LargeUtf8", 21_846)
        sideEffectText = $sideEffect
        toStringCalls = sideEffectClass.ToStringCalls
        updatedControls = ambiguousObject.getProperty("Controls")

      expect DotnetError: (block: (for item in throwingEnumerable: item.release()))
      expect DotnetError: (block: (for item in missingMethodEnumerable: item.release()))
      expect DotnetError: (block: (for item in countErrorIndexable: item.release()))

      let fixturePath = genTempPath("winim-dotnet-binding-", ".dll")
      writeTrackedFile(fixturePath, fixtureBytes)

      let pathAddMethod = load(fixturePath, fixtureTypeName, "Add", "*")

      check:
        asProc[AddMethod](addMethod)(20, 22) == 42
        asProc[AddMethod](addMethod)(17, 25) == 42
        changedField.toInt == 9
        changedProperty.toInt == 13
        $picked == "int"
        multibyteText == "繁".repeat(21_846)
        sideEffectText.len == 65_537
        toStringCalls.toInt == 1
        $updatedControls == "updated"
        asProc[AddMethod](pathAddMethod)(1, 41) == 42
        asProc[AddMethod](pathAddMethod)(2, 40) == 42

      expect DotnetError: entryPoints.invoke("ThrowLarge", 70_000)
      expect DotnetError: entryPoints.invoke("ThrowManaged")

      for length in [65_535, 65_536, 65_537]:
        let largeText = $entryPoints.invoke("LargeText", length)
        check largeText == "x".repeat(length)

    block:
      dotnetStart()
      defer: dotnetClose()

      let
        collections = load("System.Collections")
        collectionsByPath = load(collections.path)
        arrayListClass = collections.getType("System.Collections.ArrayList")

      check:
        collections.name == "System.Collections"
        fileExists(collections.path)
        collectionsByPath.name == collections.name
        collectionsByPath.path == collections.path
        arrayListClass.typeName == "System.Collections.ArrayList"
        arrayListClass.assemblyName == "System.Collections"

  test "Values and Call Boundaries":
    let
      nullValue = toDotnetValue(nil)
      encoded = DotnetValue(kind: DotnetValueKind.Bool, boolValue: true)

    check:
      nullValue.kind == DotnetValueKind.Null
      toDotnetValue(encoded).kind == DotnetValueKind.Bool
      toDotnetValue(true).kind == DotnetValueKind.Bool
      toDotnetValue(true).boolValue
      toDotnetValue("text").kind == DotnetValueKind.String
      toDotnetValue("text").stringValue == "text"
      toDotnetValue(cstring "cstring").kind == DotnetValueKind.String
      toDotnetValue(cstring "cstring").stringValue == "cstring"
      toDotnetValue('N').kind == DotnetValueKind.String
      toDotnetValue('N').stringValue == "N"
      toDotnetValue(int(-17)).kind == DotnetValueKind.Int64
      toDotnetValue(int(-17)).int64Value == -17
      toDotnetValue(int8(-8)).kind == DotnetValueKind.Int64
      toDotnetValue(int8(-8)).int64Value == -8
      toDotnetValue(int16(-16)).kind == DotnetValueKind.Int64
      toDotnetValue(int16(-16)).int64Value == -16
      toDotnetValue(int32(-32)).kind == DotnetValueKind.Int64
      toDotnetValue(int32(-32)).int64Value == -32
      toDotnetValue(int64(-64)).kind == DotnetValueKind.Int64
      toDotnetValue(int64(-64)).int64Value == -64
      toDotnetValue(uint(18)).kind == DotnetValueKind.UInt64
      toDotnetValue(uint(18)).uint64Value == 18
      toDotnetValue(uint8(8)).kind == DotnetValueKind.UInt64
      toDotnetValue(uint8(8)).uint64Value == 8
      toDotnetValue(uint16(16)).kind == DotnetValueKind.UInt64
      toDotnetValue(uint16(16)).uint64Value == 16
      toDotnetValue(uint32(32)).kind == DotnetValueKind.UInt64
      toDotnetValue(uint32(32)).uint64Value == 32
      toDotnetValue(uint64(64)).kind == DotnetValueKind.UInt64
      toDotnetValue(uint64(64)).uint64Value == 64
      toDotnetValue(float32(1.5)).kind == DotnetValueKind.Float64
      toDotnetValue(float32(1.5)).float64Value == 1.5
      toDotnetValue(float64(2.5)).kind == DotnetValueKind.Float64
      toDotnetValue(float64(2.5)).float64Value == 2.5
      toDotnetValue(DotnetObject()).kind == DotnetValueKind.Null

    let
      componentMethod = DotnetMethod(address: cast[pointer](proc (data: pointer, size: int32): int32 {.stdcall.} = size))
      data = @[byte 1, 2, 3]
      emptyData: seq[byte] = @[]
      value = int32(42)
      emptyText = ""

    check:
      componentMethod.call() == 0
      componentMethod.call(addr data[0], int32(data.len)) == 3
      componentMethod.call(data.toOpenArray(0, data.high)) == 3
      componentMethod.call(emptyData.toOpenArray(0, -1)) == 0
      componentMethod.call("hello") == 5
      componentMethod.call(emptyText) == 0
      componentMethod.call(value) == int32(sizeof(value))

    dotnetStart()
    defer: dotnetClose()

    let
      assemblyPath = frameworkAssembly("System.Private.CoreLib.dll")
      emptyBytes: seq[byte] = @[]

    expect DotnetError: load(assemblyPath, "System.GC", "Collect", UnmanagedCallersOnly)
    expect DotnetError: getMethod("System.GC", "Collect", "*")
    expect DotnetError: load(assemblyPath, "System.GC", "Collect")
    expect DotnetError: getMethod("System.GC", "Collect")
    expect DotnetError: loadAssembly(emptyBytes)
    expect DotnetError: discard asProc[proc() {.stdcall.}](DotnetMethod())
    expect DotnetError: discard DotnetMethod().call()

    let
      typeType = getManagedType("System.Type, System.Private.CoreLib")
      stringType = getManagedType("System.String, System.Private.CoreLib")
      intPtrType = getManagedType("System.IntPtr, System.Private.CoreLib")
      int32Type = getManagedType("System.Int32, System.Private.CoreLib")
      boolType = getManagedType("System.Boolean, System.Private.CoreLib")
      funcType = getManagedType("System.Func`2, System.Private.CoreLib")
      convertClass = loadClass("System.Convert", "System.Private.CoreLib")
      delegateTypeArguments = newManagedArray(typeType, [stringType, intPtrType])
      delegateType = dotnetInvoke(funcType, "MakeGenericType", delegateTypeArguments)
    var
      callbackCount = 0
      callbackArgument = ""

    proc callback(args: openArray[DotnetObject]): DotnetObject =
      inc callbackCount
      check args.len == 1
      callbackArgument = $args[0]
      if callbackArgument == "loader":
        return newObject("System.IntPtr", 123)
      newObject("System.IntPtr", 0)

    let
      managedDelegate = newDelegate(delegateType, callback)
      result = dotnetInvoke(managedDelegate, "DynamicInvoke", "loader")

    check:
      callbackCount == 1
      callbackArgument == "loader"
      $result == "123"

    let
      referenceDelegateTypeArguments = newManagedArray(typeType, [stringType, stringType])
      referenceDelegateType = dotnetInvoke(funcType, "MakeGenericType", referenceDelegateTypeArguments)
      referenceDelegate = newDelegate(referenceDelegateType) do (args: openArray[DotnetObject]) -> DotnetObject:
        check args.len == 1
        args[0]
      referenceResult = dotnetInvoke(referenceDelegate, "DynamicInvoke", "input")

    check $referenceResult == "input"

    let
      primitiveDelegateTypeArguments = newManagedArray(typeType, [int32Type, boolType])
      primitiveDelegateType = dotnetInvoke(funcType, "MakeGenericType", primitiveDelegateTypeArguments)
      primitiveDelegate = newDelegate(primitiveDelegateType) do (args: openArray[DotnetObject]) -> DotnetObject:
        check args.len == 1
        dotnetInvoke(convertClass, "ToBoolean", args[0].toInt > 10)
      primitiveArgument = dotnetInvoke(convertClass, "ToInt32", 11)
      primitiveResult = dotnetInvoke(primitiveDelegate, "DynamicInvoke", primitiveArgument)

    check primitiveResult.toBool

    let
      fiveParameterType = getManagedType("System.Func`6, System.Private.CoreLib")
      fiveParameterTypeArguments = newManagedArray(typeType, [int32Type, int32Type, int32Type, int32Type, int32Type, int32Type])
      fiveParameterDelegateType = dotnetInvoke(fiveParameterType, "MakeGenericType", fiveParameterTypeArguments)
      fiveParameterDelegate = newDelegate(fiveParameterDelegateType) do (args: openArray[DotnetObject]) -> DotnetObject:
        check args.len == 5
        dotnetInvoke(convertClass, "ToInt32", args[0].toInt + args[1].toInt + args[2].toInt + args[3].toInt + args[4].toInt)
      argumentOne = dotnetInvoke(convertClass, "ToInt32", 1)
      argumentTwo = dotnetInvoke(convertClass, "ToInt32", 2)
      argumentThree = dotnetInvoke(convertClass, "ToInt32", 3)
      argumentFour = dotnetInvoke(convertClass, "ToInt32", 4)
      argumentFive = dotnetInvoke(convertClass, "ToInt32", 5)
      fiveParameterResult = dotnetInvoke(fiveParameterDelegate, "DynamicInvoke", argumentOne, argumentTwo, argumentThree, argumentFour, argumentFive)

    check fiveParameterResult.toInt == 15

    var actionCount = 0
    let
      actionType = getManagedType("System.Action`2, System.Private.CoreLib")
      actionTypeArguments = newManagedArray(typeType, [stringType, int32Type])
      actionDelegateType = dotnetInvoke(actionType, "MakeGenericType", actionTypeArguments)
      actionDelegate = newDelegate(actionDelegateType) do (args: openArray[DotnetObject]) -> DotnetObject:
        check:
          args.len == 2
          $args[0] == "done"
          args[1].toInt == 7
        inc actionCount
      actionArgument = dotnetInvoke(convertClass, "ToInt32", 7)
    dotnetInvoke(actionDelegate, "DynamicInvoke", "done", actionArgument)
    check actionCount == 1

    let failingDelegate = newDelegate(actionDelegateType) do (args: openArray[DotnetObject]) -> DotnetObject:
      raise newException(ValueError, "callback failed")
    expect DotnetError:
      dotnetInvoke(failingDelegate, "DynamicInvoke", "done", actionArgument)

    let
      badDelegateTypeArguments = newManagedArray(typeType, [stringType, int32Type])
      badDelegateType = dotnetInvoke(funcType, "MakeGenericType", badDelegateTypeArguments)
      badDelegate = newDelegate(badDelegateType, callback)
    expect DotnetError:
      discard dotnetInvoke(badDelegate, "DynamicInvoke", "loader")

  test "Object Syntax":
    dotnetStart()
    defer: dotnetClose()

    let
      shorthandBuilder = newObject("StringBuilder")
      builder = newObject("System.Text.StringBuilder")
      classBuilder = loadClass("System.Text.StringBuilder", "System.Private.CoreLib").newObject()
      shorthandObject = loadClass("System.Text.StringBuilder").new()
      qualifiedObject = newClass("System.Text.StringBuilder, System.Private.CoreLib", "Ignored").new()
      stringClass = newClass("System.String", "System.Private.CoreLib")

    shorthandBuilder.Capacity = 64
    dotnetScript:
      builder.Capacity = 24

    check:
      shorthandBuilder.Capacity.toInt == 64
      builder.Capacity.toInt == 24
      $builder.ToString() == ""
      $shorthandBuilder.Append("Nim object syntax").Append("繁體中文 😀") == "Nim object syntax繁體中文 😀"
      $classBuilder.Append("class proxy") == "class proxy"
      $shorthandObject.Append("short class") == "short class"
      $qualifiedObject.Append("qualified class") == "qualified class"
      $stringClass.Concat("left", "right") == "leftright"

    let list = newObject("System.Collections.ArrayList")
    list.Add("first")
    list.Add("second")
    dotnetScript:
      list.Item(1) = "updated"

    check:
      $list[0] == "first"
      $list[1] == "updated"

    var iterated: seq[string]
    for item in list:
      iterated.add $item
    check iterated == @["first", "updated"]

    expect DotnetError: DotnetObject().UnknownMember()
    expect DotnetError: DotnetClass().UnknownMember()
    builder.release()
    expect DotnetError: builder.UnknownMember()

  test "Events and Host Lifecycle":
    block:
      dotnetStart()
      defer: dotnetClose()

      var
        timer = newObject("System.Timers.Timer, System.ComponentModel.TypeConverter")
        nilHandler: DotnetEventHandler
        eventCount = 0
        receivedSender = false
        receivedArgs = false
        dispatched = 0
        removedCount = 0
        retainedCount = 0
        orphanCount = 0

      check pollEvents() == 0
      expect DotnetError: timer.on("Elapsed", nilHandler)
      expect DotnetError: timer.on("MissingEvent") do (sender, args: DotnetObject): discard

      timer.Interval = 10.0
      timer.AutoReset = false
      let primaryToken = timer.on("Elapsed") do (sender, args: DotnetObject):
        inc eventCount
        receivedSender = not sender.isNil
        receivedArgs = not args.isNil

      let started = timer.Start()
      for _ in 0 .. 49:
        sleep(10)
        dispatched += pollEvents()
        if eventCount != 0:
          break

      timer.Stop()
      check:
        primaryToken.off()
        not primaryToken.off()
        timer.off("Elapsed") == 0

      check:
        eventCount > 0
        dispatched > 0
        receivedSender
        receivedArgs

      let removedToken = timer.on("Elapsed") do (sender, args: DotnetObject):
        inc removedCount

      let retainedToken = timer.on("elapsed") do (sender, args: DotnetObject):
        inc retainedCount

      check removedToken.off()
      let restarted = timer.Start()

      for _ in 0 .. 49:
        sleep(10)
        pollEvents()
        if retainedCount != 0:
          break

      check:
        removedCount == 0
        retainedCount == 1
        timer.off("ELAPSED") == 1
        not retainedToken.off()

      let orphanToken = timer.on("Elapsed") do (sender, args: DotnetObject):
        inc orphanCount

      let orphanStarted = timer.Start()
      sleep(50)
      check orphanToken.off()
      check:
        pollEvents() == 0
        orphanCount == 0

    block:
      dotnetStart()
      defer: dotnetClose()

      var
        timer = newObject("System.Timers.Timer, System.ComponentModel.TypeConverter")
        callbackCount = 0
        raised = false

      timer.Interval = 10.0
      timer.AutoReset = false
      timer.on("Elapsed") do (sender, args: DotnetObject):
        inc callbackCount
        raise newException(ValueError, "fixture callback failure")

      let started = timer.Start()
      for _ in 0 .. 49:
        sleep(10)
        try:
          discard pollEvents()
        except ValueError:
          raised = true
          break

      check:
        raised
        callbackCount == 1

      timer.off("Elapsed")
      timer.Stop()

    block:
      dotnetStart()
      defer: dotnetClose()

      let
        info = dotnetRuntimeInfo()
        config = genTempPath("winim-dotnet-event-host-", ".runtimeconfig.json")
        configText = fmt"""{{"runtimeOptions":{{"framework":{{"name":"{info.frameworkName}","version":"{info.frameworkVersion}"}}}}}}"""

      writeTrackedFile(config, configText)
      expect DotnetError: dotnetStart(config)
      check pollEvents() == 0

  test "Managed Handles and Cleanup":
    block:
      dotnetStart()
      defer: dotnetClose()

      var
        builder = newObject("System.Text.StringBuilder")
        nilAssembly: DotnetAssembly

      expect DotnetError: discard builder.dotnetGet("MissingProperty")
      expect DotnetError: builder.dotnetInvoke("MissingMethod")
      expect DotnetError: newObject("Missing.Managed.Type")

      builder.release()
      builder.release()
      check $builder == "null"
      expect DotnetError: discard builder.dotnetGet("Length")
      expect DotnetError: builder.dotnetSet("Capacity", 8)
      expect DotnetError: builder.dotnetInvoke("ToString")
      expect DotnetError: discard builder.toInt64

      check $DotnetObject() == "null"
      expect DotnetError: discard DotnetObject().toInt64
      expect DotnetError: discard DotnetObject().toInt
      expect DotnetError: discard DotnetObject().toBool
      expect DotnetError: DotnetClass().new()
      expect DotnetError: DotnetClass().newObject()
      expect DotnetError: discard DotnetClass().dotnetGet("Version")
      expect DotnetError: DotnetClass().dotnetSet("ExitCode", 0)
      expect DotnetError: DotnetClass().invoke("Version")
      expect DotnetError: discard DotnetClass().getProperty("Version")
      expect DotnetError: DotnetClass().setProperty("ExitCode", 0)
      expect DotnetError: discard nilAssembly.getType("Missing.Type")
      expect DotnetError: nilAssembly.new("Missing.Type")

    block:
      dotnetStart()
      proc createScopedObject() =
        let transient = newObject("System.Text.StringBuilder")
        discard transient.Append("scoped cleanup")

      createScopedObject()
      when not defined(gcArc) and not defined(gcOrc):
        GC_fullCollect()

      let transient = newObject("System.Text.StringBuilder")
      discard transient.Append("host-owned cleanup")
      dotnetClose()
      dotnetClose()
      expect DotnetError: transient.ToString()
      transient.release()
      check $transient == "null"
