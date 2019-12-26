#!/bin/bash

for pid in $(ps axo pid | tail -n +2)
do
    (sudo readlink /proc/$pid/exe | grep -q "/sbin") && echo $pid
done

#echo "after"
#ps axo pid,command | grep "/sbin/" | awk '{printf("%s\n", $1)}'

exit 0
