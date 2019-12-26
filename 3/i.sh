#!/bin/bash

ps a -u donaldo -o pid,command | awk '{printf("%s:%s\n", $1, $2)}'

exit 0
