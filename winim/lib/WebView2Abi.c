/*
 * ABI glue for WebView2LoaderStatic*.lib when the application is linked by
 * a non-MSVC compiler.  The Microsoft static loader is otherwise independent
 * of the MSVC CRT; these symbols bridge the small ABI surface it expects to
 * Win32 and the non-MSVC CRT already used by the application.
 *
 * This source is compiled once for each target architecture.  The ABI glue
 * is deliberately selected at compile time because the TLS layout, symbol
 * decoration, calling convention, and assembly registers differ between
 * x86 and x64.
 */

#define _WIN32_WINNT 0x0600

#if defined(__i386__) || defined(_M_IX86)
#define WEBVIEW2_X86 1
#define WEBVIEW2_X64 0
#elif defined(__x86_64__) || defined(_M_X64)
#define WEBVIEW2_X86 0
#define WEBVIEW2_X64 1
#else
#error Unsupported WebView2 non-MSVC bridge architecture
#endif

#include <windows.h>
#if WEBVIEW2_X86
#include <intrin.h>
#endif
#include <stdint.h>
#include <stdio.h>

static SRWLOCK webview2_init_lock = SRWLOCK_INIT;
static CONDITION_VARIABLE webview2_init_condition = CONDITION_VARIABLE_INIT;

#if WEBVIEW2_X64
int32_t webview2_init_global_epoch __asm__("_Init_global_epoch") = 0;
#if defined(__TINYC__)
unsigned long webview2_tls_index __asm__("_tls_index") = 0;
#else
extern unsigned long webview2_tls_index __asm__("_tls_index");
#endif

static int32_t *webview2_init_thread_epoch_slot(void) {
  PVOID *tls = (PVOID *)(uintptr_t)__readgsqword(0x58);
  return (int32_t *)((unsigned char *)tls[webview2_tls_index] + 8);
}

uintptr_t webview2_security_cookie __asm__("__security_cookie") =
    UINT64_C(0x2B992DDFA232);
uintptr_t webview2_security_cookie_complement
    __asm__("__security_cookie_complement") = UINT64_C(0xFFFFD466D2205DCD);
#else
int32_t webview2_init_global_epoch __asm__("__Init_global_epoch") = 0;
#if defined(__TINYC__)
unsigned long webview2_tls_index __asm__("__tls_index") = 0;
#else
extern unsigned long webview2_tls_index __asm__("__tls_index");
#endif

static int32_t *webview2_init_thread_epoch_slot(void) {
  PVOID *tls = (PVOID *)(uintptr_t)__readfsdword(0x2C);
  return (int32_t *)((unsigned char *)tls[webview2_tls_index] + 4);
}

#if defined(__TINYC__)
/* TCC emits the explicit asm label verbatim in its ELF object. */
uintptr_t webview2_security_cookie __asm__("__security_cookie") =
    UINT32_C(0xBB40E64E);
uintptr_t webview2_security_cookie_complement
    __asm__("__security_cookie_complement") = UINT32_C(0x44BF19B1);
#else
uintptr_t webview2_security_cookie __asm__("___security_cookie") =
    UINT32_C(0xBB40E64E);
uintptr_t webview2_security_cookie_complement
    __asm__("___security_cookie_complement") = UINT32_C(0x44BF19B1);
#endif
#endif

#if WEBVIEW2_X64
void webview2_init_thread_header(int32_t *location)
    __asm__("_Init_thread_header");
void webview2_init_thread_footer(int32_t *location)
    __asm__("_Init_thread_footer");
void webview2_init_thread_abort(int32_t *location)
    __asm__("_Init_thread_abort");
#else
#if defined(__TINYC__)
void webview2_init_thread_header(int32_t *location)
    __asm__("_Init_thread_header");
void webview2_init_thread_footer(int32_t *location)
    __asm__("_Init_thread_footer");
void webview2_init_thread_abort(int32_t *location)
    __asm__("_Init_thread_abort");
