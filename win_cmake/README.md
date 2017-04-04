
windows下 cmake使用

* 下载安装cmake,设置环境变量

* 安装一个vs,如vs2015

# 使用code_01下的工程

cmake将生成vs解决方案

![](../win_cmake/imgs/01.png)

打开解决方案后

![](../win_cmake/imgs/02.png)

* 将三个项目重新生成一下

* 然后设置hello为主启动工程，打开main.cpp，然后运行即可


# 使用code_04下的工程（有静态库）

![](../win_cmake/imgs/03.png)

![](../win_cmake/imgs/04.png)


打开解决方案后有4个工程

* 将项目重新生成一下

查看项目属性，可以看到fun工程是链接了静态库的（头文件目录,引用的.lib）

![](../win_cmake/imgs/001.png)

![](../win_cmake/imgs/002.png)

* 然后设置fun为主启动工程，打开main.cpp，然后运行即可

![](../win_cmake/imgs/05.png)

![](../win_cmake/imgs/06.png)

