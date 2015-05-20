#i/bin/bash
# 让用户输入文件名,并取得fileuser这个变量
echo -e "I will use 'touch' command to create 3 files." #纯遂显示信息
read -p "Please input your filename:" fileuser #提示用户输入
#为了避免用户随意按[Enter],利用变量功能分析文件名是否有设置
filename=${fileuser:-"filename"} 
#开始利用date命令来取得所需要的文件名了
date1=$(date --date='2 days ago' +%Y%m%d) #前两天的日期
date2=$(date --date='1 days ago' +%Y%m%d) #前一天的日期
date3=$(date +%Y%m%d) #今天的日期
#下面三行配置文件名
file1=${filename}${date1}
file2=${filename}${date2}
file3=${filename}${date3}
# 创建文件名
touch "$file1"
touch "$file2"
touch "$file3"
