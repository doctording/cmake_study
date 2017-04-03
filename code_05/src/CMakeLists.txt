#########################################
# Build（关于依赖库）
#########################################
set(dir_src main.cpp)
set(exe_name test)

# xmath库头文件所在目录
set(lib_inc ${PROJECT_SOURCE_DIR}/libfun CACHE PATH "include of fun")
# fun库文件所在目录
set(lib_dir ${PROJECT_SOURCE_DIR}/lib CACHE PATH "directory of fun.lib")

# 在这里动态库与静态库的设置是一样的
# 指定头文件的搜索路径
include_directories(${lib_inc})
# 指定库文件的搜索路径
link_directories(${lib_dir})

#########################################
# Target（关于目标文件）
#########################################
# 添加可执行文件Test
add_executable(${exe_name} ${dir_src})
# 设置可执行文件输出目录
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

# 使用动态库与静态库(都有的情况下，优先使用动态库)
# 链接库（动态库）
#target_link_libraries(${exe_name} fun)
# 链接库（静态库）
target_link_libraries(${exe_name} fun)
