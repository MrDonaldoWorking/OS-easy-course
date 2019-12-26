#!/bin/bash

for pid in $(ps -A -o pid | tail -n +2)
do
     cat "/proc/$pid/statm" | awk '{printf $2 - $3; print " *"}' | sed "s/*/${pid}/"
     #cat "/proc/$pid/statm" | awk '{printf("%d %d\n", $2 - $3, $pid)}'
done | sort -n -r | awk '{printf $2; printf " : "; print $1}'

exit 0
