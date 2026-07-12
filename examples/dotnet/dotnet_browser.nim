#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

## A small .NET Object Browser hosted by modern CoreCLR. It lists assemblies,
## types, methods, properties, fields, and events, and inspects live managed
## Windows Forms objects created by the browser itself.

import std/[strformat, strutils]
import winim/dotnet

const MaximumTypeResults = 250

proc selectedTag(list: DotnetObject): DotnetObject =
  let selected = list.SelectedItems
  if selected.Count.toInt == 0:
    return
  let item = selected[0]
  result = item.Tag

proc addListItem(forms: DotnetAssembly, list: DotnetObject,
    name, kind, extra: string, tag: DotnetObject) =
  let item = forms.new("System.Windows.Forms.ListViewItem", name)
  item.SubItems.Add(kind)
  item.SubItems.Add(extra)
  item.Tag = tag
  list.Items.Add(item)

proc clearList(list: DotnetObject) =
  list.BeginUpdate()
  list.Items.Clear()
  list.EndUpdate()

proc typeKind(typ: DotnetObject): string =
  if typ.IsInterface:
    return "interface"
  if typ.IsEnum:
    return "enum"
  if typ.IsValueType:
    return "struct"
  if typ.IsClass:
    return "class"
  "type"

proc baseTypeName(typ: DotnetObject): string =
  let baseType = typ.BaseType
  if baseType.isNil:
    return "(none)"
  $(baseType.Name)

proc populateTypes(forms: DotnetAssembly, assembly, types, members,
    properties, details, status: DotnetObject, filter: string) =
  clearList(types)
  clearList(members)
  clearList(properties)
  if assembly.isNil:
    details.text = "Select an assembly."
    status.text = "No assembly selected"
    return
  let needle = filter.strip.toLowerAscii

  try:
    let allTypes = assembly.GetTypes()
    let count = allTypes.Length.toInt
    let scanCount = if needle.len == 0: min(count, MaximumTypeResults) else: count
    var shown = 0
    types.BeginUpdate()
    try:
      for i in 0 ..< scanCount:
        let typ = allTypes.invoke("GetValue", i)
        let fullName = $(typ.FullName)
        if needle.len == 0 or fullName.toLowerAscii.contains(needle):
          if needle.len == 0:
            addListItem(forms, types, fullName, "(lazy)", "", typ)
          else:
            addListItem(forms, types, fullName, typeKind(typ), baseTypeName(typ), typ)
          inc shown
          if shown >= MaximumTypeResults:
            break
    finally:
      types.EndUpdate()
    let assemblyName = assembly.GetName()
    let displayName =
      if assemblyName.isNil: "(unknown assembly)"
      else: $(assemblyName.Name)
    if needle.len == 0 and count > scanCount:
      details.text = fmt("Showing the first {shown} of {count} types in {displayName}.\nEnter a filter to search the assembly.")
      status.text = fmt("{shown} of {count} type(s) shown")
    else:
      status.text = fmt("{shown} type(s) shown from {count} in {displayName}")
  except CatchableError as error:
    details.text = fmt("Unable to enumerate types:\n{error.msg}")
    status.text = "Reflection error"

proc populateMembers(forms: DotnetAssembly, typ, members, properties,
    details, status: DotnetObject) =
  clearList(members)
  clearList(properties)
  if typ.isNil:
    details.text = "Select a type."
    return

  try:
    let allMembers = typ.GetMembers()
    let count = allMembers.Length.toInt
    members.BeginUpdate()
    try:
      for i in 0 ..< count:
        let member = allMembers.invoke("GetValue", i)
        let declaringType = member.DeclaringType
        addListItem(forms, members, member.Name, member.MemberType, declaringType.Name, member)
    finally:
      members.EndUpdate()
    details.text = fmt("{typ.FullName}\n{count} member(s)")
    status.text = fmt("{count} member(s)")
  except CatchableError as error:
    details.text = fmt("Unable to enumerate members:\n{error.msg}")
    status.text = "Reflection error"

