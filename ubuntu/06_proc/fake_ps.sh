#!/bin/bash

for line in $(ls /proc | grep [0-9])
do
	if ! [ -f /proc/$line/task/$line/status ]; then
		continue
	else
		name=$(cat /proc/$line/task/$line/status | grep Name | awk '{print $2}')
		pid=$line
		ppid=$(cat /proc/$line/task/$line/status | grep PPid | awk '{print $2}')
		state=$(cat /proc/1599/task/1599/status | grep State | awk '{print $2}')
		echo "PID=$pid | PPID=$ppid | STATE=$state | NAME=$name"
	fi
done