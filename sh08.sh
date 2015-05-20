#!/bin/bash
#利用循环计算1+2+3+....+100的和
echo -e "开始计算和"
x=0
sum=0
while [ "$x" -lt "100" ]
do
x=$(($x+1))
sum=$(($sum+$x))
done
echo "计算结果为: " $sum
