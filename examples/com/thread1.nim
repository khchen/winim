#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#====================================================================

import winim/com
import threadpool

proc thread(dict: com) =
  {.gcsafe.}:
    discard dict.add("child", "thread")

proc main() =
  var dict = CreateObject("Scripting.Dictionary")
  dict.add("main", "thread")

  spawn thread(dict)
  sync()

  for key in dict:
    echo key, " => ", dict.item(key)

main()
