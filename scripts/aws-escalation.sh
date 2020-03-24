#!/bin/bash

INSTANCEID=`/bin/cat /sys/devices/virtual/dmi/id/board_asset_tag`


###Controllo
#echo $INSTANCEID
echo "Wait 5 second before claim vip interface"

sleep 5

echo "Attach VIP Interface"
/usr/local/bin/aws ec2 attach-network-interface --instance-id $INSTANCEID --network-interface-id {{ aws_netint_id }} --device-index 1
#`/usr/local/bin/aws ec2 attach-network-interface --instance-id $INSTANCEID --network-interface-id {{ aws_netint_id }} --device-index 1`

echo "Wait 3 second before Config the interface"
sleep 3
/sbin/ifup {{ sec_net_int }}
