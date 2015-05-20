#!/bin/sh
#编写的转换本文件夹下从Windows系统复制过来的C++文件文件转换格式为utf-8格式,转换目标文件夹为上一个文件夹.
FileList=$(ls *.cpp *.h)
if [ "$FileList" == "" ];then
	echo -e "\a没有找到任何C++源文件文件！"
	exit 1
else
	for filename in $FileList; do
		iconv -f gbk -t utf-8 $filename > ../$filename

		if [[ $? -ne 0 ]]; then  # -ne 两数值不等
			echo -e "\a$filename convert wrong!"
		fi
	done
	echo -e "\a转换完成！ "
fi
exit 0
	
