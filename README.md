This project is to take the signal % from the 4g modem in a Mikrotik RBM11G running Goldenorb rOOter, and change the LEDs on the front of it depending on the signal strength.
There are 5 bars, so depending on the % of the signal, it will show more/less(1 bar for 0-20, 2 for 21-40, 3 for 41-60, 4, for 61-80, all 5 for 81-100)

It should be trivial to modify this for other boards with spare LEDs as long as you're running Goldenorb rOOter(and probably modifiable for other OpenWRT based distros),  This page has more info on listing LEDs, and turning them on/off
https://openwrt.org/docs/guide-user/base-system/led_configuration

The RBM11G, LEDs from left to right are 4, 3, 2, 1, 0.


In /usr/lib/rooter/signal/modemsignal.sh , towards the bottom of the file, find the "while [ 1 = 1 ]; do" loop (I don't know the line number, but its towards the bottom of the page)
And add this if statement block right under it. 
```

	if [ -e $ROOTER/modem-led.sh ]; then
		$ROOTER/modem-led.sh $CSQ_PER
	fi
```                                                                                                                                                      `

This will call a script at /usr/lib/rooter/modem-led.sh with the CSQ Percentage value as the first parameter.

You can also change the variable to $CSQ to just show the CSQ value, or $CSQ_RSSI to show it as a RSSI value.

This works with any time of modem that provides a signal level in the Network Status page regardless if it is PPP, QMI or MBIM.


Then, create a script modem-led.sh in /usr/lib/rooter/ and insert the contents of the modem-led.sh script in the github.  chmod +x it to make it executable.

Reboot and it should update after it connects to 4g.  It seems to update every 10 seconds or so.  

Thanks to Dairyman on the whirlpool.net.au rOOter forums for providing the infromation on the modemsignal.sh script!

Obviously backup any files you're modifying.