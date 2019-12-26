#!/bin/bash

if [[ ! ($# -eq 3 || $# -eq 2) ]]; then
    echo "2 arguments is required: input.mp3, pic, [result.mp3]"
    exit 1
fi

result=""
if [[ $# -eq 3 ]]; then
    result=$3
else
    result=$(echo $1 | sed "s/.mp3/New.mp3/")
fi

echo "result file is "$result

ffmpeg -i $pwd/$1 -i $pwd/$2 -map_metadata 0 -map 0 -map 1 $pwd/$result

exit 0
