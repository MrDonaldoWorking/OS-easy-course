#!/bin/bash

#touch v_problem
#> v_problem 

num=1
mode="+"

tail -n 0 -f v_problem |
while true; do
    read line
    case $line in
        "+")
            mode="+"
            echo "Adding mode"
            ;;
        "*")
            mode="*"
            echo "Multiplying mode"
            ;;
        "QUIT")
            echo "Stopped"
       		killall tail

            exit 0
            ;;
        [0-9]*)
            case $mode in
                "+")
                    echo $num "+" $line	"=" $(($num + $line))				
                    num=$(($num + $line))
                    ;;
                "*")
                    echo $num "*" $line "=" $(($num * $line))					
                    num=$(($num * $line))
                    ;;
            esac
            ;;
        *) 
	    echo "Incorrect input"
	    killall tail
            exit 1
            ;;
    esac
done

exit 0
