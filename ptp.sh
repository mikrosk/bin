#!/bin/sh

USER=mikro
# virtual interface name
TAP=tap0
# real interface name
IF=wlp3s0
# host IP
HOSTIP=192.168.130.12
# free IP on the network
ATARIIP=192.168.130.254
# netmask
MASK=255.255.255.0

#tunctl -t $TAP -u $USER
ip tuntap add dev $TAP mode tap user $USER
sleep 1

sysctl -w net.ipv4.ip_forward=1
sysctl -w net.ipv4.conf.$TAP.proxy_arp=1

# This will answer ARP requests for $ATARIIP with the MAC address for $IF.
arp -Ds $ATARIIP $IF pub

ifconfig $TAP $HOSTIP pointopoint $ATARIIP netmask $MASK up
