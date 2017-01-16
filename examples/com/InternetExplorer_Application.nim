import strutils
import winim.com

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
obj.visible = true
obj.connect(handler, &DIID_DWebBrowserEvents2)
obj.navigate("http://www.google.com")

while not isQuit:
  var msg: MSG
  GetMessage(msg, 0, 0, 0)
  DispatchMessage(msg)

COM_FullRelease()
