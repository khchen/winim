#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2020 Ward
#
#====================================================================

import winimbase
import windef
import objbase
#include <wincodec.h>
type
  WICDecodeOptions* = int32
  WICBitmapCreateCacheOption* = int32
  WICBitmapAlphaChannelOption* = int32
  WICBitmapDecoderCapabilities* = int32
  WICBitmapDitherType* = int32
  WICBitmapEncoderCacheOption* = int32
  WICBitmapInterpolationMode* = int32
  WICBitmapLockFlags* = int32
  WICBitmapPaletteType* = int32
  WICBitmapTransformOptions* = int32
  WICColorContextType* = int32
  WICComponentType* = int32
  WICComponentSigning* = int32
  WICComponentEnumerateOptions* = int32
  WICPixelFormatNumericRepresentation* = int32
  WICTiffCompressionOption* = int32
  WICPixelFormatGUID* = GUID
  REFWICPixelFormatGUID* = REFGUID
  WICColor* = UINT32
const
  WINCODEC_SDK_VERSION* = 0x0236
  wICDecodeMetadataCacheOnDemand* = 0x0
  wICDecodeMetadataCacheOnLoad* = 0x1
  WICMETADATACACHEOPTION_FORCE_DWORD* = 0x7fffffff
  wICBitmapNoCache* = 0x0
  wICBitmapCacheOnDemand* = 0x1
  wICBitmapCacheOnLoad* = 0x2
  WICBITMAPCREATECACHEOPTION_FORCE_DWORD* = 0x7fffffff
  wICBitmapUseAlpha* = 0x0
  wICBitmapUsePremultipliedAlpha* = 0x1
  wICBitmapIgnoreAlpha* = 0x2
  WICBITMAPALPHACHANNELOPTIONS_FORCE_DWORD* = 0x7fffffff
  wICBitmapDecoderCapabilitySameEncoder* = 0x1
  wICBitmapDecoderCapabilityCanDecodeAllImages* = 0x2
  wICBitmapDecoderCapabilityCanDecodeSomeImages* = 0x4
  wICBitmapDecoderCapabilityCanEnumerateMetadata* = 0x8
  wICBitmapDecoderCapabilityCanDecodeThumbnail* = 0x10
  wICBitmapDitherTypeNone* = 0x0
  wICBitmapDitherTypeSolid* = 0x0
  wICBitmapDitherTypeOrdered4x4* = 0x1
  wICBitmapDitherTypeOrdered8x8* = 0x2
  wICBitmapDitherTypeOrdered16x16* = 0x3
  wICBitmapDitherTypeSpiral4x4* = 0x4
  wICBitmapDitherTypeSpiral8x8* = 0x5
  wICBitmapDitherTypeDualSpiral4x4* = 0x6
  wICBitmapDitherTypeDualSpiral8x8* = 0x7
  wICBitmapDitherTypeErrorDiffusion* = 0x8
  WICBITMAPDITHERTYPE_FORCE_DWORD* = 0x7fffffff
  wICBitmapEncoderCacheInMemory* = 0x0
  wICBitmapEncoderCacheTempFile* = 0x1
  wICBitmapEncoderNoCache* = 0x2
  WICBITMAPENCODERCACHEOPTION_FORCE_DWORD* = 0x7fffffff
  wICBitmapInterpolationModeNearestNeighbor* = 0x0
  wICBitmapInterpolationModeLinear* = 0x1
  wICBitmapInterpolationModeCubic* = 0x2
  wICBitmapInterpolationModeFant* = 0x3
  WICBITMAPINTERPOLATIONMODE_FORCE_DWORD* = 0x7fffffff
  wICBitmapLockRead* = 0x1
  wICBitmapLockWrite* = 0x2
  WICBITMAPLOCKFLAGS_FORCE_DWORD* = 0x7fffffff
  wICBitmapPaletteTypeCustom* = 0x0
  wICBitmapPaletteTypeMedianCut* = 0x1
  wICBitmapPaletteTypeFixedBW* = 0x2
  wICBitmapPaletteTypeFixedHalftone8* = 0x3
  wICBitmapPaletteTypeFixedHalftone27* = 0x4
  wICBitmapPaletteTypeFixedHalftone64* = 0x5
  wICBitmapPaletteTypeFixedHalftone125* = 0x6
  wICBitmapPaletteTypeFixedHalftone216* = 0x7
  wICBitmapPaletteTypeFixedWebPalette* = wICBitmapPaletteTypeFixedHalftone216
  wICBitmapPaletteTypeFixedHalftone252* = 0x8
  wICBitmapPaletteTypeFixedHalftone256* = 0x9
  wICBitmapPaletteTypeFixedGray4* = 0xa
  wICBitmapPaletteTypeFixedGray16* = 0xb
  wICBitmapPaletteTypeFixedGray256* = 0xc
  WICBITMAPPALETTETYPE_FORCE_DWORD* = 0x7fffffff
  wICBitmapTransformRotate0* = 0x0
  wICBitmapTransformRotate90* = 0x1
  wICBitmapTransformRotate180* = 0x2
  wICBitmapTransformRotate270* = 0x3
  wICBitmapTransformFlipHorizontal* = 0x8
  wICBitmapTransformFlipVertical* = 0x10
  WICBITMAPTRANSFORMOPTIONS_FORCE_DWORD* = 0x7fffffff
  wICColorContextUninitialized* = 0x0
  wICColorContextProfile* = 0x1
  wICColorContextExifColorSpace* = 0x2
  wICDecoder* = 0x1
  wICEncoder* = 0x2
  wICPixelFormatConverter* = 0x4
  wICMetadataReader* = 0x8
  wICMetadataWriter* = 0x10
  wICPixelFormat* = 0x20
  WICCOMPONENTTYPE_FORCE_DWORD* = 0x7fffffff
  wICComponentSigned* = 0x1
  wICComponentUnsigned* = 0x2
  wICComponentSafe* = 0x4
  wICComponentDisabled* = 0x80000000'i32
  wICComponentEnumerateDefault* = 0x0
  wICComponentEnumerateRefresh* = 0x1
  wICComponentEnumerateBuiltInOnly* = 0x20000000
  wICComponentEnumerateUnsigned* = 0x40000000
  wICComponentEnumerateDisabled* = 0x80000000'i32
  wICPixelFormatNumericRepresentationUnspecified* = 0x0
  wICPixelFormatNumericRepresentationIndexed* = 0x1
  wICPixelFormatNumericRepresentationUnsignedInteger* = 0x2
  wICPixelFormatNumericRepresentationSignedInteger* = 0x3
  wICPixelFormatNumericRepresentationFixed* = 0x4
  wICPixelFormatNumericRepresentationFloat* = 0x5
  WICPIXELFORMATNUMERICREPRESENTATION_FORCE_DWORD* = 0x7fffffff
  wICTiffCompressionDontCare* = 0x0
  wICTiffCompressionNone* = 0x1
  wICTiffCompressionCCITT3* = 0x2
  wICTiffCompressionCCITT4* = 0x3
  wICTiffCompressionLZW* = 0x4
  wICTiffCompressionRLE* = 0x5
  wICTiffCompressionZIP* = 0x6
  wICTiffCompressionLZWHDifferencing* = 0x7
  WICTIFFCOMPRESSIONOPTION_FORCE_DWORD* = 0x7fffffff
  GUID_WICPixelFormatDontCare* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x00])
  GUID_WICPixelFormatUndefined* = GUID_WICPixelFormatDontCare
  GUID_WICPixelFormat1bppIndexed* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x01])
  GUID_WICPixelFormat2bppIndexed* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x02])
  GUID_WICPixelFormat4bppIndexed* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x03])
  GUID_WICPixelFormat8bppIndexed* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x04])
  GUID_WICPixelFormatBlackWhite* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x05])
  GUID_WICPixelFormat2bppGray* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x06])
  GUID_WICPixelFormat4bppGray* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x07])
  GUID_WICPixelFormat8bppGray* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x08])
  GUID_WICPixelFormat16bppGray* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0b])
  GUID_WICPixelFormat16bppBGR555* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x09])
  GUID_WICPixelFormat16bppBGR565* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0a])
  GUID_WICPixelFormat16bppBGRA5551* = DEFINE_GUID(0x05ec7c2b'i32, 0xf1e6, 0x4961, [0xad'u8, 0x46, 0xe1, 0xcc, 0x81, 0x0a, 0x87, 0xd2])
  GUID_WICPixelFormat24bppBGR* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0c])
  GUID_WICPixelFormat24bppRGB* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0d])
  GUID_WICPixelFormat32bppBGR* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0e])
  GUID_WICPixelFormat32bppBGRA* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0f])
  GUID_WICPixelFormat32bppPBGRA* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x10])
  GUID_WICPixelFormat32bppRGB* = DEFINE_GUID(0xd98c6b95'i32, 0x3efe, 0x47d6, [0xbb'u8, 0x25, 0xeb, 0x17, 0x48, 0xab, 0x0c, 0xf1])
  GUID_WICPixelFormat32bppRGBA* = DEFINE_GUID(0xf5c7ad2d'i32, 0x6a8d, 0x43dd, [0xa7'u8, 0xa8, 0xa2, 0x99, 0x35, 0x26, 0x1a, 0xe9])
  GUID_WICPixelFormat32bppPRGBA* = DEFINE_GUID(0x3cc4a650'i32, 0xa527, 0x4d37, [0xa9'u8, 0x16, 0x31, 0x42, 0xc7, 0xeb, 0xed, 0xba])
  GUID_WICPixelFormat48bppRGB* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x15])
  GUID_WICPixelFormat64bppRGBA* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x16])
  GUID_WICPixelFormat64bppPRGBA* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4bfe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x17])
  GUID_WICPixelFormat32bppCMYK* = DEFINE_GUID(0x6fddc324'i32, 0x4e03, 0x4fbe, [0xb1'u8, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1c])
  WINCODEC_ERR_WRONGSTATE* = 0x88982f04'i32
  WINCODEC_ERR_VALUEOUTOFRANGE* = 0x88982f05'i32
  WINCODEC_ERR_NOTINITIALIZED* = 0x88982f0c'i32
  WINCODEC_ERR_ALREADYLOCKED* = 0x88982f0d'i32
  WINCODEC_ERR_PROPERTYNOTFOUND* = 0x88982f40'i32
  WINCODEC_ERR_CODECNOTHUMBNAIL* = 0x88982f44'i32
  WINCODEC_ERR_PALETTEUNAVAILABLE* = 0x88982f45'i32
  WINCODEC_ERR_COMPONENTNOTFOUND* = 0x88982f50'i32
  WINCODEC_ERR_BADIMAGE* = 0x88982f60'i32
  WINCODEC_ERR_FRAMEMISSING* = 0x88982f62'i32
  WINCODEC_ERR_BADMETADATAHEADER* = 0x88982f63'i32
  WINCODEC_ERR_UNSUPPORTEDPIXELFORMAT* = 0x88982f80'i32
  WINCODEC_ERR_UNSUPPORTEDOPERATION* = 0x88982f81'i32
  WINCODEC_ERR_INSUFFICIENTBUFFER* = 0x88982f8c'i32
  WINCODEC_ERR_PROPERTYUNEXPECTEDTYPE* = 0x88982f8e'i32
  WINCODEC_ERR_WIN32ERROR* = 0x88982f94'i32
  IID_IWICColorContext* = DEFINE_GUID(0x3c613a02'i32, 0x34b2, 0x44ea, [0x9a'u8, 0x7c, 0x45, 0xae, 0xa9, 0xc6, 0xfd, 0x6d])
  IID_IWICBitmapSource* = DEFINE_GUID(0x00000120'i32, 0xa8f2, 0x4877, [0xba'u8, 0x0a, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94])
  IID_IWICBitmapLock* = DEFINE_GUID(0x00000123'i32, 0xa8f2, 0x4877, [0xba'u8, 0x0a, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94])
  IID_IWICBitmapFlipRotator* = DEFINE_GUID(0x5009834f'i32, 0x2d6a, 0x41ce, [0x9e'u8, 0x1b, 0x17, 0xc5, 0xaf, 0xf7, 0xa7, 0x82])
  IID_IWICBitmap* = DEFINE_GUID(0x00000121'i32, 0xa8f2, 0x4877, [0xba'u8, 0x0a, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94])
  IID_IWICPalette* = DEFINE_GUID(0x00000040'i32, 0xa8f2, 0x4877, [0xba'u8, 0x0a, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94])
  IID_IWICComponentInfo* = DEFINE_GUID(0x23bc3f0a'i32, 0x698b, 0x4357, [0x88'u8, 0x6b, 0xf2, 0x4d, 0x50, 0x67, 0x13, 0x34])
  IID_IWICMetadataQueryReader* = DEFINE_GUID(0x30989668'i32, 0xe1c9, 0x4597, [0xb3'u8, 0x95, 0x45, 0x8e, 0xed, 0xb8, 0x08, 0xdf])
  IID_IWICMetadataQueryWriter* = DEFINE_GUID(0xa721791a'i32, 0x0def, 0x4d06, [0xbd'u8, 0x91, 0x21, 0x18, 0xbf, 0x1d, 0xb1, 0x0b])
  IID_IWICBitmapFrameDecode* = DEFINE_GUID(0x3b16811b'i32, 0x6a43, 0x4ec9, [0xa8'u8, 0x13, 0x3d, 0x93, 0x0c, 0x13, 0xb9, 0x40])
  IID_IWICPixelFormatInfo* = DEFINE_GUID(0xe8eda601'i32, 0x3d48, 0x431a, [0xab'u8, 0x44, 0x69, 0x05, 0x9b, 0xe8, 0x8b, 0xbe])
  IID_IWICPixelFormatInfo2* = DEFINE_GUID(0xa9db33a2'i32, 0xaf5f, 0x43c7, [0xb6'u8, 0x79, 0x74, 0xf5, 0x98, 0x4b, 0x5a, 0xa4])
  IID_IWICBitmapCodecInfo* = DEFINE_GUID(0xe87a44c4'i32, 0xb76e, 0x4c47, [0x8b'u8, 0x09, 0x29, 0x8e, 0xb1, 0x2a, 0x27, 0x14])
  IID_IWICBitmapDecoderInfo* = DEFINE_GUID(0xd8cd007f'i32, 0xd08f, 0x4191, [0x9b'u8, 0xfc, 0x23, 0x6e, 0xa7, 0xf0, 0xe4, 0xb5])
  IID_IWICBitmapDecoder* = DEFINE_GUID(0x9edde9e7'i32, 0x8dee, 0x47ea, [0x99'u8, 0xdf, 0xe6, 0xfa, 0xf2, 0xed, 0x44, 0xbf])
  IID_IWICBitmapFrameEncode* = DEFINE_GUID(0x00000105'i32, 0xa8f2, 0x4877, [0xba'u8, 0x0a, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94])
  IID_IWICBitmapEncoderInfo* = DEFINE_GUID(0x94c9b4ee'i32, 0xa09f, 0x4f92, [0x8a'u8, 0x1e, 0x4a, 0x9b, 0xce, 0x7e, 0x76, 0xfb])
  IID_IWICBitmapEncoder* = DEFINE_GUID(0x00000103'i32, 0xa8f2, 0x4877, [0xba'u8, 0x0a, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94])
  IID_IWICFormatConverter* = DEFINE_GUID(0x00000301'i32, 0xa8f2, 0x4877, [0xba'u8, 0x0a, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94])
  IID_IWICFormatConverterInfo* = DEFINE_GUID(0x9f34fb65'i32, 0x13f4, 0x4f15, [0xbc'u8, 0x57, 0x37, 0x26, 0xb5, 0xe5, 0x3d, 0x9f])
  IID_IWICStream* = DEFINE_GUID(0x135ff860'i32, 0x22b7, 0x4ddf, [0xb0'u8, 0xf6, 0x21, 0x8f, 0x4f, 0x29, 0x9a, 0x43])
  IID_IWICBitmapScaler* = DEFINE_GUID(0x00000302'i32, 0xa8f2, 0x4877, [0xba'u8, 0x0a, 0xfd, 0x2b, 0x66, 0x45, 0xfb, 0x94])
  IID_IWICBitmapClipper* = DEFINE_GUID(0xe4fbcf03'i32, 0x223d, 0x4e81, [0x93'u8, 0x33, 0xd6, 0x35, 0x55, 0x6d, 0xd1, 0xb5])
  IID_IWICColorTransform* = DEFINE_GUID(0xb66f034f'i32, 0xd0e2, 0x40ab, [0xb4'u8, 0x36, 0x6d, 0xe3, 0x9e, 0x32, 0x1a, 0x94])
  IID_IWICFastMetadataEncoder* = DEFINE_GUID(0xb84e2c09'i32, 0x78c9, 0x4ac4, [0x8b'u8, 0xd3, 0x52, 0x4a, 0xe1, 0x66, 0x3a, 0x2f])
  CLSID_WICImagingFactory* = DEFINE_GUID(0xcacaf262'i32, 0x9370, 0x4615, [0xa1'u8, 0x3b, 0x9f, 0x55, 0x39, 0xda, 0x4c, 0x0a])
  IID_IWICImagingFactory* = DEFINE_GUID(0xec5ec8a9'i32, 0xc395, 0x4314, [0x9c'u8, 0x77, 0x54, 0xd7, 0xa9, 0x35, 0xff, 0x70])
  IID_IWICEnumMetadataItem* = DEFINE_GUID(0xdc2bb46d'i32, 0x3f07, 0x481e, [0x86'u8, 0x25, 0x22, 0x0c, 0x4a, 0xed, 0xbb, 0x33])
  CLSID_WICBmpDecoder* = DEFINE_GUID(0x6b462062'i32, 0x7cbf, 0x400d, [0x9f'u8, 0xdb, 0x81, 0x3d, 0xd1, 0x0f, 0x27, 0x78])
  CLSID_WICPngDecoder* = DEFINE_GUID(0x389ea17b'i32, 0x5078, 0x4cde, [0xb6'u8, 0xef, 0x25, 0xc1, 0x51, 0x75, 0xc7, 0x51])
  CLSID_WICIcoDecoder* = DEFINE_GUID(0xc61bfcdf'i32, 0x2e0f, 0x4aad, [0xa8'u8, 0xd7, 0xe0, 0x6b, 0xaf, 0xeb, 0xcd, 0xfe])
  CLSID_WICJpegDecoder* = DEFINE_GUID(0x9456a480'i32, 0xe88b, 0x43ea, [0x9e'u8, 0x73, 0x0b, 0x2d, 0x9b, 0x71, 0xb1, 0xca])
  CLSID_WICGifDecoder* = DEFINE_GUID(0x381dda3c'i32, 0x9ce9, 0x4834, [0xa2'u8, 0x3e, 0x1f, 0x98, 0xf8, 0xfc, 0x52, 0xbe])
  CLSID_WICTiffDecoder* = DEFINE_GUID(0xb54e85d9'i32, 0xfe23, 0x499f, [0x8b'u8, 0x88, 0x6a, 0xce, 0xa7, 0x13, 0x75, 0x2b])
  CLSID_WICWmpDecoder* = DEFINE_GUID(0xa26cec36'i32, 0x234c, 0x4950, [0xae'u8, 0x16, 0xe3, 0x4a, 0xac, 0xe7, 0x1d, 0x0d])
  CLSID_WICBmpEncoder* = DEFINE_GUID(0x69be8bb4'i32, 0xd66d, 0x47c8, [0x86'u8, 0x5a, 0xed, 0x15, 0x89, 0x43, 0x37, 0x82])
  CLSID_WICPngEncoder* = DEFINE_GUID(0x27949969'i32, 0x876a, 0x41d7, [0x94'u8, 0x47, 0x56, 0x8f, 0x6a, 0x35, 0xa4, 0xdc])
  CLSID_WICJpegEncoder* = DEFINE_GUID(0x1a34f5c1'i32, 0x4a5a, 0x46dc, [0xb6'u8, 0x44, 0x1f, 0x45, 0x67, 0xe7, 0xa6, 0x76])
  CLSID_WICGifEncoder* = DEFINE_GUID(0x114f5598'i32, 0x0b22, 0x40a0, [0x86'u8, 0xa1, 0xc8, 0x3e, 0xa4, 0x95, 0xad, 0xbd])
  CLSID_WICTiffEncoder* = DEFINE_GUID(0x0131be10'i32, 0x2001, 0x4c5f, [0xa9'u8, 0xb0, 0xcc, 0x88, 0xfa, 0xb6, 0x4c, 0xe8])
  CLSID_WICWmpEncoder* = DEFINE_GUID(0xac4ce3cb'i32, 0xe1c1, 0x44cd, [0x82'u8, 0x15, 0x5a, 0x16, 0x65, 0x50, 0x9e, 0xc2])
  CLSID_WICDefaultFormatConverter* = DEFINE_GUID(0x1a3f11dc'i32, 0xb514, 0x4b17, [0x8c'u8, 0x5f, 0x21, 0x54, 0x51, 0x38, 0x52, 0xf1])
  GUID_ContainerFormatBmp* = DEFINE_GUID(0x0af1d87e'i32, 0xfcfe, 0x4188, [0xbd'u8, 0xeb, 0xa7, 0x90, 0x64, 0x71, 0xcb, 0xe3])
  GUID_ContainerFormatPng* = DEFINE_GUID(0x1b7cfaf4'i32, 0x713f, 0x473c, [0xbb'u8, 0xcd, 0x61, 0x37, 0x42, 0x5f, 0xae, 0xaf])
  GUID_ContainerFormatIco* = DEFINE_GUID(0xa3a860c4'i32, 0x338f, 0x4c17, [0x91'u8, 0x9a, 0xfb, 0xa4, 0xb5, 0x62, 0x8f, 0x21])
  GUID_ContainerFormatJpeg* = DEFINE_GUID(0x19e4a5aa'i32, 0x5662, 0x4fc5, [0xa0'u8, 0xc0, 0x17, 0x58, 0x02, 0x8e, 0x10, 0x57])
  GUID_ContainerFormatTiff* = DEFINE_GUID(0x163bcc30'i32, 0xe2e9, 0x4f0b, [0x96'u8, 0x1d, 0xa3, 0xe9, 0xfd, 0xb7, 0x88, 0xa3])
  GUID_ContainerFormatGif* = DEFINE_GUID(0x1f8a5601'i32, 0x7d4d, 0x4cbd, [0x9c'u8, 0x82, 0x1b, 0xc8, 0xd4, 0xee, 0xb9, 0xa5])
  GUID_ContainerFormatWmp* = DEFINE_GUID(0x57a37caa'i32, 0x367a, 0x4540, [0x91'u8, 0x6b, 0xf1, 0x83, 0xc5, 0x09, 0x3a, 0x4b])
  GUID_VendorMicrosoft* = DEFINE_GUID(0xf0e749ca'i32, 0xedef, 0x4589, [0xa7'u8, 0x3a, 0xee, 0x0e, 0x62, 0x6a, 0x2a, 0x2b])
  CLSID_WICImagingCategories* = DEFINE_GUID(0xfae3d380'i32, 0xfea4, 0x4623, [0x8c'u8, 0x75, 0xc6, 0xb6, 0x11, 0x10, 0xb6, 0x81])
  CATID_WICBitmapDecoders* = DEFINE_GUID(0x7ed96837'i32, 0x96f0, 0x4812, [0xb2'u8, 0x11, 0xf1, 0x3c, 0x24, 0x11, 0x7e, 0xd3])
  CATID_WICBitmapEncoders* = DEFINE_GUID(0xac757296'i32, 0x3522, 0x4e11, [0x98'u8, 0x62, 0xc1, 0x7b, 0xe5, 0xa1, 0x76, 0x7e])
  CATID_WICFormatConverters* = DEFINE_GUID(0x7835eae8'i32, 0xbf14, 0x49d1, [0x93'u8, 0xce, 0x53, 0x3a, 0x40, 0x7b, 0x22, 0x48])
  CATID_WICMetadataReader* = DEFINE_GUID(0x05af94d8'i32, 0x7174, 0x4cd2, [0xbe'u8, 0x4a, 0x41, 0x24, 0xb8, 0x0e, 0xe4, 0xb8])
  CATID_WICPixelFormats* = DEFINE_GUID(0x2b46e70f'i32, 0xcda7, 0x473e, [0x89'u8, 0xf6, 0xdc, 0x96, 0x30, 0xa2, 0x39, 0x0b])
