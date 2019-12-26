#!/bin/bash

echo $$ > vii.pid

mod="add"
res=1

add() {
    mod="add"
}

mult() {
	mod="mult"
}

term() {
	mod="stop"
}

calc() {
	case $mod in
	"add" )
		let res=res+2
		;;
	"mult" )
		let res=res*2
		;;
	esac
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
    *)
    	calc
    	echo $res
    	;;
    esac
    
    sleep 1
done
