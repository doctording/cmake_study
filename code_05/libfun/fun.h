#ifndef _FUN_
#define _FUN_

#include <cstdio>

using namespace std;

#if defined _WIN32
    #if LIBFUN_BUILD
        #define LIBFUN_API __declspec(dllexport) // 如果生成dll工程，那么导出
    #else
        #define LIBFUN_API __declspec(dllimport) // 如果生成使用dll的工程，那么导入
    #endif
#else
    #define LIBFUN_API
#endif

LIBFUN_API int max2(int, int);
LIBFUN_API int min2(int, int);

#endif
