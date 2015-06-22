#!/bin/bash
#写这个脚本文件的缘由：看到STL源码剖析中的一些测试程序，遂想编写测试一下。但是从官网上下来的SGI STL源代码文件里包含头文件时均是利用"#include <>"方式来包括的
#这样我就没法包含我想要包含的同目录下的SGI自己的文件了，肯定不能把它挪到我系统目录下呀，所以就编写这个脚本文件来自动修改SGI STL源代码文件里的包
#含头文件方式为"#include " ""。

#结果：达到我想要的作用，但是每次修改文件时均需要事前确认，以后要修改的可以加个比如-f参数，则不需要确认就可以修改

declare -a changedfile
declare -a unchangedfile
declare -i i=0
declare -i j=0
declare -i sum=0

#用sed替换修改文件内容
function changeFile_f()
{
	pathfilename=$1
	read -p "确定要修改文件：$pathfilename?[Y/N] " -t 10 issure
	if [ "$issure" = "y" ] || [ "$issure" = "Y" ];then
		egrep "^#include <([_a-z\.]+)>$" $pathfilename    #先查看是否有要搜索的内容
		if [ $? -eq 0 ];then
			sed -r -i 's/^#include <([_a-z\.]+)>$/#include "\1" \/\/被我给改了/g' $pathfilename
			echo "修改文件： $pathfilename"
			changedfile[$i]=$pathfilename
			i=$i+1
		else
			echo "无须修改文件： $pathfilename"
			unchangedfile[$j]=$pathfilename
			j=$j+1
		fi
	else
		unchangedfile[$j]=$pathfilename
		j=$j+1
	fi
	sum=$sum+1
}
#修改目录下的所有文件
function changeDirectoryFile_f()
{
	filenames=$(ls $1)
	for filename in $filenames
	do
		changeFile_f "$1$filename"
	done
	
}


if [ "$#" -eq 0 ]; then #0个参数则需要用户输入文件夹名或文件名
	read -p "请输入要修改文件的文件夹名称或者文件名称: " -t 20 temp
	if [ $temp ] && [ -d "$temp" ];then	#为目录
		changeDirectoryFile_f $temp #调用上面的函数
	elif [ $temp ] && [ -f $temp ];then	#为文件名
		changeFile_f $temp	#调用函数
	fi
else
	if [ -d $1 ];then	#如果用户输入的是目录
		changeDirectoryFile_f $1 #调用上面的函数
	elif [ $1 ] && [ -f $1 ];then
		changeFile_f $1
	fi
fi
printf "总文件数:$sum\t修改文件:$i\t未修改文件数:$j\n"

