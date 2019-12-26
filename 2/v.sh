#!/bin/bash

awk -F ':' '{printf("%s:%s\n", $3, $1)}' /etc/passwd | sort --numeric-sort

exit 0
