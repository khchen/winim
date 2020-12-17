#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

# Source: https://docs.microsoft.com/en-us/dotnet/api/system.reflection.bindingflags?view=net-5.0

import winim/clr
import strutils, strformat

const code = """
  using System;
  using System.Reflection;
  using System.IO;

  public class TestClass
  {
      public String Name;
      private Object [] values = new Object [] {0, 1,2,3,4,5,6,7,8,9};

      public Object this [int index]
      {
          get
          {
              return values[index];
          }
          set
          {
              values[index] = value;
          }
      }

      public Object Value
      {
          get
          {
              return "the value";
          }
      }

      public TestClass () : this("initialName") {}
      public TestClass (string initName)
      {
          Name = initName;
      }

      int methodCalled = 0;

      public static void SayHello ()
      {
          Console.WriteLine ("Hello");
      }

      public void AddUp ()
      {
          methodCalled++;
          Console.WriteLine ("AddUp Called {0} times", methodCalled);
      }

      public static double ComputeSum (double d1, double d2)
      {
          return d1 + d2;
      }

      public static void PrintName (String firstName, String lastName)
      {
          Console.WriteLine ("{0}, {1}", lastName,firstName);
      }

      public void PrintTime ()
      {
          Console.WriteLine (DateTime.Now);
      }

      public void Swap(ref Object a, ref Object b)
      {
          Object x = a;
          a = b;
          b = x;
      }
  }

  [DefaultMemberAttribute ("PrintTime")]
  public class TestClass2
  {
      public void PrintTime ()
      {
          Console.WriteLine (DateTime.Now);
      }
  }

  public class Base
  {
      static int BaseOnlyPrivate = 0;
      protected static int BaseOnly = 0;
  }
  public class Derived : Base
  {
      public static int DerivedOnly = 0;
  }
  public class MostDerived : Derived {}
"""

proc print(msg: string) =
  echo "\n" & msg
  echo repeat('-', msg.len)

var mscor = load("mscorlib")
var BindingFlags = mscor.GetType("System.Reflection.BindingFlags")
var Array = mscor.GetType("System.Array")

var res = compile(code)
if res.Errors.Count != 0:
  for error in res.Errors:
    echo error

var assembly = res.CompiledAssembly
var TestClass = assembly.GetType("TestClass")
var TestClass2 = assembly.GetType("TestClass2")
var MostDerived = assembly.GetType("MostDerived")

print "Invoking a static method."
@TestClass.SayHello()

print "Invoking an instance method."
var c = @TestClass.new()
c.AddUp()
c.AddUp()

print "Invoking a method with parameters."
echo "100.09 + 184.45 = ", c.ComputeSum(100.09, 184.45)

print "Invoking a field (getting and setting.)"
echo "Name == ", c.Name
c.Name = "NewName"
echo "Name == ", c.Name

print "Invoking an indexed property (getting and setting.)"
var index = 3
echo fmt"Item[{index}] == ", c.Item(index)
clrScript:
  c.Item(index) = "NewValue"
echo fmt"Item[{index}] == ", c.Item(index)

print "Getting a field or property."
echo c.Name
echo c.Value

print "Invoking a method with named parameters."
echo "(Unsupported)"

print "Invoking a default member of a type."
var c2 = @TestClass2.new()
c2.invoke("", BindingFlags_InvokeMethod or BindingFlags_Default)

print "Invoking a method with ref parameters."
echo "(Unsupported)"

print "Creating an instance with a parameterless constructor."
var flags = BindingFlags_Public or BindingFlags_Instance or BindingFlags_CreateInstance
# method 1: Use "new" keyword on CLRType (by calling Activator.CreateInstance)
c = @TestClass.new()
# method 2: Use "new" keyword on assembly CLRVariant (by calling Assembly.CreateInstance)
c = assembly.new("TestClass")
# method 3: Call "invoke" low level helper function
c = @TestClass.invoke("TestClass", flags)
# method 4: Call InvokeMember method by yourself
c = TestClass.InvokeMember("TestClass", flags[BindingFlags], nil, nil, nil)
echo fmt"Instance of {c.GetType().Name} created."

print "Creating an instance with a constructor that has parameters."
c = @TestClass.new("Hello, World!")
c = assembly.new("TestClass", "Hello, World!")
c = @TestClass.invoke("TestClass", flags, "Hello, World!")
c = TestClass.InvokeMember("TestClass", flags[BindingFlags], nil, nil, ["Hello, World!"])
echo fmt"Instance of {c.GetType().Name} created with initial value '{c.Name}'."

print "DeclaredOnly instance members."
flags = BindingFlags_DeclaredOnly or BindingFlags_Instance or BindingFlags_Public
for i in TestClass.GetMembers(flags[BindingFlags])[Array]:
  echo i.Name

print "Using IgnoreCase and invoking the PrintName method."
flags = BindingFlags_IgnoreCase or BindingFlags_Static or BindingFlags_Public or BindingFlags_InvokeMethod
@TestClass.invoke("printname", flags, "Brad", "Smith")

print "Using FlattenHierarchy to get inherited static protected and public members."
flags = BindingFlags_NonPublic or BindingFlags_Public or BindingFlags_Static or BindingFlags_FlattenHierarchy
for i in MostDerived.GetFields(flags[BindingFlags])[Array]:
  echo fmt"{i.Name} defined in {i.DeclaringType.Name}."

print "Without FlattenHierarchy."
flags = BindingFlags_NonPublic or BindingFlags_Public or BindingFlags_Static
for i in MostDerived.GetFields(flags[BindingFlags])[Array]:
  echo fmt"{i.Name} defined in {i.DeclaringType.Name}."
