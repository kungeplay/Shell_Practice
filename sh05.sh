#!/bin/bash
#在脚本文件后面加入参数
echo -e "The filename is ==>" $0 
echo -e "total parameter number is ==>" $#
test $# -lt 2 && echo -e "the total parameter number is not enough " \
 && exit 0
echo -e "all the parameter are :" $@
echo -e $* " \t" 
echo -e "the first parameter is  " $1 
echo -e " the second parameter is " $2 
