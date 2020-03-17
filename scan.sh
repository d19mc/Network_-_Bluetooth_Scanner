#!/bin/bash

# Bluetooth Scanner - MacOS


#Install Bluetooth incase it's not on the system.
brew install blueutil

if [ $? == 1 ]; then
  echo -e "No WiFi Connection \n"
else
  echo -e "\n----- WiFi Connections -----"
  i=0
  while [ $i -lt 256 ]
  do
  	ping 192.168.1.$i -c 1 -W 5 > /dev/null && echo "$(host 192.168.1.$i)"&i=$(($i+1))
  done

fi

blueutil --power 1 # Turns on bluetooth incase it's off.

devices=$(blueutil --paired)
nearby_devices=$(blueutil --inquiry)

if [ -z devices ]; then
  devices="None"
fi

if [ -z nearby_devices ]; then
  nearby_devices="None"
fi

echo -e "\n----- BLUETOOTH -----\nPAIRED DEVICES:\n$devices\n\nNEARBY DEVICES:\n$nearby_devices"
