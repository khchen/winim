#====================================================================
#
#          Winim - Windows API, COM, and CLR Module for Nim
#               Copyright (c) Chen Kai-Hung, Ward
#
#====================================================================

import winim/com
import nimDispatch

when isMainModule:
  import os
  CoInitialize(nil)

  var nimDisp = newNimDispatch()
  var isExit = false
  var buffer = "this is string from NimDispatch"

  nimDisp.add("setString") do (vargs: varargs[variant]) -> variant:
    if vargs.len >= 1:
      buffer = $vargs[0]

  nimDisp.add("getString") do (vargs: varargs[variant]) -> variant:
    return toVariant(buffer)

  nimDisp.add("exit") do (vargs: varargs[variant]) -> variant:
    isExit = true

  nimDisp.regist("nimDispatch")
  echo "Run client.vbs, client.py, or client.nim to end this server..."

  while not isExit:
    nimDisp.inloop()
    os.sleep(1)

  nimDisp.revoke()
