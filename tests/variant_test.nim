import winim.com

var
  v: variant
  V: VARIANT

  vuint = 123.uint
  vu8 = 123'u8
  vu16 = 123'u16
  vu32 = 123'u32
  vu64 = 123'u64
  vint = -123.int
  vi8 = -123'i8
  vi16 = -123'i16
  vi32 = -123'i32
  vi64 = -123'i64
  vf32 = -123.4'f32
  vf64 = -123.4'f64

  ft: FILETIME
  st: SYSTEMTIME
  a1: array[10, string]
  a2: array[10, array[10, string]]
  a3: array[10, array[10, array[10, string]]]

  ca1: comarray1d
  ca2: comarray2d
  ca3: comarray3d

  s1 = @[105, 110, 112, 117, 116, 61, 116, 101, 115, 116]
  s2 = @[@[1, 2], @[3, 4, 5, 6, 7], @[8, 9, 10, 11], @[12], @[13, 14, 15]]
  s3 = @[@[@[1, 2], @[3, 4, 5, 6], @[7]], @[@[8, 9, 10, 11, 12, 13], @[14, 15]], @[@[16, 17, 18], @[19], @[20, 21], @[22, 23, 24, 25]]]
  s4 = @[@[@[@[1, 2], @[3, 4, 5, 6], @[7]], @[@[8, 9, 10, 11, 12, 13], @[14, 15]], @[@[16, 17, 18], @[19], @[20, 21], @[22, 23, 24, 25]]]]

# convert SomeNumber, enum to variant
v = toVariant(vuint)
v = toVariant(vu8)
v = toVariant(vu16)
v = toVariant(vu32)
v = toVariant(vu64)
v = toVariant(vint)
v = toVariant(vi8)
v = toVariant(vi16)
v = toVariant(vi32)
v = toVariant(vi64)
v = toVariant(vf32)
v = toVariant(vf64)
v = toVariant(VT_DATE)

# convert ptr SomeNumber to variant
v = toVariant(&vuint)
v = toVariant(&vu8)
v = toVariant(&vu16)
v = toVariant(&vu32)
v = toVariant(&vu64)
v = toVariant(&vint)
v = toVariant(&vi8)
v = toVariant(&vi16)
v = toVariant(&vi32)
v = toVariant(&vi64)
v = toVariant(&vf32)
v = toVariant(&vf64)

# convert variant to nim data type
discard v.uint
discard v.uint8
discard v.uint16
discard v.uint32
discard v.uint64
discard v.int
discard v.int8
discard v.int16
discard v.int32
discard v.int64
discard v.float
discard v.float32
discard v.float64
discard v.string

# string, cstring, wstring, mstring support
v = toVariant(cstring("the quick fox jumps over the lazy brown dog"))
v = toVariant(L"the quick fox jumps over the lazy brown dog")
v = toVariant(-$"the quick fox jumps over the lazy brown dog")
v = toVariant("the quick fox jumps over the lazy brown dog")

discard v.string
discard v.wstring
discard v.mstring

# FILETIME and SYSTEMTIME support
GetLocalTime(&st)
ft = toVariant(st).FILETIME
st = toVariant(ft).SYSTEMTIME
discard $toVariant(st)

# convert array/seq to safearray variant and convert back to seq
ca1 = toVariant(a1).comarray1d  # seq[variant]
ca2 = toVariant(a2).comarray2d  # seq[seq[variant]]
ca3 = toVariant(a3).comarray3d  # seq[seq[seq[variant]]]
ca1 = toVariant(s1).comarray1d
ca2 = toVariant(s2).comarray2d
ca3 = toVariant(s3).comarray3d

# VariantConversionError test
st.wMonth = 9999
ft.dwLowDateTime = 0xffffffff.DWORD
ft.dwHighDateTime = 0xffffffff.DWORD
V.vt = VT_RESERVED.VARTYPE

try: discard toVariant(st)
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(ft)
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(V)
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(s1, VT_EMPTY)
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(s2, VT_EMPTY)
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(s3, VT_EMPTY)
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(s4)
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(s2).comarray1d
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(s3).comarray2d
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(s1).comarray3d
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(s1).int
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant("abc").int
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

try: discard toVariant(nil.variant).int
except VariantConversionError: echo "VariantConversionError: " & getCurrentExceptionMsg()

# discard fromVariant[VARENUM](toVariant(1))
