#!/bin/bash

while true
do
    read line

    if [[ $line == "TERM" ]]
    then
        kill -SIGTERM $(cat vi.pid)
        exit
    fi
done

exit 0
