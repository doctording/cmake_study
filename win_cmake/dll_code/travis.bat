@echo on

:创建build目录并进入cmake
if exist build (
   rmdir /q /s build
)
md build
cd build

cmake ..

pause