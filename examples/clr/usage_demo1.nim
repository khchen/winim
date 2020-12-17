#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import winim/clr
import sugar, strutils

proc print(msg: string) =
  echo "\n" & msg
  echo repeat('-', msg.len)

print "Load mscorlib"
var mscor = load("mscorlib")
dump mscor

print "Create 'System.Random' object from type name"
var r1 = mscor.new("System.Random")
dump r1

print "Create 'System.Random' object from type object"
var Random = mscor.GetType("System.Random")
var r2 = @Random.new()
dump r2

print "Create 'System.Random' object from type object with parameter"
r1 = mscor.new("System.Random", 12345)
dump r1
r2 = @Random.new(12345)
dump r2

print "Invoke some methods"
dump r1.Next()
dump r1.Next(0, 100)
dump r2.NextDouble()

print "Get 'System.Int32' type object"
var Int32 = mscor.GetType("System.Int32")
dump Int32

print "Invoke static method or field"
dump @Int32.Parse("12345")
dump @Int32.MaxValue

print "Get 'value type' CLRVariant"
var n1 = @Int32.Parse("12345")
dump n1
dump n1.rawTypeDesc # should be VT_I4
dump n1.isObject # should be false

print "Convert value type to 'System.Int32' object"
var n2 = n1[Int32]
dump n2
dump n2.rawTypeDesc # should be VT_UNKNOWN
dump n2.isObject # should be true, so that we can call the methods
dump n2.GetType # should be System.Int32
dump n2.Equals(n1)

print "Convert int64 to 'System.Int64' object"
var n3 = 12345'i64[]
dump n3
dump n3.isObject # should be true
dump n3.GetType # should be System.Int64
dump n3.Equals(n2)

print "Create CLR struct type: 'System.Drawing.Point'"
var Point = load("System.Drawing").GetType("System.Drawing.Point")
dump Point
var p1 = @Point.new(10, 20)
dump p1
dump p1.rawTypeDesc # should be VT_RECORD
dump p1.isStruct # should be true
dump p1["x"] # use `[]` operator to get the value if it is struct type
dump p1["y"]

print "Iterator over every field of struct type"
for name in p1.fields: dump name
for name, value in p1.fieldPairs: dump value

print "Convert struct type to 'System.Drawing.Point' object"
var p2 = p1[Point]
dump p2
dump p2.rawTypeDesc # should be VT_UNKNOWN
dump p2.isObject # should be true, so that we can call the methods
p2.Offset(5, 5)
dump p2

print "Create 'System.Collections.ArrayList' object and use iterator"
var a = mscor.new("System.Collections.ArrayList")
for i in ["The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]:
  a.Add(i)

dump a.Count
dump a.Item(3)
clrScript:
  a.Item(3) = "FOX"

var beforeSort: string
for i in a: # iterator works if the object implements GetEnumerator
  beforeSort.add $i & " "

a.Sort()
var afterSort: string
for i in a:
  afterSort.add $i & " "

dump beforeSort
dump afterSort

print "Convert Array to 'System.Array' Object"
var Array = mscor.GetType("System.Array")
var ICollection = Array.GetInterface("ICollection")
var IList = Array.GetInterface("IList")
var arr1 = mscor.GetTypes()
dump arr1.rawTypeDesc # should be VT_ARRAY(1D)|VT_UNKNOWN
dump arr1.isObject # should be false

# we can deal with VT_ARRAY(1D)|VT_UNKNOWN by ourself
for i in fromCLRVariant[COMArray1D](arr1):
  dump toCLRVariant(i)
  break

# however, the easiest way is convert it back to System.Array object
var arr2 = arr1[Array]
dump arr2.isObject # should be true
dump arr2
for i in arr2:
  dump i
  break

print "Invoke Explicit Interface Implementations of 'System.Array'"
when NimVersion >= "1.2":
  dump arr2{ICollection}.Count
  dump arr2{ICollection}.Count.int == arr2.GetLength(0)
  dump arr2{IList}.Item(0)

else:
  var i1: CLRInterface
  i1.obj = arr2
  i1.intf = ICollection

  var i2: CLRInterface
  i2.obj = arr2
  i2.intf = IList

  dump i1.Count
  dump i1.Count.int == arr2.GetLength(0)
  dump i2.Item(0)
