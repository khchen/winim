#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import winim/clr
import sugar, strutils
import strformat except `&`

proc section(title: string) =
  echo "\n" & title
  echo repeat('-', title.len)

section "Load mscorlib"
var mscor = load("mscorlib")
dump mscor # mscor = the mscorlib Assembly object

section "Create System.Random by name"
var r1 = mscor.new("System.Random")
dump r1 # r1 = System.Random

section "Create System.Random from a type"
var Random = mscor.getType("System.Random")
var r2 = Random.new()
dump r2 # r2 = System.Random

section "Create System.Random with a seed"
r1 = mscor.new("System.Random", 12345)
dump r1 # r1 = System.Random
r2 = Random.new(12345)
dump r2 # r2 = System.Random

section "Invoke methods"
dump r1.Next() # a random Int32
dump r1.Next(0, 100) # a random Int32 from 0 to 99
dump r2.NextDouble() # a random Double from 0.0 to 1.0

section "Get the System.Int32 type"
var Int32 = mscor.getType("System.Int32")
dump Int32 # Int32 = System.Int32

section "Invoke a static method or access a field"
dump Int32.Parse("12345") # 12345 (VT_I4)
dump Int32.MaxValue # 2147483647

section "Get a value-type CLRVariant"
var n1 = Int32.Parse("12345")
dump n1 # n1 = 12345
dump n1.rawTypeDesc # VT_I4
dump n1.isObject # false
dump n1.GetType # System.Int32

section "Box a value as a System.Int32 object"
var n2 = n1[Int32]
dump n2 # n2 = 12345
dump n2.rawTypeDesc # VT_UNKNOWN
dump n2.isObject # true
dump n2.GetType # System.Int32
dump n2.Equals(n1) # True

section "Box an int64 as a System.Int64 object"
var n3 = 12345'i64[]
dump n3 # n3 = 12345
dump n3.isObject # true
dump n3.GetType # System.Int64
dump n3.Equals(n2) # True

section "Create the System.Drawing.Point struct type"
var Point = load("System.Drawing").getType("System.Drawing.Point")
dump Point # Point = System.Drawing.Point
var p1 = Point.new(10, 20)
dump p1 # p1 = (x: 10, y: 20)
dump p1.rawTypeDesc # VT_RECORD
dump p1.isStruct # true
dump (p1["x"], p1["y"]) # (10, 20)
dump (p1.X, p1.Y) # (10, 20); v3.8.0 direct field access

section "Iterate over a struct's fields"
for name in p1.fields: dump name # field names
for name, value in p1.fieldPairs: dump value # field values

section "Box a struct as a System.Drawing.Point object"
var p2 = p1[Point]
dump p2 # p2 = {X=10,Y=20}
dump p2.rawTypeDesc # VT_UNKNOWN
dump p2.isObject # true
p2.Offset(5, 5)
dump p2 # p2 = {X=15,Y=25}

section "Create an ArrayList and iterate over it"
var a = mscor.new("System.Collections.ArrayList")
for i in ["The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]:
  a.Add(i)

dump a.Count # 9
dump a.Item(3) # fox
clrScript:
  a.Item(3) = "FOX"

var beforeSort: string
for i in a: # iterator works if the object implements GetEnumerator
  beforeSort.add $i & " "

a.Sort()
var afterSort: string
for i in a:
  afterSort.add $i & " "

dump beforeSort # the list contents before sorting
dump afterSort # the list contents after sorting

section "Box an array as a System.Array object"
var Array = mscor.GetType("System.Array")
var ICollection = Array.GetInterface("ICollection")
var IList = Array.GetInterface("IList")
var arr1 = mscor.GetTypes()
dump arr1.rawTypeDesc # VT_ARRAY(1D)|VT_UNKNOWN
dump arr1.isObject # false

# Handle the raw array directly.
for i in fromCLRVariant[COMArray1D](arr1):
  dump toCLRVariant(i) # the first type entry
  break

# Or wrap it as a System.Array object.
var arr2 = arr1[Array]
dump arr2.isObject # true
dump arr2 # arr2 = System.Object[]
for i in arr2:
  dump i # the first array element
  break

# v3.8.0: iterate over raw arrays.
for i in arr1:
  dump i # the first array element
  break

section "Invoke System.Array's explicit interface members"
dump arr2{ICollection}.Count # the number of types in the array
dump arr2{ICollection}.Count.int == arr2.GetLength(0) # true
dump arr2{IList}.Item(0) # the first type in the array

section "List types in mscorlib"
for i, typ in mscor.GetTypes():
  echo typ.FullName
  if i >= 20: break

section "Use a SortedList"
var list = mscor.new("System.Collections.SortedList")
list.Add(1.4, "jumps")
list.Add(1.5, "over")
list.Add(1.2, "brown")
list.Add(1.1, "quick")
list.Add(1.0, "The")
list.Add(1.6, "the")
list.Add(1.8, "dog")
list.Add(1.7, "lazy")
var index = 3
echo fmt"The key   at index {index} is {list.GetKey(index)}."
echo fmt"The value at index {index} is {list.GetByIndex(index)}."

var keyList = list.GetKeyList()
var valueList = list.GetValueList()
echo "-KEY-\t-VALUE-"
for i in 0 ..< list.Count:
  echo keyList.Item(int32 i), "\t", valueList.Item(int32 i)

for i in list:
  echo i.Key, "\t", i.Value
  assert i.isStruct
  assert $i["_value"] == $(i.Value)

section "Encode text and compute a SHA-256 hash"
var encoding = mscor.getType("System.Text.Encoding")
var sha256 = mscor.new("System.Security.Cryptography.SHA256Managed")
var data = encoding.UTF8.GetBytes("Password")
var hash = sha256.ComputeHash(data)

echo "UTF8 Encoding Byte[] = ", fromCLRVariant[COMArray1D](data)
echo "SHA256 Byte[] = ", fromCLRVariant[COMArray1D](hash)
