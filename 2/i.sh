#!/bin/bash

sudo grep -r -h -s -a "ACPI*" /var/log/ > errors.log
sudo grep -E -a "/[^\0/]+(\.[^\0/])+[^\0/]+" errors.log

exit 0