proc showMember(member, details, status: DotnetObject) =
  if member.isNil:
    return
  try:
    let declaringType = member.DeclaringType
    details.text = fmt("Name: {member.Name}\nKind: {member.MemberType}\nDeclaring type: {declaringType.FullName}\n\n{member.ToString}")
    status.text = fmt("Selected {member.MemberType}")
  except CatchableError as error:
    details.text = fmt("Unable to inspect member:\n{error.msg}")
    status.text = "Member inspection error"

proc populateProperties(forms: DotnetAssembly, instance, properties,
    details, status: DotnetObject) =
  clearList(properties)
  if instance.isNil:
    details.text = "Select a live managed object."
    return

  try:
    let typ = instance.GetType()
    let allProperties = typ.GetProperties()
    let count = allProperties.Length.toInt
    properties.BeginUpdate()
    try:
      for i in 0 ..< count:
        let property = allProperties.invoke("GetValue", i)
        if not property.CanRead:
          continue
        let indexParameters = property.GetIndexParameters()
        if indexParameters.Length.toInt != 0:
          continue
        let propertyType = property.PropertyType
        addListItem(forms, properties, property.Name,
          propertyType.Name, "<select property>", property)
    finally:
      properties.EndUpdate()
    details.text = fmt("Object type: {typ.FullName}\nReadable properties: {count}\n\nSelect a property to evaluate its value.")
    status.text = fmt("Inspecting {typ.Name}")
  except CatchableError as error:
    details.text = fmt("Unable to inspect object:\n{error.msg}")
    status.text = "Object inspection error"

proc showPropertyValue(instance, property, details, status: DotnetObject) =
  if instance.isNil or property.isNil:
    return
  try:
    let propertyType = property.PropertyType
    let value = property.GetValue(instance)
    details.text = fmt("Object type: {instance.GetType().FullName}\nProperty: {property.Name}\nType: {propertyType.FullName}\n\nValue: {value}")
    status.text = fmt("Evaluated {property.Name}")
  except CatchableError as error:
    details.text = fmt("Unable to evaluate property:\n{error.msg}")
    status.text = "Property evaluation error"

proc addAssembly(forms: DotnetAssembly, list: DotnetObject,
    displayName: string, assembly: DotnetObject) =
  addListItem(forms, list, displayName, "Assembly", assembly.FullName, assembly)

