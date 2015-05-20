#!/bin/bash
#author:刘佳坤
#由于ViTi项目中来自8系的车要向不同的UDP端口号发送视频流，故写这个程序要开启服务器的多个端口
StartPort=20000	#从StartPort端口开始，每隔1个打开一个
NumPort=400		#共打开400个端口号,到21598号端口
i=1
echo -e "Now start to open the ports"
while [[ $i -le $NumPort ]]; do 	#-le:小于等于
	/sbin/iptables -I INPUT -p udp --dport $StartPort -j ACCEPT
	if [[ $? -ne 0 ]]; then  # -ne 两数值不等
		echo -e "Open port $StartPort failed! "
		break
	else
		echo -e "Port $StartPort Open successfully!$result"
	fi
	StartPort=$(($StartPort+2))
	/sbin/iptables -I INPUT -p udp --dport $StartPort -j ACCEPT
	if [[ $? -ne 0 ]]; then  # -ne 两数值不等
		echo -e "Open port $StartPort failed!"
		break
	else
		echo -e "Port $StartPort Open successfully!"
	fi	
	StartPort=$(($StartPort+2))
	i=$(($i+1))
done
#/etc/init.d/iptables save
echo -e "Now It is over!"