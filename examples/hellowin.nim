import winim

proc WndProc(hwnd: HWND, message: UINT, wParam: WPARAM, lParam: LPARAM): LRESULT {.stdcall.} =
  var
    hdc: HDC
    ps: PAINTSTRUCT
    rect: RECT

  case message
  of WM_PAINT:
    hdc = BeginPaint(hwnd, ps)
    defer: EndPaint(hwnd, ps)

    GetClientRect(hwnd, rect)
    DrawText(hdc, "Hello, Windows!", -1, rect, DT_SINGLELINE or DT_CENTER or DT_VCENTER)
    return 0

  of WM_DESTROY:
    PostQuitMessage(0)
    return 0

  else:
    return DefWindowProc(hwnd, message, wParam, lParam)

proc main() =
  var
    hInstance = GetModuleHandle(nil)
    appName = "HelloWin"
    hwnd: HWND
    msg: MSG
    wndclass: WNDCLASS

  wndclass.style         = CS_HREDRAW or CS_VREDRAW
  wndclass.lpfnWndProc   = WndProc
  wndclass.cbClsExtra    = 0
  wndclass.cbWndExtra    = 0
  wndclass.hInstance     = hInstance
  wndclass.hIcon         = LoadIcon(0, IDI_APPLICATION)
  wndclass.hCursor       = LoadCursor(0, IDC_ARROW)
  wndclass.hbrBackground = GetStockObject(WHITE_BRUSH)
  wndclass.lpszMenuName  = nil
  wndclass.lpszClassName = appName

  if RegisterClass(wndclass) == 0:
    MessageBox(0, "This program requires Windows NT!", appName, MB_ICONERROR)
    return

  hwnd = CreateWindow(appName,                    # window class name
                       "The Hello Program",       # window caption
                       WS_OVERLAPPEDWINDOW.DWORD, # window style
                       CW_USEDEFAULT,             # initial x position
                       CW_USEDEFAULT,             # initial y position
                       CW_USEDEFAULT,             # initial x size
                       CW_USEDEFAULT,             # initial y size
                       0,                         # parent window handle
                       0,                         # window menu handle
                       hInstance,                 # program instance handle
                       nil)                       # creation parameters

  ShowWindow(hwnd, SW_SHOW)
  UpdateWindow(hwnd)

  while GetMessage(msg, 0, 0, 0) != 0:
    TranslateMessage(msg)
    DispatchMessage(msg)

main()
