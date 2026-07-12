#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
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

proc section(title: string) =
  echo "\n" & title
  echo repeat('-', title.len)

var mscor = load("mscorlib")
var BindingFlags = mscor.GetType("System.Reflection.BindingFlags")

var res = compile(code)
if res.Errors.Count != 0:
  for error in res.Errors:
    echo error

var assembly = res.CompiledAssembly
var TestClass = assembly.GetType("TestClass")
var TestClass2 = assembly.GetType("TestClass2")
var MostDerived = assembly.GetType("MostDerived")

section "Invoke a static method"
@TestClass.SayHello() # Hello

section "Invoke an instance method"
var c = @TestClass.new()
c.AddUp() # AddUp Called 1 times
c.AddUp() # AddUp Called 2 times

section "Invoke a method with parameters"
echo "100.09 + 184.45 = ", c.ComputeSum(100.09, 184.45) # 284.54

section "Get and set a field"
echo "Name == ", c.Name # initialName
c.Name = "NewName"
echo "Name == ", c.Name # NewName

section "Get and set an indexed property"
var index = 3
echo fmt"Item[{index}] == ", c.Item(index) # 3
clrScript:
  c.Item(index) = "NewValue"
echo fmt"Item[{index}] == ", c.Item(index) # NewValue

section "Get a field or property"
echo c.Name # NewName
echo c.Value # the value

section "Invoke a method with named parameters"
echo "(Unsupported)" # named parameters are unsupported

section "Invoke a type's default member"
var c2 = @TestClass2.new()
c2.invoke("", BindingFlags_InvokeMethod or BindingFlags_Default) # the current date and time

section "Invoke a method with ref parameters"
var m = c.GetType.GetMethod("Swap")
var args = [1, 2][]
m.Invoke(c, args)
echo fmt"args[0] = {args[0]}, args[1] = {args[1]}" # args[0] = 2, args[1] = 1

section "Create an instance with a parameterless constructor"
var flags = BindingFlags_Public or BindingFlags_Instance or BindingFlags_CreateInstance
# Method 1: use CLRType.new (Activator.CreateInstance).
c = @TestClass.new()
# Method 2: use assembly.new (Assembly.CreateInstance).
c = assembly.new("TestClass")
# Method 3: call the low-level invoke helper.
c = @TestClass.invoke("TestClass", flags)
# Method 4: call InvokeMember directly.
c = TestClass.InvokeMember("TestClass", flags[BindingFlags], nil, nil, nil)
echo fmt"Instance of {c.GetType().Name} created." # Instance of TestClass created.

section "Create an instance with constructor arguments"
c = @TestClass.new("Hello, World!")
c = assembly.new("TestClass", "Hello, World!")
c = @TestClass.invoke("TestClass", flags, "Hello, World!")
c = TestClass.InvokeMember("TestClass", flags[BindingFlags], nil, nil, ["Hello, World!"])
echo fmt"Instance of {c.GetType().Name} created with initial value '{c.Name}'." # Hello, World!

section "List DeclaredOnly instance members"
flags = BindingFlags_DeclaredOnly or BindingFlags_Instance or BindingFlags_Public
for i in TestClass.GetMembers(flags[BindingFlags]):
  echo i.Name # member names

section "Invoke PrintName with IgnoreCase"
flags = BindingFlags_IgnoreCase or BindingFlags_Static or BindingFlags_Public or BindingFlags_InvokeMethod
@TestClass.invoke("printname", flags, "Brad", "Smith") # Smith, Brad

section "List inherited members with FlattenHierarchy"
flags = BindingFlags_NonPublic or BindingFlags_Public or BindingFlags_Static or BindingFlags_FlattenHierarchy
for i in MostDerived.GetFields(flags[BindingFlags]):
  echo fmt"{i.Name} defined in {i.DeclaringType.Name}." # field names and declaring types

section "List members without FlattenHierarchy"
flags = BindingFlags_NonPublic or BindingFlags_Public or BindingFlags_Static
for i in MostDerived.GetFields(flags[BindingFlags]):
  echo fmt"{i.Name} defined in {i.DeclaringType.Name}." # field names and declaring types
