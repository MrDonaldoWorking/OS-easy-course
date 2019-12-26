#!/bin/bash

#grep -r -s -o -E "^#![[:alnum:]/]+" /bin/* | awk -F "^#!" '{printf("%s\n", $2)}' | sort | uniq --ignore-case --count | sort --numeric-sort --reverse | head -n 1 | awk '{printf("%s\n", $2)}'
#file /bin/* | grep ' script' | cut -d : -f 1 | xargs -n 1 head -n 1 | sort | uniq -c | sort -rn | head -n 1 | awk '{printf("%s\n", $2)}'
sudo find /bin -name '*' -type f | xargs -n 1 head -n 1 | grep -s -a "^#!" | awk -F "#!" '{printf("%s\n", $2)}' | sort | uniq --ignore-case --count | sort --numeric-sort --reverse | head -n 1 | awk '{printf("%s\n", $2)}'

exit 0
