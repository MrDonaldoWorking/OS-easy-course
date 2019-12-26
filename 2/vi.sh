#!/bin/bash

#sudo cat /var/log/*.log | wc -l
sudo find /var/log/ -name "*.log" -type f | xargs -n 1 cat | wc -l

exit 0
