#!/bin/bash

while true
do
	read line
	
	case $line in
		"+" )
			kill -USR1 $(cat vii.pid)
			;;
		"*" )
			kill -USR2 $(cat vii.pid)
			;;
		"TERM" )
			kill -SIGTERM $(cat vii.pid)
			exit 0
			;;
	esac
done
