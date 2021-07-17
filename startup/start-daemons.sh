#!/bin/bash

konsole -e htop &
konsole -e "/home/donaldo/Desktop/plasma-refresh.sh 1" &

# if [ ! -d .log ]; then
#     mkdir -p .log
# fi
konsole -e "/home/donaldo/Desktop/grub-image-shaker.sh 1" &