proc main() =
  dotnetStart(frameworkName = "Microsoft.WindowsDesktop.App")
  defer: dotnetClose()

  let core = load("System.Private.CoreLib")
  let forms = load("System.Windows.Forms")
  let drawing = load("System.Drawing")
  let assemblyType = core.getType("System.Reflection.Assembly")
  let application = forms.getType("System.Windows.Forms.Application")
  let highDpiMode = forms.getType("System.Windows.Forms.HighDpiMode").PerMonitorV2
  application.SetHighDpiMode(highDpiMode)
  application.EnableVisualStyles()
  application.SetCompatibleTextRenderingDefault(false)

  let Size = drawing.getType("System.Drawing.Size")
  let FormStartPosition = forms.getType("System.Windows.Forms.FormStartPosition")
  let DockStyle = forms.getType("System.Windows.Forms.DockStyle")
  let Orientation = forms.getType("System.Windows.Forms.Orientation")
  let SizeType = forms.getType("System.Windows.Forms.SizeType")
  let View = forms.getType("System.Windows.Forms.View")

  let form = forms.new("System.Windows.Forms.Form")
  form.text = "Nim + modern .NET Object Browser"
  form.clientSize = Size.new(1280, 760)
  form.startPosition = FormStartPosition.CenterScreen

  let toolbar = forms.new("System.Windows.Forms.FlowLayoutPanel")
  toolbar.dock = DockStyle.Fill
  let filterLabel = forms.new("System.Windows.Forms.Label")
  filterLabel.text = "Type filter (Refresh):"
  filterLabel.autoSize = true
  let filterBox = forms.new("System.Windows.Forms.TextBox")
  filterBox.width = 280
  let refreshButton = forms.new("System.Windows.Forms.Button")
  refreshButton.text = "Refresh"
  refreshButton.size = Size.new(85, 28)
  toolbar.Controls.Add(filterLabel)
  toolbar.Controls.Add(filterBox)
  toolbar.Controls.Add(refreshButton)

  let assemblyList = forms.new("System.Windows.Forms.ListView")
  assemblyList.dock = DockStyle.Fill
  assemblyList.view = View.Details
  assemblyList.fullRowSelect = true
  assemblyList.gridLines = true
  assemblyList.Columns.Add("Assembly", 210)
  assemblyList.Columns.Add("Full name", 420)

  let objectList = forms.new("System.Windows.Forms.ListView")
  objectList.dock = DockStyle.Fill
  objectList.view = View.Details
  objectList.fullRowSelect = true
  objectList.gridLines = true
  objectList.Columns.Add("Live object", 230)
  objectList.Columns.Add("Type", 380)

  let typeList = forms.new("System.Windows.Forms.ListView")
  typeList.dock = DockStyle.Fill
  typeList.view = View.Details
  typeList.fullRowSelect = true
  typeList.gridLines = true
  typeList.Columns.Add("Type", 390)
  typeList.Columns.Add("Kind", 90)
  typeList.Columns.Add("Base type", 260)

  let memberList = forms.new("System.Windows.Forms.ListView")
  memberList.dock = DockStyle.Fill
  memberList.view = View.Details
  memberList.fullRowSelect = true
  memberList.gridLines = true
  memberList.Columns.Add("Member", 260)
  memberList.Columns.Add("Kind", 120)
  memberList.Columns.Add("Declaring type", 260)

  let propertyList = forms.new("System.Windows.Forms.ListView")
  propertyList.dock = DockStyle.Fill
  propertyList.view = View.Details
  propertyList.fullRowSelect = true
  propertyList.gridLines = true
  propertyList.Columns.Add("Property", 240)
  propertyList.Columns.Add("Type", 180)
  propertyList.Columns.Add("Value", 420)

  let details = forms.new("System.Windows.Forms.RichTextBox")
  details.dock = DockStyle.Fill
  details.readOnly = true
  details.wordWrap = false
  details.text = "Select an assembly, type, member, or live object."

  let status = forms.new("System.Windows.Forms.StatusStrip")
  status.dock = DockStyle.Fill
  let statusLabel = forms.new("System.Windows.Forms.ToolStripStatusLabel")
  statusLabel.text = "Ready"
  statusLabel.spring = true
  status.Items.Add(statusLabel)

  let mainSplit = forms.new("System.Windows.Forms.SplitContainer")
  mainSplit.dock = DockStyle.Fill
  mainSplit.orientation = Orientation.Vertical

  let leftLayout = forms.new("System.Windows.Forms.TableLayoutPanel")
  leftLayout.dock = DockStyle.Fill
  leftLayout.columnCount = 1
  leftLayout.rowCount = 2
  leftLayout.RowStyles.Add(
    forms.new("System.Windows.Forms.RowStyle", SizeType.Percent, 50.0))
  leftLayout.RowStyles.Add(
    forms.new("System.Windows.Forms.RowStyle", SizeType.Percent, 50.0))
  leftLayout.Controls.Add(assemblyList, 0, 0)
  leftLayout.Controls.Add(objectList, 0, 1)
  mainSplit.Panel1.Controls.Add(leftLayout)

  let rightLayout = forms.new("System.Windows.Forms.TableLayoutPanel")
  rightLayout.dock = DockStyle.Fill
  rightLayout.columnCount = 1
  rightLayout.rowCount = 3
  rightLayout.RowStyles.Add(
    forms.new("System.Windows.Forms.RowStyle", SizeType.Percent, 28.0))
  rightLayout.RowStyles.Add(
    forms.new("System.Windows.Forms.RowStyle", SizeType.Percent, 40.0))
  rightLayout.RowStyles.Add(
    forms.new("System.Windows.Forms.RowStyle", SizeType.Percent, 32.0))
  rightLayout.Controls.Add(typeList, 0, 0)
  rightLayout.Controls.Add(memberList, 0, 1)

  let propertyLayout = forms.new("System.Windows.Forms.TableLayoutPanel")
  propertyLayout.dock = DockStyle.Fill
  propertyLayout.columnCount = 1
  propertyLayout.rowCount = 2
  propertyLayout.RowStyles.Add(
    forms.new("System.Windows.Forms.RowStyle",SizeType.Percent, 70.0))
  propertyLayout.RowStyles.Add(
    forms.new("System.Windows.Forms.RowStyle", SizeType.Percent, 30.0))
  propertyLayout.Controls.Add(propertyList, 0, 0)
  propertyLayout.Controls.Add(details, 0, 1)
  rightLayout.Controls.Add(propertyLayout, 0, 2)
  mainSplit.Panel2.Controls.Add(rightLayout)

  let root = forms.new("System.Windows.Forms.TableLayoutPanel")
  root.dock = DockStyle.Fill
  root.columnCount = 1
  root.rowCount = 3
  root.RowStyles.Add(forms.new("System.Windows.Forms.RowStyle", SizeType.Absolute, 42.0))
  root.RowStyles.Add(forms.new("System.Windows.Forms.RowStyle", SizeType.Percent, 100.0))
  root.RowStyles.Add(forms.new("System.Windows.Forms.RowStyle", SizeType.Absolute, 24.0))
  root.Controls.Add(toolbar, 0, 0)
  root.Controls.Add(mainSplit, 0, 1)
  root.Controls.Add(status, 0, 2)
  form.Controls.Add(root)

  var currentAssembly: DotnetObject
  var currentInstance: DotnetObject

  let formsAssembly = assemblyType.Load("System.Windows.Forms")
  let drawingAssembly = assemblyType.Load("System.Drawing")
  let coreAssembly = assemblyType.Load("System.Private.CoreLib")
  addAssembly(forms, assemblyList, "System.Windows.Forms", formsAssembly)
  addAssembly(forms, assemblyList, "System.Drawing", drawingAssembly)
  addAssembly(forms, assemblyList, "System.Private.CoreLib", coreAssembly)

  addListItem(forms, objectList, "Browser form", "Form", "", form)
  addListItem(forms, objectList, "Main SplitContainer", "SplitContainer", "", mainSplit)
  addListItem(forms, objectList, "Assembly ListView", "ListView", "", assemblyList)
  addListItem(forms, objectList, "Type ListView", "ListView", "", typeList)
  addListItem(forms, objectList, "Member ListView", "ListView", "", memberList)
  addListItem(forms, objectList, "Property ListView", "ListView", "", propertyList)

  form.on("Load") do (sender, args: DotnetObject):
    mainSplit.panel1MinSize = 260
    mainSplit.panel2MinSize = 700
    mainSplit.splitterDistance = 300

  assemblyList.on("SelectedIndexChanged") do (sender, args: DotnetObject):
    currentAssembly = selectedTag(assemblyList)
    populateTypes(forms, currentAssembly, typeList, memberList, propertyList,
      details, statusLabel, $(filterBox.Text))

  typeList.on("SelectedIndexChanged") do (sender, args: DotnetObject):
    populateMembers(forms, selectedTag(typeList), memberList, propertyList,
      details, statusLabel)

  memberList.on("SelectedIndexChanged") do (sender, args: DotnetObject):
    showMember(selectedTag(memberList), details, statusLabel)

  objectList.on("SelectedIndexChanged") do (sender, args: DotnetObject):
    currentInstance = selectedTag(objectList)
    populateProperties(forms, currentInstance, propertyList,
      details, statusLabel)

  propertyList.on("SelectedIndexChanged") do (sender, args: DotnetObject):
    showPropertyValue(currentInstance, selectedTag(propertyList), details,
      statusLabel)

  refreshButton.on("Click") do (sender, args: DotnetObject):
    if not currentAssembly.isNil:
      populateTypes(forms, currentAssembly, typeList, memberList, propertyList,
        details, statusLabel, filterBox.Text)

  let firstAssembly = assemblyList.Items[0]
  firstAssembly.Selected = true
  currentAssembly = formsAssembly

  let firstObject = objectList.Items[0]
  firstObject.Selected = true
  currentInstance = form
  populateProperties(forms, form, propertyList, details, statusLabel)

  application.Run(form)

when isMainModule:
  main()
