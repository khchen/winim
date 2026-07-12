#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

## A progressive tutorial for the calling forms provided by winim/dotnet.
##
## The examples deliberately use only a few managed types. Each section
## introduces a different way to create, inspect, invoke, or pass objects.
## This example does not require the .NET SDK, a C# compiler, or generated
## managed source files.

import winim/dotnet
import strutils

proc section(title: string) =
  echo "\n" & title
  echo "-".repeat(title.len)

proc main() =
  dotnetStart()
  defer: dotnetClose()

  section "Start the runtime and load an assembly"
  let info = dotnetRuntimeInfo()
  echo "Framework: ", info.frameworkName
  echo "Version: ", info.frameworkVersion
  let core = load("System.Private.CoreLib")
  echo "Assembly: ", core.name

  section "Three equivalent object construction forms"
  let fromAssembly = core.new("System.Text.StringBuilder", "assembly.new")
  let fromRuntime = newObject("System.Text.StringBuilder, System.Private.CoreLib", "newObject")
  let builderType = core.getType("System.Text.StringBuilder")
  let fromClass = builderType.new("DotnetClass.new")
  echo fromAssembly.getType, " via ", fromAssembly
  echo fromRuntime.getType, " via ", fromRuntime
  echo fromClass.getType, " via ", fromClass

  section "Invoke instance methods and use properties"
  fromClass.Append("Nim")
  fromClass.Append(" + modern .NET")
  echo "Text: ", fromClass
  echo "Length: ", fromClass.Length
  fromClass.Capacity = 64
  echo "Capacity: ", fromClass.Capacity

  section "Invoke static methods and read static values"
  let int32Type = core.getType("System.Int32")
  let parsed = int32Type.Parse("12345")
  echo "Int32.Parse(\"12345\"): ", parsed
  echo "Int32.MaxValue: ", int32Type.MaxValue
  let environment = core.getType("System.Environment")
  echo "Environment.Version: ", environment.Version

  section "Pass constructor arguments and enum values"
  let randomType = core.getType("System.Random")
  let random = randomType.new(12345)
  echo "Random.Next(0, 100): ", random.Next(0, 100)
  let comparison = enumValue("System.StringComparison", "OrdinalIgnoreCase")
  let stringType = core.getType("System.String")
  echo "String.Equals(..., OrdinalIgnoreCase): ", stringType.Equals("Nim", "NIM", comparison)

  section "Use the explicit API instead of dot syntax"
  let explicitBuilder = builderType.new("explicit")
  explicitBuilder.invoke("Append", " API")
  explicitBuilder.setProperty("Capacity", 64)
  let length = explicitBuilder.getProperty("Length")
  echo "Text: ", $explicitBuilder
  echo "Length: ", length.toInt
  echo "Capacity: ", explicitBuilder.getProperty("Capacity").toInt

  section "Use an indexed property and a managed iterator"
  let collections = load("System.Collections.NonGeneric")
  let items = collections.new("System.Collections.ArrayList")
  for item in ["The", "quick", "brown", "fox"]: items.Add(item)
  items.Sort()
  echo "Count: ", items.Count.toInt
  echo "[0] via indexer: ", items[0]
  items[0] = "BROWN"
  echo "[0] after indexer setter: ", items[0]

  var msg = "Items via items(source): "
  for item in items: msg.add item & " "
  echo msg

  var pairMsg = "Items via pairs(source): "
  for index, item in pairs(items): pairMsg.add $index & "=" & $item & " "
  echo pairMsg

  let enumerator = items.GetEnumerator()
  var enumeratorMsg = "Items via IEnumerator: "
  for item in enumerator: enumeratorMsg.add item & " "
  echo enumeratorMsg

  dotnetScript:
    items.Item(0) = "scripted"
  echo "[0] after dotnetScript setter: ", items[0]

  section "Pass a managed result to another managed API"
  let encoding = core.getType("System.Text.Encoding")
  let data = encoding.UTF8.GetBytes("Password")
  let crypto = load("System.Security.Cryptography")
  let sha256 = crypto.getType("System.Security.Cryptography.SHA256").Create()
  let hash = sha256.ComputeHash(data)
  echo "SHA256: ", core.getType("System.Convert").ToHexString(hash)

  section "Use a framework component through the same call forms"
  let regexAssembly = load("System.Text.RegularExpressions")
  let regexType = regexAssembly.getType("System.Text.RegularExpressions.Regex")
  echo "Regex.IsMatch: ", regexType.IsMatch("WARN cache miss", "^[A-Z]+\\s+.+$")

  section "Call a Nim callback through a managed delegate"
  let
    delegateTypeType = getManagedType("System.Type, System.Private.CoreLib")
    delegateStringType = getManagedType("System.String, System.Private.CoreLib")
    actionType = getManagedType("System.Action`1, System.Private.CoreLib")
    delegateTypeArguments = newManagedArray(delegateTypeType, [delegateStringType])
    delegateType = actionType.MakeGenericType(delegateTypeArguments)

  proc callback(args: openArray[DotnetObject]): DotnetObject =
    echo "Nim callback received: ", args[0]
    nil

  let actionDelegate = newDelegate(delegateType, callback)
  actionDelegate.DynamicInvoke("hello from managed code")

  section "Call a low-level static method through hostfxr"
  type VoidMethod = proc() {.stdcall.}
  let collect = asProc[VoidMethod](getMethod("System.GC", "Collect", "System.Action"))
  collect()
  echo "System.GC.Collect invoked through a native function pointer."

when isMainModule:
  main()
