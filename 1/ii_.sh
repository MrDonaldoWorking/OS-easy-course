#!/bin/bash

if [[ $# -eq 0 ]]
then
    echo "got 0 arguments"
    exit 0
fi

max_num=$1
for n in $*
do
    if [[ $max_num -lt $n ]]
    then
        max_num=$n
    fi
done

echo $max_num

exit 0
