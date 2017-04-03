
在cm03的基础上，我们想让生成的库，可执行文件在我们指定的目录下

* build/bin 下 生成 fun 可执行文件

* build/lib 下 生成 libfun.a的静态库


生成是指定外部生成目录


libfun下的CMakeLists.txt

```
#让静态库在 /build/lib下生成 
# PROJECT_BINARY_DIR 在out-of-source编译 是指发生编译的目录 即build目录
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

```

src下的CMakeLists.txt

```
link_directories(${PROJECT_BINARY_DIR}/lib)

# 可执行文件生成在 build/bin下面
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

```