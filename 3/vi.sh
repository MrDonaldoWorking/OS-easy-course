#!/bin/bash

ppid=0
sleepSum=0
count=0

result=""

function calcSleepAvg() {
    sleepSum=$(echo "$sleepSum/$count" | bc -l -q)
    #result=${result}"Average_Sleeping_Children_of_ParentID="${ppid}" is "${sleepSum}$'\n'
    echo "Average_Sleeping_Children_of_ParentID="${ppid}" is "${sleepSum}
}

while read line
do
    if [[ -n ${line} ]]
    then
        currPpid=$(echo ${line} | grep -E -h -s -i -o "Parent_ProcessID=[0-9]+" | grep -E -o "[0-9]+")
        currSleepAvg=$(echo ${line} | grep -E -h -s -i -o "Average_Sleeping_Time=[0-9]+.[0-9]+" | grep -E -o "[0-9]+.[0-9]+" | awk '{printf("%s",$1)}')

        if [[ ${ppid} == ${currPpid} ]]
        then
            sleepSum=$(echo "$sleepSum+$currSleepAvg" | bc -l -q)
            count=$(echo "$count+1" | bc -l -q)
        else
            calcSleepAvg

            sleepSum=${currSleepAvg}
            ppid=${currPpid}
            count=1
        fi
        
        #result=${result}${line}$'\n'
        echo ${line}
    fi
done < res5.txt

calcSleepAvg

#echo "$result"

exit 0
