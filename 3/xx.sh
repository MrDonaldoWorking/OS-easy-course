#!/bin/bash

for pid in $(ps axo pid | tail -n +2)
do
    sudo readlink -f /proc/$pid/exe
done | sort | uniq | wc -l

exit 0
