#!/usr/bin/bash

while true; do
d=$(date +%H:%M)
usage=$(free -m | awk '/Mem:/{print $3}')
fr=$(free -m | awk '/Mem:/{print $2}')
echo $d $usage $fr
sleep 10
done
