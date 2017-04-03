set(LIB_SRC fun.cpp)

# 生成一个静态库文件
add_library(libfun ${LIB_SRC})

# 更改名字(fun这个名字被可执行名占用了) liblibfun.a 改成 libfun.a
set_target_properties(libfun PROPERTIES OUTPUT_NAME "fun")
