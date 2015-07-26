#!/bin/bash

# Transpose File
# Given a text file file.txt, transpose(进行变换, 变换顺序) its content.

# You may assume that each row has the same number of columns and each field is separated by the ' ' character.

# For example, if file.txt has the following content:

# name age
# alice 21
# ryan 30

# Output the following:

# name alice ryan
# age 21 30
#这个题做着老麻烦了，耗了一下午的时间，重新看了下for，if，declare的用法。结果发现网上人家直接用awk解决了
#人家的代码如下：

# awk '
# { 
#     for (i = 1; i <= NF; i++)  {
#         a[NR, i] = $i
#     }
# }
# NF > p { p = NF }
# END {    
#     for (j = 1; j <= p; j++) {
#         str = a[1, j]
#         for (i = 2; i <= NR; i++){
#             str = str " " a[i, j]
#         }
#         print str
#     }
# }' TransposeFile.txt



File="TransposeFile.txt"
declare -i LineNum
LineNum=$(cat $File | wc -l)

declare -a WordArray
Context=$(cat $File | tr '\n' ' ')

declare -i WordNum=0
for Word in $Context 
do
	WordNum=$WordNum+1
	WordArray[$WordNum]=$Word
done

if [ $LineNum == 0 ] && [ $WorNum !=0 ];then
	LineNum=1
fi

declare -i ColNum=$WordNum/$LineNum
declare -i i=1
for((i=1;i<=$ColNum;i=i+1))
do
	for((j=$i;j<=$WordNum;j=j+$ColNum))
	do
		printf  '%s' ${WordArray[$j]}
		declare -i m=$j+$ColNum
		if [ "$m" -le "$WordNum" ];
		then
			printf ' '
		else
			printf '\n'
		fi
	done
done



