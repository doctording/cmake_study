
最简单的cmake使用

CMakeList.txt
```
PROJECT (FUN)
INCLUDE_DIRECTORIES(.)
set(LIB_SRC fun.cpp)
set(APP_SRC main.cpp)
# 生成一个静态库文件
add_library(libfun ${LIB_SRC})
# 需要生成一个可执行文件
add_executable(fun ${APP_SRC})
# 可执行文件 需要链接 静态库
target_link_libraries(fun libfun)
# 更改名字(fun这个名字被可执行名占用了) liblibfun.a 改成 libfun.a
set_target_properties(libfun PROPERTIES OUTPUT_NAME "fun")
```


fun.cpp实现 fun.h中的方法，main.cpp 调用fun.h中的方法

* 生成libfun.a的静态库

* 生成fun可执行文件（依赖main.cpp和libfun.a）

