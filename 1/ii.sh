#!/bin/bash

max12=0
if [[ $1 -gt $2 ]]
then
    max12=$1
else
    max12=$2
fi

if [[ $3 -gt $max12 ]]
then
    max12=$3
fi

echo $max12

exit 0
