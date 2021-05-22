#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2021 Ward
#
#====================================================================

import winim/clr
import unittest

suite "Test Suites for winim/clr":
  setup:
    const code = """
    using System;

    public class Test
    {
      public static double PI = 3.1415929203539823;
      public String name;

      public static double GetPI()
      {
        return PI;
      }

      public Test(String s)
      {
        name = s;
      }

      public Nested getNested()
      {
        return new Nested(name);
      }

      public class Nested
      {
        public static String welcome = "Hello, world";
        public String msg;

        public Nested(String s)
        {
          msg = s;
        }
      }

      public struct Struct
      {
        public static int itmeCount = 2;
        public int X;
        public int Y;

        public Struct(int x, int y)
        {
          X = x;
          Y = y;
        }
      }
    }

    """

    var res = compile(code, ["System.dll"])
    if res.Errors.Count != 0:
      for error in res.Errors:
        echo repr error

    var assembly = res.CompiledAssembly

  test "Get Type Object and Invoke Static Member":
    var Test = assembly.GetType("Test")
    var Nested = assembly.GetType("Test+Nested")
    var Struct = assembly.GetType("Test+Struct")
    check:
      Test.isObject == true
      Nested.isObject == true
      Struct.isObject == true

      Test.isType == true
      Nested.isType == true
      Struct.isType == true

      $Test == "Test"
      $Nested == "Test+Nested"
      $Struct == "Test+Struct"

      @Test.PI == 3.1415929203539823
      @Test.GetPI() == 3.1415929203539823
      @Nested.welcome == "Hello, world"
      @Struct.itmeCount == 2

  test "Create Instance by Name":
    var obj = assembly.new("Test", "myname")
    var nested = assembly.new("Test+Nested", "hello")
    var struct = assembly.new("Test+Struct", 123'i32, 456'i32)

    check:
      obj.isObject == true
      obj.isType == false
      obj.isStruct == false

      nested.isObject == true
      nested.isType == false
      nested.isStruct == false

      struct.isObject == false
      struct.isType == false
      struct.isStruct == true

      obj.name == "myname"
      nested.msg == "hello"
      struct["X"] == 123
      struct["Y"] == 456
      struct.toObject.X == 123
      struct.toObject.Y == 456

      $obj.getNested().GetType() == "Test+Nested"
      obj.getNested().msg == "myname"

  test "Create Instance by Type Object":
    var Test = assembly.GetType("Test")
    var Nested = assembly.GetType("Test+Nested")
    var Struct = assembly.GetType("Test+Struct")

    var obj = @Test.new("myname")
    var nested = @Nested.new("hello")
    var struct = @Struct.new(123'i32, 456'i32)

    check:
      obj.isObject == true
      obj.isType == false
      obj.isStruct == false

      nested.isObject == true
      nested.isType == false
      nested.isStruct == false

      struct.isObject == false
      struct.isType == false
      struct.isStruct == true

      obj.name == "myname"
      nested.msg == "hello"
      struct["X"] == 123
      struct["Y"] == 456
      struct[Struct].X == 123
      struct[Struct].Y == 456

      $obj.getNested().GetType() == "Test+Nested"
      obj.getNested().msg == "myname"
