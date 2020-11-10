#!/bin/bash
### BEGIN INIT INFO
# Provides:          HddlfBoot
# Required-Start:    $remote_fs
# Required-Stop:     $all
# Should-Start:      $all
# Default-Start:     2 3 4 5
# Default-Stop:	     0 1 6
# Short-Description: HddlfBoot reboot
# Description:       HddlfBoot reboot for detect hddlf
### END INIT INFO

finiteRun() {
	[ ! -e /boot/HddlfBootCounter ] && echo "1" > /boot/HddlfBootCounter
        [ ! -e /boot/HddlfBootCounter2 ] && echo "0" > /boot/HddlfBootCounter2
	sudo chmod -R 777 /boot/HddlfBootCounter
	declare -i count=$(cat /boot/HddlfBootCounter)
	declare -i count2=$(cat /boot/HddlfBootCounter2)
	

	if [ $count -ge 50000 ]; then
	    echo "1" > /boot/HddlfBootCounter
	fi

        CardCounter=$(lspci | grep Altera | wc -l)
        echo $CardCounter > /home/hddlf/Desktop/CardCounter

        if [ $CardCounter -ge 1 ]; then
            if [ $[ $count%2 ] -eq 0 ]; then
               echo "$[ $count+1 ]" > /boot/HddlfBootCounter
            fi
	else
            echo "$[ $count+1 ]" > /boot/HddlfBootCounter
            sleep 5
            if [ $[ $count%2 ] -ge 1 ]; then
               echo "$[ $count2+1 ]" > /boot/HddlfBootCounter2
               sleep 5
	       /sbin/reboot
            fi
	fi
}

## Main function stream
case $1 in
  start)
finiteRun;
  ;;
  stop)
  ;;
  restart)
  ;;
  reload|force-reload) 
  ;;
  status)
  ;;
  *)
  ;;
esac

exit 0

