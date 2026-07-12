#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

## A real Windows Forms example hosted by modern CoreCLR. The managed Form,
## Button, enum, property, method, and event are all operated from Nim through
## `winim/dotnet`'s opaque managed-object layer.

import winim/dotnet

proc main() =
  dotnetStart(frameworkName = "Microsoft.WindowsDesktop.App")
  defer: dotnetClose()

  let forms = load("System.Windows.Forms")
  let drawing = load("System.Drawing")
  let application = forms.getType("System.Windows.Forms.Application")
  let highDpiMode = forms.getType("System.Windows.Forms.HighDpiMode").PerMonitorV2
  application.SetHighDpiMode(highDpiMode)
  application.EnableVisualStyles()
  application.SetCompatibleTextRenderingDefault(false)

  let Size = drawing.getType("System.Drawing.Size")
  let FormStartPosition = forms.getType("System.Windows.Forms.FormStartPosition")
  let DockStyle = forms.getType("System.Windows.Forms.DockStyle")

  let form = forms.new("System.Windows.Forms.Form")
  let button = forms.new("System.Windows.Forms.Button")
  form.text = "Nim + modern .NET"
  form.clientSize = Size.new(420, 150)
  form.startPosition = FormStartPosition.CenterScreen
  button.text = "Close"
  button.dock = DockStyle.Fill
  form.Controls.Add(button)

  button.on("Click") do (sender, args: DotnetObject):
    form.close()

  application.Run(form)

when isMainModule:
  main()
