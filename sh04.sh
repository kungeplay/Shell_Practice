#! /bin/bash
#学会用test命令
read -p "Please input the filename:" filename
test -e $filename || echo -e "Filename does not exist "
test -e $filename -a -f $filename && echo -e "Filename is regular file " 
test -e $filename -a -r $filename && echo -e "can read "
test -e $filename -a -w $filename && echo -e "can write"
test -e $filename -a -x $filename && echo -e "can execute"
test -e $filename -a -u $filename && echo -e "have SUID \t"
test -e $filename -a -g $filename && echo -e "have SGID \t"
