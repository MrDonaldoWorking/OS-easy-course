#!/bin/bash

man bash | tr -c "[[:alnum:]]" "\n" | grep -E ".{4,}" | sort | uniq --ignore-case --count | sort --numeric-sort --reverse | head -n 3 | awk '{printf("%s\n", $2)}'

exit 0
