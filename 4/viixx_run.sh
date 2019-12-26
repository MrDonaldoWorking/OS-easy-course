#!/bin/bash

echo $$ > vii.pid

res=1

add() {
    let res=res+2
    echo $res
}

mult() {
	let res=res*2
	echo $res
}

term() {
	mod="stop"
}

trap 'add' USR1
trap 'mult' USR2
trap 'term' SIGTERM

while true
do    
    case $mod in
    "stop" )
        echo "Got SIGTERM signal"
        exit 0
    	;;
    esac
    
    sleep 1
done
