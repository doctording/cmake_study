
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/libfun)

set(APP_SRC main.cpp)

# 需要生成一个可执行文件
add_executable(fun ${APP_SRC})

# 可执行文件 需要链接 静态库
target_link_libraries(fun libfun)