#else
void webview2_init_thread_header(int32_t *location)
    __asm__("__Init_thread_header");
void webview2_init_thread_footer(int32_t *location)
    __asm__("__Init_thread_footer");
void webview2_init_thread_abort(int32_t *location)
    __asm__("__Init_thread_abort");
#endif
#endif

void webview2_init_thread_header(int32_t *location) {
  AcquireSRWLockExclusive(&webview2_init_lock);
  while (*location == -1) {
    SleepConditionVariableSRW(
        &webview2_init_condition, &webview2_init_lock, INFINITE, 0);
  }
  if (*location == 0) {
    *location = -1;
  }
  ReleaseSRWLockExclusive(&webview2_init_lock);
}

void webview2_init_thread_footer(int32_t *location) {
  AcquireSRWLockExclusive(&webview2_init_lock);
  ++webview2_init_global_epoch;
  *location = webview2_init_global_epoch;
  *webview2_init_thread_epoch_slot() = webview2_init_global_epoch;
  ReleaseSRWLockExclusive(&webview2_init_lock);
  WakeAllConditionVariable(&webview2_init_condition);
}

void webview2_init_thread_abort(int32_t *location) {
  AcquireSRWLockExclusive(&webview2_init_lock);
  *location = 0;
  ReleaseSRWLockExclusive(&webview2_init_lock);
  WakeAllConditionVariable(&webview2_init_condition);
}

static __attribute__((noreturn)) void webview2_bridge_abort(void) {
  fputs("WebView2 non-MSVC bridge: security failure\n", stderr);
  fflush(stderr);
  ExitProcess(0xC0000409u);
  for (;;) {
  }
}

#if WEBVIEW2_X64
void webview2_security_check_cookie(uintptr_t cookie)
    __asm__("__security_check_cookie");
void webview2_security_check_cookie(uintptr_t cookie) {
  extern uintptr_t webview2_security_cookie __asm__("__security_cookie");
  if (cookie != webview2_security_cookie) {
    webview2_bridge_abort();
  }
}
#else
void __attribute__((stdcall)) webview2_security_check_cookie_impl(
    uintptr_t cookie) {
  if (cookie != webview2_security_cookie) {
    webview2_bridge_abort();
  }
}

/* MSVC x86 names this __security_check_cookie stdcall symbol with @4. */
#if defined(__TINYC__)
void __attribute__((stdcall)) webview2_security_check_cookie(
    uintptr_t cookie) __asm__("@__security_check_cookie@4");
void __attribute__((stdcall)) webview2_security_check_cookie(
    uintptr_t cookie) {
  webview2_security_check_cookie_impl(cookie);
}
#else
__asm__(
    ".text\n"
    ".globl \"@__security_check_cookie@4\"\n"
    "\"@__security_check_cookie@4\":\n"
    "jmp \"_webview2_security_check_cookie_impl@4\"\n");
#endif
#endif

void *webview2_nothrow_new_impl(size_t size, const void *tag) {
  (void)tag;
  return HeapAlloc(GetProcessHeap(), 0, size);
}

#if WEBVIEW2_X86
void *webview2_new_impl(size_t size) {
  return HeapAlloc(GetProcessHeap(), 0, size);
}

void webview2_delete_impl(void *ptr) {
  if (ptr != NULL) {
    HeapFree(GetProcessHeap(), 0, ptr);
  }
}
#endif

void webview2_sized_delete_impl(void *ptr, size_t size) {
  (void)size;
  if (ptr != NULL) {
    HeapFree(GetProcessHeap(), 0, ptr);
  }
}

void webview2_libcpp_verbose_abort_impl(const char *message) {
  (void)message;
  webview2_bridge_abort();
}

#if WEBVIEW2_X86
/* The non-MSVC x86 import library does not declare EventSetInformation. */
typedef ULONG(WINAPI *webview2_event_set_information_proc)(
    ULONGLONG registration_handle,
    ULONG information_class,
    PVOID event_information,
    ULONG information_length);

