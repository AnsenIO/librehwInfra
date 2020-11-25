#!/bin/bash
	
while  true
do 
clear
date
hostname
vcgencmd measure_volts core
vcgencmd measure_clock arm
vcgencmd measure_temp
free -h
ps auxck -pcpu  | head
	
sleep 1
done
	
#n=1
	
# continue until $n equals 5
#while [ $n -le 5 ]
#do
echo "Welcome $n times."
n=$(( n+1 ))     # increments $n
#done
