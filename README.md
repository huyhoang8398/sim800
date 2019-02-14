## Project
* Control raspberry Pi via smartphone
* Features:
	- Number images record
	- Free storage capacity of SD card
	- Number images record
	- Power of the battery
	- ...(More to come!)

## Dependencies
* Linux >= 2.6.13
* Python >= 2.4 (including Python 3.x)
* Bash
* An USB Huawei Dcom or GSM module 800l

## Hardware 
```
RPI Sim808 	|| 		Raspberry Pi
	  C_PW		||			GPIO 27
	   PWK		|| 			GPIO 17 
	   TxD 		|| 			RxD (GPIO 15)
     RxD 		|| 			TxD (GPIO 14)
```
- Insert your SIM card into the SIM800

## Preparing
```bash
sudo apt-get install python-pip
sudo apt-get install python-serial
```
## Enable UART
* Go to Raspberry Pi setting and enable UART

## NOTE: Configuration
* The port /dev/ttyAMA0 on the raspberry pi 3 maps to the bluetooth and to the standard serial port on the others
* Assuming you have used the default raspbian image, you will first need to disable the serial console as
  * The Broadcom UART appears as /dev/ttyAMA0 under Linux. There are several minor things in the way if you want to have dedicated control of the serial port on a Raspberry Pi. Firstly, the kernel will use the port as controlled by kernel command line contained in /boot/cmdline.txt. The file will look something like this:
  ```
  dwc_otg.lpm_enable=0 console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait
  ```
* The console keyword outputs messages during boot, and the kgdboc keyword enables kernel debugging. You will need to remove all references to ttyAMA0. So, for the example above 
```
/boot/cmdline.txt
``` 
should contain:
```
dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait
```
* In this tutorial I will show you how to connect your Raspberry Pi to a 3G network using the Itead Raspberry Pi GSM Board (SIM800). This breakout board communicates to the Pi over serial, but as we know the serial ports of the Pi are initally already in use, so we will need to do a bit of jiggery pokery to free up the serial ports.

### Free up your serial ports
* First we need to edit the /boot/config.txt file
```bash
sudo nano /boot/config.txt
```
* Add the following lines
```
dtoverlay=pi3-miniuart-bt
enable_uart=1
force_turbo=1
```
* Now we need to edit the /boot/cmdline.txt file
```bash
sudo nano /boot/cmdline.txt
```
* Remove all references of "console=", for example, if the line reads:
```
dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait
```
* Change it to:
```
dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait
```

### If it is too hard for you, I prepared all the configuration file in the config folder, you just need to put it into /boot folder

## Run this app
```bash
git clone https://github.com/huyhoang8398/sim800
sudo python sim808.py
```
## File edit :
* sim800.py
	* Edit your phone number for GSM.
	* ![alt text](https://github.com/huyhoang8398/sim800/blob/v1.0/pictures/Screenshot_2018-12-24_23-00-01.png)
* info.sh
	* Edit the path to your folder where you store pictures.
	* ![alt text](https://raw.githubusercontent.com/huyhoang8398/sim800/v1.0/pictures/Screenshot_2018-12-24_23-07-41.png)
* changeTime.sh
	* Edit the path to your java file (to control scanner) to install new cronjob for Rasp Pi
	* ![alt text](https://raw.githubusercontent.com/huyhoang8398/sim800/v1.0/pictures/Screenshot_2018-12-24_23-10-11.png)
## Auto run at start up with crontab
```bash
sudo apt-get install crontab
```
To config crontab use:
```bash
crontab -e
* Add this line to automatic run the program at startup
```
```
@reboot bash /home/pi/sim800/launcher.sh
```
* Updating...
