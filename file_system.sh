#!bin/bash

#monitoring the free fs disk space

FU=$(df -H | egrep -v "Filesystem|tmpfs" | grep "drivers" | awk '{print $5}' |tr -d %)
TO="aashlesha111@gmail.com"

if [[ $FU -ge 20 ]]
then
	echo "Warning, disk space is low  - $FU %" | mail -s "Disk space alert"  $TO
else
	echo "Disk space sufficient"
fi
