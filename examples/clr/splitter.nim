#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2021 Ward
#
#====================================================================

# Source: https://github.com/pythonnet/pythonnet/blob/master/demo/splitter.py

import winim/clr

# clrStart("v2.0.50727")

var forms = load("System.Windows.Forms")
var drawing = load("System.Drawing")

var DockStyle = forms.GetType("System.Windows.Forms.DockStyle")
var Color = drawing.GetType("System.Drawing.Color")
var Application = forms.GetType("System.Windows.Forms.Application")
var Size = drawing.GetType("System.Drawing.Size")
var Point = drawing.GetType("System.Drawing.Point")

# Create an instance of each control being used.
var form = forms.new("System.Windows.Forms.Form")
var treeView = forms.new("System.Windows.Forms.TreeView")
var listView = forms.new("System.Windows.Forms.ListView")
var richTextBox = forms.new("System.Windows.Forms.RichTextBox")
var splitter1 = forms.new("System.Windows.Forms.Splitter")
var splitter2 = forms.new("System.Windows.Forms.Splitter")
var panel = forms.new("System.Windows.Forms.Panel")

# Set properties of TreeView control.
treeView.Dock = @DockStyle.Left[DockStyle]
treeView.Width = form.ClientSize["width"] div 3
treeView.TabIndex = 0
treeView.Nodes.Add("TreeView")

# Set properties of ListView control.
listView.Dock = @DockStyle.Top[DockStyle]
listView.Height = form.ClientSize["height"] * 2 div 3
listView.TabIndex = 0
listView.Items.Add("ListView")

# Set properties of RichTextBox control.
richTextBox.Dock = @DockStyle.Fill[DockStyle]
richTextBox.TabIndex = 2
richTextBox.Text = "richTextBox"

# Set properties of Panel's Splitter control.
splitter2.Dock = @DockStyle.Top[DockStyle]

# Width is irrelevant if splitter is docked to Top.
splitter2.Height = 3

# Use a different color to distinguish the two splitters.
try:
  # fail in .NET Framework 2.0
  splitter2.BackColor = @Color.Blue[Color]

except CLRError:
  echo "v2.0.50727 workaround"
  splitter2.BackColor = 0xff0000[Color]

splitter2.TabIndex = 1

# Set TabStop to false for ease of use when negotiating UI.
splitter2.TabStop = false

# Set properties of Form's Splitter control.
try:
  # fail in .NET Framework 2.0
  splitter1.Location = @Point.new(121, 0)
  splitter1.Size = @Size.new(3, 273)
  splitter1.BackColor = @Color.Red[Color]

except CLRError:
  echo "v2.0.50727 workaround"
  splitter1.Left = 121
  splitter1.Top = 0
  splitter1.Width = 3
  splitter1.Height = 273
  splitter1.BackColor = 0x0000ff[Color]

splitter1.TabIndex = 1

# Set TabStop to false for ease of use when negotiating UI.
splitter1.TabStop = false

# Add the appropriate controls to the Panel.
for item in [richTextBox, splitter2, listView]:
  panel.Controls.Add(item)

# Set properties of Panel control.
panel.Dock = @DockStyle.Fill[DockStyle]
panel.TabIndex = 2

# Add the rest of the controls to the form.
for item in [panel, splitter1, treeView]:
  form.Controls.Add(item)

form.Text = "Intricate UI Example"

@Application.Run(form)
form.Dispose()
