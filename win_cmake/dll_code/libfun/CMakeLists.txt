set (major_version 1)
set (minor_version 0)
set (patch_version 0)
set (build_version 0)
set (version ${major_version}.${minor_version}.${patch_version})

#########################################
# Source（关于源文件）
#########################################
set(file_inc fun.h)                   # 头文件
set(file_src fun.cpp)                 # 源文件

set(lib_name "fun")                   # 库名称
set(lib_name_static ${lib_name}-static) # 静态库的名称
set(lib_name_shared ${lib_name}-shared) # 动态库的名称

# WIN32下添加def文件
if(WIN32)
set(file_src ${file_src} fun.def)     # 源文件添加fun.def
endif()

#########################################
# Target（关于目标文件）
#########################################
# 添加静态库
add_library(${lib_name_static}          # 静态库名称
        STATIC                          # 静态库FLAG
        ${file_inc} ${file_src}         # 库的源文件
        ) 

# 添加动态库
add_library(${lib_name_shared}          # 动态库名称
        SHARED                          # 动态库标识
        ${file_inc} ${file_src}         # 源文件
    )

# 不需要下面的几句，win32下，头文件是什么就写成什么.lib .dll 因为vs工程的原因
# WIN32平台添加前缀lib（UNIX为默认lib前缀的）
#if(WIN32)
#set(lib_name lib${lib_name})            # 添加前缀lib
#endif()

# 设置静态库的属性
set_target_properties(${lib_name_static}
        PROPERTIES 
        OUTPUT_NAME_DEBUG ${lib_name}d  # DEBUG下生成的库名称libfund.lib
        OUTPUT_NAME ${lib_name}         # 非DEBUG生成的库名称libfun.lib
        )

# 设置动态库的属性
set_target_properties(${lib_name_shared}
        PROPERTIES 
        OUTPUT_NAME ${lib_name}         # 重名命生成的库名称libfun.lib
        SOVERSION ${major_version}      # 设置函数API版本
        VERSION ${version}              # 设置动态库版本
        )

# 设置库的输出路径
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

