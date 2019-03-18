#!/bin/bash
str1="Images JPG:"
str2="Images PNG:" 
str3="Free storage:" # your storage available
str4="DPI:" ## your DPI 
str6="Time to take Picture:"
str5="Number of Picture can take:"
str7="Voltage:"
delimiter=' '
#Linux command line 
avaiMemG=$(df -h /home | tail -1 | awk '{print $4}')
avaiMemM=$(df /home | tail -1 | awk '{print $4}')
# edit your path to count number of image here
infoPng=$(find /home/pi/scannn/ | grep .png | wc -l)
infoJpg=$(find /home/pi/scannn/ | grep .jpg | wc -l)
infoVolt=$(cat -A /home/pi/sim800/outputvoltage.txt)
infoDPI=$(crontab -u pi -l > /home/pi/sim800/cron.txt; < /home/pi/sim800/cron.txt grep java | awk '{print $(NF-2)}')
crontab -u pi -l | grep java > /home/pi/sim800/cron.txt
cut -d"$delimiter" -f1-5 /home/pi/sim800/cron.txt > /home/pi/sim800/cron2.txt
infoTime=$(cat -A /home/pi/sim800/cron2.txt)
### image size
## 1GiB = 1024 MB = 1048576 KB
# df -h will output as gigabyte if posible, but we need KB and MB 
# using kb as default parameter
# Write date, time > overwrite all files data
date > /home/pi/sim800/dailyLog.txt


function GET_MEM()
{
    echo -e "$str3 $avaiMemG "Mb" $avaiMemM\n";  
}

function GET_PNG()
{
    echo -e "$str2 $infoPng\n";
}

function GET_JPG()
{
    echo -e "$str1 $infoJpg\n";
}
function GetDPI()
{
	echo -e "$str4 $infoDPI\n"
}
function GetTime()
{
	echo -e "${str6}" "${infoTime}"
}
function getVolt()
{
  echo -e "${str7} ""${infoVolt}"
}
# Echo output to textfile without overwrite date time 
echo $(GET_JPG) >> /home/pi/sim800/dailyLog.txt
echo $(GET_PNG) >> /home/pi/sim800/dailyLog.txt
echo $(GET_MEM) >> /home/pi/sim800/dailyLog.txt
echo $(GetDPI) >> /home/pi/sim800/dailyLog.txt
echo $(getVolt) >> /home/pi/sim800/dailyLog.txt
echo -e "$str6" "$infoTime""\n" >> /home/pi/sim800/dailyLog.txt


