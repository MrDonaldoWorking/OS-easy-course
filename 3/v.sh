#!/bin/bash

for pid in $(ps -A -o pid | tail -n +2)
do
	status="/proc/"$pid"/status"
	sched="/proc/"$pid"/sched"
	
	ppid=$(sudo grep -E -s -h "PPid" $status | grep -E -s -o "[0-9]+")
	sleepavg=$( grep -E -s -h "se.sum_exec_runtime" $sched | grep -E -s -o "[0-9]+.[0-9]+")
	#echo "!!"
	#sudo grep -E -s -h "se.sum_exec_runtime" $sched

	if [[ -z $sleepavg ]]
	then 
		sleepavg=0
	fi

	if [[ -n $ppid ]]
	then 
		echo "ProcessID=$pid : Parent_ProcessID=$ppid : Average_Sleeping_Time=$sleepavg"
	fi
done | sort -V --key=2 > res5.txt

exit 0
