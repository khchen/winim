import winim

block:
  var
    str = "English Test 中文測試"
    cstr = "English Test 中文測試".cstring
    wstr = +$"English Test 中文測試"
    mstr = -$"English Test 中文測試"

    lpwstr = &(L"English Test 中文測試")
    bstr = SysAllocString(L"English Test 中文測試")
    arrachar: array[30, char]
    arruchar: array[30, char]
    arrwchar: array[30, WCHAR]
    parrachar = &arrachar
    parruchar = &arruchar
    parrwchar = &arrwchar

  L"English Test 中文測試" >> arrwchar
  "English Test 中文測試" >> arruchar
  -$"English Test 中文測試" >> arrachar

  var
    nw1 = newWString("English Test 中文測試")
    nw2 = newWString("English Test 中文測試".cstring)
    nw3 = newWString(1024)
    nm1 = newMString("English Test 中文測試")
    nm2 = newMString("English Test 中文測試".cstring)
    nm3 = newMString(1024)

    ps1 = allocString("English Test 中文測試")
    ps2 = allocString("English Test 中文測試".cstring)
    ps3 = allocString(+$"English Test 中文測試")
    ps4 = allocString(-$"English Test 中文測試")
    ps5 = allocString(1024)

    pw1 = allocWString("English Test 中文測試")
    pw2 = allocWString("English Test 中文測試".cstring)
    pw3 = allocWString(+$"English Test 中文測試")
    pw4 = allocWString(-$"English Test 中文測試")
    pw5 = allocWString(1024)

    pm1 = allocMString("English Test 中文測試")
    pm2 = allocMString("English Test 中文測試".cstring)
    pm3 = allocMString(+$"English Test 中文測試")
    pm4 = allocMString(-$"English Test 中文測試")
    pm5 = allocMString(1024)

    s1 = $(+$"English Test 中文測試")
    s2 = $(-$"English Test 中文測試")
    s3 = $(lpwstr)
    s4 = $(bstr)
    s5 = $arruchar
    s6 = $arrwchar
    s7 = $parruchar
    s8 = $parrwchar

    w1 = +$("English Test 中文測試")
    w2 = +$("English Test 中文測試".cstring)
    w3 = +$(cast[ptr char]("English Test 中文測試".cstring))
    w4 = +$(L"English Test 中文測試")
    w5 = +$(-$"English Test 中文測試")
    w6 = +$(lpwstr)
    w7 = +$(bstr)
    w8 = +$'T'
    w9 = +$(20061.WCHAR)
    w10 = +$arruchar
    w11 = +$arrwchar
    w12 = +$parruchar
    w13 = +$parrwchar

    m1 = -$("English Test 中文測試")
    m2 = -$("English Test 中文測試".cstring)
    m3 = -$(cast[ptr char]("English Test 中文測試".cstring))
    m4 = -$(L"English Test 中文測試")
    m5 = -$(-$"English Test 中文測試")
    m6 = -$(lpwstr)
    m7 = -$(bstr)
    m8 = -$'T'
    m9 = -$(20061.WCHAR)
    m10 = -$arruchar
    m11 = -$arrwchar
    m12 = -$parruchar
    m13 = -$parrwchar

    ss1 = $$("English Test 中文測試")
    ss2 = $$("English Test 中文測試".cstring)
    ss3 = $$(cast[ptr char]("English Test 中文測試".cstring))
    ss4 = $$(L"English Test 中文測試")
    ss5 = $$(-$"English Test 中文測試")
    ss6 = $$(lpwstr)
    ss7 = $$(bstr)
    ss8 = $$'T'
    ss9 = $$(20061.WCHAR)
    ss10 = $$arrachar
    ss11 = $$arrwchar
    ss12 = $$parrachar
    ss13 = $$parrwchar

    ww1 = +$$("English Test 中文測試")
    ww2 = +$$("English Test 中文測試".cstring)
    ww3 = +$$(cast[ptr char]("English Test 中文測試".cstring))
    ww4 = +$$(L"English Test 中文測試")
    ww5 = +$$(-$"English Test 中文測試")
    ww6 = +$$(lpwstr)
    ww7 = +$$(bstr)
    ww8 = +$$'T'
    ww9 = +$$(20061.WCHAR)
    ww10 = +$$arrachar
    ww11 = +$$arrwchar
    ww12 = +$$parrachar
    ww13 = +$$parrwchar

    mm1 = -$$("English Test 中文測試")
    mm2 = -$$("English Test 中文測試".cstring)
    mm3 = -$$(cast[ptr char]("English Test 中文測試".cstring))
    mm4 = -$$(L"English Test 中文測試")
    mm5 = -$$(-$"English Test 中文測試")
    mm6 = -$$(lpwstr)
    mm7 = -$$(bstr)
    mm8 = -$$'T'
    mm9 = -$$(20061.WCHAR)
    mm10 = -$$arrachar
    mm11 = -$$arrwchar
    mm12 = -$$parrachar
    mm13 = -$$parrwchar

    arrc: array[100, char]
    arrw: array[100, WCHAR]
    parrc = arrc.addr
    parrw = arrw.addr

    arrc5: array[5..10, char]
    arrw5: array[5..10, WCHAR]
    parrc5 = arrc5.addr
    parrw5 = arrw5.addr

    buffs = newString(100)
    buffw = newWString(100)
    buffm = newMString(100)
    buffc = newString(100).cstring

    pchr = cast[ptr char](newString(100).cstring)
    pwchr = cast[ptr WCHAR](&newWString(100))

  "English Test 中文測試" >> arrc5
  -$"English Test 中文測試" >> arrc5
  "English Test 中文測試" >> parrc5
  -$"English Test 中文測試" >> parrc5
  arrc5 >> buffs
  arrc5 >> buffm
  parrc5 >> buffs
  parrc5 >> buffm

  +$"English Test 中文測試" >> arrw5
  +$"English Test 中文測試" >> parrw5
  arrw5 >> buffw
  parrw5 >> buffw

  "English Test 中文測試" >> arrc
  -$"English Test 中文測試" >> arrc
  "English Test 中文測試" >> parrc
  -$"English Test 中文測試" >> parrc
  arrc >> buffs
  arrc >> buffm
  parrc >> buffs
  parrc >> buffm

  +$"English Test 中文測試" >> arrw
  +$"English Test 中文測試" >> parrw
  arrw >> buffw
  parrw >> buffw

  "English Test 中文測試" >> buffc
  -$"English Test 中文測試" >> buffc
  "English Test 中文測試" >> pchr
  -$"English Test 中文測試" >> pchr

  +$"English Test 中文測試" >> pwchr

  proc topch(s: ptr char) = echo cast[int](s), " is ptr char, len: ", $lstrlenA(s)
  proc tostr(s: LPSTR) = echo cast[int](s), " is LPSTR, len: ", $lstrlenA(s)
  proc towstr(s: LPWSTR) = echo cast[int](s), " is LPWSTR, len: ", $lstrlenW(s)
  proc tobstr(s: BSTR) = echo cast[int](s), " is BSTR, len: ", $SysStringLen(s)

  topch(str)
  topch(cstr)
  topch(mstr)

  tostr(str)
  tostr(cstr)
  tostr(mstr)

  towstr(str)
  towstr(cstr)
  towstr(wstr)
  towstr(bstr)

  tobstr(str)
  tobstr(cstr)
  tobstr(wstr)

  tostr(arrc)
  tostr(arrc5)
  tostr(parrc)
  tostr(parrc5)

  topch(arrc)
  topch(arrc5)
  topch(parrc)
  topch(parrc5)

  towstr(arrw)
  towstr(arrw5)
  towstr(parrw)
  towstr(parrw5)

  proc test0(s: LPSTR) = echo cast[int](s)
  proc test1(s: LPWSTR) = echo cast[int](s)

  block:
    var
      s1: string
      s2 = "abc"
      w1: wstring
      w2 = L"abc"
      m1: mstring
      m2 = -$"abc"

    test0(&s1)
    test0(&s2)
    test1(&w1)
    test1(&w2)
    test0(&m1)
    test0(&m2)
