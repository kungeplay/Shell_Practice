#!  /bin/bash
# 使用curl命令完成简单的用户注册,用户登陆,上传脚本文件等功能

userName="jiakun.liu"
cookiesFile="/tmp/loginCookies"
url="http://xxx.com:8080"

#用户注册  POST /user/register
registerResult=$(curl -s -d "username=$userName&password=123" "$url/user/register" | egrep -i '已经注册|success')
#register success or user exist!
if [[ -n $registerResult ]]; then
	echo	"注册用户成功"	
	#用户登录 POST /user/login,并获取cookies
	loginResult=$(curl -s -D $cookiesFile -d "name=$userName&password=123" "$url/user/login" | egrep -i 'success')
	
	if [[ -n $loginResult ]]; then
		echo	"登录用户成功"
		#上传脚本文件 POST /user/homework
		uploadResult=$(curl -s -b $cookiesFile -F  "file=@Curl_Using.sh"  "$url/user/homework"  | egrep -i 'success')
		if [[ -n $uploadResult ]]; then
			echo	"上传文件成功"
		else
			echo	"上传文件失败"
		fi
	else
		echo	"用户登录失败"
	fi
else
	echo	"注册用户失败"
fi



