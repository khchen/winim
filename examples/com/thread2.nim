import winim/com
import threadpool

proc getGit(): ptr IGlobalInterfaceTable =
  const CLSID_StdGlobalInterfaceTable = DEFINE_GUID(0x00000323'i32, 0x0000, 0x0000,
    [0xC0'u8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46])

  if FAILED CoCreateInstance(&CLSID_StdGlobalInterfaceTable, nil, CLSCTX_INPROC_SERVER,
    &IID_IGlobalInterfaceTable, cast[ptr pointer](&result)):
    raise

var dict = CreateObject("Scripting.Dictionary")
dict.add("main", "thread")

proc thread(cookie: DWORD) =
  var git = getGit()
  var disp: ptr IDispatch
  if SUCCEEDED git.GetInterfaceFromGlobal(cookie, &IID_IDispatch, cast[ptr pointer](&disp)):
    var dict = warp(disp)
    dict.add("child", "thread")
    disp.Release()

var git = getGit()
var cookie: DWORD
if SUCCEEDED git.RegisterInterfaceInGlobal(unwarp(dict), &IID_IDispatch, &cookie):
  spawn thread(cookie)
  sync()

for key in dict:
  echo key, " => ", dict.item(key)
