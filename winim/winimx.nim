#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#                Winim minified code generator
#
#====================================================================

##  Winim contains too many Windows SDK definitions, so it often needs a lot of
##  time to compile a file, especially for large project (for example,
##  `wNim <https://github.com/khchen/wNim>`_).
##
##  Here is the solution. **Winimx** is a standalone tool to generate the
##  minfied Winim module. This file also can be used as a nim module to
##  generate the necessary definitions at compile time.
##
##  In general, you should add following lines at beginning of file to use
##  winimx as a module:
##
##  .. code-block:: Nim
##    import winim/[winimx, winstr, utils]
##    winimx(currentSourcePath())
##
##  *winimx* is a template here. It accepts one or multiple filenames and use
##  system.gorge() to call winimx.exe and then generate the code. Notice, the
##  filenames **must include the full path**, otherwise winimx cannot find it
##  (There is no getAppDir() at compile time for now). Here is a technic to get
##  the full path of source code directory:
##
##  .. code-block:: Nim
##    import os
##    winimx currentSourcePath().parentDir() / "keywords.txt"
##
##  If Winim (version >= 3.0) is installed by nimble, the winimx.exe should be
##  placed in the correct directory to use. In other case, you should make sure
##  winimx.exe can be found by system.

when defined(Nimdoc):
  template winimx*(filenames: varargs[string]) = discard

