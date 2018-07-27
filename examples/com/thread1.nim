import winim.com
import threadpool

var dict = CreateObject("Scripting.Dictionary")
dict.add("main", "thread")

proc thread(stream: ptr IStream) =
  var disp: ptr IDispatch
  if SUCCEEDED CoGetInterfaceAndReleaseStream(stream, &IID_IDispatch, cast[ptr pointer](&disp)):
    var dict = warp(disp)
    dict.add("child", "thread")
    disp.Release()

var stream: ptr IStream
if SUCCEEDED CoMarshalInterThreadInterfaceInStream(&IID_IDispatch, unwarp(dict), &stream):
  spawn thread(stream)
  sync()

for key in dict:
  echo key, " => ", dict.item(key)
