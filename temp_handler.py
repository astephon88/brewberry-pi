#!/usr/bin/python
import MySQLdb as mdb
import time
from w1thermsensor import W1ThermSensor
import RPi.GPIO as io
io.setmode(io.BCM)

io.setup(23,io.OUT)
io.output(23,False)
sensor = W1ThermSensor()
con=mdb.connect('localhost','root','beermenu','beer')
cur=con.cursor()
compressorOn=False
while True:
	cur.execute("SELECT value FROM temps WHERE type='setting';")
	setTemp = cur.fetchone()[0]
	currentTemp=sensor.get_temperature(W1ThermSensor.DEGREES_F)
	if currentTemp > (setTemp+5) and compressorOn == False:
		compressorOn=True
		#set compressor output high
		io.output(23,True)
		print "Turning on compressor"
	elif currentTemp<=(setTemp+2.5) and compressorOn == True:
		compressorOn=False
		#set compressor output low
		io.output(23,False)
		print "Turning off compressor"
	cur.execute("UPDATE temps SET value="+str(currentTemp)+"  WHERE type='current';")
	print currentTemp
	time.sleep(1)
