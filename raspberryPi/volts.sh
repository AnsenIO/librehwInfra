for id in core sdram_c sdram_i sdram_p ; do 

echo -e "$id:\t$(vcgencmd measure_volts $id)" ; 
done


vcgencmd measure_clock arm
vcgencmd measure_temp

for src in arm core h264 isp v3d uart pwm emmc pixel vec hdmi dpi gpu ; do 
echo -e "$src:\t$(vcgencmd measure_clock $src)" ; 

done

#cat /proc/cpuinfo
vcgencmd get_mem arm && vcgencmd get_mem gpu

free -h

