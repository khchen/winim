#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

{.push hint[XDeclaredButNotUsed]: off.}

import winim/com
import std/[unittest, strutils]

suite "Test Suites for winim/com":
  setup:
    var dict = CreateObject("Scripting.Dictionary")

  teardown:
    COM_FullRelease()

  test "Calls, Properties, And Indexing":
    let c = dict.copy
    c.set("comparemode", 1)
    dict.call("add", "nested", CreateObject("Scripting.Dictionary"))
    let v = dict.get("item", "nested")
    dict.call("remove", "nested", kwargs=[])

    check:
      c is com
      v is variant

    v.set("comparemode", 1)
    c.call("add", "a", 1)
    v.call("add", "a", 1)
    c.call("add", "b", kwargs={"item": toVariant(2)})
    v.call("add", "b", kwargs={"item": toVariant(2)})
    c.call("add", kwargs={"item": toVariant(3), "key": toVariant("c")})
    v.call("add", kwargs={"item": toVariant(3), "key": toVariant("c")})

    check:
      c.get("comparemode") == 1
      v.get("comparemode") == 1
      c.get("item", "a") == 1
      v.get("item", "a") == 1
      c.get("item", kwargs={"key": toVariant("b")}) == 2
      v.get("item", kwargs={"key": toVariant("b")}) == 2

    var
      cCount = 0
      vCount = 0

    for key in c: cCount.inc
    for key in v: vCount.inc
    check:
      cCount == 3
      vCount == 3

    c.call("remove", "b", kwargs=[])
    v.call("remove", "b", kwargs=[])

    check:
      c.get("exists", "a").bool
      v.get("exists", "a").bool
      not c.get("exists", "missing").bool
      not v.get("exists", "missing").bool
      c.get("count").int == 2
      v.get("count").int == 2

    c.call("removeall", kwargs=[])
    v.call("removeall", kwargs=[])

    check:
      c.get("count").int == 0
      v.get("count").int == 0

    c.comparemode = 1
    v.comparemode = 1
    c.add("a", 1)
    v.add("a", 1)
    c.add("b", {"item": toVariant(2)})
    v.add("b", {"item": toVariant(2)})
    v.add({"item": toVariant(3), "key": toVariant("c")})
    c.add({"item": toVariant(3), "key": toVariant("c")})

    check:
      c.comparemode == 1
      v.comparemode == 1
      c.item("a") == 1
      v.item("a") == 1
      c.item({"key": toVariant("b")}) == 2
      v.item({"key": toVariant("b")}) == 2

    c["comparemode"] = 1
    v["comparemode"] = 1

    check:
      c["comparemode"] == 1
      v["comparemode"] == 1

    dict.call("removeall", kwargs=[])

    let request = CreateObject("WinHttp.WinHttpRequest.5.1")
    request.setTimeouts(5000, 5000, 5000, 5000)
    request.open("GET", "http://www.google.com", false)
    request.send()
    let
      status = request.status.int
      responseText = request.responseText.string
    check:
      status >= 200 and status < 400
      responseText.len > 0

  test "Scripts And Named Arguments":
    comScript:
      dict.add(item:=1, "a")
      dict.add(item:=2, key:="b")
      dict.call("add", item:=3, "c")
      dict.call("add", item:=4, key:="d")

      check:
        dict.item("a") == 1
        dict.item("b") == 2
        dict.item("c") == 3
        dict.item("d") == 4

      dict.item("a") = 10
      dict.item(key:="b") = 20
      dict.set("item", key:="c", 30)
      dict.set("item", 40, key:="d")

      check:
        dict.item("a") == 10
        dict.item("b") == 20
        dict.item("c") == 30
        dict.item("d") == 40

      dict.item("name") = "key"
      dict.add(key:=dict.item(key:="name"), item:=dict.item(key:="a"))
      check dict.item("key").int == 10

      dict.item(key:=dict.item(key:="name")) = dict.item(key:="b")
      check dict.item("key").int == 20

    var evaluations = 0
    proc nextValue(value: int): int =
      evaluations.inc
      value

    comScript:
      dict.add(key:="once", item:=nextValue(7))
      check dict.item(key:="once").int == 7
      dict.item(key:="once") = nextValue(8)
      check dict.item("once").int == 8
      check evaluations == 2

    let description = dict.desc("add")
    check:
      description.toLowerAscii.contains("add")
      description.toLowerAscii.contains("key")
      description.toLowerAscii.contains("item")

    dict.call("add", kwargs={"KEY": toVariant("case"), "ITEM": toVariant(12)})
    check dict.get("item", "case") == 12

    expect COMError:
      dict.call("add", kwargs={"notAnArgument": toVariant(1)})

  test "Dispatch Errors And Event Connections":
    try:
      dict.get("memberThatDoesNotExist")
      check(false)

    except COMError as error:
      check:
        error.hresult == DISP_E_UNKNOWNNAME
        error.msg.contains("unsupported method")
        error.desc.len != 0

    expect COMError:
      dict.call("add", "only-one-argument", kwargs=[])

    check:
      dict.connect(nil) == 0
      not dict.disconnect(0)

    expect COMError:
      dict.connect(proc (self: com, name: string, params: varargs[variant]): variant = nil)

    expect COMError:
      dict.disconnect(1)

  test "Nil Wrappers, Copying, And Release":
    var empty: com
    check:
      unwrap(empty).isNil
      empty.copy.isNil

    template expectNilDispatch(body: untyped) =
      try:
        body
        check(false)
      except COMError as error:
        check(error.hresult == E_POINTER)

    expectNilDispatch: empty.get("value")
    expectNilDispatch: empty.set("value", 1)
    expectNilDispatch: empty.call("value", 1)
    expectNilDispatch: discard empty.desc("value")
    expectNilDispatch: (for _ in empty: break)
    expectNilDispatch: empty.connect(proc (self: com, name: string, params: varargs[variant]): variant = nil)
    expectNilDispatch: empty.disconnect(1)

    let first = CreateObject("Scripting.Dictionary")
    let second = first.copy
    second.call("add", "value", 42)
    let asVariant = toVariant(second)
    let variantCopy = asVariant.copy
    let adoptedSource = CreateObject("Scripting.Dictionary")
    var rawDispatch = unwrap(adoptedSource)
    rawDispatch.AddRef()
    let adopted = adoptCom(rawDispatch)
    var adoptedRaw: VARIANT
    adoptedRaw.vt = VT_BSTR
    adoptedRaw.bstrVal = SysAllocString("adopted")
    let adoptedVariant = adoptVariant(adoptedRaw)

    check:
      second is com
      second.get("item", "value") == 42
      variantCopy.com.get("item", "value") == 42
      rawDispatch.isNil
      adopted.get("count").int == 0
      adoptedRaw.vt == VT_EMPTY
      $adoptedVariant == "adopted"

    when not defined(gcDestructors) and not defined(notrace):
      let trackedVariant = toVariant("tracked")
      check:
        $trackedVariant == "tracked"
        not unwrap(dict).isNil

      COM_FullRelease()
      check:
        trackedVariant.isNull
        unwrap(dict).isNil

      COM_FullRelease()
      let afterRelease = toVariant("after release")
      check:
        $afterRelease == "after release"
