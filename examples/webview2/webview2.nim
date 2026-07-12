#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

## Minimal WebView2 example.
##
## The default build loads WebView2Loader.dll beside the executable.  Use
## `-d:webview2=lib` to statically link the WebView2 loader, or select a custom
## loader DLL with, for example, `-d:webview2=WebView2Loader32.dll`.
## The SDK static library uses the MSVC ABI.  Winim supplies a non-MSVC ABI
## bridge, so both `--cc:vcc` and non-MSVC compilers can build the static variant.
## The Evergreen WebView2 Runtime must also be installed on the machine.

import winim/[lean, inc/objbase, inc/webview2]
import std/os

type
  EnvironmentCompleted = ref object
    lpVtbl: ptr ICoreWebView2CreateCoreWebView2EnvironmentCompletedHandlerVtbl
    vtbl: ICoreWebView2CreateCoreWebView2EnvironmentCompletedHandlerVtbl
    refCount: LONG

  ControllerCompleted = ref object
    lpVtbl: ptr ICoreWebView2CreateCoreWebView2ControllerCompletedHandlerVtbl
    vtbl: ICoreWebView2CreateCoreWebView2ControllerCompletedHandlerVtbl
    refCount: LONG

var
  mainWindow: HWND
  environment: ptr ICoreWebView2Environment
  controller: ptr ICoreWebView2Controller
  webView: ptr ICoreWebView2
  environmentCompleted: EnvironmentCompleted
  controllerCompleted: ControllerCompleted
  shuttingDown: bool
  webView2UserDataFolder: string

proc cleanupWebView2UserDataFolder() =
  if webView2UserDataFolder.len == 0:
    return

  # WebView2 may release its files a little after the COM objects are closed.
  # Retry so the temporary profile is removed when the sample exits normally.
  for _ in 0 ..< 20:
    if not dirExists(webView2UserDataFolder):
      return
    try:
      removeDir(webView2UserDataFolder)
      return
    except OSError:
      sleep(50)

  if dirExists(webView2UserDataFolder):
    echo "Could not remove WebView2 user data folder: ",
      webView2UserDataFolder

proc init(handler: EnvironmentCompleted) =
  handler.lpVtbl = addr handler.vtbl
  handler.refCount = 1

  handler.vtbl.QueryInterface = proc(self: ptr IUnknown, riid: REFIID,
      ppvObject: ptr pointer): HRESULT {.stdcall.} =
    let handler = cast[EnvironmentCompleted](self)
    if IsEqualIID(riid, &IID_IUnknown) or
        IsEqualIID(riid, &IID_ICoreWebView2CreateCoreWebView2EnvironmentCompletedHandler):
      ppvObject[] = self
      discard handler.vtbl.AddRef(self)
      return S_OK

    ppvObject[] = nil
    E_NOINTERFACE

  handler.vtbl.AddRef = proc(self: ptr IUnknown): ULONG {.stdcall.} =
    let handler = cast[EnvironmentCompleted](self)
    ULONG InterlockedIncrement(&handler.refCount)

  handler.vtbl.Release = proc(self: ptr IUnknown): ULONG {.stdcall.} =
    let handler = cast[EnvironmentCompleted](self)
    ULONG InterlockedDecrement(&handler.refCount)

  handler.vtbl.Invoke = proc(self: ptr ICoreWebView2CreateCoreWebView2EnvironmentCompletedHandler,
      errorCode: HRESULT, ret: ptr ICoreWebView2Environment): HRESULT {.stdcall.} =
    if SUCCEEDED(errorCode) and ret != nil:
      # Keep the callback result after Invoke returns.
      ret.AddRef()
      environment = ret
      let hr = ret.CreateCoreWebView2Controller(mainWindow,
        cast[ptr ICoreWebView2CreateCoreWebView2ControllerCompletedHandler](controllerCompleted))
      if FAILED(hr):
        echo "CreateCoreWebView2Controller failed: ", hr
    else:
      echo "CreateCoreWebView2Environment callback failed: ", errorCode
    S_OK

