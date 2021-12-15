import winim/clr

const code = """
  using System;
  using System.Runtime.InteropServices;

  class Foo {
    public void Test() {
      Console.WriteLine("test2");
    }

    public void Test(string str = "Hello, world") {
      Console.WriteLine(str);
    }

  }
"""

var res = compile(code)
if res.Errors.Count != 0:
  for error in res.Errors:
    echo error
  quit()

else:
  var foo = res.CompiledAssembly.new("Foo")
  # foo.Test("This is test")
  var flags = BindingFlags_InvokeMethod or BindingFlags_OptionalParamBinding
  foo.invoke("Test", flags)
