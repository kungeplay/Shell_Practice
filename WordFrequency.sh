#!/bin/bash

# Word Frequency
# Write a bash script to calculate the frequency of each word in a text file words.txt.
# For simplicity sake, you may assume:
#     words.txt contains only lowercase characters and space ' ' characters.
#     Each word must consist of lowercase characters only.
#     Words are separated by one or more whitespace characters.

# For example, assume that words.txt has the following content:

# the day is sunny the the
# the sunny is is

# Your script should output the following, sorted by descending frequency:

# the 4
# is 3
# sunny 2
# day 1

# Note:
# Don't worry about handling ties, it is guaranteed that each word's frequency count is unique. 
#sed -r 支持扩展型正则表达式; 's/要被替换的字符串/新字符串/g' 将文本中的空格替换成行
#第二个sed将产生的空行，替换掉
#此时，先将相同的单词排序放在以起，为下面用uniq统计做准备
#uniq，默认是由以小到大来处理的，所以使用sort -r再翻转排序过来
#uniq 默认是将数字放在前边，所以使用awk来进行处理
#cat ./words.txt | tr '[[:blank:]]' '\n' | sort |uniq -c | sort -r

sed  -r 's/[[:blank:]]+/\n/g' ./words.txt |sed '/^$/d' | sort | uniq -c | sort -r | awk '{print $2 " "  $1}'
