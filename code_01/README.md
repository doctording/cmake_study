
最简单的cmake使用

CMakeList.txt
```
PROJECT (HELLO)
INCLUDE_DIRECTORIES(.)
SET(SRC_LIST main.cpp fun.cpp)
ADD_EXECUTABLE(hello ${SRC_LIST})
```


fun.cpp实现 fun.h中的方法，main.cpp 调用fun.h中的方法

最终生成一个可执行文件

```
$cmake ./CMakeList.txt
$make
```

