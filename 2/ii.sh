#!/bin/bash

sudo grep -h -s "\(WW\)" /var/log/Xorg.0.log | sed "s/\(WW\)/Warning: /" > full.log
sudo grep -h -s "\(II\)" /var/log/Xorg.0.log | sed "s/\(II\)/Information: /" >> full.log

exit 0
