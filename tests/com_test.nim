import winim/com except FAILED # conflict with TestStatus.FAILED
import unittest

suite "Test Suites for iDispatch.Invoke in winim/com":
  setup:
    var dict = CreateObject("Scripting.Dictionary")

  teardown:
    COM_FullRelease()

  test "proc call(), set(), and get() for com":
    var c = dict.copy
    check(c is com)

    c.set("comparemode", 1)
    c.call("add", "a", 1)
    c.call("add", "b", kwargs={"item": toVariant(2)})
    c.call("add", kwargs={"item": toVariant(3), "key": toVariant("c")})

    check(c.get("comparemode") == 1)
    check(c.get("item", "a") == 1)
    check(c.get("item", kwargs={"key": toVariant("b")}) == 2)

    var count = 0
    for key in c: count.inc
    check(count == 3)

  test "proc call(), set(), and get() for variant":
    dict.call("add", "dict", CreateObject("Scripting.Dictionary"))
    var v = dict.get("item", "dict")
    check(v is variant)

    v.set("comparemode", 1)
    v.call("add", "a", 1)
    v.call("add", "b", kwargs={"item": toVariant(2)})
    v.call("add", kwargs={"item": toVariant(3), "key": toVariant("c")})

    check(v.get("comparemode") == 1)
    check(v.get("item", "a") == 1)
    check(v.get("item", kwargs={"key": toVariant("b")}) == 2)

    var count = 0
    for key in v: count.inc
    check(count == 3)

  test "template `.`, `.=`, and `.()` for com":
    var c = dict.copy
    check(c is com)

    c.comparemode = 1
    c.add("a", 1)
    c.add("b", {"item": toVariant(2)})
    c.add({"item": toVariant(3), "key": toVariant("c")})

    check(c.comparemode == 1)
    check(c.item("a") == 1)
    check(c.item({"key": toVariant("b")}) == 2)

  test "template `.`, `.=`, and `.()` for variant":
    dict.call("add", "dict", CreateObject("Scripting.Dictionary"))
    var v = dict.get("item", "dict")
    check(v is variant)

    v.comparemode = 1
    v.add("a", 1)
    v.add("b", {"item": toVariant(2)})
    when NimMajor < 1:
      v.add(kwargs={"item": toVariant(3), "key": toVariant("c")})
    else:
      v.add({"item": toVariant(3), "key": toVariant("c")})

    check(v.comparemode == 1)
    check(v.item("a") == 1)
    check(v.item({"key": toVariant("b")}) == 2)

  test "template `[]`, `[]=` for com":
    var c = dict.copy
    check(c is com)

    c["comparemode"] = 1
    check(c["comparemode"] == 1)

  test "template `[]`, `[]=` for variant":
    dict.call("add", "dict", CreateObject("Scripting.Dictionary"))
    var v = dict.get("item", "dict")
    check(v is variant)

    v["comparemode"] = 1
    check(v["comparemode"] == 1)

  test "template `[]`, `.` for variant (constants)":
    var excel = CreateObject("Excel.Application")
    defer: excel.quit()
    check(excel.XlFileFormat["xlOpenXMLWorkbook"] == 51)
    check(excel.XlFileFormat.xlOpenXMLWorkbook == 51)

  test "macro comScript and named arguments":
    comScript:
      dict.add(item:=1, "a")
      dict.add(item:=2, key:="b")
      dict.call("add", item:=3, "c")
      dict.call("add", item:=4, key:="d")

      check(dict.item("a") == 1)
      check(dict.item("b") == 2)
      check(dict.item("c") == 3)
      check(dict.item("d") == 4)

      dict.item("a") = 10
      dict.item(key:="b") = 20
      dict.set("item", key:="c", 30)
      dict.set("item", 40, key:="d")

      check(dict.item("a") == 10)
      check(dict.item("b") == 20)
      check(dict.item("c") == 30)
      check(dict.item("d") == 40)

      dict.item("name") = "key"
      dict.add(key:=dict.item(key:="name"), item:=dict.item(key:="a"))
      check(dict.item("key") == 10)

      dict.item(key:=dict.item(key:="name")) = dict.item(key:="b")
      check(dict.item("key") == 20)

      var excel = CreateObject("Excel.Application")
      defer: excel.quit()

      excel.displayalerts = false
      excel.workbooks.add()
      excel.activeSheet.cells(1, 1) = "foo"
      check(excel.activeSheet.cells(1, 1) == "foo")

      excel.activeSheet.range(cell1:="A1") = "bar"
      check(excel.activeSheet.range(cell1:="A1") == "bar")

      excel.activeSheet.range(cell1:="B2").value = "foobar"
      check(excel.activeSheet.range(cell1:="B2").value == "foobar")
