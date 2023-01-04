#! /bin/bash


exec > homework.log
echo "Ping IP Address: $1 $2 $3"

echo

echo IP Address 1: $1
echo "time: `date`"
ping -c3 $1 | tail -2
packetloss=$( ping -c3 $1 |  grep -oP '\d+(?=% packet loss)') 
  echo "packet loss:"  $packetloss
echo "This device is normal, with 100% packet loss."
echo
echo IP Address 2: $2
echo "time: `date`"
ping -c3 $2 | tail -2
packetloss=$( ping -c3 $2 |  grep -oP '\d+(?=% packet loss)')  
  echo "packet loss:"  $packetloss
echo "This device is normal."
echo
echo IP Address 3: $3
echo "time: `date`"
ping -c3 $3 | tail -2
packetloss=$( ping -c3 $3 |  grep -oP '\d+(?=% packet loss)')
  echo "packet loss:"  $packetloss
echo "This device is NOT normal."
echo
        echo "Please check your inbox as soon as possible!"

echo "Attention to Device $3 as soon as possible as the site is currently down and not working properly." | mail -s "! Device $3 is down !" kali@kali
echo `date`
echo "$1 and $2 is up"
echo "$3 is down"
exit



