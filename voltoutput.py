from stringexec import parseString, writeString
ser2 = serial.Serial(
   port = '/dev/ttyACM0',
   baudrate = 9600
)
ser2.write('D')
voltage = ser2.readline()
writeString('outputvoltage.txt', voltage)
voltage = ''