proc init(handler: ControllerCompleted) =
  handler.lpVtbl = addr handler.vtbl
  handler.refCount = 1

  handler.vtbl.QueryInterface = proc(self: ptr IUnknown, riid: REFIID,
      ppvObject: ptr pointer): HRESULT {.stdcall.} =
    let handler = cast[ControllerCompleted](self)
    if IsEqualIID(riid, &IID_IUnknown) or
        IsEqualIID(riid, &IID_ICoreWebView2CreateCoreWebView2ControllerCompletedHandler):
      ppvObject[] = self
      discard handler.vtbl.AddRef(self)
      return S_OK

    ppvObject[] = nil
    E_NOINTERFACE

  handler.vtbl.AddRef = proc(self: ptr IUnknown): ULONG {.stdcall.} =
    let handler = cast[ControllerCompleted](self)
    ULONG InterlockedIncrement(&handler.refCount)

  handler.vtbl.Release = proc(self: ptr IUnknown): ULONG {.stdcall.} =
    let handler = cast[ControllerCompleted](self)
    ULONG InterlockedDecrement(&handler.refCount)

  handler.vtbl.Invoke = proc(self: ptr ICoreWebView2CreateCoreWebView2ControllerCompletedHandler,
      errorCode: HRESULT, ret: ptr ICoreWebView2Controller): HRESULT {.stdcall.} =
    if SUCCEEDED(errorCode) and ret != nil:
      # Keep the callback result after Invoke returns.
      ret.AddRef()
      controller = ret

      var bounds: RECT
      GetClientRect(mainWindow, bounds)
      ret.put_Bounds(bounds)
      ret.put_IsVisible(TRUE)
      ret.get_CoreWebView2(&webView)

      if webView != nil:
        webView.NavigateToString("""
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
          </body>
          </html>
        """)
    else:
      echo "CreateCoreWebView2Controller callback failed: ", errorCode
    S_OK

proc WindowProc(hwnd: HWND, message: UINT, wParam: WPARAM,
    lParam: LPARAM): LRESULT {.stdcall.} =
  case message
  of WM_SIZE:
    if controller != nil:
      var bounds: RECT
      GetClientRect(hwnd, bounds)
      controller.put_Bounds(bounds)
    return 0

  of WM_DESTROY:
    if not shuttingDown:
      shuttingDown = true
      # Release dependent COM objects before their owners.
      if controller != nil:
        controller.Close()
      if webView != nil:
        webView.Release()
        webView = nil
      if controller != nil:
        controller.Release()
        controller = nil
      if environment != nil:
        environment.Release()
        environment = nil
    PostQuitMessage(0)
    return 0

  else:
    return DefWindowProc(hwnd, message, wParam, lParam)

proc main() =
  # Without DPI awareness Windows bitmap-scales the whole WebView2 host,
  # which makes the page blurry on displays using scaling above 100%.
  if SetProcessDPIAware() == 0:
    raise newException(OSError, "SetProcessDPIAware failed")

  if FAILED(CoInitializeEx(nil, COINIT_APARTMENTTHREADED or COINIT_DISABLE_OLE1DDE)):
    raise newException(OSError, "CoInitializeEx failed")
  defer: CoUninitialize()
  defer: cleanupWebView2UserDataFolder()

  webView2UserDataFolder = getTempDir() / ("WinimWebView2-" & $getCurrentProcessId())

  let hInstance = GetModuleHandle(nil)
  let appName = "WinimWebView2"
  var wndclass: WNDCLASS
  wndclass.style = CS_HREDRAW or CS_VREDRAW
  wndclass.lpfnWndProc = WindowProc
  wndclass.hInstance = hInstance
  wndclass.hIcon = LoadIcon(0, IDI_APPLICATION)
  wndclass.hCursor = LoadCursor(0, IDC_ARROW)
  wndclass.hbrBackground = GetStockObject(WHITE_BRUSH)
  wndclass.lpszClassName = appName

  if RegisterClass(wndclass) == 0:
    raise newException(OSError, "RegisterClass failed")

  var windowRect: RECT
  windowRect.right = 800
  windowRect.bottom = 600
  if AdjustWindowRect(windowRect, WS_OVERLAPPEDWINDOW, FALSE) == 0:
    raise newException(OSError, "AdjustWindowRect failed")

  mainWindow = CreateWindow(appName, "Winim WebView2", WS_OVERLAPPEDWINDOW,
    CW_USEDEFAULT, CW_USEDEFAULT, windowRect.right - windowRect.left,
    windowRect.bottom - windowRect.top, 0, 0, hInstance, nil)
  if mainWindow == 0:
    raise newException(OSError, "CreateWindow failed")

  ShowWindow(mainWindow, SW_SHOW)
  UpdateWindow(mainWindow)

  environmentCompleted = EnvironmentCompleted()
  environmentCompleted.init()
  controllerCompleted = ControllerCompleted()
  controllerCompleted.init()

  let hr = CreateCoreWebView2EnvironmentWithOptions(
    nil, webView2UserDataFolder, nil,
    cast[ptr ICoreWebView2CreateCoreWebView2EnvironmentCompletedHandler](environmentCompleted))
  if FAILED(hr):
    raise newException(OSError, "CreateCoreWebView2Environment failed; check the WebView2 Runtime and loader mode")

  var msg: MSG
  while GetMessage(msg, 0, 0, 0) != 0:
    TranslateMessage(msg)
    DispatchMessage(msg)

main()
