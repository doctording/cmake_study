set(LIB_SRC fun.cpp)

# 生成一个静态库文件
add_library(libfun ${LIB_SRC})

#让静态库在 /build/lib下生成 
# PROJECT_BINARY_DIR 在out-of-source编译 是指发生编译的目录 即build目录
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

# 更改名字(fun这个名字被可执行名占用了) liblibfun.a 改成 libfun.a
set_target_properties(libfun PROPERTIES OUTPUT_NAME "fun")