type
  WICRect* {.pure.} = object
    X*: INT
    Y*: INT
    Width*: INT
    Height*: INT
  WICBitmapPattern* {.pure.} = object
    Position*: ULARGE_INTEGER
    Length*: ULONG
    Pattern*: ptr BYTE
    Mask*: ptr BYTE
    EndOfStream*: WINBOOL
  IWICColorContext* {.pure.} = object
    lpVtbl*: ptr IWICColorContextVtbl
  IWICColorContextVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    InitializeFromFilename*: proc(self: ptr IWICColorContext, wzFilename: LPCWSTR): HRESULT {.stdcall.}
    InitializeFromMemory*: proc(self: ptr IWICColorContext, pbBuffer: ptr BYTE, cbBufferSize: UINT): HRESULT {.stdcall.}
    InitializeFromExifColorSpace*: proc(self: ptr IWICColorContext, value: UINT): HRESULT {.stdcall.}
    GetType*: proc(self: ptr IWICColorContext, pType: ptr WICColorContextType): HRESULT {.stdcall.}
    GetProfileBytes*: proc(self: ptr IWICColorContext, cbBuffer: UINT, pbBuffer: ptr BYTE, pcbActual: ptr UINT): HRESULT {.stdcall.}
    GetExifColorSpace*: proc(self: ptr IWICColorContext, pValue: ptr UINT): HRESULT {.stdcall.}
  IWICPalette* {.pure.} = object
    lpVtbl*: ptr IWICPaletteVtbl
  IWICPaletteVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    InitializePredefined*: proc(self: ptr IWICPalette, ePaletteType: WICBitmapPaletteType, fAddTransparentColor: WINBOOL): HRESULT {.stdcall.}
    InitializeCustom*: proc(self: ptr IWICPalette, pColors: ptr WICColor, colorCount: UINT): HRESULT {.stdcall.}
    InitializeFromBitmap*: proc(self: ptr IWICPalette, pISurface: ptr IWICBitmapSource, colorCount: UINT, fAddTransparentColor: WINBOOL): HRESULT {.stdcall.}
    InitializeFromPalette*: proc(self: ptr IWICPalette, pIPalette: ptr IWICPalette): HRESULT {.stdcall.}
    GetType*: proc(self: ptr IWICPalette, pePaletteType: ptr WICBitmapPaletteType): HRESULT {.stdcall.}
    GetColorCount*: proc(self: ptr IWICPalette, pcCount: ptr UINT): HRESULT {.stdcall.}
    GetColors*: proc(self: ptr IWICPalette, colorCount: UINT, pColors: ptr WICColor, pcActualColors: ptr UINT): HRESULT {.stdcall.}
    IsBlackWhite*: proc(self: ptr IWICPalette, pfIsBlackWhite: ptr WINBOOL): HRESULT {.stdcall.}
    IsGrayscale*: proc(self: ptr IWICPalette, pfIsGrayscale: ptr WINBOOL): HRESULT {.stdcall.}
    HasAlpha*: proc(self: ptr IWICPalette, pfHasAlpha: ptr WINBOOL): HRESULT {.stdcall.}
  IWICBitmapSource* {.pure.} = object
    lpVtbl*: ptr IWICBitmapSourceVtbl
  IWICBitmapSourceVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetSize*: proc(self: ptr IWICBitmapSource, puiWidth: ptr UINT, puiHeight: ptr UINT): HRESULT {.stdcall.}
    GetPixelFormat*: proc(self: ptr IWICBitmapSource, pPixelFormat: ptr WICPixelFormatGUID): HRESULT {.stdcall.}
    GetResolution*: proc(self: ptr IWICBitmapSource, pDpiX: ptr float64, pDpiY: ptr float64): HRESULT {.stdcall.}
    CopyPalette*: proc(self: ptr IWICBitmapSource, pIPalette: ptr IWICPalette): HRESULT {.stdcall.}
    CopyPixels*: proc(self: ptr IWICBitmapSource, prc: ptr WICRect, cbStride: UINT, cbBufferSize: UINT, pbBuffer: ptr BYTE): HRESULT {.stdcall.}
  IWICBitmapLock* {.pure.} = object
    lpVtbl*: ptr IWICBitmapLockVtbl
  IWICBitmapLockVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetSize*: proc(self: ptr IWICBitmapLock, pWidth: ptr UINT, pHeight: ptr UINT): HRESULT {.stdcall.}
    GetStride*: proc(self: ptr IWICBitmapLock, pcbStride: ptr UINT): HRESULT {.stdcall.}
    GetDataPointer*: proc(self: ptr IWICBitmapLock, pcbBufferSize: ptr UINT, ppbData: ptr ptr BYTE): HRESULT {.stdcall.}
    GetPixelFormat*: proc(self: ptr IWICBitmapLock, pPixelFormat: ptr WICPixelFormatGUID): HRESULT {.stdcall.}
  IWICBitmapFlipRotator* {.pure.} = object
    lpVtbl*: ptr IWICBitmapFlipRotatorVtbl
  IWICBitmapFlipRotatorVtbl* {.pure, inheritable.} = object of IWICBitmapSourceVtbl
    Initialize*: proc(self: ptr IWICBitmapFlipRotator, pISource: ptr IWICBitmapSource, options: WICBitmapTransformOptions): HRESULT {.stdcall.}
  IWICBitmap* {.pure.} = object
    lpVtbl*: ptr IWICBitmapVtbl
  IWICBitmapVtbl* {.pure, inheritable.} = object of IWICBitmapSourceVtbl
    Lock*: proc(self: ptr IWICBitmap, prcLock: ptr WICRect, flags: DWORD, ppILock: ptr ptr IWICBitmapLock): HRESULT {.stdcall.}
    SetPalette*: proc(self: ptr IWICBitmap, pIPalette: ptr IWICPalette): HRESULT {.stdcall.}
    SetResolution*: proc(self: ptr IWICBitmap, dpiX: float64, dpiY: float64): HRESULT {.stdcall.}
  IWICComponentInfo* {.pure.} = object
    lpVtbl*: ptr IWICComponentInfoVtbl
  IWICComponentInfoVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetComponentType*: proc(self: ptr IWICComponentInfo, pType: ptr WICComponentType): HRESULT {.stdcall.}
    GetCLSID*: proc(self: ptr IWICComponentInfo, pclsid: ptr CLSID): HRESULT {.stdcall.}
    GetSigningStatus*: proc(self: ptr IWICComponentInfo, pStatus: ptr DWORD): HRESULT {.stdcall.}
    GetAuthor*: proc(self: ptr IWICComponentInfo, cchAuthor: UINT, wzAuthor: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.stdcall.}
    GetVendorGUID*: proc(self: ptr IWICComponentInfo, pguidVendor: ptr GUID): HRESULT {.stdcall.}
    GetVersion*: proc(self: ptr IWICComponentInfo, cchVersion: UINT, wzVersion: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.stdcall.}
    GetSpecVersion*: proc(self: ptr IWICComponentInfo, cchSpecVersion: UINT, wzSpecVersion: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.stdcall.}
    GetFriendlyName*: proc(self: ptr IWICComponentInfo, cchFriendlyName: UINT, wzFriendlyName: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.stdcall.}
  IWICMetadataQueryReader* {.pure.} = object
    lpVtbl*: ptr IWICMetadataQueryReaderVtbl
  IWICMetadataQueryReaderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    GetContainerFormat*: proc(self: ptr IWICMetadataQueryReader, pguidContainerFormat: ptr GUID): HRESULT {.stdcall.}
    GetLocation*: proc(self: ptr IWICMetadataQueryReader, cchMaxLength: UINT, wzNamespace: ptr WCHAR, pcchActualLength: ptr UINT): HRESULT {.stdcall.}
    GetMetadataByName*: proc(self: ptr IWICMetadataQueryReader, wzName: LPCWSTR, pvarValue: ptr PROPVARIANT): HRESULT {.stdcall.}
    GetEnumerator*: proc(self: ptr IWICMetadataQueryReader, ppIEnumString: ptr ptr IEnumString): HRESULT {.stdcall.}
  IWICMetadataQueryWriter* {.pure.} = object
    lpVtbl*: ptr IWICMetadataQueryWriterVtbl
  IWICMetadataQueryWriterVtbl* {.pure, inheritable.} = object of IWICMetadataQueryReaderVtbl
    SetMetadataByName*: proc(self: ptr IWICMetadataQueryWriter, wzName: LPCWSTR, pvarValue: ptr PROPVARIANT): HRESULT {.stdcall.}
    RemoveMetadataByName*: proc(self: ptr IWICMetadataQueryWriter, wzName: LPCWSTR): HRESULT {.stdcall.}
  IWICBitmapFrameDecode* {.pure.} = object
    lpVtbl*: ptr IWICBitmapFrameDecodeVtbl
  IWICBitmapFrameDecodeVtbl* {.pure, inheritable.} = object of IWICBitmapSourceVtbl
    GetMetadataQueryReader*: proc(self: ptr IWICBitmapFrameDecode, ppIMetadataQueryReader: ptr ptr IWICMetadataQueryReader): HRESULT {.stdcall.}
    GetColorContexts*: proc(self: ptr IWICBitmapFrameDecode, cCount: UINT, ppIColorContexts: ptr ptr IWICColorContext, pcActualCount: ptr UINT): HRESULT {.stdcall.}
    GetThumbnail*: proc(self: ptr IWICBitmapFrameDecode, ppIThumbnail: ptr ptr IWICBitmapSource): HRESULT {.stdcall.}
  IWICPixelFormatInfo* {.pure.} = object
    lpVtbl*: ptr IWICPixelFormatInfoVtbl
  IWICPixelFormatInfoVtbl* {.pure, inheritable.} = object of IWICComponentInfoVtbl
    GetFormatGUID*: proc(self: ptr IWICPixelFormatInfo, pFormat: ptr GUID): HRESULT {.stdcall.}
    GetColorContext*: proc(self: ptr IWICPixelFormatInfo, ppIColorContext: ptr ptr IWICColorContext): HRESULT {.stdcall.}
    GetBitsPerPixel*: proc(self: ptr IWICPixelFormatInfo, puiBitsPerPixel: ptr UINT): HRESULT {.stdcall.}
    GetChannelCount*: proc(self: ptr IWICPixelFormatInfo, puiChannelCount: ptr UINT): HRESULT {.stdcall.}
    GetChannelMask*: proc(self: ptr IWICPixelFormatInfo, uiChannelIndex: UINT, cbMaskBuffer: UINT, pbMaskBuffer: ptr BYTE, pcbActual: ptr UINT): HRESULT {.stdcall.}
  IWICPixelFormatInfo2* {.pure.} = object
    lpVtbl*: ptr IWICPixelFormatInfo2Vtbl
  IWICPixelFormatInfo2Vtbl* {.pure, inheritable.} = object of IWICPixelFormatInfoVtbl
    SupportsTransparency*: proc(self: ptr IWICPixelFormatInfo2, pfSupportsTransparency: ptr WINBOOL): HRESULT {.stdcall.}
    GetNumericRepresentation*: proc(self: ptr IWICPixelFormatInfo2, pNumericRepresentation: ptr WICPixelFormatNumericRepresentation): HRESULT {.stdcall.}
  IWICBitmapCodecInfo* {.pure.} = object
    lpVtbl*: ptr IWICBitmapCodecInfoVtbl
  IWICBitmapCodecInfoVtbl* {.pure, inheritable.} = object of IWICComponentInfoVtbl
    GetContainerFormat*: proc(self: ptr IWICBitmapCodecInfo, pguidContainerFormat: ptr GUID): HRESULT {.stdcall.}
    GetPixelFormats*: proc(self: ptr IWICBitmapCodecInfo, cFormats: UINT, pguidPixelFormats: ptr GUID, pcActual: ptr UINT): HRESULT {.stdcall.}
    GetColorManagementVersion*: proc(self: ptr IWICBitmapCodecInfo, cchColorManagementVersion: UINT, wzColorManagementVersion: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.stdcall.}
    GetDeviceManufacturer*: proc(self: ptr IWICBitmapCodecInfo, cchDeviceManufacturer: UINT, wzDeviceManufacturer: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.stdcall.}
    GetDeviceModels*: proc(self: ptr IWICBitmapCodecInfo, cchDeviceModels: UINT, wzDeviceModels: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.stdcall.}
    GetMimeTypes*: proc(self: ptr IWICBitmapCodecInfo, cchMimeTypes: UINT, wzMimeTypes: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.stdcall.}
    GetFileExtensions*: proc(self: ptr IWICBitmapCodecInfo, cchFileExtensions: UINT, wzFileExtensions: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.stdcall.}
    DoesSupportAnimation*: proc(self: ptr IWICBitmapCodecInfo, pfSupportAnimation: ptr WINBOOL): HRESULT {.stdcall.}
    DoesSupportChromaKey*: proc(self: ptr IWICBitmapCodecInfo, pfSupportChromaKey: ptr WINBOOL): HRESULT {.stdcall.}
    DoesSupportLossless*: proc(self: ptr IWICBitmapCodecInfo, pfSupportLossless: ptr WINBOOL): HRESULT {.stdcall.}
    DoesSupportMultiframe*: proc(self: ptr IWICBitmapCodecInfo, pfSupportMultiframe: ptr WINBOOL): HRESULT {.stdcall.}
    MatchesMimeType*: proc(self: ptr IWICBitmapCodecInfo, wzMimeType: LPCWSTR, pfMatches: ptr WINBOOL): HRESULT {.stdcall.}
  IWICBitmapDecoder* {.pure.} = object
    lpVtbl*: ptr IWICBitmapDecoderVtbl
  IWICBitmapDecoderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    QueryCapability*: proc(self: ptr IWICBitmapDecoder, pIStream: ptr IStream, pdwCapability: ptr DWORD): HRESULT {.stdcall.}
    Initialize*: proc(self: ptr IWICBitmapDecoder, pIStream: ptr IStream, cacheOptions: WICDecodeOptions): HRESULT {.stdcall.}
    GetContainerFormat*: proc(self: ptr IWICBitmapDecoder, pguidContainerFormat: ptr GUID): HRESULT {.stdcall.}
    GetDecoderInfo*: proc(self: ptr IWICBitmapDecoder, ppIDecoderInfo: ptr ptr IWICBitmapDecoderInfo): HRESULT {.stdcall.}
    CopyPalette*: proc(self: ptr IWICBitmapDecoder, pIPalette: ptr IWICPalette): HRESULT {.stdcall.}
    GetMetadataQueryReader*: proc(self: ptr IWICBitmapDecoder, ppIMetadataQueryReader: ptr ptr IWICMetadataQueryReader): HRESULT {.stdcall.}
    GetPreview*: proc(self: ptr IWICBitmapDecoder, ppIBitmapSource: ptr ptr IWICBitmapSource): HRESULT {.stdcall.}
    GetColorContexts*: proc(self: ptr IWICBitmapDecoder, cCount: UINT, ppIColorContexts: ptr ptr IWICColorContext, pcActualCount: ptr UINT): HRESULT {.stdcall.}
    GetThumbnail*: proc(self: ptr IWICBitmapDecoder, ppIThumbnail: ptr ptr IWICBitmapSource): HRESULT {.stdcall.}
    GetFrameCount*: proc(self: ptr IWICBitmapDecoder, pCount: ptr UINT): HRESULT {.stdcall.}
    GetFrame*: proc(self: ptr IWICBitmapDecoder, index: UINT, ppIBitmapFrame: ptr ptr IWICBitmapFrameDecode): HRESULT {.stdcall.}
  IWICBitmapDecoderInfo* {.pure.} = object
    lpVtbl*: ptr IWICBitmapDecoderInfoVtbl
  IWICBitmapDecoderInfoVtbl* {.pure, inheritable.} = object of IWICBitmapCodecInfoVtbl
    GetPatterns*: proc(self: ptr IWICBitmapDecoderInfo, cbSizePatterns: UINT, pPatterns: ptr WICBitmapPattern, pcPatterns: ptr UINT, pcbPatternsActual: ptr UINT): HRESULT {.stdcall.}
    MatchesPattern*: proc(self: ptr IWICBitmapDecoderInfo, pIStream: ptr IStream, pfMatches: ptr WINBOOL): HRESULT {.stdcall.}
    CreateInstance*: proc(self: ptr IWICBitmapDecoderInfo, ppIBitmapDecoder: ptr ptr IWICBitmapDecoder): HRESULT {.stdcall.}
  IWICBitmapFrameEncode* {.pure.} = object
    lpVtbl*: ptr IWICBitmapFrameEncodeVtbl
  IWICBitmapFrameEncodeVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IWICBitmapFrameEncode, pIEncoderOptions: ptr IPropertyBag2): HRESULT {.stdcall.}
    SetSize*: proc(self: ptr IWICBitmapFrameEncode, uiWidth: UINT, uiHeight: UINT): HRESULT {.stdcall.}
    SetResolution*: proc(self: ptr IWICBitmapFrameEncode, dpiX: float64, dpiY: float64): HRESULT {.stdcall.}
    SetPixelFormat*: proc(self: ptr IWICBitmapFrameEncode, pPixelFormat: ptr WICPixelFormatGUID): HRESULT {.stdcall.}
    SetColorContexts*: proc(self: ptr IWICBitmapFrameEncode, cCount: UINT, ppIColorContext: ptr ptr IWICColorContext): HRESULT {.stdcall.}
    SetPalette*: proc(self: ptr IWICBitmapFrameEncode, pIPalette: ptr IWICPalette): HRESULT {.stdcall.}
    SetThumbnail*: proc(self: ptr IWICBitmapFrameEncode, pIThumbnail: ptr IWICBitmapSource): HRESULT {.stdcall.}
    WritePixels*: proc(self: ptr IWICBitmapFrameEncode, lineCount: UINT, cbStride: UINT, cbBufferSize: UINT, pbPixels: ptr BYTE): HRESULT {.stdcall.}
    WriteSource*: proc(self: ptr IWICBitmapFrameEncode, pIBitmapSource: ptr IWICBitmapSource, prc: ptr WICRect): HRESULT {.stdcall.}
    Commit*: proc(self: ptr IWICBitmapFrameEncode): HRESULT {.stdcall.}
    GetMetadataQueryWriter*: proc(self: ptr IWICBitmapFrameEncode, ppIMetadataQueryWriter: ptr ptr IWICMetadataQueryWriter): HRESULT {.stdcall.}
  IWICBitmapEncoder* {.pure.} = object
    lpVtbl*: ptr IWICBitmapEncoderVtbl
  IWICBitmapEncoderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Initialize*: proc(self: ptr IWICBitmapEncoder, pIStream: ptr IStream, cacheOption: WICBitmapEncoderCacheOption): HRESULT {.stdcall.}
    GetContainerFormat*: proc(self: ptr IWICBitmapEncoder, pguidContainerFormat: ptr GUID): HRESULT {.stdcall.}
    GetEncoderInfo*: proc(self: ptr IWICBitmapEncoder, ppIEncoderInfo: ptr ptr IWICBitmapEncoderInfo): HRESULT {.stdcall.}
    SetColorContexts*: proc(self: ptr IWICBitmapEncoder, cCount: UINT, ppIColorContext: ptr ptr IWICColorContext): HRESULT {.stdcall.}
    SetPalette*: proc(self: ptr IWICBitmapEncoder, pIPalette: ptr IWICPalette): HRESULT {.stdcall.}
    SetThumbnail*: proc(self: ptr IWICBitmapEncoder, pIThumbnail: ptr IWICBitmapSource): HRESULT {.stdcall.}
    SetPreview*: proc(self: ptr IWICBitmapEncoder, pIPreview: ptr IWICBitmapSource): HRESULT {.stdcall.}
    CreateNewFrame*: proc(self: ptr IWICBitmapEncoder, ppIFrameEncode: ptr ptr IWICBitmapFrameEncode, ppIEncoderOptions: ptr ptr IPropertyBag2): HRESULT {.stdcall.}
    Commit*: proc(self: ptr IWICBitmapEncoder): HRESULT {.stdcall.}
    GetMetadataQueryWriter*: proc(self: ptr IWICBitmapEncoder, ppIMetadataQueryWriter: ptr ptr IWICMetadataQueryWriter): HRESULT {.stdcall.}
  IWICBitmapEncoderInfo* {.pure.} = object
    lpVtbl*: ptr IWICBitmapEncoderInfoVtbl
  IWICBitmapEncoderInfoVtbl* {.pure, inheritable.} = object of IWICBitmapCodecInfoVtbl
    CreateInstance*: proc(self: ptr IWICBitmapEncoderInfo, ppIBitmapEncoder: ptr ptr IWICBitmapEncoder): HRESULT {.stdcall.}
  IWICFormatConverter* {.pure.} = object
    lpVtbl*: ptr IWICFormatConverterVtbl
  IWICFormatConverterVtbl* {.pure, inheritable.} = object of IWICBitmapSourceVtbl
    Initialize*: proc(self: ptr IWICFormatConverter, pISource: ptr IWICBitmapSource, dstFormat: REFWICPixelFormatGUID, dither: WICBitmapDitherType, pIPalette: ptr IWICPalette, alphaThresholdPercent: float64, paletteTranslate: WICBitmapPaletteType): HRESULT {.stdcall.}
    CanConvert*: proc(self: ptr IWICFormatConverter, srcPixelFormat: REFWICPixelFormatGUID, dstPixelFormat: REFWICPixelFormatGUID, pfCanConvert: ptr WINBOOL): HRESULT {.stdcall.}
  IWICFormatConverterInfo* {.pure.} = object
    lpVtbl*: ptr IWICFormatConverterInfoVtbl
  IWICFormatConverterInfoVtbl* {.pure, inheritable.} = object of IWICComponentInfoVtbl
    GetPixelFormats*: proc(self: ptr IWICFormatConverterInfo, cFormats: UINT, pPixelFormatGUIDs: ptr WICPixelFormatGUID, pcActual: ptr UINT): HRESULT {.stdcall.}
    CreateInstance*: proc(self: ptr IWICFormatConverterInfo, ppIConverter: ptr ptr IWICFormatConverter): HRESULT {.stdcall.}
  IWICStream* {.pure.} = object
    lpVtbl*: ptr IWICStreamVtbl
  IWICStreamVtbl* {.pure, inheritable.} = object of IStreamVtbl
    InitializeFromIStream*: proc(self: ptr IWICStream, pIStream: ptr IStream): HRESULT {.stdcall.}
    InitializeFromFilename*: proc(self: ptr IWICStream, wzFileName: LPCWSTR, dwAccessMode: DWORD): HRESULT {.stdcall.}
    InitializeFromMemory*: proc(self: ptr IWICStream, pbBuffer: ptr BYTE, cbBufferSize: DWORD): HRESULT {.stdcall.}
    InitializeFromIStreamRegion*: proc(self: ptr IWICStream, pIStream: ptr IStream, ulOffset: ULARGE_INTEGER, ulMaxSize: ULARGE_INTEGER): HRESULT {.stdcall.}
  IWICBitmapScaler* {.pure.} = object
    lpVtbl*: ptr IWICBitmapScalerVtbl
  IWICBitmapScalerVtbl* {.pure, inheritable.} = object of IWICBitmapSourceVtbl
    Initialize*: proc(self: ptr IWICBitmapScaler, pISource: ptr IWICBitmapSource, uiWidth: UINT, uiHeight: UINT, mode: WICBitmapInterpolationMode): HRESULT {.stdcall.}
  IWICBitmapClipper* {.pure.} = object
    lpVtbl*: ptr IWICBitmapClipperVtbl
  IWICBitmapClipperVtbl* {.pure, inheritable.} = object of IWICBitmapSourceVtbl
    Initialize*: proc(self: ptr IWICBitmapClipper, pISource: ptr IWICBitmapSource, prc: ptr WICRect): HRESULT {.stdcall.}
  IWICColorTransform* {.pure.} = object
    lpVtbl*: ptr IWICColorTransformVtbl
  IWICColorTransformVtbl* {.pure, inheritable.} = object of IWICBitmapSourceVtbl
    Initialize*: proc(self: ptr IWICColorTransform, pIBitmapSource: ptr IWICBitmapSource, pIContextSource: ptr IWICColorContext, pIContextDest: ptr IWICColorContext, pixelFmtDest: REFWICPixelFormatGUID): HRESULT {.stdcall.}
  IWICFastMetadataEncoder* {.pure.} = object
    lpVtbl*: ptr IWICFastMetadataEncoderVtbl
  IWICFastMetadataEncoderVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Commit*: proc(self: ptr IWICFastMetadataEncoder): HRESULT {.stdcall.}
    GetMetadataQueryWriter*: proc(self: ptr IWICFastMetadataEncoder, ppIMetadataQueryWriter: ptr ptr IWICMetadataQueryWriter): HRESULT {.stdcall.}
  IWICImagingFactory* {.pure.} = object
    lpVtbl*: ptr IWICImagingFactoryVtbl
  IWICImagingFactoryVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    CreateDecoderFromFilename*: proc(self: ptr IWICImagingFactory, wzFilename: LPCWSTR, pguidVendor: ptr GUID, dwDesiredAccess: DWORD, metadataOptions: WICDecodeOptions, ppIDecoder: ptr ptr IWICBitmapDecoder): HRESULT {.stdcall.}
    CreateDecoderFromStream*: proc(self: ptr IWICImagingFactory, pIStream: ptr IStream, pguidVendor: ptr GUID, metadataOptions: WICDecodeOptions, ppIDecoder: ptr ptr IWICBitmapDecoder): HRESULT {.stdcall.}
    CreateDecoderFromFileHandle*: proc(self: ptr IWICImagingFactory, hFile: ULONG_PTR, pguidVendor: ptr GUID, metadataOptions: WICDecodeOptions, ppIDecoder: ptr ptr IWICBitmapDecoder): HRESULT {.stdcall.}
    CreateComponentInfo*: proc(self: ptr IWICImagingFactory, clsidComponent: REFCLSID, ppIInfo: ptr ptr IWICComponentInfo): HRESULT {.stdcall.}
    CreateDecoder*: proc(self: ptr IWICImagingFactory, guidContainerFormat: REFGUID, pguidVendor: ptr GUID, ppIDecoder: ptr ptr IWICBitmapDecoder): HRESULT {.stdcall.}
    CreateEncoder*: proc(self: ptr IWICImagingFactory, guidContainerFormat: REFGUID, pguidVendor: ptr GUID, ppIEncoder: ptr ptr IWICBitmapEncoder): HRESULT {.stdcall.}
    CreatePalette*: proc(self: ptr IWICImagingFactory, ppIPalette: ptr ptr IWICPalette): HRESULT {.stdcall.}
    CreateFormatConverter*: proc(self: ptr IWICImagingFactory, ppIFormatConverter: ptr ptr IWICFormatConverter): HRESULT {.stdcall.}
    CreateBitmapScaler*: proc(self: ptr IWICImagingFactory, ppIBitmapScaler: ptr ptr IWICBitmapScaler): HRESULT {.stdcall.}
    CreateBitmapClipper*: proc(self: ptr IWICImagingFactory, ppIBitmapClipper: ptr ptr IWICBitmapClipper): HRESULT {.stdcall.}
    CreateBitmapFlipRotator*: proc(self: ptr IWICImagingFactory, ppIBitmapFlipRotator: ptr ptr IWICBitmapFlipRotator): HRESULT {.stdcall.}
    CreateStream*: proc(self: ptr IWICImagingFactory, ppIWICStream: ptr ptr IWICStream): HRESULT {.stdcall.}
    CreateColorContext*: proc(self: ptr IWICImagingFactory, ppIWICColorContext: ptr ptr IWICColorContext): HRESULT {.stdcall.}
    CreateColorTransformer*: proc(self: ptr IWICImagingFactory, ppIWICColorTransform: ptr ptr IWICColorTransform): HRESULT {.stdcall.}
    CreateBitmap*: proc(self: ptr IWICImagingFactory, uiWidth: UINT, uiHeight: UINT, pixelFormat: REFWICPixelFormatGUID, option: WICBitmapCreateCacheOption, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.stdcall.}
    CreateBitmapFromSource*: proc(self: ptr IWICImagingFactory, piBitmapSource: ptr IWICBitmapSource, option: WICBitmapCreateCacheOption, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.stdcall.}
    CreateBitmapFromSourceRect*: proc(self: ptr IWICImagingFactory, piBitmapSource: ptr IWICBitmapSource, x: UINT, y: UINT, width: UINT, height: UINT, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.stdcall.}
    CreateBitmapFromMemory*: proc(self: ptr IWICImagingFactory, uiWidth: UINT, uiHeight: UINT, pixelFormat: REFWICPixelFormatGUID, cbStride: UINT, cbBufferSize: UINT, pbBuffer: ptr BYTE, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.stdcall.}
    CreateBitmapFromHBITMAP*: proc(self: ptr IWICImagingFactory, hBitmap: HBITMAP, hPalette: HPALETTE, options: WICBitmapAlphaChannelOption, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.stdcall.}
    CreateBitmapFromHICON*: proc(self: ptr IWICImagingFactory, hIcon: HICON, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.stdcall.}
    CreateComponentEnumerator*: proc(self: ptr IWICImagingFactory, componentTypes: DWORD, options: DWORD, ppIEnumUnknown: ptr ptr IEnumUnknown): HRESULT {.stdcall.}
    CreateFastMetadataEncoderFromDecoder*: proc(self: ptr IWICImagingFactory, pIDecoder: ptr IWICBitmapDecoder, ppIFastEncoder: ptr ptr IWICFastMetadataEncoder): HRESULT {.stdcall.}
    CreateFastMetadataEncoderFromFrameDecode*: proc(self: ptr IWICImagingFactory, pIFrameDecoder: ptr IWICBitmapFrameDecode, ppIFastEncoder: ptr ptr IWICFastMetadataEncoder): HRESULT {.stdcall.}
    CreateQueryWriter*: proc(self: ptr IWICImagingFactory, guidMetadataFormat: REFGUID, pguidVendor: ptr GUID, ppIQueryWriter: ptr ptr IWICMetadataQueryWriter): HRESULT {.stdcall.}
    CreateQueryWriterFromReader*: proc(self: ptr IWICImagingFactory, pIQueryReader: ptr IWICMetadataQueryReader, pguidVendor: ptr GUID, ppIQueryWriter: ptr ptr IWICMetadataQueryWriter): HRESULT {.stdcall.}
  IWICEnumMetadataItem* {.pure.} = object
    lpVtbl*: ptr IWICEnumMetadataItemVtbl
  IWICEnumMetadataItemVtbl* {.pure, inheritable.} = object of IUnknownVtbl
    Next*: proc(self: ptr IWICEnumMetadataItem, celt: ULONG, rgeltSchema: ptr PROPVARIANT, rgeltId: ptr PROPVARIANT, rgeltValue: ptr PROPVARIANT, pceltFetched: ptr ULONG): HRESULT {.stdcall.}
    Skip*: proc(self: ptr IWICEnumMetadataItem, celt: ULONG): HRESULT {.stdcall.}
    Reset*: proc(self: ptr IWICEnumMetadataItem): HRESULT {.stdcall.}
    Clone*: proc(self: ptr IWICEnumMetadataItem, ppIEnumMetadataItem: ptr ptr IWICEnumMetadataItem): HRESULT {.stdcall.}
