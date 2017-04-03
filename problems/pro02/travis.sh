#!/usr/bin/env sh
#set -evx
#env | sort

EXE_DIR=./bin
LIB_DIR=./lib
BUILD_DIR=./build

if [ ! -d ${EXE_DIR} ] 
then
	mkdir ${EXE_DIR}
else
#echo "aaa"
	rm -rf ${EXE_DIR}/* 
fi

if [ ! -d ${LIB_DIR} ] 
then
	mkdir ${LIB_DIR}
else
#echo "bbb"
	rm -rf ${LIB_DIR}/* 
fi

if [ ! -d ${BUILD_DIR} ]
then 
	mkdir ${BUILD_DIR} 
else
#echo "ccc"
	rm -rf ${BUILD_DIR}/*
fi

cd build
cmake ..
make
