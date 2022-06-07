#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2022 Ward
#
#====================================================================

# Demonstrates RPC via Windows Component Object Model.

import strutils
import winim/com

type
  NimMethod* = proc (vargs: varargs[variant]): variant
  NimDispatch* {.pure.} = ref object
    lpVtbl: ptr IDispatchVtbl
    vtbl: IDispatchVtbl
    methods: seq[tuple[name: string, callback: NimMethod]]
    cookie: DWORD

proc init(nimDisp: NimDispatch) =
  nimDisp.lpVtbl = &nimDisp.vtbl
  nimDisp.methods = @[]

  nimDisp.vtbl.AddRef = proc(self: ptr IUnknown): ULONG {.stdcall.} = 1

  nimDisp.vtbl.Release = proc(self: ptr IUnknown): ULONG {.stdcall.} = 1

  nimDisp.vtbl.QueryInterface = proc(self: ptr IUnknown, riid: REFIID, ppvObject: ptr pointer): HRESULT {.stdcall.} =
    if IsEqualIID(riid, &IID_IUnknown) or IsEqualIID(riid, &IID_IDispatch):
      ppvObject[] = self
      return S_OK
    else:
      ppvObject[] = nil
      return E_NOINTERFACE

  nimDisp.vtbl.GetTypeInfoCount = proc(self: ptr IDispatch, pctinfo: ptr UINT): HRESULT {.stdcall.} =
    pctinfo[] = 0

  nimDisp.vtbl.GetTypeInfo = proc(self: ptr IDispatch, iTInfo: UINT, lcid: LCID, ppTInfo: ptr ptr ITypeInfo): HRESULT {.stdcall.} =
    ppTInfo[] = nil

  nimDisp.vtbl.GetIDsOfNames = proc(self: ptr IDispatch, riid: REFIID, rgszNames: ptr LPOLESTR, cNames: UINT, lcid: LCID, rgDispId: ptr DISPID): HRESULT {.stdcall.} =
    let nimDisp = cast[NimDispatch](self)
    let name = $rgszNames[]
    for i, tup in nimDisp.methods:
      if name.cmpIgnoreCase(tup.name) == 0:
        rgDispId[] = DISPID i + 1
        break

    if rgDispId[] != 0:
      return S_OK
    else:
      return DISP_E_UNKNOWNNAME

  nimDisp.vtbl.Invoke = proc(self: ptr IDispatch, dispIdMember: DISPID, riid: REFIID, lcid: LCID, wFlags: WORD, pDispParams: ptr DISPPARAMS, pVarResult: ptr VARIANT, pExcepInfo: ptr EXCEPINFO, puArgErr: ptr UINT): HRESULT {.stdcall.} =
    let nimDisp = cast[NimDispatch](self)
    let index = dispIdMember - 1
    if index <= nimDisp.methods.len:
      var args = newSeq[variant](pDispParams.cArgs)
      let rgvarg = cast[ptr UncheckedArray[VARIANTARG]](pDispParams.rgvarg)

      for i in countdown(pDispParams.cArgs - 1, 0):
        args[i] = toVariant(rgvarg[pDispParams.cArgs - 1 - i])

      var ret = nimDisp.methods[index].callback(args)
      if not ret.isNil:
        var raw = ret.unwrap
        VariantCopy(pVarResult, &raw)

      return S_OK

    return DISP_E_MEMBERNOTFOUND

proc add*(nimDisp: NimDispatch, name: string, callback: NimMethod) =
  nimDisp.methods.add (name, callback)

proc regist*(nimDisp: NimDispatch, name: string): bool {.discardable.} =
  if nimDisp.cookie != 0:
    return false

  var pROT: ptr IRunningObjectTable
  var pMoniker: ptr IMoniker
  if SUCCEEDED GetRunningObjectTable(0, &pROT):
    defer: pROT.Release()
    if SUCCEEDED CreateFileMoniker(name, &pMoniker):
      defer: pMoniker.Release()
      if SUCCEEDED pROT.Register(ROTFLAGS_REGISTRATIONKEEPSALIVE,
        cast[ptr IUnknown](nimDisp), pMoniker, &nimDisp.cookie):
          return true

proc revoke*(nimDisp: NimDispatch): bool {.discardable.} =
  if nimDisp.cookie == 0:
    return false

  var pROT: ptr IRunningObjectTable
  if SUCCEEDED GetRunningObjectTable(0, &pROT):
    defer: pROT.Release()
    if SUCCEEDED pROT.Revoke(nimDisp.cookie):
      return true

proc inloop*(nimDisp: NimDispatch) =
  var msg: MSG
  if PeekMessage(&msg, 0, 0, 0, PM_REMOVE) != 0:
    DispatchMessage(&msg)

proc newNimDispatch*(): NimDispatch =
  result = NimDispatch()
  result.init()
