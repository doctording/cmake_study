
有目录层次，让生成的文件都在build目录下，同时可以写一个脚本去运行


fun.cpp实现 fun.h中的方法，main.cpp 调用fun.h中的方法

* 生成libfun.a的静态库

* 生成fun可执行文件（依赖main.cpp和libfun.a）

```
john@ubuntu:~/cmake/cm02$ tree .
.
├── CMakeLists.txt
├── libfun
│   ├── CMakeLists.txt
│   ├── fun.cpp
│   └── fun.h
├── src
│   ├── CMakeLists.txt
│   └── main.cpp
└── travis.sh

2 directories, 7 files

```

* travis.sh

创建build目录并进入，在build目录下 camke,make生成文件

```
#!/usr/bin/env sh
#set -evx
#env | sort

mkdir build || true
cd build
cmake ..
make

```

运行后生成

* build/src/fun

* build/libfun/libfun.a


* 最外层的CMakeLists.txt

```
PROJECT (FUN)
add_subdirectory(src)
add_subdirectory(libfun)

```

* libfun下的CMakeLists.txt

```
set(LIB_SRC fun.cpp)

# 生成一个静态库文件
add_library(libfun ${LIB_SRC})

# 更改名字(fun这个名字被可执行名占用了) liblibfun.a 改成 libfun.a
set_target_properties(libfun PROPERTIES OUTPUT_NAME "fun")

```


* src下的CMakeLists.txt

通过INCLUDE_DIRECTORIES包含libfun目录
```
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/libfun)

set(APP_SRC main.cpp)

# 需要生成一个可执行文件
add_executable(fun ${APP_SRC})

# 可执行文件 需要链接 静态库
target_link_libraries(fun libfun)
```