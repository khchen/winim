#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import winim/lean

proc WindowProc(hwnd: HWND, message: UINT, wParam: WPARAM, lParam: LPARAM): LRESULT {.stdcall.} =
  var
    cxClient {.global.}: DWORD
    cyClient {.global.}: DWORD

  case message
  of WM_SIZE:
    cxClient = DWORD LOWORD(lParam)
    cyClient = DWORD HIWORD(lParam)
    return 0

  of WM_PAINT:
    var ps: PAINTSTRUCT
    var hdc = BeginPaint(hwnd, ps)
    defer: EndPaint(hwnd, ps)

    Rectangle(hdc, cxClient div 8, cyClient div 8, 7 * cxClient div 8, 7 * cyClient div 8)

    MoveToEx(hdc, 0, 0, NULL)
    LineTo(hdc, cxClient, cyClient)

    MoveToEx(hdc, 0, cyClient, NULL)
    LineTo(hdc, cxClient, 0)

    Ellipse(hdc, cxClient div 8, cyClient div 8, 7 * cxClient div 8, 7 * cyClient div 8)
    RoundRect(hdc, cxClient div 4, cyClient div 4, 3 * cxClient div 4, 3 * cyClient div 4, cxClient div 4, cyClient div 4)
    return 0

  of WM_DESTROY:
    PostQuitMessage(0)
    return 0

  else:
    return DefWindowProc(hwnd, message, wParam, lParam)

proc main() =
  var
    hInstance = GetModuleHandle(nil)
    appName = "LineDemo"
    hwnd: HWND
    msg: MSG
    wndclass: WNDCLASS

  wndclass.style = CS_HREDRAW or CS_VREDRAW
  wndclass.lpfnWndProc = WindowProc
  wndclass.cbClsExtra = 0
  wndclass.cbWndExtra = 0
  wndclass.hInstance = hInstance
  wndclass.hIcon = LoadIcon(0, IDI_APPLICATION)
  wndclass.hCursor = LoadCursor(0, IDC_ARROW)
  wndclass.hbrBackground = GetStockObject(WHITE_BRUSH)
  wndclass.lpszMenuName = nil
  wndclass.lpszClassName = appName

  if RegisterClass(wndclass) == 0:
    MessageBox(0, "This program requires Windows NT!", appName, MB_ICONERROR)
    return

  hwnd = CreateWindow(appName, "Line Demonstration", WS_OVERLAPPEDWINDOW,
    CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
    0, 0, hInstance, nil)

  ShowWindow(hwnd, SW_SHOW)
  InvalidateRect(hwnd, nil, true)
  UpdateWindow(hwnd)

  while GetMessage(msg, 0, 0, 0) != 0:
    TranslateMessage(msg)
    DispatchMessage(msg)

main()
