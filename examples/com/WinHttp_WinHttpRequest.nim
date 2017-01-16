import winim.com

var obj = CreateObject("WinHttp.WinHttpRequest.5.1")
obj.open("get", "http://www.google.com")
obj.send()
echo obj.responseText
