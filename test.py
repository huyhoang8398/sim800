import pickle
import os
import time
import serial
import RPi.GPIO as GPIO
from time import sleep
import datetime
import subprocess 
from stringexec import parseString, writeString
ser2 = serial.Serial(
    port = '/dev/ttyACM0',
    baudrate = 9600
)
ser2.write('D')
voltage = ser2.readline()
writeString('outputvoltage.txt', voltage)