#!/bin/sh
# Script to control the signal lights on the front of the Mikrotik RouterBOARD RBM11G

#https://github.com/TomRBarber/Mikrotik-RBM11G-4g-Signal-LED for more info on usage

#strips % from the called perameter
percent=${1%\%}

LED_ON()
{
  echo "default-on" >  /sys/class/leds/rbm11g\:green\:rssi$1/trigger

}

LED_OFF()
{
  echo "none" >  /sys/class/leds/rbm11g\:green\:rssi$1/trigger

}


#1 Bar
if [ $percent -ge 0 ] && [ $percent -le 20 ]; then
     LED_ON 4
     LED_OFF 3
     LED_OFF 2
     LED_OFF 1
     LED_OFF 0
fi
 
#2 Bars
if [ $percent -ge 21 ] && [ $percent -le 40 ]; then
     LED_ON 4
     LED_ON 3
     LED_OFF 2
     LED_OFF 1
     LED_OFF 0
fi
 
#3 Bars
if [ $percent -ge 41 ] && [ $percent -le 60 ]; then
     LED_ON 4
     LED_ON 3
     LED_ON 2
     LED_OFF 1
     LED_OFF 0
fi
 
#4 Bars
if [ $percent -ge 61 ] && [ $percent -le 80 ]; then
     LED_ON 4
     LED_ON 3
     LED_ON 2
     LED_ON 1
     LED_OFF 0
fi
 
#5 bars
if [ $percent -ge 81 ] && [ $percent -le 100 ]; then
     LED_ON 4
     LED_ON 3
     LED_ON 2
     LED_ON 1
     LED_ON 0
fi
 
 