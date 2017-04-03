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
