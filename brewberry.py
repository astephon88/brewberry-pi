#!/usr/bin/python
import os
import time
import math
import logging
import RPi.GPIO as GPIO
import MySQLdb as mdb
from flowmeter import *

logging.basicConfig(format='%(asctime)s %(message)s',filename='/opt/brewberrypi/pour.log',level=logging.INFO)


GPIO.setmode(GPIO.BCM) # use real GPIO numbering
GPIO.setup(17,GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(18,GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(27,GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(22,GPIO.IN, pull_up_down=GPIO.PUD_UP)

#todo:config file to define number of meters, calibration, and pin
fm = FlowMeter('metric', 'beer',10.8)
fm2 = FlowMeter('metric', 'beer',10.8)
fm3= FlowMeter('metric', 'beer',10.25)
fm4=FlowMeter('metric','beer',10.04)

#todo: one funtction, just map look up mapping of channel to flowmeter
def doAClick(channel):
  currentTime = int(time.time() * FlowMeter.MS_IN_A_SECOND)
  if fm.enabled == True:
    fm.update(currentTime)


def doAClick2(channel):
  currentTime = int(time.time() * FlowMeter.MS_IN_A_SECOND)
  if fm2.enabled == True:
    fm2.update(currentTime)

def doAClick3(channel):
  currentTime = int(time.time() * FlowMeter.MS_IN_A_SECOND)
  if fm3.enabled == True:
    fm3.update(currentTime)

def doAClick4(channel):
  currentTime = int(time.time() * FlowMeter.MS_IN_A_SECOND)
  if fm4.enabled == True:
    fm4.update(currentTime)


GPIO.add_event_detect(17, GPIO.RISING, callback=doAClick, bouncetime=20) 
GPIO.add_event_detect(18, GPIO.RISING, callback=doAClick2, bouncetime=20) 
GPIO.add_event_detect(27, GPIO.RISING, callback=doAClick3, bouncetime=20)
GPIO.add_event_detect(22, GPIO.RISING, callback=doAClick4, bouncetime=20)
# main loop
while True:
  
  currentTime = int(time.time() * FlowMeter.MS_IN_A_SECOND)
 
  #todo: for loop going through each flow meter
  if (fm.thisPour > 0.150 and currentTime - fm.lastClick > 5000): # 10 seconds of inactivity causes a tweet
   
    con = mdb.connect('localhost','root','beermenu','beer');
    cur=con.cursor();
    cur.execute("SELECT enabled from Beer where tap=1;")
    enabled=bool(cur.fetchone()[0])
    if (enabled):
        cur.execute("UPDATE Beer Set Volume = Volume-"+str(fm.thisPour*33.814)+" WHERE tap=1;");
        logging.info('Just Poured %s ounces from tap 1',str(fm.thisPour*33.814))
    fm.thisPour = 0.0
    con.close()
 
  if (fm2.thisPour > 0.150 and currentTime - fm2.lastClick > 5000): # 10 seconds of inactivity causes a tweet
   
    con = mdb.connect('localhost','root','beermenu','beer');
    cur=con.cursor();
    cur.execute("SELECT enabled from Beer where tap=2;")
    enabled=bool(cur.fetchone()[0])
    if(enabled):
        cur.execute("UPDATE Beer Set Volume = Volume-"+str(fm2.thisPour*33.814)+" WHERE tap=2;");
        logging.info('Just Poured %s ounces from tap 2',str(fm2.thisPour*33.814))
    fm2.thisPour = 0.0
    con.close()
  
  if (fm3.thisPour > 0.150 and currentTime - fm3.lastClick > 5000): # 10 seconds of inactivity causes a tweet
   
    con = mdb.connect('localhost','root','beermenu','beer');
    cur=con.cursor();
    cur.execute("SELECT enabled from Beer where tap=3;")
    enabled=bool(cur.fetchone()[0])
    if(enabled):
        cur.execute("UPDATE Beer Set Volume = Volume-"+str(fm3.thisPour*33.814)+" WHERE tap=3;");
        logging.info('Just Poured %s ounces from tap 3',str(fm3.thisPour*33.814))
    fm3.thisPour = 0.0
    con.close()

  if (fm4.thisPour > 0.159 and currentTime - fm4.lastClick > 5000): # 10 seconds of inactivity causes a tweet
   
    con = mdb.connect('localhost','root','beermenu','beer');
    cur=con.cursor();
    cur.execute("SELECT enabled from Beer where tap=4;")
    enabled=bool(cur.fetchone()[0])
    if(enabled):
        cur.execute("UPDATE Beer Set Volume = Volume-"+str(fm4.thisPour*33.814)+" WHERE tap=4;");
        logging.info('Just Poured %s ounces from tap 4',str(fm4.thisPour*33.814))
    fm4.thisPour = 0.0
    con.close()
  time.sleep(1)
