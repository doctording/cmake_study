@echo on

:����buildĿ¼������cmake
if exist build (
   rmdir /q /s build
)
md build
cd build

cmake ..

pause