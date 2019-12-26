#!/bin/bash

DATE=$(date +%H:%M:%S_%d.%m.%Y)
WEBSITE="www.net_nikogo.ru"

mkdir ~/test && echo "catalog test was created successfully" > ~/report && touch ~/test/$DATE.txt
(ping $WEBSITE -c 1 && echo "$WEBSITE is available" >> ~/report) || echo "$WEBSITE isn't available"

rm -r ~/test
cat ~/report
#rm ~/report

exit 0
