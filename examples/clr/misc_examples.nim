#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import winim/clr
import strformat except `&`

proc test1() =
  var mscor = load("mscorlib")
  var Array = mscor.GetType("System.Array")

  for typ in mscor.GetTypes()[Array]:
    echo typ.FullName

proc test2() =
  var mscor = load("mscorlib")
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
    echo i
    assert i.isStruct
    assert $i["_value"] == $(i[].Value)

proc test3() =
  var mscor = load("mscorlib")
  var Encoding = mscor.GetType("System.Text.Encoding")
  var sha256 = mscor.new("System.Security.Cryptography.SHA256Managed")

  var data = fromCLRVariant[COMArray1D](@Encoding.UTF8.GetBytes(L"Password"))
  var hash = fromCLRVariant[COMArray1D](sha256.ComputeHash(toCLRVariant(data, VT_UI1)))

  echo "UTF8 Encoding Byte[] = ", data
  echo "SHA256 Byte[] = ", hash

proc test4() =
  var sys = load("System")
  var Process = sys.GetType("System.Diagnostics.Process")
  var notepad = @Process.Start("notepad")

  notepad.WaitForInputIdle()
  echo notepad.MainWindowTitle

  var th = load("System.Threading.Thread")
  var Thread = th.GetType("System.Threading.Thread")
  @Thread.Sleep(1000)
  notepad.CloseMainWindow()

test1()
test2()
test3()
test4()
