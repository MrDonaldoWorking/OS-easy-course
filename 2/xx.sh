#!/bin/bash

sudo find /var/log -type f | grep -v "apt/*" | wc -l

exit 0
