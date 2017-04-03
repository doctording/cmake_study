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

