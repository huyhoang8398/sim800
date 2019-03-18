#!/bin/bash
crontab -u pi -l > /home/pi/sim800/cron.txt
infoDPI=$(grep java /home/pi/sim800/cron.txt| awk '{print $(NF-2)}')
sed -i -e 's/\r//g' /home/pi/sim800/outputTime.txt
newCron=$(cat -A /home/pi/sim800/outputTime.txt)
crontab -u pi -l | grep -v java > /home/pi/sim800/cron.txt

#change your path to your java file that control the scaner 
echo -e "${newCron}" "java -jar /home/pi/scannn/scan-lib.jar" "${infoDPI}" "> /dev/null" >> /home/pi/sim800/cron.txt

#sed -i "s|$oldCron||g" fileTmp.txt
#sed -i "s|$oldCron|$newCron|g" fileTmp.txt
crontab -u pi /home/pi/sim800/cron.txt