proc InitializeFromFilename*(self: ptr IWICColorContext, wzFilename: LPCWSTR): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializeFromFilename(self, wzFilename)
proc InitializeFromMemory*(self: ptr IWICColorContext, pbBuffer: ptr BYTE, cbBufferSize: UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializeFromMemory(self, pbBuffer, cbBufferSize)
proc InitializeFromExifColorSpace*(self: ptr IWICColorContext, value: UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializeFromExifColorSpace(self, value)
proc GetType*(self: ptr IWICColorContext, pType: ptr WICColorContextType): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetType(self, pType)
proc GetProfileBytes*(self: ptr IWICColorContext, cbBuffer: UINT, pbBuffer: ptr BYTE, pcbActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetProfileBytes(self, cbBuffer, pbBuffer, pcbActual)
proc GetExifColorSpace*(self: ptr IWICColorContext, pValue: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetExifColorSpace(self, pValue)
proc GetSize*(self: ptr IWICBitmapSource, puiWidth: ptr UINT, puiHeight: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetSize(self, puiWidth, puiHeight)
proc GetPixelFormat*(self: ptr IWICBitmapSource, pPixelFormat: ptr WICPixelFormatGUID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetPixelFormat(self, pPixelFormat)
proc GetResolution*(self: ptr IWICBitmapSource, pDpiX: ptr float64, pDpiY: ptr float64): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetResolution(self, pDpiX, pDpiY)
proc CopyPalette*(self: ptr IWICBitmapSource, pIPalette: ptr IWICPalette): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CopyPalette(self, pIPalette)
proc CopyPixels*(self: ptr IWICBitmapSource, prc: ptr WICRect, cbStride: UINT, cbBufferSize: UINT, pbBuffer: ptr BYTE): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CopyPixels(self, prc, cbStride, cbBufferSize, pbBuffer)
proc GetSize*(self: ptr IWICBitmapLock, pWidth: ptr UINT, pHeight: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetSize(self, pWidth, pHeight)
proc GetStride*(self: ptr IWICBitmapLock, pcbStride: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetStride(self, pcbStride)
proc GetDataPointer*(self: ptr IWICBitmapLock, pcbBufferSize: ptr UINT, ppbData: ptr ptr BYTE): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetDataPointer(self, pcbBufferSize, ppbData)
proc GetPixelFormat*(self: ptr IWICBitmapLock, pPixelFormat: ptr WICPixelFormatGUID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetPixelFormat(self, pPixelFormat)
proc Initialize*(self: ptr IWICBitmapFlipRotator, pISource: ptr IWICBitmapSource, options: WICBitmapTransformOptions): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Initialize(self, pISource, options)
proc Lock*(self: ptr IWICBitmap, prcLock: ptr WICRect, flags: DWORD, ppILock: ptr ptr IWICBitmapLock): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Lock(self, prcLock, flags, ppILock)
proc SetPalette*(self: ptr IWICBitmap, pIPalette: ptr IWICPalette): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetPalette(self, pIPalette)
proc SetResolution*(self: ptr IWICBitmap, dpiX: float64, dpiY: float64): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetResolution(self, dpiX, dpiY)
proc InitializePredefined*(self: ptr IWICPalette, ePaletteType: WICBitmapPaletteType, fAddTransparentColor: WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializePredefined(self, ePaletteType, fAddTransparentColor)
proc InitializeCustom*(self: ptr IWICPalette, pColors: ptr WICColor, colorCount: UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializeCustom(self, pColors, colorCount)
proc InitializeFromBitmap*(self: ptr IWICPalette, pISurface: ptr IWICBitmapSource, colorCount: UINT, fAddTransparentColor: WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializeFromBitmap(self, pISurface, colorCount, fAddTransparentColor)
proc InitializeFromPalette*(self: ptr IWICPalette, pIPalette: ptr IWICPalette): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializeFromPalette(self, pIPalette)
proc GetType*(self: ptr IWICPalette, pePaletteType: ptr WICBitmapPaletteType): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetType(self, pePaletteType)
proc GetColorCount*(self: ptr IWICPalette, pcCount: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetColorCount(self, pcCount)
proc GetColors*(self: ptr IWICPalette, colorCount: UINT, pColors: ptr WICColor, pcActualColors: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetColors(self, colorCount, pColors, pcActualColors)
proc IsBlackWhite*(self: ptr IWICPalette, pfIsBlackWhite: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.IsBlackWhite(self, pfIsBlackWhite)
proc IsGrayscale*(self: ptr IWICPalette, pfIsGrayscale: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.IsGrayscale(self, pfIsGrayscale)
proc HasAlpha*(self: ptr IWICPalette, pfHasAlpha: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.HasAlpha(self, pfHasAlpha)
proc GetComponentType*(self: ptr IWICComponentInfo, pType: ptr WICComponentType): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetComponentType(self, pType)
proc GetCLSID*(self: ptr IWICComponentInfo, pclsid: ptr CLSID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetCLSID(self, pclsid)
proc GetSigningStatus*(self: ptr IWICComponentInfo, pStatus: ptr DWORD): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetSigningStatus(self, pStatus)
proc GetAuthor*(self: ptr IWICComponentInfo, cchAuthor: UINT, wzAuthor: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetAuthor(self, cchAuthor, wzAuthor, pcchActual)
proc GetVendorGUID*(self: ptr IWICComponentInfo, pguidVendor: ptr GUID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetVendorGUID(self, pguidVendor)
proc GetVersion*(self: ptr IWICComponentInfo, cchVersion: UINT, wzVersion: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetVersion(self, cchVersion, wzVersion, pcchActual)
proc GetSpecVersion*(self: ptr IWICComponentInfo, cchSpecVersion: UINT, wzSpecVersion: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetSpecVersion(self, cchSpecVersion, wzSpecVersion, pcchActual)
proc GetFriendlyName*(self: ptr IWICComponentInfo, cchFriendlyName: UINT, wzFriendlyName: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetFriendlyName(self, cchFriendlyName, wzFriendlyName, pcchActual)
proc GetContainerFormat*(self: ptr IWICMetadataQueryReader, pguidContainerFormat: ptr GUID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetContainerFormat(self, pguidContainerFormat)
proc GetLocation*(self: ptr IWICMetadataQueryReader, cchMaxLength: UINT, wzNamespace: ptr WCHAR, pcchActualLength: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetLocation(self, cchMaxLength, wzNamespace, pcchActualLength)
proc GetMetadataByName*(self: ptr IWICMetadataQueryReader, wzName: LPCWSTR, pvarValue: ptr PROPVARIANT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetMetadataByName(self, wzName, pvarValue)
proc GetEnumerator*(self: ptr IWICMetadataQueryReader, ppIEnumString: ptr ptr IEnumString): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetEnumerator(self, ppIEnumString)
proc SetMetadataByName*(self: ptr IWICMetadataQueryWriter, wzName: LPCWSTR, pvarValue: ptr PROPVARIANT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetMetadataByName(self, wzName, pvarValue)
proc RemoveMetadataByName*(self: ptr IWICMetadataQueryWriter, wzName: LPCWSTR): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.RemoveMetadataByName(self, wzName)
proc GetMetadataQueryReader*(self: ptr IWICBitmapFrameDecode, ppIMetadataQueryReader: ptr ptr IWICMetadataQueryReader): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetMetadataQueryReader(self, ppIMetadataQueryReader)
proc GetColorContexts*(self: ptr IWICBitmapFrameDecode, cCount: UINT, ppIColorContexts: ptr ptr IWICColorContext, pcActualCount: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetColorContexts(self, cCount, ppIColorContexts, pcActualCount)
proc GetThumbnail*(self: ptr IWICBitmapFrameDecode, ppIThumbnail: ptr ptr IWICBitmapSource): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetThumbnail(self, ppIThumbnail)
proc GetFormatGUID*(self: ptr IWICPixelFormatInfo, pFormat: ptr GUID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetFormatGUID(self, pFormat)
proc GetColorContext*(self: ptr IWICPixelFormatInfo, ppIColorContext: ptr ptr IWICColorContext): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetColorContext(self, ppIColorContext)
proc GetBitsPerPixel*(self: ptr IWICPixelFormatInfo, puiBitsPerPixel: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetBitsPerPixel(self, puiBitsPerPixel)
proc GetChannelCount*(self: ptr IWICPixelFormatInfo, puiChannelCount: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetChannelCount(self, puiChannelCount)
proc GetChannelMask*(self: ptr IWICPixelFormatInfo, uiChannelIndex: UINT, cbMaskBuffer: UINT, pbMaskBuffer: ptr BYTE, pcbActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetChannelMask(self, uiChannelIndex, cbMaskBuffer, pbMaskBuffer, pcbActual)
proc SupportsTransparency*(self: ptr IWICPixelFormatInfo2, pfSupportsTransparency: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SupportsTransparency(self, pfSupportsTransparency)
proc GetNumericRepresentation*(self: ptr IWICPixelFormatInfo2, pNumericRepresentation: ptr WICPixelFormatNumericRepresentation): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetNumericRepresentation(self, pNumericRepresentation)
proc GetContainerFormat*(self: ptr IWICBitmapCodecInfo, pguidContainerFormat: ptr GUID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetContainerFormat(self, pguidContainerFormat)
proc GetPixelFormats*(self: ptr IWICBitmapCodecInfo, cFormats: UINT, pguidPixelFormats: ptr GUID, pcActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetPixelFormats(self, cFormats, pguidPixelFormats, pcActual)
proc GetColorManagementVersion*(self: ptr IWICBitmapCodecInfo, cchColorManagementVersion: UINT, wzColorManagementVersion: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetColorManagementVersion(self, cchColorManagementVersion, wzColorManagementVersion, pcchActual)
proc GetDeviceManufacturer*(self: ptr IWICBitmapCodecInfo, cchDeviceManufacturer: UINT, wzDeviceManufacturer: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetDeviceManufacturer(self, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual)
proc GetDeviceModels*(self: ptr IWICBitmapCodecInfo, cchDeviceModels: UINT, wzDeviceModels: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetDeviceModels(self, cchDeviceModels, wzDeviceModels, pcchActual)
proc GetMimeTypes*(self: ptr IWICBitmapCodecInfo, cchMimeTypes: UINT, wzMimeTypes: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetMimeTypes(self, cchMimeTypes, wzMimeTypes, pcchActual)
proc GetFileExtensions*(self: ptr IWICBitmapCodecInfo, cchFileExtensions: UINT, wzFileExtensions: ptr WCHAR, pcchActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetFileExtensions(self, cchFileExtensions, wzFileExtensions, pcchActual)
proc DoesSupportAnimation*(self: ptr IWICBitmapCodecInfo, pfSupportAnimation: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.DoesSupportAnimation(self, pfSupportAnimation)
proc DoesSupportChromaKey*(self: ptr IWICBitmapCodecInfo, pfSupportChromaKey: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.DoesSupportChromaKey(self, pfSupportChromaKey)
proc DoesSupportLossless*(self: ptr IWICBitmapCodecInfo, pfSupportLossless: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.DoesSupportLossless(self, pfSupportLossless)
proc DoesSupportMultiframe*(self: ptr IWICBitmapCodecInfo, pfSupportMultiframe: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.DoesSupportMultiframe(self, pfSupportMultiframe)
proc MatchesMimeType*(self: ptr IWICBitmapCodecInfo, wzMimeType: LPCWSTR, pfMatches: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.MatchesMimeType(self, wzMimeType, pfMatches)
proc GetPatterns*(self: ptr IWICBitmapDecoderInfo, cbSizePatterns: UINT, pPatterns: ptr WICBitmapPattern, pcPatterns: ptr UINT, pcbPatternsActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetPatterns(self, cbSizePatterns, pPatterns, pcPatterns, pcbPatternsActual)
proc MatchesPattern*(self: ptr IWICBitmapDecoderInfo, pIStream: ptr IStream, pfMatches: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.MatchesPattern(self, pIStream, pfMatches)
proc CreateInstance*(self: ptr IWICBitmapDecoderInfo, ppIBitmapDecoder: ptr ptr IWICBitmapDecoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateInstance(self, ppIBitmapDecoder)
proc QueryCapability*(self: ptr IWICBitmapDecoder, pIStream: ptr IStream, pdwCapability: ptr DWORD): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.QueryCapability(self, pIStream, pdwCapability)
proc Initialize*(self: ptr IWICBitmapDecoder, pIStream: ptr IStream, cacheOptions: WICDecodeOptions): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Initialize(self, pIStream, cacheOptions)
proc GetContainerFormat*(self: ptr IWICBitmapDecoder, pguidContainerFormat: ptr GUID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetContainerFormat(self, pguidContainerFormat)
proc GetDecoderInfo*(self: ptr IWICBitmapDecoder, ppIDecoderInfo: ptr ptr IWICBitmapDecoderInfo): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetDecoderInfo(self, ppIDecoderInfo)
proc CopyPalette*(self: ptr IWICBitmapDecoder, pIPalette: ptr IWICPalette): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CopyPalette(self, pIPalette)
proc GetMetadataQueryReader*(self: ptr IWICBitmapDecoder, ppIMetadataQueryReader: ptr ptr IWICMetadataQueryReader): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetMetadataQueryReader(self, ppIMetadataQueryReader)
proc GetPreview*(self: ptr IWICBitmapDecoder, ppIBitmapSource: ptr ptr IWICBitmapSource): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetPreview(self, ppIBitmapSource)
proc GetColorContexts*(self: ptr IWICBitmapDecoder, cCount: UINT, ppIColorContexts: ptr ptr IWICColorContext, pcActualCount: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetColorContexts(self, cCount, ppIColorContexts, pcActualCount)
proc GetThumbnail*(self: ptr IWICBitmapDecoder, ppIThumbnail: ptr ptr IWICBitmapSource): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetThumbnail(self, ppIThumbnail)
proc GetFrameCount*(self: ptr IWICBitmapDecoder, pCount: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetFrameCount(self, pCount)
proc GetFrame*(self: ptr IWICBitmapDecoder, index: UINT, ppIBitmapFrame: ptr ptr IWICBitmapFrameDecode): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetFrame(self, index, ppIBitmapFrame)
proc Initialize*(self: ptr IWICBitmapFrameEncode, pIEncoderOptions: ptr IPropertyBag2): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Initialize(self, pIEncoderOptions)
proc SetSize*(self: ptr IWICBitmapFrameEncode, uiWidth: UINT, uiHeight: UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetSize(self, uiWidth, uiHeight)
proc SetResolution*(self: ptr IWICBitmapFrameEncode, dpiX: float64, dpiY: float64): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetResolution(self, dpiX, dpiY)
proc SetPixelFormat*(self: ptr IWICBitmapFrameEncode, pPixelFormat: ptr WICPixelFormatGUID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetPixelFormat(self, pPixelFormat)
proc SetColorContexts*(self: ptr IWICBitmapFrameEncode, cCount: UINT, ppIColorContext: ptr ptr IWICColorContext): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetColorContexts(self, cCount, ppIColorContext)
proc SetPalette*(self: ptr IWICBitmapFrameEncode, pIPalette: ptr IWICPalette): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetPalette(self, pIPalette)
proc SetThumbnail*(self: ptr IWICBitmapFrameEncode, pIThumbnail: ptr IWICBitmapSource): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetThumbnail(self, pIThumbnail)
proc WritePixels*(self: ptr IWICBitmapFrameEncode, lineCount: UINT, cbStride: UINT, cbBufferSize: UINT, pbPixels: ptr BYTE): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.WritePixels(self, lineCount, cbStride, cbBufferSize, pbPixels)
proc WriteSource*(self: ptr IWICBitmapFrameEncode, pIBitmapSource: ptr IWICBitmapSource, prc: ptr WICRect): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.WriteSource(self, pIBitmapSource, prc)
proc Commit*(self: ptr IWICBitmapFrameEncode): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Commit(self)
proc GetMetadataQueryWriter*(self: ptr IWICBitmapFrameEncode, ppIMetadataQueryWriter: ptr ptr IWICMetadataQueryWriter): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetMetadataQueryWriter(self, ppIMetadataQueryWriter)
proc CreateInstance*(self: ptr IWICBitmapEncoderInfo, ppIBitmapEncoder: ptr ptr IWICBitmapEncoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateInstance(self, ppIBitmapEncoder)
proc Initialize*(self: ptr IWICBitmapEncoder, pIStream: ptr IStream, cacheOption: WICBitmapEncoderCacheOption): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Initialize(self, pIStream, cacheOption)
proc GetContainerFormat*(self: ptr IWICBitmapEncoder, pguidContainerFormat: ptr GUID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetContainerFormat(self, pguidContainerFormat)
proc GetEncoderInfo*(self: ptr IWICBitmapEncoder, ppIEncoderInfo: ptr ptr IWICBitmapEncoderInfo): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetEncoderInfo(self, ppIEncoderInfo)
proc SetColorContexts*(self: ptr IWICBitmapEncoder, cCount: UINT, ppIColorContext: ptr ptr IWICColorContext): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetColorContexts(self, cCount, ppIColorContext)
proc SetPalette*(self: ptr IWICBitmapEncoder, pIPalette: ptr IWICPalette): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetPalette(self, pIPalette)
proc SetThumbnail*(self: ptr IWICBitmapEncoder, pIThumbnail: ptr IWICBitmapSource): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetThumbnail(self, pIThumbnail)
proc SetPreview*(self: ptr IWICBitmapEncoder, pIPreview: ptr IWICBitmapSource): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.SetPreview(self, pIPreview)
proc CreateNewFrame*(self: ptr IWICBitmapEncoder, ppIFrameEncode: ptr ptr IWICBitmapFrameEncode, ppIEncoderOptions: ptr ptr IPropertyBag2): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateNewFrame(self, ppIFrameEncode, ppIEncoderOptions)
proc Commit*(self: ptr IWICBitmapEncoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Commit(self)
proc GetMetadataQueryWriter*(self: ptr IWICBitmapEncoder, ppIMetadataQueryWriter: ptr ptr IWICMetadataQueryWriter): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetMetadataQueryWriter(self, ppIMetadataQueryWriter)
proc Initialize*(self: ptr IWICFormatConverter, pISource: ptr IWICBitmapSource, dstFormat: REFWICPixelFormatGUID, dither: WICBitmapDitherType, pIPalette: ptr IWICPalette, alphaThresholdPercent: float64, paletteTranslate: WICBitmapPaletteType): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Initialize(self, pISource, dstFormat, dither, pIPalette, alphaThresholdPercent, paletteTranslate)
proc CanConvert*(self: ptr IWICFormatConverter, srcPixelFormat: REFWICPixelFormatGUID, dstPixelFormat: REFWICPixelFormatGUID, pfCanConvert: ptr WINBOOL): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CanConvert(self, srcPixelFormat, dstPixelFormat, pfCanConvert)
proc GetPixelFormats*(self: ptr IWICFormatConverterInfo, cFormats: UINT, pPixelFormatGUIDs: ptr WICPixelFormatGUID, pcActual: ptr UINT): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetPixelFormats(self, cFormats, pPixelFormatGUIDs, pcActual)
proc CreateInstance*(self: ptr IWICFormatConverterInfo, ppIConverter: ptr ptr IWICFormatConverter): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateInstance(self, ppIConverter)
proc InitializeFromIStream*(self: ptr IWICStream, pIStream: ptr IStream): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializeFromIStream(self, pIStream)
proc InitializeFromFilename*(self: ptr IWICStream, wzFileName: LPCWSTR, dwAccessMode: DWORD): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializeFromFilename(self, wzFileName, dwAccessMode)
proc InitializeFromMemory*(self: ptr IWICStream, pbBuffer: ptr BYTE, cbBufferSize: DWORD): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializeFromMemory(self, pbBuffer, cbBufferSize)
proc InitializeFromIStreamRegion*(self: ptr IWICStream, pIStream: ptr IStream, ulOffset: ULARGE_INTEGER, ulMaxSize: ULARGE_INTEGER): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.InitializeFromIStreamRegion(self, pIStream, ulOffset, ulMaxSize)
proc Initialize*(self: ptr IWICBitmapScaler, pISource: ptr IWICBitmapSource, uiWidth: UINT, uiHeight: UINT, mode: WICBitmapInterpolationMode): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Initialize(self, pISource, uiWidth, uiHeight, mode)
proc Initialize*(self: ptr IWICBitmapClipper, pISource: ptr IWICBitmapSource, prc: ptr WICRect): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Initialize(self, pISource, prc)
proc Initialize*(self: ptr IWICColorTransform, pIBitmapSource: ptr IWICBitmapSource, pIContextSource: ptr IWICColorContext, pIContextDest: ptr IWICColorContext, pixelFmtDest: REFWICPixelFormatGUID): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Initialize(self, pIBitmapSource, pIContextSource, pIContextDest, pixelFmtDest)
proc Commit*(self: ptr IWICFastMetadataEncoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Commit(self)
proc GetMetadataQueryWriter*(self: ptr IWICFastMetadataEncoder, ppIMetadataQueryWriter: ptr ptr IWICMetadataQueryWriter): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.GetMetadataQueryWriter(self, ppIMetadataQueryWriter)
proc CreateDecoderFromFilename*(self: ptr IWICImagingFactory, wzFilename: LPCWSTR, pguidVendor: ptr GUID, dwDesiredAccess: DWORD, metadataOptions: WICDecodeOptions, ppIDecoder: ptr ptr IWICBitmapDecoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateDecoderFromFilename(self, wzFilename, pguidVendor, dwDesiredAccess, metadataOptions, ppIDecoder)
proc CreateDecoderFromStream*(self: ptr IWICImagingFactory, pIStream: ptr IStream, pguidVendor: ptr GUID, metadataOptions: WICDecodeOptions, ppIDecoder: ptr ptr IWICBitmapDecoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateDecoderFromStream(self, pIStream, pguidVendor, metadataOptions, ppIDecoder)
proc CreateDecoderFromFileHandle*(self: ptr IWICImagingFactory, hFile: ULONG_PTR, pguidVendor: ptr GUID, metadataOptions: WICDecodeOptions, ppIDecoder: ptr ptr IWICBitmapDecoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateDecoderFromFileHandle(self, hFile, pguidVendor, metadataOptions, ppIDecoder)
proc CreateComponentInfo*(self: ptr IWICImagingFactory, clsidComponent: REFCLSID, ppIInfo: ptr ptr IWICComponentInfo): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateComponentInfo(self, clsidComponent, ppIInfo)
proc CreateDecoder*(self: ptr IWICImagingFactory, guidContainerFormat: REFGUID, pguidVendor: ptr GUID, ppIDecoder: ptr ptr IWICBitmapDecoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateDecoder(self, guidContainerFormat, pguidVendor, ppIDecoder)
proc CreateEncoder*(self: ptr IWICImagingFactory, guidContainerFormat: REFGUID, pguidVendor: ptr GUID, ppIEncoder: ptr ptr IWICBitmapEncoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateEncoder(self, guidContainerFormat, pguidVendor, ppIEncoder)
proc CreatePalette*(self: ptr IWICImagingFactory, ppIPalette: ptr ptr IWICPalette): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreatePalette(self, ppIPalette)
proc CreateFormatConverter*(self: ptr IWICImagingFactory, ppIFormatConverter: ptr ptr IWICFormatConverter): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateFormatConverter(self, ppIFormatConverter)
proc CreateBitmapScaler*(self: ptr IWICImagingFactory, ppIBitmapScaler: ptr ptr IWICBitmapScaler): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateBitmapScaler(self, ppIBitmapScaler)
proc CreateBitmapClipper*(self: ptr IWICImagingFactory, ppIBitmapClipper: ptr ptr IWICBitmapClipper): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateBitmapClipper(self, ppIBitmapClipper)
proc CreateBitmapFlipRotator*(self: ptr IWICImagingFactory, ppIBitmapFlipRotator: ptr ptr IWICBitmapFlipRotator): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateBitmapFlipRotator(self, ppIBitmapFlipRotator)
proc CreateStream*(self: ptr IWICImagingFactory, ppIWICStream: ptr ptr IWICStream): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateStream(self, ppIWICStream)
proc CreateColorContext*(self: ptr IWICImagingFactory, ppIWICColorContext: ptr ptr IWICColorContext): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateColorContext(self, ppIWICColorContext)
proc CreateColorTransformer*(self: ptr IWICImagingFactory, ppIWICColorTransform: ptr ptr IWICColorTransform): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateColorTransformer(self, ppIWICColorTransform)
proc CreateBitmap*(self: ptr IWICImagingFactory, uiWidth: UINT, uiHeight: UINT, pixelFormat: REFWICPixelFormatGUID, option: WICBitmapCreateCacheOption, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateBitmap(self, uiWidth, uiHeight, pixelFormat, option, ppIBitmap)
proc CreateBitmapFromSource*(self: ptr IWICImagingFactory, piBitmapSource: ptr IWICBitmapSource, option: WICBitmapCreateCacheOption, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateBitmapFromSource(self, piBitmapSource, option, ppIBitmap)
proc CreateBitmapFromSourceRect*(self: ptr IWICImagingFactory, piBitmapSource: ptr IWICBitmapSource, x: UINT, y: UINT, width: UINT, height: UINT, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateBitmapFromSourceRect(self, piBitmapSource, x, y, width, height, ppIBitmap)
proc CreateBitmapFromMemory*(self: ptr IWICImagingFactory, uiWidth: UINT, uiHeight: UINT, pixelFormat: REFWICPixelFormatGUID, cbStride: UINT, cbBufferSize: UINT, pbBuffer: ptr BYTE, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateBitmapFromMemory(self, uiWidth, uiHeight, pixelFormat, cbStride, cbBufferSize, pbBuffer, ppIBitmap)
proc CreateBitmapFromHBITMAP*(self: ptr IWICImagingFactory, hBitmap: HBITMAP, hPalette: HPALETTE, options: WICBitmapAlphaChannelOption, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateBitmapFromHBITMAP(self, hBitmap, hPalette, options, ppIBitmap)
proc CreateBitmapFromHICON*(self: ptr IWICImagingFactory, hIcon: HICON, ppIBitmap: ptr ptr IWICBitmap): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateBitmapFromHICON(self, hIcon, ppIBitmap)
proc CreateComponentEnumerator*(self: ptr IWICImagingFactory, componentTypes: DWORD, options: DWORD, ppIEnumUnknown: ptr ptr IEnumUnknown): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateComponentEnumerator(self, componentTypes, options, ppIEnumUnknown)
proc CreateFastMetadataEncoderFromDecoder*(self: ptr IWICImagingFactory, pIDecoder: ptr IWICBitmapDecoder, ppIFastEncoder: ptr ptr IWICFastMetadataEncoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateFastMetadataEncoderFromDecoder(self, pIDecoder, ppIFastEncoder)
proc CreateFastMetadataEncoderFromFrameDecode*(self: ptr IWICImagingFactory, pIFrameDecoder: ptr IWICBitmapFrameDecode, ppIFastEncoder: ptr ptr IWICFastMetadataEncoder): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateFastMetadataEncoderFromFrameDecode(self, pIFrameDecoder, ppIFastEncoder)
proc CreateQueryWriter*(self: ptr IWICImagingFactory, guidMetadataFormat: REFGUID, pguidVendor: ptr GUID, ppIQueryWriter: ptr ptr IWICMetadataQueryWriter): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateQueryWriter(self, guidMetadataFormat, pguidVendor, ppIQueryWriter)
proc CreateQueryWriterFromReader*(self: ptr IWICImagingFactory, pIQueryReader: ptr IWICMetadataQueryReader, pguidVendor: ptr GUID, ppIQueryWriter: ptr ptr IWICMetadataQueryWriter): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.CreateQueryWriterFromReader(self, pIQueryReader, pguidVendor, ppIQueryWriter)
proc Next*(self: ptr IWICEnumMetadataItem, celt: ULONG, rgeltSchema: ptr PROPVARIANT, rgeltId: ptr PROPVARIANT, rgeltValue: ptr PROPVARIANT, pceltFetched: ptr ULONG): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Next(self, celt, rgeltSchema, rgeltId, rgeltValue, pceltFetched)
proc Skip*(self: ptr IWICEnumMetadataItem, celt: ULONG): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Skip(self, celt)
proc Reset*(self: ptr IWICEnumMetadataItem): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Reset(self)
proc Clone*(self: ptr IWICEnumMetadataItem, ppIEnumMetadataItem: ptr ptr IWICEnumMetadataItem): HRESULT {.winapi, inline.} = {.gcsafe.}: self.lpVtbl.Clone(self, ppIEnumMetadataItem)
converter winimConverterIWICColorContextToIUnknown*(x: ptr IWICColorContext): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapSourceToIUnknown*(x: ptr IWICBitmapSource): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapLockToIUnknown*(x: ptr IWICBitmapLock): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapFlipRotatorToIWICBitmapSource*(x: ptr IWICBitmapFlipRotator): ptr IWICBitmapSource = cast[ptr IWICBitmapSource](x)
converter winimConverterIWICBitmapFlipRotatorToIUnknown*(x: ptr IWICBitmapFlipRotator): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapToIWICBitmapSource*(x: ptr IWICBitmap): ptr IWICBitmapSource = cast[ptr IWICBitmapSource](x)
converter winimConverterIWICBitmapToIUnknown*(x: ptr IWICBitmap): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICPaletteToIUnknown*(x: ptr IWICPalette): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICComponentInfoToIUnknown*(x: ptr IWICComponentInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICMetadataQueryReaderToIUnknown*(x: ptr IWICMetadataQueryReader): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICMetadataQueryWriterToIWICMetadataQueryReader*(x: ptr IWICMetadataQueryWriter): ptr IWICMetadataQueryReader = cast[ptr IWICMetadataQueryReader](x)
converter winimConverterIWICMetadataQueryWriterToIUnknown*(x: ptr IWICMetadataQueryWriter): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapFrameDecodeToIWICBitmapSource*(x: ptr IWICBitmapFrameDecode): ptr IWICBitmapSource = cast[ptr IWICBitmapSource](x)
converter winimConverterIWICBitmapFrameDecodeToIUnknown*(x: ptr IWICBitmapFrameDecode): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICPixelFormatInfoToIWICComponentInfo*(x: ptr IWICPixelFormatInfo): ptr IWICComponentInfo = cast[ptr IWICComponentInfo](x)
converter winimConverterIWICPixelFormatInfoToIUnknown*(x: ptr IWICPixelFormatInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICPixelFormatInfo2ToIWICPixelFormatInfo*(x: ptr IWICPixelFormatInfo2): ptr IWICPixelFormatInfo = cast[ptr IWICPixelFormatInfo](x)
converter winimConverterIWICPixelFormatInfo2ToIWICComponentInfo*(x: ptr IWICPixelFormatInfo2): ptr IWICComponentInfo = cast[ptr IWICComponentInfo](x)
converter winimConverterIWICPixelFormatInfo2ToIUnknown*(x: ptr IWICPixelFormatInfo2): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapCodecInfoToIWICComponentInfo*(x: ptr IWICBitmapCodecInfo): ptr IWICComponentInfo = cast[ptr IWICComponentInfo](x)
converter winimConverterIWICBitmapCodecInfoToIUnknown*(x: ptr IWICBitmapCodecInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapDecoderInfoToIWICBitmapCodecInfo*(x: ptr IWICBitmapDecoderInfo): ptr IWICBitmapCodecInfo = cast[ptr IWICBitmapCodecInfo](x)
converter winimConverterIWICBitmapDecoderInfoToIWICComponentInfo*(x: ptr IWICBitmapDecoderInfo): ptr IWICComponentInfo = cast[ptr IWICComponentInfo](x)
converter winimConverterIWICBitmapDecoderInfoToIUnknown*(x: ptr IWICBitmapDecoderInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapDecoderToIUnknown*(x: ptr IWICBitmapDecoder): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapFrameEncodeToIUnknown*(x: ptr IWICBitmapFrameEncode): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapEncoderInfoToIWICBitmapCodecInfo*(x: ptr IWICBitmapEncoderInfo): ptr IWICBitmapCodecInfo = cast[ptr IWICBitmapCodecInfo](x)
converter winimConverterIWICBitmapEncoderInfoToIWICComponentInfo*(x: ptr IWICBitmapEncoderInfo): ptr IWICComponentInfo = cast[ptr IWICComponentInfo](x)
converter winimConverterIWICBitmapEncoderInfoToIUnknown*(x: ptr IWICBitmapEncoderInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapEncoderToIUnknown*(x: ptr IWICBitmapEncoder): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICFormatConverterToIWICBitmapSource*(x: ptr IWICFormatConverter): ptr IWICBitmapSource = cast[ptr IWICBitmapSource](x)
converter winimConverterIWICFormatConverterToIUnknown*(x: ptr IWICFormatConverter): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICFormatConverterInfoToIWICComponentInfo*(x: ptr IWICFormatConverterInfo): ptr IWICComponentInfo = cast[ptr IWICComponentInfo](x)
converter winimConverterIWICFormatConverterInfoToIUnknown*(x: ptr IWICFormatConverterInfo): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICStreamToIStream*(x: ptr IWICStream): ptr IStream = cast[ptr IStream](x)
converter winimConverterIWICStreamToISequentialStream*(x: ptr IWICStream): ptr ISequentialStream = cast[ptr ISequentialStream](x)
converter winimConverterIWICStreamToIUnknown*(x: ptr IWICStream): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapScalerToIWICBitmapSource*(x: ptr IWICBitmapScaler): ptr IWICBitmapSource = cast[ptr IWICBitmapSource](x)
converter winimConverterIWICBitmapScalerToIUnknown*(x: ptr IWICBitmapScaler): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICBitmapClipperToIWICBitmapSource*(x: ptr IWICBitmapClipper): ptr IWICBitmapSource = cast[ptr IWICBitmapSource](x)
converter winimConverterIWICBitmapClipperToIUnknown*(x: ptr IWICBitmapClipper): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICColorTransformToIWICBitmapSource*(x: ptr IWICColorTransform): ptr IWICBitmapSource = cast[ptr IWICBitmapSource](x)
converter winimConverterIWICColorTransformToIUnknown*(x: ptr IWICColorTransform): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICFastMetadataEncoderToIUnknown*(x: ptr IWICFastMetadataEncoder): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICImagingFactoryToIUnknown*(x: ptr IWICImagingFactory): ptr IUnknown = cast[ptr IUnknown](x)
converter winimConverterIWICEnumMetadataItemToIUnknown*(x: ptr IWICEnumMetadataItem): ptr IUnknown = cast[ptr IUnknown](x)
