#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import winim/clr
import std/[os, strutils, unittest]

suite "Test Suites for winim/clr":
  setup:
    const code = """
    using System;
    public class Test {
      public static double PI = 3.1415929203539823;
      public static int itemCount = 2;
      public String name;
      public static double GetPI() { return PI; }
      public static String Optional(String value = "default") { return value; }
      public static String GetNull() { return null; }
      public static int[] GetArray() { return new int[] { 4, 5, 6 }; }
      public Test(String s) { name = s; }
      public Nested getNested() { return new Nested(name); }
      public static EmptyStruct GetEmpty() { return new EmptyStruct(); }
      public class Nested {
        public static String welcome = "Hello, world";
        public String msg;
        public Nested(String s) { msg = s; }
      }
      public struct Struct {
        public static int structCount = 2;
        public int X;
        public int Y;
        public Struct(int x, int y) { X = x; Y = y; }
      }
      public struct EmptyStruct {}
      public class Indexable {
        private String[] values = new String[3];
        public String this[int index] {
          get { return values[index]; }
          set { values[index] = value; }
        }
      }
    }
    """

    var res = compile(code, ["System.dll"])
    if res.Errors.Count != 0:
      for error in res.Errors:
        echo repr error

    var assembly {.used.} = res.CompiledAssembly

  teardown:
    clrClose()

  test "Reflection and construction":
    let
      Test = assembly.GetType("Test")
      Nested = assembly.GetType("Test+Nested")
      Struct = assembly.GetType("Test+Struct")
      Random = load("mscorlib").getType("System.Random")
      random = Random.new(12345)
      random2 = @Random.new(12345)

    check:
      not Test.isNil
      not Nested.isNil
      not Struct.isNil
      not Random.isNil
      Test.isObject
      Nested.isObject
      Struct.isObject
      Test.isType
      Nested.isType
      Struct.isType
      not Test.isStruct
      $Test == "Test"
      $Nested == "Test+Nested"
      $Struct == "Test+Struct"
      $Random == "System.Random"
      repr(Random) == "System.Random"
      @Random.isNil == false
      @Test.PI == 3.1415929203539823
      @Test.GetPI() == 3.1415929203539823
      @Test.Optional() == "default"
      (@Test.GetNull()).isNull
      @Nested.welcome == "Hello, world"
      @Struct.structCount == 2
      random.Next().int == random2.Next().int

    let nilVariant = toCLRVariant(nil)
    check:
      nilVariant.isNull
      not nilVariant.isObject
      not nilVariant.isStruct

    block:
      let
        obj = assembly.new("Test", "myname")
        nested = assembly.new("Test+Nested", "hello")
        struct = assembly.new("Test+Struct", 123'i32, 456'i32)

      check:
        obj.isObject
        not obj.isType
        not obj.isStruct
        nested.isObject
        not nested.isType
        not nested.isStruct
        not struct.isObject
        not struct.isType
        struct.isStruct
        obj.name == "myname"
        nested.msg == "hello"
        struct["X"] == 123
        struct["Y"] == 456
        struct.toObject.X == 123
        struct.toObject.Y == 456
        $obj.getNested().GetType() == "Test+Nested"
        obj.getNested().msg == "myname"

    block:
      let
        TestType = assembly.GetType("Test")
        NestedType = assembly.GetType("Test+Nested")
        StructType = assembly.GetType("Test+Struct")
        obj = @TestType.new("myname")
        nested = @NestedType.new("hello")
        struct = @StructType.new(123'i32, 456'i32)

      check:
        obj.isObject
        nested.isObject
        struct.isStruct
        obj.name == "myname"
        nested.msg == "hello"
        struct["X"] == 123
        struct["Y"] == 456
        struct[StructType].X == 123
        struct[StructType].Y == 456
        $obj.getNested().GetType() == "Test+Nested"
        obj.getNested().msg == "myname"

  test "Records, indexing, and collections":
    let
      RecordTest = assembly.GetType("Test")
      empty = @RecordTest.GetEmpty()
      structured = assembly.new("Test+Struct", 1'i32, 2'i32)
      indexable = assembly.new("Test+Indexable")
    var
      emptyFields = 0
      structuredFields: seq[string]
      pairNames: seq[string]
      pairValues: seq[int]

    for _ in empty.fields:
      emptyFields.inc
    for field in structured.fields:
      structuredFields.add field
    for name, value in structured.fieldPairs:
      pairNames.add name
      pairValues.add int(value)

    clrScript:
      indexable.Item(1) = "updated"

    check:
      empty.isStruct
      emptyFields == 0
      structuredFields == @["X", "Y"]
      pairNames == @["X", "Y"]
      pairValues == @[1, 2]
      structured["X"] == 1
      structured["Y"] == 2
      repr(structured).contains("X: 1")
      repr(structured).contains("Y: 2")
      $structured == repr(structured)
      indexable.Item(1) == "updated"

    let CollectionTest = assembly.GetType("Test")
    let list = load("mscorlib").new("System.Collections.ArrayList")
    list.Add("first")
    list.Add("second")

    var listItems: seq[string]
    var listPairs: seq[(int, string)]
    for item in list.items: listItems.add string(item)
    for index, item in list.pairs: listPairs.add (index, string(item))

    var listInterface = list{list.GetType.GetInterface("System.Collections.IList")}
    clrScript:
      listInterface.Item(1) = "updated"

    let array = @CollectionTest.GetArray()
    var arrayItems: seq[int]
    var arrayPairs: seq[(int, int)]
    for item in array.items: arrayItems.add int(item)
    for index, item in array.pairs: arrayPairs.add (index, int(item))

    let enumerable = toObject("abc")
    var enumerableItems: seq[int]
    for item in enumerable.items: enumerableItems.add int(item)

    check:
      listItems == @["first", "second"]
      listPairs == @[(0, "first"), (1, "second")]
      string(listInterface.Item(1)) == "updated"
      arrayItems == @[4, 5, 6]
      arrayPairs == @[(0, 4), (1, 5), (2, 6)]
      enumerableItems == @[97, 98, 99]

  test "Boxing, conversion, and COM":
    for i in 0 ..< 64:
      let boxed = toObject(i)
      check $boxed.ToString == $i

    let
      pointerObject = toObject(cast[pointer](123))
      procObject = toObject(proc () {.stdcall.} = discard )
      typedByName = toObject(123'i32, "System.Int64")
      int64Type = load("mscorlib").getType("System.Int64")
      int64Variant = load("mscorlib").GetType("System.Int64")
      typedByType = toObject(123'i32, int64Type)
      typedByIndex = (123'i32)[int64Type]
      typedByVariant = toObject(123'i32, int64Variant)
      color = toObject(0x00332211'i32, "System.Drawing.Color")
      text = toCLRVariant("bridge")
      dispatch = com(toObject("bridge"))

    check:
      pointerObject.isObject
      $pointerObject == "123"
      procObject.isObject
      $typedByName == "123"
      $typedByType == "123"
      $typedByIndex == "123"
      $typedByVariant == "123"
      int(color.R) == 0x11
      int(color.G) == 0x22
      int(color.B) == 0x33
      string(text) == "bridge"
      fromCLRVariant[string](text) == "bridge"
      $dispatch.ToString == "bridge"

  test "Runtime, compilation, and assembly loading":
    var versions: seq[string]
    for version in clrVersions():
      versions.add version
    check versions.len > 0

    let domain = clrStart(versions[^1])
    check:
      not domain.isNil
      not domain.isNull

    let output = getTempDir() / "winim-clr-saved-assembly.dll"
    if fileExists(output): removeFile(output)
    let compiled = compile("public class Saved { public static int Value = 7; }", ["System.dll"], output)
    defer:
      if fileExists(output): removeFile(output)

    check:
      compiled.Errors.Count == 0
      fileExists(output)

    let
      systemAssembly = load("System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
      systemPath = string systemAssembly.Location
      fromIdentity = load(string systemAssembly.FullName)
      fromPath = load(systemPath)
      bytes = readFile(output)
      fromBytes = load(bytes.toOpenArrayByte(0, bytes.len - 1))
      fromBinary = load(COMBinary bytes)

    check:
      not fromPath.isNil
      not fromIdentity.isNil
      not fromBytes.isNil
      not fromBinary.isNil

  test "Invalid values and loading failures":
    var raw: VARIANT
    raw.vt = VT_RECORD

    let
      unknown = toCLRVariant(cast[ptr IUnknown](nil))
      dispatch = toCLRVariant(cast[ptr IDispatch](nil))
      nilVariant = toCLRVariant(nil)
      malformed = CLRVariant adoptVariant(raw)
      plain = toCLRVariant(1)
      failed = compile("public class {", ["System.dll"])

    check:
      unknown.isNull
      dispatch.isNull
      unknown.isObject == false
      dispatch.isObject == false
      failed.Errors.Count != 0

    expect CLRError: discard com(unknown)
    expect CLRError: discard com(dispatch)
    expect CLRError: discard com(nilVariant)
    expect CLRError: discard plain["field"]
    expect CLRError: discard malformed["field"]

    let path = getTempDir() / "winim-clr-invalid-assembly.dll"
    writeFile(path, "not a managed assembly")
    defer:
      if fileExists(path): removeFile(path)

    expect CLRError: discard load(path)
