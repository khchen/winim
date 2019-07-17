#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#====================================================================

import strutils
import winim/com

type
  NimMethod* = proc (vargs: varargs[variant]): variant
  NimMethodTuple = tuple[name: string, callback: NimMethod]
  INimDispatch* {.pure.} = object
    lpVtbl: ptr IDispatchVtbl
    vtbl: IDispatchVtbl
    methods: seq[NimMethodTuple]
    ref_count: int
    cookie: DWORD

converter converterINimDispatchToIUnknown*(x: ptr INimDispatch): ptr IUnknown = cast[ptr IUnknown](x)
converter converterINimDispatchToIDispatch*(x: ptr INimDispatch): ptr IDispatch = cast[ptr IDispatch](x)

proc init(nimDisp: ptr INimDispatch) =
  nimDisp.lpVtbl = &nimDisp.vtbl
  nimDisp.methods = newSeq[NimMethodTuple]()
  GC_ref(nimDisp.methods)

  nimDisp.vtbl.AddRef = proc(self: ptr IUnknown): ULONG {.stdcall.} =
    let nimDisp = cast[ptr INimDispatch](self)
    inc nimDisp.ref_count
    return ULONG nimDisp.ref_count

  nimDisp.vtbl.Release = proc(self: ptr IUnknown): ULONG {.stdcall.} =
    let nimDisp = cast[ptr INimDispatch](self)
    dec nimDisp.ref_count
    if nimDisp.ref_count == 0:
      GC_unref(nimDisp.methods)
      dealloc(nimDisp)
      return 0

    return ULONG nimDisp.ref_count

  nimDisp.vtbl.QueryInterface = proc(self: ptr IUnknown, riid: REFIID, ppvObject: ptr pointer): HRESULT {.stdcall.} =
    if IsEqualIID(riid, &IID_IUnknown) or IsEqualIID(riid, &IID_IDispatch):
      ppvObject[] = self
      self.AddRef()
      return S_OK
    else:
      ppvObject[] = nil
      return E_NOINTERFACE

  nimDisp.vtbl.GetTypeInfoCount = proc(self: ptr IDispatch, pctinfo: ptr UINT): HRESULT {.stdcall.} =
    pctinfo[] = 0

  nimDisp.vtbl.GetTypeInfo = proc(self: ptr IDispatch, iTInfo: UINT, lcid: LCID, ppTInfo: ptr ptr ITypeInfo): HRESULT {.stdcall.} =
    ppTInfo[] = nil

  nimDisp.vtbl.GetIDsOfNames = proc(self: ptr IDispatch, riid: REFIID, rgszNames: ptr LPOLESTR, cNames: UINT, lcid: LCID, rgDispId: ptr DISPID): HRESULT {.stdcall.} =
    let nimDisp = cast[ptr INimDispatch](self)
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
    let nimDisp = cast[ptr INimDispatch](self)
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

proc add*(nimDisp: ptr INimDispatch, name: string, callback: NimMethod) =
  nimDisp.methods.add (name, callback)

proc regist*(nimDisp: ptr INimDispatch, name: string): bool {.discardable.} =
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

proc revoke*(nimDisp: ptr INimDispatch): bool {.discardable.} =
  if nimDisp.cookie == 0:
    return false

  var pROT: ptr IRunningObjectTable
  if SUCCEEDED GetRunningObjectTable(0, &pROT):
    defer: pROT.Release()
    if SUCCEEDED pROT.Revoke(nimDisp.cookie):
      return true

proc inloop*(nimDisp: ptr INimDispatch) =
  var msg: MSG
  if PeekMessage(&msg, 0, 0, 0, PM_REMOVE) != 0:
    DispatchMessage(&msg)

proc newNimDispatch*(): ptr INimDispatch =
  result = cast[ptr INimDispatch](alloc0(sizeof(INimDispatch)))
  result.init()
