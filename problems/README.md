
# cmake例题1

## 描述

给定静态库和一个使用它的main源文件，编译执行
```
 libs
│   ├── fun.h
│   └── libfun.a
├── main.cpp

```

自己写Makefile可能需要些时间，但是使用cmake，将变得很简单

linux下需要只要写一个CMakeLists.txt， 一个shell脚本,然后运行shell脚本就ok了


```
.
├── CMakeLists.txt
├── libs
│   ├── fun.h
│   └── libfun.a
├── main.cpp
└── travis.sh
```

* CMakeLists.txt 

```
PROJECT (FUN)

set(APP_SRC main.cpp)
set(exe_name test)
set(lib_name fun)

# 目录链接
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/libs)

link_directories(${PROJECT_SOURCE_DIR}/libs)

# 可执行文件生成在 ./bin下面
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

# 生成可执行文件
add_executable(${exe_name} ${APP_SRC})

# 可执行文件 需要链接 静态库
target_link_libraries(${exe_name} ${lib_name})

```

* travis.sh(加上可执行的权限)

```
#!/usr/bin/env sh
#set -evx
#env | sort

EXE_DIR=./bin
BUILD_DIR=./build

if [ ! -d ${EXE_DIR} ]
then
        mkdir ${EXE_DIR}
else
#echo "aaa"
        rm -rf ${EXE_DIR}/*
fi

if [ ! -d ${BUILD_DIR} ]
then
        mkdir ${BUILD_DIR}
else
#echo "ccc"
        rm -rf ${BUILD_DIR}/*
fi

cd build
cmake ..
make
```

代码见pro01目录

---

# cmake例题2

我的博文地址(linux下静态库)

http://blog.csdn.net/qq_26437925/article/details/51541717

原来用的Makefile, 现在用cmake(CMakeLists.txt看起来写的多，但是很简单)

* CMakeLists.txt

```
PROJECT (FUN)

set(APP_SRC test.c)
set(exe_name test)

set(lib_name "mylib")                   # 库名称
set(lib_name_static ${lib_name}-static) # 静态库的名称

set(file_inc ${PROJECT_SOURCE_DIR}/include/my_math.h ${PROJECT_SOURCE_DIR}/include/my_print.h)
set(file_src ${PROJECT_SOURCE_DIR}/src/my_math.c ${PROJECT_SOURCE_DIR}/src/my_print.c)

#################################
# 静态库生成
#################################
# 添加静态库
add_library(${lib_name_static}          # 静态库名称
        STATIC                          # 静态库FLAG
        ${file_inc} ${file_src}         # 库的源文件
        ) 


# 设置静态库的属性
set_target_properties(${lib_name_static}
        PROPERTIES 
        OUTPUT_NAME_DEBUG ${lib_name}d  # DEBUG下生成的库名称
        OUTPUT_NAME ${lib_name}         # 非DEBUG生成的库名称
        )

# 设置库的输出路径
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

#################################
# 可执行文件生成
#################################
# 目录链接
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/include)
link_directories(${PROJECT_SOURCE_DIR}/lib)

# 可执行文件生成在 ./bin下面
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

# 生成可执行文件
add_executable(${exe_name} ${APP_SRC})

# 可执行文件 需要链接 静态库
target_link_libraries(${exe_name} ${lib_name})

```

* travis.sh编译脚本

```
#!/usr/bin/env sh
#set -evx
#env | sort

EXE_DIR=./bin
LIB_DIR=./lib
BUILD_DIR=./build

if [ ! -d ${EXE_DIR} ] 
then
	mkdir ${EXE_DIR}
else
#echo "aaa"
	rm -rf ${EXE_DIR}/* 
fi

if [ ! -d ${LIB_DIR} ] 
then
	mkdir ${LIB_DIR}
else
#echo "bbb"
	rm -rf ${LIB_DIR}/* 
fi

if [ ! -d ${BUILD_DIR} ]
then 
	mkdir ${BUILD_DIR} 
else
#echo "ccc"
	rm -rf ${BUILD_DIR}/*
fi

cd build
cmake ..
make

```

---