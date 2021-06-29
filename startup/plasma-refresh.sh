#!/bin/bash

if [ $1 -eq 1 ]; then
    sleep 100
fi
MAX_MEM=500000

while true; do
    MEM=$(grep VmRSS < /proc/`pidof plasmashell`/status | awk '{print $2}')
    if [ $MEM -ge $MAX_MEM ]; then
        kdialog --msgbox "!!! $(date) plasmashell eats $(numfmt --to=iec-i --suffix=B $MEM) of RAM !!!"
        sleep 6
        echo "kquitapp5 plasmashell"
        kquitapp5 plasmashell &
        sleep 10
        echo "killall plasmashell"
        killall plasmashell &
        sleep 10
        echo "killall plasmashell -9 (SIGKILL)"
        killall plasmashell -9 &
        sleep 10
        echo "Starting plasmashell again"
        plasmashell &>/dev/null &
    else
        let next=$(date +%s)+1500
        echo "$(date): $(numfmt --to=iec-i --suffix=B MEM) bytes"
        kdialog --msgbox "$(numfmt --to=iec-i --suffix=B $MEM) bytes is acceptable, next check at $(date -d @$next)"
    fi
    sleep 1500
done
