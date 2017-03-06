#!/bin/bash
#awk有许多内置变量用来设置环境信息，这些变量可以被改变
# ARGC               命令行参数个数
# ARGV               命令行参数排列
# ENVIRON            支持队列中系统环境变量的使用
# FILENAME           awk浏览的文件名
# FNR                浏览文件的记录数
# FS                 设置输入域分隔符，等价于命令行 -F选项
# NF                 浏览记录的域的个数
# NR                 已读的记录数
# OFS                输出域分隔符
# ORS                输出记录分隔符
# RS                 控制记录分隔符
#  此外,$0变量是指整条记录。$1表示当前行的第一个域,$2表示当前行的第二个域,......以此类推。
egrep '^2017\-[[:digit:]]{2}\-[[:digit:]]{2}[[:blank:]]' ./temp | awk 'BEGIN{num=0;sum=0} {print $4;sum=sum+$4;num=num+1} END{printf("dubbo调用次数:%s,响应时间总计:%s,平均响应时间:%s\n",num,sum,sum/num)}'
