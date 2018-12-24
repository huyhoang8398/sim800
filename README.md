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

## Run this app
```bash
git clone https://github.com/huyhoang8398/sim800
sudo python sim808.py
```
## File edit :
* sim800.py
	* Edit your phone number for GSM.
* info.sh
	* Edit the path to your folder where you store pictures.
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
