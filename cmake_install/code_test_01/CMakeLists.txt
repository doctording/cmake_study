cmake_minimum_required(VERSION 2.8)

set(APP_SRC main.cpp)
set(exe_name test)
set(lib_name fun)

#INCLUDE_DIRECTORIES(/usr/local/include)
#LINK_DIRECTORIES(/user/local/lib)

# 需要生成一个可执行文件
add_executable(${exe_name} ${APP_SRC})

# 可执行文件 需要链接 静态库
target_link_libraries(${exe_name} ${lib_name})
