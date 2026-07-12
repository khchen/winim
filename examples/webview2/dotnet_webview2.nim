#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

## A WinForms WebView2 example using modern .NET.
##
## It opens a window, displays a page, exchanges messages with JavaScript, and
## runs a small script after the page loads. It also shows how to select the
## WebView2 loader DLL with a .NET `DllImportResolver`.
##
## The Evergreen WebView2 Runtime is required at runtime.

import winim/dotnet
import std/[os, asyncdispatch, json]

const
  off = false
  # Nim 2.0's async macro emits `stackTrace: off` in the caller's scope.
  # Bind the pragma literal locally because winim/dotnet exports event APIs
  # named `off`.

  ExampleDir = currentSourcePath().parentDir()
  Core = ExampleDir / "Microsoft.Web.WebView2.Core.dll"
  WinForms = ExampleDir / "Microsoft.Web.WebView2.WinForms.dll"
  Loader = ExampleDir / "WebView2Loader64.dll"

const page = """
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Winim WebView2</title>
  <style>
    body { font-family: Segoe UI, sans-serif; margin: 2em; }
    h1 { font-size: 1.5em; }
    p { line-height: 1.5; }
  </style>
</head>
<body>
  <h1>Winim + WebView2</h1>
  <p>This page is rendered by the Evergreen WebView2 Runtime.</p>
  <button id="send">Send a message to Nim</button>
  <pre id="messages"></pre>
  <script>
    document.getElementById("send").addEventListener("click", () => {
      window.chrome.webview.postMessage("Hello, nim!");
    });
    window.chrome.webview.addEventListener("message", event => {
      const messages = document.getElementById("messages");
      messages.textContent += "Message from nim: " + event.data + "\n";
    });
  </script>
</body>
</html>
"""

proc cleanupUserDataFolder(path: string) =
  if path.len == 0: return

  # WebView2 may release its files a little after the managed objects are closed.
  # Retry so the temporary profile is removed when the sample exits normally.
  for _ in 0 ..< 20:
    if not dirExists(path): return
    try:
      removeDir(path)
      return
    except OSError:
      sleep(50)

  if dirExists(path):
    echo "Could not remove WebView2 user data folder: ", path

proc checkFiles(paths: varargs[string]) =
  for path in paths:
    if not fileExists(path):
      raise newException(OSError,
        extractFilename(path) & " was not found in " & ExampleDir)

proc configureLoader(loaderPath: string) =
  let
    resolverType = getManagedType("System.Runtime.InteropServices.DllImportResolver, System.Private.CoreLib")
    coreManagedType = getManagedType("Microsoft.Web.WebView2.Core.CoreWebView2Environment, Microsoft.Web.WebView2.Core")
    nativeLibrary = loadClass("System.Runtime.InteropServices.NativeLibrary", "System.Private.CoreLib")

  let resolver = newDelegate(resolverType) do (args: openArray[DotnetObject]) -> DotnetObject:
    if $args[0] == "WebView2Loader.dll":
      return nativeLibrary.Load(loaderPath)
    newObject("System.IntPtr", 0)

  nativeLibrary.SetDllImportResolver(coreManagedType.Assembly, resolver)

proc executeScriptDemo(core: DotnetObject) {.async.} =
  let task = core.ExecuteScriptAsync("""
    (() => {
      const count = document.querySelectorAll("*").length;
      const message = `Nim found ${count} DOM element(s).`;
      return message;
    })()
  """)

  let result = await toFuture(task)
  let message = if result.isNil: "null" else: parseJson($result).getStr
  core.PostWebMessageAsString(message)
  echo "Nim ExecuteScriptAsync result: ", message

proc main() =
  let
    corePath = absolutePath(Core)
    winFormsPath = absolutePath(WinForms)
    loaderPath = absolutePath(Loader)
    userDataFolder = getTempDir() / ("WinimDotnetWebView2-" & $getCurrentProcessId())
  checkFiles(corePath, winFormsPath, loaderPath)
  defer: cleanupUserDataFolder(userDataFolder)

  dotnetStart(frameworkName = "Microsoft.WindowsDesktop.App")
  defer: dotnetClose()

  let
    thread = loadClass("System.Threading.Thread", "System.Private.CoreLib")
    apartmentState = loadClass("System.Threading.ApartmentState", "System.Private.CoreLib")
    currentThread = thread.CurrentThread
  if not currentThread.TrySetApartmentState(apartmentState.STA):
    raise newException(OSError, "the .NET UI thread could not be set to STA")

  let
    forms = load("System.Windows.Forms")
    drawing = load("System.Drawing")
    application = forms.getType("System.Windows.Forms.Application")
    highDpiMode = forms.getType("System.Windows.Forms.HighDpiMode").PerMonitorV2
  application.SetHighDpiMode(highDpiMode)
  application.EnableVisualStyles()
  application.SetCompatibleTextRenderingDefault(false)

  let coreAssembly = load(corePath)
  configureLoader(loaderPath)
  load(winFormsPath)

  let
    Size = drawing.getType("System.Drawing.Size")
    DockStyle = forms.getType("System.Windows.Forms.DockStyle")
    form = forms.new("System.Windows.Forms.Form")
    webView = newObject("Microsoft.Web.WebView2.WinForms.WebView2")

  form.Text = "Nim + WebView2"
  form.ClientSize = Size.new(800, 600)
  webView.Dock = DockStyle.Fill
  form.Controls.Add(webView)

  webView.on("CoreWebView2InitializationCompleted") do (sender, args: DotnetObject):
    if not args.IsSuccess:
      form.Close()
    else:
      let core = webView.CoreWebView2
      core.on("NavigationCompleted") do (sender, args: DotnetObject):
        if args.IsSuccess:
          asyncCheck executeScriptDemo(core)

      core.on("WebMessageReceived") do (sender, args: DotnetObject):
        echo "Message from page: ", args.TryGetWebMessageAsString()
        core.PostWebMessageAsString("Hello, page!")

      core.NavigateToString(page)

  form.Show()
  form.CreateControl()
  webView.CreateControl()

  let
    environmentClass = coreAssembly.getType("Microsoft.Web.WebView2.Core.CoreWebView2Environment")
    environment = waitFor toFuture(environmentClass.CreateAsync(nil, userDataFolder, nil))
    initialization = webView.EnsureCoreWebView2Async(environment)

  application.Run(form)

  if initialization.IsFaulted:
    echo "WebView2 initialization failed: ", initialization.getProperty("Exception")

when isMainModule:
  main()
