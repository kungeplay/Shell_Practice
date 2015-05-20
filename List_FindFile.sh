#!/bin/bash
#编写的使用find命令查找文件，并列出文件的详细信息
if [ "$#" -lt 2 ];then     #$#代表后接的参数个数
	echo -e "\a 你输入的参数个数为:$#, $@"
	read -p "请输入要查找的文件路径:" Searchpath
	read -p "请输入要查找的文件名:" Filename
else
	for part in $@
	do
		Searchpath="$Searchpath $Filename"
		Filename="$part"
	done
fi
#if [ ! -d $Searchpath ]
#then
#	echo -e "\a您输入的目录不存在!"
#	exit 1
#fi
Searchresult=$(find $Searchpath -name $Filename)
if [ "$Searchresult" == "" ];then
	echo -e "\a No files find!"
	exit 1
else
	Listfiles=$(ls -htl $Searchresult)
	echo -e "\a 查找结果为:\n $Listfiles "	
fi
exit 0

