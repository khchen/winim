#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import strformat
import winim/com

when not defined(cpu64):
  block:
    var obj = CreateObject("MSScriptControl.ScriptControl")
    obj.allowUI = false
    obj.useSafeSubset = false

    obj.language = "JavaScript"
    let answer = obj.eval("Math.pow(5, 2) * Math.PI")
    echo fmt"Math.pow(5, 2) * Math.PI = {answer}"

block:
  let js = CreateObject("htmlfile").parentWindow
  js.execScript "function(){}"

  let answer = js.eval("Math.pow(5, 2) * Math.PI")
  echo fmt"Math.pow(5, 2) * Math.PI = {answer}"

  js.execScript """
    var count = 0;
    function nextId() { return ++count; }
  """
  echo "First ID: ", js.nextId(0)
  echo "Second ID: ", js.call("nextId")

  let status = js.decodeURIComponent("Status%3A%20%F0%9F%9A%80")
  doAssert(status == "Status: 🚀")
  echo status

block:
  let html = CreateObject("htmlfile")
  html.write("<meta http-equiv='x-ua-compatible' content='IE=9' />")
  html.close()

  let js = html.parentWindow
  let rawJson = """{"user": {"id": 9527, "profile": {"name": "Tony", "score": 98.5}}}"""
  let user = js.eval(fmt"(JSON.parse('{rawJson}').user)")
  let score = user.profile.score
  doAssert(score == 98.5)
  echo fmt"Tony's score is {98.5}"
