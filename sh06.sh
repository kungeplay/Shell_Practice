#!/bin/bash
#if else 测试
if [ -z $1 ]; then
echo -e "Must input the parameter!"
elif [ $1 == "hello" ];then
echo -e "Hello,how are you ?"
else
echo -e "parameter must be 'hello'"
fi
