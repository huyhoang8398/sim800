#!/bin/bash
crontab -u pi -l > /home/pi/sim800/cron.txt
sed -i -e 's/\r//g' /home/pi/sim800/outputDPI.txt
DPI=$(cat -A /home/pi/sim800/outputDPI.txt)
infoDPI=$(grep java /home/pi/sim800/cron.txt| awk '{print $(NF-2)}')
sed -i "s|$infoDPI|$DPI|" /home/pi/sim800/cron.txt
crontab -u pi /home/pi/sim800/cron.txt
