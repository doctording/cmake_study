# 简单的cmake INSTALL

* CMakeLists.txt
将可执行文件安装到bin目录下
```
PROJECT (HELLO)
INCLUDE_DIRECTORIES(.)
SET(SRC_LIST main.cpp fun.cpp)
ADD_EXECUTABLE(hello ${SRC_LIST})

INSTALL(TARGETS hello
        RUNTIME DESTINATION bin
        )

```


* camke的时候指定安装目录前缀

例如要将可执行文件安装到 /usr/local/bin下，使用如下的语句
```
cmake -DCMAKE_INSTALL_PREFIX=/usr/local
```

接着安装、运行即可
```
$make
$sudo make install
```

```
john@ubuntu:~/cmake_study/code_01$ cmake -DCMAKE_INSTALL_PREFIX=/usr/local
CMake Warning (dev) in CMakeLists.txt:
  No cmake_minimum_required command is present.  A line of code such as

    cmake_minimum_required(VERSION 2.8)

  should be added at the top of the file.  The version specified may be lower
  if you wish to support older CMake versions for this project.  For more
  information run "cmake --help-policy CMP0000".
This warning is for project developers.  Use -Wno-dev to suppress it.

-- Configuring done
-- Generating done
-- Build files have been written to: /home/john/cmake_study/code_01
john@ubuntu:~/cmake_study/code_01$ make
[100%] Built target hello
john@ubuntu:~/cmake_study/code_01$ sudo make install
[100%] Built target hello
Install the project...
-- Install configuration: ""
-- Installing: /usr/local/bin/hello
```

---