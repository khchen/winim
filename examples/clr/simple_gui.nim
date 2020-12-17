#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import winim/clr

# clrStart("v2.0.50727")

const code = """
  using System;
  using System.Reflection;
  using System.Runtime.InteropServices;

  public class EventHelper {
    [UnmanagedFunctionPointer(CallingConvention.StdCall)]
    public delegate void CallbackType([MarshalAs(UnmanagedType.IUnknown)] Object arg);

    public EventHandler MakeHandler(IntPtr cb) {
      return new EventHandler(delegate(Object sender, EventArgs e) {
        Marshal.GetDelegateForFunctionPointer(cb, typeof(CallbackType)).DynamicInvoke(sender);
      });
    }
  }
"""

proc eventHandler(sender: ptr IUnknown) {.stdcall.} =
  echo toCLRVariant(sender)

var res = compile(code)
if res.Errors.Count != 0:
  for error in res.Errors:
    echo error
  quit()

var eventHelper = res.CompiledAssembly.new("EventHelper")
var handler = eventHelper.MakeHandler(eventHandler[])

var drawing = load("System.Drawing")
var forms = load("System.Windows.Forms")
var Size = drawing.GetType("System.Drawing.Size")
var Point = drawing.GetType("System.Drawing.Point")

var form = forms.new("System.Windows.Forms.Form")
form.Text = "Nim .NET"

try:
  # fail in .NET Framework 2.0
  form.Size = @Size.new(640, 480)

except CLRError:
  echo "v2.0.50727 workaround"
  form.Width = 640
  form.Height = 480

var button = forms.new("System.Windows.Forms.Button")
button.Text = "Button"
try:
  # fail in .NET Framework 2.0
  button.Size = @Size.new(120, 30)
  button.Location = @Point.new(10, 10)

except CLRError:
  echo "v2.0.50727 workaround"
  button.Width = 120
  button.Height = 30
  button.Left = 10
  button.Top = 10

button.add_Click(handler)
form.Controls.Add(button)
form.ShowDialog()
