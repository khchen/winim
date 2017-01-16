import strutils
import winim.com

var obj = CreateObject("VBScript.RegExp")
obj.pattern = r"\wo\w"
obj.ignoreCase = true
obj.global = true

for match in obj.execute("the quick brown fox jumps over the lazy dog"):
  echo match
  echo "FirstIndex: $1, Length: $2, Value: $3" % [$match.firstIndex, $match.length, $match.value]
