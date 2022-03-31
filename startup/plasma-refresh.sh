#!/bin/bash

if [ $1 -eq 1 ]; then
    sleep 100
fi
if [ $1 -eq 2 ]; then
    kstart5 plasmashell &
fi

MAX_MEM=300000 # 300 MiB is upper bound of acceptable memory

while true; do
    MEM=$(grep VmRSS < /proc/`pidof plasmashell`/status | awk '{print $2}')
    if [ $MEM -ge $MAX_MEM ]; then
        kdialog --msgbox "!!! $(date) plasmashell eats $(numfmt --to=iec-i --suffix=B $(($MEM*1000))) of RAM !!!" &
        sleep 6
        echo "kquitapp5 plasmashell"
        kquitapp5 plasmashell &
        sleep 4
        echo "killall plasmashell"
        killall plasmashell &
        sleep 4
        echo "killall plasmashell -9 (SIGKILL)"
        killall plasmashell -9 &
        sleep 4
        echo "Trying restart plasmashell every 15 seconds"
        while [ $(ps aux | grep plasmashell | wc -l) -le 1 ]; do
            kstart5 plasmashell &>/dev/null &
            echo "kstart5 plasmashell &>/dev/null &"
            sleep 15
        done
        # In situation when not started properly
        for (( i = 0; i < 5; ++i )); do
            sleep 5
            kstart5 plasmashell &>/dev/null &
        done
        for (( i = 0; i < 5; ++i )); do
            sleep 5
            plasmashell &>/dev/null &
        done
        echo "Restarted"
    else
        let next=$(date +%s)+1500
        echo "$(date): $(numfmt --to=iec-i --suffix=B $(($MEM*1000))) bytes"
        kdialog --msgbox "$(numfmt --to=iec-i --suffix=B $(($MEM*1000))) bytes is acceptable, next check at $(date -d @$next)" &
    fi
    sleep 1500
done
