#!/bin/bash

#sudo rm /etc/init.d/HddlfBoot.sh 
#sudo gedit /etc/init.d/HddlfBoot.sh 
cp HddlfBoot.sh /etc/init.d/
chmod -R 777 /etc/init.d/HddlfBoot.sh 
chown hddlf:hddlf /etc/init.d/HddlfBoot.sh 

# install
cd /etc/init.d/
update-rc.d HddlfBoot.sh defaults 90
echo "Install Mustang-F100 Boot plug-in successfully , You need to reboot the computer to make the plug-in work "
