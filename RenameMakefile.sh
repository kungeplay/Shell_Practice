#!/bin/bash
#自己编写的批量修改makefile文件为Makefile文件
Filespath=$(find /home/Jiakun/C++Practice/ -name makefile)
if [ "$Filespath"=="" ];then
	echo -e  "\aNO files find!"
	exit 1
fi
for filepath in $Filespath
do	
	rename makefile Makefile $filepath
	echo -e "rename the file $filepath \a"
done
exit 0

