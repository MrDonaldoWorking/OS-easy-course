#!/bin/bash

./iv_gen.sh&pid1=$!
cpulimit -q --background --pid $pid1 --limit 15
./iv_gen.sh&pid2=$!

echo $pid1
echo $pid2

exit 0