when isMainModule:
  import
    json, strutils, parseutils, sets, tables, sequtils, os,
    parseopt, lean, lib/miniz

  import strformat except `&`

  # use RCDATA resource instead of staticRead for vcc compatibility

  when defined(cpu64):
    {.link: "lib/winimx64.res".}
  else:
    {.link: "lib/winimx32.res".}

  let
    resource = FindResource(0, "winimx.db", RT_RCDATA)
    handle = LoadResource(0, resource)
    db = cast[cstring](LockResource(handle))
    dbLen = SizeofResource(0, resource)

  type
    CodeClass = enum ccNone, ccType, ccConst
    CodeVersion = enum cvNone, cvUnicode, cvAnsi
    CodeArch = enum caNone, caCpu64, caCpu32
    CodeKind = enum ckType, ckConst, ckProcType, ckObject, ckInterface, ckApi,
      ckTemplate, ckProc, ckAccessProc, ckMethod, ckConverter

    CodeNode = ref object
      module: string
      version: CodeVersion
      arch: CodeArch
      name, parent, params, typ, pragma: string
      nodel: bool
      children: seq[CodeNode]
      isDiscard: bool
      isXpIncompatible: bool
      case kind: CodeKind
      of ckApi, ckProcType:
        dll: string
        alias: string
        calling: string
      of ckConst, ckTemplate, ckProc, ckAccessProc:
        body: string
      of ckMethod:
        self, paramNames, memberName: string
      of ckObject, ckInterface:
        items: seq[CodeNode]
        isUnion: bool
        isRef: bool
        isPacked: bool
      of ckType:
        bitsize: string
      of ckConverter:
        rawName: string

  proc toClass(k: CodeKind): CodeClass =
    result = case k
    of ckApi, ckMethod, ckConverter, ckTemplate, ckProc, ckAccessProc:
      ccNone
    of ckType, ckObject, ckProcType, ckInterface:
      ccType
    of ckConst:
      ccConst

  iterator generator(node: CodeNode): string =
    case node.kind:
    of ckApi:
      let calling = if node.calling.len == 0: "stdcall" else: node.calling
      let xpincompatible = if node.isXpIncompatible: "xpincompatible, " else: ""
      if node.alias.len == 0:
        yield fmt"proc {node.name}*({node.params}): {node.typ} {{.winapi, {xpincompatible}{calling}, dynlib: ""{node.dll}"", importc.}}"
      else:
        yield fmt"proc {node.alias}*({node.params}): {node.typ} {{.winapi, {xpincompatible}{calling}, dynlib: ""{node.dll}"", importc: ""{node.name}"".}}"

    of ckConst:
      if node.typ.len == 0:
        yield fmt"{node.name}* = {node.body}"
      elif node.body[0] == '-':
        yield fmt"{node.name}* = {node.typ}({node.body})"
      else:
        yield fmt"{node.name}* = {node.typ} {node.body}"

    of ckInterface:
      yield fmt"{node.name}* {{.pure.}} = object"
      yield fmt"  lpVtbl*: ptr {node.name}Vtbl"

      if node.parent.len == 0:
        yield fmt"{node.name}Vtbl* {{.pure, inheritable.}} = object"
      else:
        yield fmt"{node.name}Vtbl* {{.pure, inheritable.}} = object of {node.parent}Vtbl"

      for i in node.items:
        if i.isDiscard: continue
        if i.params.len == 0:
          yield fmt"  {i.name}*: proc(self: ptr {node.name}): {i.typ} {{.stdcall.}}"
        else:
          yield fmt"  {i.name}*: proc(self: ptr {node.name}, {i.params}): {i.typ} {{.stdcall.}}"

    of ckConverter:
      yield fmt"converter {node.name}*(x: ptr {node.rawName}): ptr {node.parent} = cast[ptr {node.parent}](x)"

    of ckMethod:
      if node.params.len == 0:
        yield fmt"proc {node.name}*(self: ptr {node.self}): {node.typ} {{.winapi, inline.}} = {{.gcsafe.}}: self.lpVtbl.{node.memberName}(self)"
      else:
        yield fmt"proc {node.name}*(self: ptr {node.self}, {node.params}): {node.typ} {{.winapi, inline.}} = {{.gcsafe.}}: self.lpVtbl.{node.memberName}(self, {node.paramNames})"

    of ckType:
      yield fmt"{node.name}* = {node.typ}"

    of ckProcType:
      let calling = if node.calling.len == 0: "stdcall" else: node.calling
      yield fmt"{node.name}* = proc ({node.params}): {node.typ} {{.{calling}.}}"

    of ckObject:
      var typ = if node.isRef: "ref object" else: "object"
      var pragma = "pure"
      if node.isUnion: pragma.add ", union"
      if node.isPacked: pragma.add ", packed"
      yield fmt"{node.name}* {{.{pragma}.}} = {typ}"

      for i in node.items:
        if i.kind == ckProcType:
          let calling = if i.calling.len == 0: "stdcall" else: i.calling
          yield fmt"  {i.name}*: proc({i.params}): {i.typ} {{.{calling}.}}"
        else:
          if i.bitsize.len == 0:
            yield fmt"  {i.name}*: {i.typ}"
          else:
            yield fmt"  {i.name}* {{.bitsize:{i.bitsize}.}}: {i.typ}"

    of ckProc, ckAccessProc:
      let
        typ = if node.typ.len == 0: "" else: fmt": {node.typ}"
        pragma = if node.pragma.len == 0: "winapi, inline" else: node.pragma
        body = if node.body.len == 0: "" else: fmt" = {node.body}"

      yield fmt"proc {node.name}*({node.params}){typ} {{.{pragma}.}}{body}"

    of ckTemplate:
      let typ = if node.typ.len == 0: "" else: fmt": {node.typ}"
      yield fmt"template {node.name}*({node.params}){typ} = {node.body}"

  proc output(nodes: seq[CodeNode], target = stdout) =
    proc indent(n: int): string = spaces(n * 2)

    var
      curr_indent = 0
      curr_class = ccNone
      curr_version = cvNone
      curr_arch = caNone

    for node in nodes:
      if node.isDiscard: continue
      let class = node.kind.toClass

      if node.kind == ckConst and node.body == node.name: continue
      if node.kind == ckType and node.typ == node.name: continue

      if node.version != curr_version or node.arch != curr_arch:
        if node.version == cvNone and node.arch == caNone:
          curr_indent = 0
        else:
          curr_indent = 1
          if node.version == cvUnicode and node.arch == caNone:
            target.writeLine "when winimUnicode:"
          elif node.version == cvAnsi and node.arch == caNone:
            target.writeLine "when winimAnsi:"
          elif node.version == cvNone and node.arch == caCpu64:
            target.writeLine "when winimCpu64:"
          elif node.version == cvNone and node.arch == caCpu32:
            target.writeLine "when winimCpu32:"
          elif node.version == cvUnicode and node.arch == caCpu64:
            target.writeLine "when winimUnicode and winimCpu64:"
          elif node.version == cvUnicode and node.arch == caCpu32:
            target.writeLine "when winimUnicode and winimCpu32:"
          elif node.version == cvAnsi and node.arch == caCpu64:
            target.writeLine "when winimAnsi and winimCpu64:"
          elif node.version == cvAnsi and node.arch == caCpu32:
            target.writeLine "when winimAnsi and winimCpu32:"
          else: doassert false
        curr_class = ccNone

      if class == curr_class:
        for line in node.generator():
          target.writeLine indent(curr_indent) & line

      else:
        if curr_class in {ccType, ccConst}:
          curr_indent.dec

        if class == ccConst:
          target.writeLine indent(curr_indent) & "const"
          curr_indent.inc

        if class == ccType:
          target.writeLine indent(curr_indent) & "type"
          curr_indent.inc

        for line in node.generator():
          target.writeLine indent(curr_indent) & line

      curr_class = class
      curr_version = node.version
      curr_arch = node.arch

  iterator catchIdent(input: string, skipColon = false): string =

    when declared(toHashSet): # toSet is deprecated since v0.20
      template toSet[T](x: T): untyped = toHashSet(x)

    const keywords = ["addr", "and", "array", "as", "asm", "bind", "block", "bool",
      "break", "case", "cast", "cchar", "cdouble", "cfloat", "char", "cint",
      "clong", "clongdouble", "clonglong", "concept", "const", "continue",
      "converter", "cschar", "cshort", "csize", "cstring", "cuchar", "cuint",
      "culong", "culonglong", "cushort", "defer", "discard", "distinct", "div",
      "do", "elif", "else", "end", "enum", "except", "export", "f32", "f64",
      "false", "finally", "float", "float32 ", "float64", "for", "from", "func",
      "i16", "i32", "i64", "i8", "if", "import", "in", "include", "int", "int16",
      "int32", "int64", "int8", "interface", "is", "isnot", "iterator", "let",
      "macro", "method", "mixin", "mod", "nil", "not", "notin", "object", "of",
      "openarray", "or", "out", "pointer", "proc", "ptr", "raise", "range", "ref",
      "return", "seq", "set", "shl", "shr", "static", "string", "template", "true",
      "try", "tuple", "type", "typed", "u16", "u32", "u64", "u8", "uint", "uint16",
      "uint32", "uint64", "uint8", "untyped", "using", "var", "varargs", "void",
      "when", "while", "xor", "yield"].toSet()

    var pos = 0
    while pos < input.len:
      case input[pos]
      of IdentStartChars:
        if pos != 0 and input[pos-1] in IdentChars: # skip 0xabc etc.
          pos.inc
        else:
          var token: string
          pos += input.parseWhile(token, IdentChars, pos)

          if token.len <= 1 or token in keywords:
            continue

          if skipColon and pos < input.len and input[pos] == ':': # skip "name:"
            continue

          yield token
      else: pos.inc

  proc dependencies(node: CodeNode): seq[string] =
    result = @[]

    case node.kind
    of ckConst:
      for word in node.typ.catchIdent(skipColon=true):
        result.add word

      let value = node.body
      if not (value[0] == '"' and value[^1] == '"'): # skip string
        for word in value.catchIdent(skipColon=true):
          result.add word

    of ckType:
      for word in node.typ.catchIdent(skipColon=true):
        result.add word

    of ckObject:
      for item in node.items:
        if item.name == "lpVtbl": continue
        for word in item.typ.catchIdent(skipColon=true):
          result.add word

        result.add item.dependencies()

    of ckInterface:
      for word in node.parent.catchIdent(skipColon=true):
        result.add word

      for item in node.items:
        for word in item.typ.catchIdent(skipColon=true):
          result.add word

        for word in item.params.catchIdent(skipColon=true):
          result.add word

    of ckApi, ckProcType, ckProc, ckTemplate, ckAccessProc, ckMethod:
      for word in node.typ.catchIdent(skipColon=true):
        result.add word

      for word in node.params.catchIdent(skipColon=true):
        result.add word

      if node.kind in {ckProc, ckTemplate}:
        for word in node.body.catchIdent(skipColon=true):
          if word & ":" notin node.params:
            result.add word

    else: discard

  proc toCodeNode(jnode: JsonNode): CodeNode

  proc toCodeNodes(jnode: JsonNode): seq[CodeNode] =
    for n in jnode.getElems:
      result.add n.toCodeNode

  proc toCodeNode(jnode: JsonNode): CodeNode =
    result = CodeNode(kind: parseEnum[CodeKind](jnode{"kind"}.getStr))
    result.module = jnode{"module"}.getStr
    result.version = parseEnum[CodeVersion](jnode{"version"}.getStr)
    result.arch = parseEnum[CodeArch](jnode{"arch"}.getStr)
    result.name = jnode{"name"}.getStr
    result.parent = jnode{"parent"}.getStr
    result.params = jnode{"params"}.getStr
    result.typ = jnode{"typ"}.getStr
    result.pragma = jnode{"pragma"}.getStr
    result.nodel = jnode{"nodel"}.getBool
    result.children = jnode{"children"}.toCodeNodes

    result.isDiscard = jnode{"isDiscard"}.getBool
    result.isXpIncompatible = jnode{"isXpIncompatible"}.getBool

    case result.kind
    of ckApi, ckProcType:
      result.dll = jnode{"dll"}.getStr
      result.alias = jnode{"alias"}.getStr
      result.calling = jnode{"calling"}.getStr
    of ckConst, ckTemplate, ckProc, ckAccessProc:
      result.body = jnode{"body"}.getStr
    of ckMethod:
      result.self = jnode{"self"}.getStr
      result.paramNames = jnode{"paramNames"}.getStr
      result.memberName = jnode{"memberName"}.getStr
    of ckObject, ckInterface:
      result.items = jnode{"items"}.toCodeNodes
      result.isUnion = jnode{"isUnion"}.getBool
      result.isRef = jnode{"isRef"}.getBool
      result.isPacked = jnode{"isPacked"}.getBool
    of ckType:
      result.bitsize = jnode{"bitsize"}.getStr
    of ckConverter:
      result.rawName = jnode{"rawName"}.getStr

  type
    Minifier = object
      nodes: seq[CodeNode]
      table: Table[string, seq[int]]
      skipModules: Table[string, bool]
      used: bool

  proc initMinifier(used = false): Minifier =

    proc add(table: var Table[string, seq[int]], name: string, index: int) =
      if name in table:
        table[name].add index
      else:
        table[name] = @[index]

    proc init(table: var Table[string, seq[int]], nodes: var seq[CodeNode]) =
      for i, node in nodes:
        node.isDiscard = true

        case node.kind
        of ckType, ckConst, ckProcType, ckObject, ckTemplate, ckProc, ckInterface:
          table.add(node.name, i)

        of ckAccessProc:
          let name = node.params.split(',')[0].split(' ')[^1]
          table.add(name, i)

        of ckApi:
          if node.alias.len != 0:
            table.add(node.alias, i)
          else:
            table.add(node.name, i)

        of ckConverter:
          table.add(node.rawName, i)

        of ckMethod:
          table.add(node.self, i)

    result.table = initTable[string, seq[int]]()
    result.skipModules = initTable[string, bool]()
    result.nodes = toCodeNodes(parseJson(miniz.uncompress(db, dbLen)))
    result.used = used
    init(result.table, result.nodes)

  proc incl(minifier: var Minifier, name: string) =
    if name in minifier.table and minifier.table[name].len != 0:
      for i in minifier.table[name]:
        var node = minifier.nodes[i]
        if node.isDiscard:
          node.isDiscard = false

          for token in node.dependencies.deduplicate:
            minifier.incl(token)

      minifier.table[name] = @[]

    elif name.endsWith("Vtbl"):
      minifier.incl(name[0..^5])

  proc output(minifier: var Minifier, file: File) =
    file.writeLine """
      #====================================================================
      #
      #               Winim - Nim's Windows API Module
      #                 (c) Copyright 2016-2020 Ward
      #
      #====================================================================
    """.unindent

    if minifier.used:
      file.writeLine """
        when defined(nimHasUsed): {.used.}
      """.unindent

    file.writeLine "import winim/inc/winimbase"

    var imports = newSeq[string]()
    for module in minifier.skipModules.keys:
      minifier.skipModules[module] = true

    var nodes = newSeq[CodeNode]()
    for node in minifier.nodes:
      if not node.isDiscard:
        if node.module in minifier.skipModules:
          if minifier.skipModules[node.module]:
            imports.add node.module
            minifier.skipModules[node.module] = false
        else:
          nodes.add node

    for module in imports:
      file.writeLine("import winim/inc/" & module)

    nodes.output(file)

  proc getVersion(): string =
    const nimble = staticRead("../winim.nimble")
    for line in nimble.splitLines:
      var pair = line.split('=', maxsplit=1)
      if pair[0].strip == "version":
        return pair[1].strip.replace("\"")

  iterator walkFilesRec(path: string, recursively = true): string =
    if recursively:
      if fileExists(path):
        yield path

      else:
        var (root, pattern) =
          if dirExists(path): (path, "*.*")
          else: splitPath(path)

        for file in walkFiles(root / pattern):
          yield file

        if root.len == 0: root = "./"

        for dir in walkDirRec(root, {pcDir}):
          for file in walkFiles(dir / pattern):
            yield file
    else:
      for file in walkFiles(path):
        yield file

  proc help() =
    const version = getVersion()
    echo """
Winimx - Winim minified code generator [Database: Winim $1]
Copyright (c) 2019-2020 by Ward

Usage: winimx [options] inputfile(s)

Options:
  -s, --skip:MODULE         skip identifiers in the module
  -d, --dir:PATH            specify the working directory
  -r, --recursively         walks over the directory recursively
  -t, --test                output the file list to be prased
  -u, --used                mark the output module as "used" by used pragma

Inputfile(s):
  This tool catch all the identifiers from input files and output the
  minified Winim module. The files can be nim source file or just keyword
  list. Wildcard is allowed.""" % version

  proc main() =
    var
      p = initOptParser()
      skips = newSeq[string]()
      codes = newSeq[string]()
      recursively = false
      test = false
      used = false

    for kind, key, val in p.getopt():
      case kind
      of cmdArgument:
        for file in walkFilesRec(key, recursively):
          try:
            if test:
              echo file
            else:
              codes.add readFile(file)
          except IOError:
            echo "Error: cannot open file: " & file
            quit(1)

      of cmdLongOption, cmdShortOption:
        case key
        of "r", "recursively":
          recursively = true
        of "t", "test":
          test = true
        of "u", "used":
          used = true
        of "s", "skip":
          skips.add val
        of "d", "dir":
          try:
            setCurrentDir(val)
          except OSError:
            echo "Error: cannot set working dir to " & val
            quit(1)

      of cmdEnd: assert(false)

    if codes.len == 0 and not test and not recursively:
      help()

    elif not test:
      var minifier = initMinifier(used)

      for module in skips:
        minifier.skipModules[module] = true

      for code in codes:
        for token in code.catchIdent():
          minifier.incl(token)

      minifier.output(stdout)

  main()

else:
  import macros, strutils, os

  macro winimxMacro*(code: static[string]): untyped =
    result = parseStmt(code)

  proc winimxRun(filenames: openarray[string]): string =
    var (code, exitCode) = gorgeEx(quoteShellCommand(@["winimx"] & @filenames))

    if code.len == 0:
      (code, exitCode) = gorgeEx(quoteShellCommand(@["cmd", "/c", "winimx"] & @filenames))

    if code.len == 0:
      return "Error: cannot generate the code, winimx not found ?"

    elif exitCode != 0: # Error report by cmd or winimx
      return "Error: " & code

    else: # Everything is OK
      return code

  template winimx*(filenames: varargs[string]) =
    const code = winimxRun(filenames)

    when code.startsWith "Error: ":
      {.fatal: code.replace("Error: ").}

    winimxMacro(code)