ULONG WINAPI webview2_event_set_information_impl(
    ULONGLONG registration_handle,
    ULONG information_class,
    PVOID event_information,
    ULONG information_length) {
  static webview2_event_set_information_proc implementation;
  if (implementation == NULL) {
    HMODULE advapi = GetModuleHandleW(L"advapi32.dll");
    if (advapi == NULL) {
      advapi = LoadLibraryW(L"advapi32.dll");
    }
    if (advapi != NULL) {
      implementation = (webview2_event_set_information_proc)
          GetProcAddress(advapi, "EventSetInformation");
    }
  }
  if (implementation == NULL) {
    return ERROR_CALL_NOT_IMPLEMENTED;
  }
  return implementation(
      registration_handle,
      information_class,
      event_information,
      information_length);
}
#endif

/* The static loader was built with CFG-aware MSVC indirect-call thunks. */
#if defined(__TINYC__)
#if WEBVIEW2_X64
void webview2_guard_dispatch_icall_nop(void)
    __asm__("_guard_dispatch_icall_nop") {}
void webview2_guard_xfg_dispatch_icall_nop(void)
    __asm__("_guard_xfg_dispatch_icall_nop") {}
void webview2_guard_check_icall_nop(void)
    __asm__("_guard_check_icall_nop") {}
void webview2_guard_xfg_check_icall_nop(void)
    __asm__("_guard_xfg_check_icall_nop") {}
void *webview2_guard_dispatch_icall_fptr
    __asm__("__guard_dispatch_icall_fptr") = webview2_guard_dispatch_icall_nop;
void *webview2_guard_xfg_dispatch_icall_fptr
    __asm__("__guard_xfg_dispatch_icall_fptr") = webview2_guard_xfg_dispatch_icall_nop;
void *webview2_guard_xfg_table_dispatch_icall_fptr
    __asm__("__guard_xfg_table_dispatch_icall_fptr") = webview2_guard_xfg_dispatch_icall_nop;
void *webview2_guard_check_icall_fptr
    __asm__("__guard_check_icall_fptr") = webview2_guard_check_icall_nop;
void *webview2_guard_xfg_check_icall_fptr
    __asm__("__guard_xfg_check_icall_fptr") = webview2_guard_xfg_check_icall_nop;
int32_t webview2_init_thread_epoch __asm__("_Init_thread_epoch") = 0;
void *webview2_msvc_nothrow_new(size_t size, const void *tag)
    __asm__("??2@YAPEAX_KAEBUnothrow_t@std@@@Z") {
  return webview2_nothrow_new_impl(size, tag);
}
void webview2_msvc_sized_delete(void *ptr, size_t size)
    __asm__("??3@YAXPEAX_K@Z") {
  webview2_sized_delete_impl(ptr, size);
}
void webview2_msvc_verbose_abort(const char *message)
    __asm__("?__libcpp_verbose_abort@__Cr@std@@YAXPEBDZZ") {
  webview2_libcpp_verbose_abort_impl(message);
}
unsigned char webview2_msvc_nothrow
    __asm__("?nothrow@std@@3Unothrow_t@1@B") = 0;
#else
void webview2_guard_dispatch_icall_nop(void)
    __attribute__((stdcall)) __asm__("_guard_dispatch_icall_nop") {}
void webview2_guard_xfg_dispatch_icall_nop(void)
    __attribute__((stdcall)) __asm__("_guard_xfg_dispatch_icall_nop") {}
void webview2_guard_check_icall_nop(void)
    __attribute__((stdcall)) __asm__("_guard_check_icall_nop") {}
void webview2_guard_xfg_check_icall_nop(void)
    __attribute__((stdcall)) __asm__("_guard_xfg_check_icall_nop") {}
void *webview2_guard_dispatch_icall_fptr
    __asm__("__guard_dispatch_icall_fptr") = webview2_guard_dispatch_icall_nop;
