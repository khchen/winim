#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

## Downloads a web page with a managed `HttpClient` and Nim's `await`.
##
## This is a console example, so `waitFor` can drive Nim's async dispatcher
## while `toFuture` polls the managed `Task` without blocking the
## thread. Pass a URL as the first argument to override the default. Managed
## cancellation is covered separately by the dotnet tests.
##
## This example does not require the .NET SDK, a C# compiler, or generated
## managed source files.

import winim/dotnet
import std/[os, asyncdispatch]

# Nim 2.0's async macro emits `stackTrace: off` in the caller's scope.
# `winim/dotnet` also exports event APIs named `off`, so bind the pragma
# literal locally to keep this example unambiguous.
const off = false

proc downloadPageAsync(url: string): Future[string] {.async.} =
  dotnetStart()
  defer: dotnetClose()

  let httpAssembly = load("System.Net.Http")
  let client = httpAssembly.getType("System.Net.Http.HttpClient").new()
  defer: client.Dispose()

  let request = client.GetStringAsync(url)
  let page = await toFuture(request)
  return $page

proc main() =
  let url = if paramCount() == 0: "https://example.com/" else: paramStr(1)
  echo "Downloading: ", url
  let page = waitFor downloadPageAsync(url)
  echo "Downloaded characters: ", page.len
  echo page

when isMainModule:
  try:
    main()
  except CatchableError as error:
    echo "Async download failed: ", error.msg
    quit(1)
