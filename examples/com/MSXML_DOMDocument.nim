#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2021 Ward
#
#====================================================================

import winim/com

var xml = """
<book>
 <chapter>
  <title>title 01</title>
  <summary>summary 01</summary>
 </chapter>
 <chapter>
  <title>title 02</title>
  <summary>summary 02</summary>
 </chapter>
 <chapter>
  <title>title 03</title>
  <summary>summary 03</summary>
 </chapter>
</book>"""

var obj = CreateObject("MSXML.DOMDocument")
obj.loadXml(xml)
for n in obj.selectNodes("book/chapter"):
  echo n.xml
