#!/bin/bash

CONN=`netstat -nt | awk '{ print $5}' | cut -d: -f1 | sed -e '/^$/d' | sort -n | uniq | wc -l`
DATE=`date '+%D | %r'`

BR1=`cat /sys/class/net/eth0/statistics/rx_bytes`
BT1=`cat /sys/class/net/eth0/statistics/tx_bytes`
sleep 30
BR2=`cat /sys/class/net/eth0/statistics/rx_bytes`
BT2=`cat /sys/class/net/eth0/statistics/tx_bytes`

INKB=$(((($BR2-$BR1) /30) /1024))
OUTKB=$(((($BT2-$BT1) /30) /1024))

echo "$DATE | $CONN | $INKB KB/s In (eth0) | $OUTKB KB/s Out (eth0)" >> /var/log/camstatlog

exit 0