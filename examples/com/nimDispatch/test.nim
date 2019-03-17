#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
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
  echo "End this program by run test.vbs or test.py..."

  while not isExit:
    nimDisp.inloop()
    os.sleep(1)

  nimDisp.revoke()

