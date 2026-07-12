#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

import winim/com
import threadpool

proc thread(dict: com) {.thread.} =
  dict.add("child", "thread")

proc main() =
  var dict = CreateObject("Scripting.Dictionary")
  dict.add("main", "thread")

  spawn thread(dict)
  sync()

  for key in dict:
    echo key, " => ", dict.item(key)

main()