void *webview2_guard_xfg_dispatch_icall_fptr
    __asm__("__guard_xfg_dispatch_icall_fptr") = webview2_guard_xfg_dispatch_icall_nop;
void *webview2_guard_xfg_table_dispatch_icall_fptr
    __asm__("__guard_xfg_table_dispatch_icall_fptr") = webview2_guard_xfg_dispatch_icall_nop;
void *webview2_guard_check_icall_fptr
    __asm__("__guard_check_icall_fptr") = webview2_guard_check_icall_nop;
void *webview2_guard_xfg_check_icall_fptr
    __asm__("__guard_xfg_check_icall_fptr") = webview2_guard_xfg_check_icall_nop;
int32_t webview2_tls_array __asm__("__tls_array") = 0;
int32_t webview2_init_thread_epoch __asm__("__Init_thread_epoch") = 0;
void *webview2_msvc_nothrow_new(size_t size, const void *tag)
    __asm__("??2@YAPAXIABUnothrow_t@std@@@Z") {
  return webview2_nothrow_new_impl(size, tag);
}
void *webview2_msvc_new(size_t size)
    __asm__("??_U@YAPAXI@Z") { return webview2_new_impl(size); }
void webview2_msvc_sized_delete(void *ptr, size_t size)
    __asm__("??3@YAXPAXI@Z") { webview2_sized_delete_impl(ptr, size); }
void webview2_msvc_delete(void *ptr)
    __asm__("??_V@YAXPAX@Z") { webview2_delete_impl(ptr); }
void webview2_msvc_verbose_abort(const char *message)
    __asm__("?__libcpp_verbose_abort@__Cr@std@@YAXPBDZZ") {
  webview2_libcpp_verbose_abort_impl(message);
}
ULONG (WINAPI *webview2_event_set_information_import)(
    ULONGLONG, ULONG, PVOID, ULONG)
    __asm__("_imp__EventSetInformation@20") =
        webview2_event_set_information_impl;
unsigned char webview2_msvc_nothrow
    __asm__("?nothrow@std@@3Unothrow_t@1@B") = 0;
#endif
#else
#if WEBVIEW2_X64
__asm__(
    ".text\n"
    ".p2align 4\n"
    ".globl _guard_dispatch_icall_nop\n"
    "_guard_dispatch_icall_nop:\n"
    "jmp *%rax\n"
    ".globl _guard_xfg_dispatch_icall_nop\n"
    "_guard_xfg_dispatch_icall_nop:\n"
    "jmp *%rax\n"
    ".globl _guard_check_icall_nop\n"
    "_guard_check_icall_nop:\n"
    "ret\n"
    ".globl _guard_xfg_check_icall_nop\n"
    "_guard_xfg_check_icall_nop:\n"
    "ret\n"
    ".data\n"
    ".p2align 3\n"
    ".globl __guard_dispatch_icall_fptr\n"
    "__guard_dispatch_icall_fptr:\n"
    ".quad _guard_dispatch_icall_nop\n"
    ".globl __guard_xfg_dispatch_icall_fptr\n"
    "__guard_xfg_dispatch_icall_fptr:\n"
    ".quad _guard_xfg_dispatch_icall_nop\n"
    ".globl __guard_xfg_table_dispatch_icall_fptr\n"
    "__guard_xfg_table_dispatch_icall_fptr:\n"
    ".quad _guard_xfg_dispatch_icall_nop\n"
    ".globl __guard_check_icall_fptr\n"
    "__guard_check_icall_fptr:\n"
    ".quad _guard_check_icall_nop\n"
    ".globl __guard_xfg_check_icall_fptr\n"
    "__guard_xfg_check_icall_fptr:\n"
    ".quad _guard_xfg_check_icall_nop\n"
    ".globl _Init_thread_epoch\n"
    ".set _Init_thread_epoch, 0x140000008\n"
    ".text\n"
    ".globl \"??2@YAPEAX_KAEBUnothrow_t@std@@@Z\"\n"
    "\"??2@YAPEAX_KAEBUnothrow_t@std@@@Z\":\n"
    "jmp webview2_nothrow_new_impl\n"
    ".globl \"??3@YAXPEAX_K@Z\"\n"
    "\"??3@YAXPEAX_K@Z\":\n"
    "jmp webview2_sized_delete_impl\n"
    ".globl \"?__libcpp_verbose_abort@__Cr@std@@YAXPEBDZZ\"\n"
    "\"?__libcpp_verbose_abort@__Cr@std@@YAXPEBDZZ\":\n"
    "jmp webview2_libcpp_verbose_abort_impl\n"
    ".data\n"
    ".globl \"?nothrow@std@@3Unothrow_t@1@B\"\n"
    "\"?nothrow@std@@3Unothrow_t@1@B\":\n"
    ".byte 0\n");
