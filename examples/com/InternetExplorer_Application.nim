#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#====================================================================

import strutils
import winim/com

var isQuit = false

proc handler(obj: com, name: string, params: varargs[variant]): variant =
  case name
  of "BeforeNavigate2":
    var
      url: string = params[1]
      cancel = fromVariant[ptr bool](params[6])

    if "google" notin url:
      cancel[] = true

    for i, j in ["pDisp", "Url", "Flags", "TargetFrameName", "PostData", "Headers", "Cancel"]:
      try:
        if j == "PostData":
          echo j, ": ", params[i].comarray1d
        else:
          echo j, ": ", params[i].string.strip
      except VariantConversionError:
        discard

  of "OnQuit":
    isQuit = true

  else: discard


var obj = CreateObject("InternetExplorer.Application")
# create InternetExplorerMedium instance to avoid it need admin
# var obj = CreateObject("{D5E8041D-920F-45e9-B8FB-B1DEB82C6E5E}")

obj.visible = true
obj.connect(handler, &DIID_DWebBrowserEvents2)
obj.navigate("http://www.google.com")

while not isQuit:
  var msg: MSG
  GetMessage(msg, 0, 0, 0)
  DispatchMessage(msg)

COM_FullRelease()
