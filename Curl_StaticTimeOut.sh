#!/bin/bash
#统计网站的响应时间
# curl 参数:
# -x 指定访问IP与端口号
# -o：将文件保存为命令行中指定的文件名的文件中
# -O：使用URL中默认的文件名保存文件到本地
# 通过-L选项进行重定向
# 通过使用-C选项可对大文件使用断点续传功能
# -v参数可以显示一次http通信的整个过程，包括端口连接、http request头信息和HTML源码
# 发送表单为POST方式，则需要使用-d参数：curl -d "name=xxx&password=xxx" www.test.html
# 使用-F参数可实现文件上传，curl 就会以multipart/form-data的方式发送 POST 请求，
# time_connect:建立到服务器的 TCP 连接所用的时间即表示 TCP 握手的耗时
# time_starttransfer    在发出请求之后，Web 服务器返回数据的第一个字节所用的时间
# time_total      完成请求所用的时间
# -s 静默，不显示进度
# -w格式化输出
#read -p "输入要统计的网址: " -t 30 url
#if [ $url ];then
#	read -p "请输入压力测试次数：" -t 30 num
#	if [$num ]
#declare url="http://l-wbd13.f.cn8.qunar.com:8080/twell/debug/mobilesearch?queryId=&depCity=%E5%8C%97%E4%BA%AC&arrCity=%E9%A6%99%E6%B8%AF&depDate=2017-04-26&retDate=&flightCode=&sortType=5&start=0&size=1000&adultNum=1&childNum=0&filters=&debug=false&isSelection=false&waittime=1"
declare url="http://l-iwbd7.f.cn2.qunar.com:8080/twell/debug/mobilesearch?queryId=&depCity=%E7%BA%BD%E7%BA%A6&arrCity=%E9%A6%99%E6%B8%AF&depDate=2017-04-06&retDate=&flightCode=&sortType=5&start=0&size=1000&adultNum=1&childNum=0&filters=&debug=false&isSelection=false&waittime=1"
declare -i num=1000
declare -i i=1
declare  sum=0.0
for ((i=1;i<=$num;i=i+1))
do
curl -o /dev/null -s -w "code:%{http_code}\tstarttransfer:%{time_starttransfer}\ttimeout:%{time_total}\n" $url
 
done
#else
#print "url无效\n"
#fi
