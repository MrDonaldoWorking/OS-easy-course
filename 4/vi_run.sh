#!/bin/bash

echo $$ > vi.pid

mod="run"

term() {
    mod="stop"
}

trap 'term' SIGTERM

while true
do    
    case $mod in
    "run" )
    	:
	    ;;
    "stop" )
        echo "Got SIGTERM signal"
        exit
    	;;
    esac
done

exit 0
