import winim.com

comScript:
  var obj = CreateObject("Excel.Application")

  obj.displayFullScreen = true
  obj.visible = true
  obj.sheetsInNewWorkBook = 1

  obj.workbooks.add()
  obj.activeSheet.name = "Critically Endangered"

  for i, j in ["Mammals", "Birds", "Reptiles", "Fishes", "Plants"]:
    obj.activeSheet.cells(1, i + 1) = j # this line needs comScript macro

  for cell in obj.activeSheet.range("A1:E1"):
    cell.interior.color = RGB(0xee, 0xdd, 0x82)
    cell.interior.pattern = 1
    cell.font.size = 13
    cell.borders.color = RGB(0, 0, 0)
    cell.borders.lineStyle = 1
    cell.borders.weight = 2

  var sheet = obj.activeSheet
  sheet.range("A2").value = 184
  sheet.range("B2").value = 182
  sheet.range("C2").value = 57
  sheet.range("D2").value = 162
  sheet.range("E2").value = 1276

  sheet.range("A4:E4").merge()
  sheet.range("A4").value = "Source: IUCN Red List 2003 (http://www.redlist.org/info/tables/table2.html)"
  sheet.range("A1:E2").borderAround(1, 2, nil.variant, RGB(0, 0, 0))

  sheet.columns("A:E").columnWidth = 12.5

  var xrange = obj.activeSheet.range("A1:E2")
  var xchart = obj.activeWorkbook.charts.add()
  xchart.chartWizard(xrange, -4100, 7, 1, 1, 0, false, "Critically Endangered Plants and Animals")
  xchart.HasAxis(3) = false

  obj.call("Quit")
  COM_FullRelease() # make sure excel.exe will end it self
