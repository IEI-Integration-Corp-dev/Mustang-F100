#!/bin/bash

cd /etc/init.d/
update-rc.d -f HddlfBoot.sh remove
rm /etc/init.d/HddlfBoot.sh
rm /boot/HddlfBootCounter
rm /boot/HddlfBootCounter2
echo "Mustang-F100 Boot plug-in uninstalled"
