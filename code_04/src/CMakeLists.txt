
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/libfun)

link_directories(${PROJECT_BINARY_DIR}/lib)

set(APP_SRC main.cpp)

# 可执行文件生成在 build/bin下面
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

# 生成可执行文件
add_executable(fun ${APP_SRC})

# 可执行文件 需要链接 静态库
target_link_libraries(fun libfun)
