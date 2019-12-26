#!/bin/bash

cnt=0
while [[ true ]]
do
    read x
    let mod2=$x%2
    if [[ $mod2 -eq 0 ]]
    then
        break
    fi

    let cnt=$cnt\+1
done

echo $cnt

exit 0
