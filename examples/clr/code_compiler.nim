#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import winim/clr

proc test_cs() =
  const code = """
    using System;
    using System.Runtime.InteropServices;

    class Foo {
      public void Test() {
        Console.WriteLine("Hello, world");
      }

      [UnmanagedFunctionPointer(CallingConvention.StdCall)]
      [return: MarshalAs( UnmanagedType.IUnknown )]
      public delegate Object CallbackType([MarshalAs(UnmanagedType.IUnknown)] Object arg);

      public void TryCallback(IntPtr ptr) {
        CallbackType func = (CallbackType) Marshal.GetDelegateForFunctionPointer(ptr, typeof(CallbackType));
        Console.WriteLine("Nim Says: " + func("Hello"));
      }

    }
  """

  var res = compile(code)
  if res.Errors.Count != 0:
    for error in res.Errors:
      echo error
    quit()

  else:
    proc callback(arg: ptr IUnknown): ptr IUnknown {.stdcall.} =
      echo "C# Says: ", toCLRVariant(arg)
      return "I am Nim callback"[] # Convert to String object

    var foo = res.CompiledAssembly.new("Foo")
    foo.Test()
    foo.TryCallback(callback[]) # Convert to IntPtr object

proc test_vb() =
  const code = """
      Imports System.Windows.Forms
      Class Foo
          Public Sub Test()
              MessageBox.Show("Hello, world, from VB!")
          End Sub
      End Class
  """

  var res = compile(code, ["System.dll", "System.Windows.Forms.dll"],
    provider="Microsoft.VisualBasic.VBCodeProvider")

  if res.Errors.Count != 0:
    for error in res.Errors:
      echo error
    quit()

  var foo = res.CompiledAssembly.new("Foo")
  foo.Test()

proc test_dll() =
  const code = """
    using System;
    using System.Windows.Forms;

    namespace TestDLL
    {
        public class TestClass
        {
            public static void Test()
            {
                MessageBox.Show("Hello, world, from C# DLL!");
            }
        }
    }
  """

  var filename = "testdll.dll"
  var res = compile(code, ["System.dll", "System.Windows.Forms.dll"],
    filename=filename)

  if res.Errors.Count != 0:
    for error in res.Errors:
      echo error
    quit()

  var dll = load(filename)
  var TestClass = dll.GetType("TestDLL.TestClass")
  @TestClass.Test()

test_cs()
test_vb()
test_dll()