#else
__asm__(
    ".text\n"
    ".p2align 2\n"
    ".globl _guard_dispatch_icall_nop\n"
    "_guard_dispatch_icall_nop:\n"
    "jmp *%eax\n"
    ".globl _guard_xfg_dispatch_icall_nop\n"
    "_guard_xfg_dispatch_icall_nop:\n"
    "jmp *%eax\n"
    ".globl _guard_check_icall_nop\n"
    "_guard_check_icall_nop:\n"
    "ret\n"
    ".globl _guard_xfg_check_icall_nop\n"
    "_guard_xfg_check_icall_nop:\n"
    "ret\n"
    ".data\n"
    ".p2align 2\n"
    ".globl ___guard_dispatch_icall_fptr\n"
    "___guard_dispatch_icall_fptr:\n"
    ".long _guard_dispatch_icall_nop\n"
    ".globl ___guard_xfg_dispatch_icall_fptr\n"
    "___guard_xfg_dispatch_icall_fptr:\n"
    ".long _guard_xfg_dispatch_icall_nop\n"
    ".globl ___guard_xfg_table_dispatch_icall_fptr\n"
    "___guard_xfg_table_dispatch_icall_fptr:\n"
    ".long _guard_xfg_dispatch_icall_nop\n"
    ".globl ___guard_check_icall_fptr\n"
    "___guard_check_icall_fptr:\n"
    ".long _guard_check_icall_nop\n"
    ".globl __tls_array\n"
    ".set __tls_array, 0x0040002C\n"
    ".globl __Init_thread_epoch\n"
    ".set __Init_thread_epoch, 0x00400004\n"
    ".text\n"
    ".globl \"??2@YAPAXIABUnothrow_t@std@@@Z\"\n"
    "\"??2@YAPAXIABUnothrow_t@std@@@Z\":\n"
    "jmp _webview2_nothrow_new_impl\n"
    ".globl \"??_U@YAPAXI@Z\"\n"
    "\"??_U@YAPAXI@Z\":\n"
    "jmp _webview2_new_impl\n"
    ".globl \"??3@YAXPAXI@Z\"\n"
    "\"??3@YAXPAXI@Z\":\n"
    "jmp _webview2_sized_delete_impl\n"
    ".globl \"??_V@YAXPAX@Z\"\n"
    "\"??_V@YAXPAX@Z\":\n"
    "jmp _webview2_delete_impl\n"
    ".globl \"?__libcpp_verbose_abort@__Cr@std@@YAXPBDZZ\"\n"
    "\"?__libcpp_verbose_abort@__Cr@std@@YAXPBDZZ\":\n"
    "jmp _webview2_libcpp_verbose_abort_impl\n"
    ".globl \"__imp__EventSetInformation@20\"\n"
    "\"__imp__EventSetInformation@20\":\n"
    ".long _webview2_event_set_information_impl@20\n"
    ".data\n"
    ".globl \"?nothrow@std@@3Unothrow_t@1@B\"\n"
    "\"?nothrow@std@@3Unothrow_t@1@B\":\n"
    ".byte 0\n");
#endif
#endif
