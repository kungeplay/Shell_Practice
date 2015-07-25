#!/bin/bash
# How would you print just the 10th line of a file?

# For example, assume that file.txt has the following content:

# Line 1
# Line 2
# Line 3
# Line 4
# Line 5
# Line 6
# Line 7
# Line 8
# Line 9
# Line 10

# Your script should output the tenth line, which is:

# Line 10
#额原来有三种方法分别是用awk,sed,以及tail和head结合的方法
# awk:
#awk 'NR==10' file.txt
#sed:
#sed -n '10p' file.txt
#tail与head相组合
#tail -n+10 file.txt | head -n1
Context=$(sed -n '10,10p' < file.txt)
echo $Context
