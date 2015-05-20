#!/bin/bash
#Program:
#Test While
while [ "$yn" != "yes" ] && [ "$yn" != "YES" ]; do
	read -p "Please input yes/YES to stop this Program: " yn
done
echo "OK! you input the correct answer."