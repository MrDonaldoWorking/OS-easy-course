#!/bin/bash

find . -type f -name '*' | sed 'p;s/old/new/' | xargs -n2 -p mv

# erase -p to do script

# https://lisakov.com/blog/renaming-find-sed-xargs-mv/
