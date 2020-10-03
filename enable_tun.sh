modprobe tun
chown mikro /dev/net/tun
sleep 1
#tunctl -t tap0 -u mikro
ip tuntap add dev tap0 mode tap user mikro
sleep 1
#ifconfig tap0 192.168.251.1 pointopoint 192.168.251.2 netmask 255.255.255.255 up
ip address add 192.168.251.1/32 dev tap0
ip tunnel add aranym mode ipip local 192.168.251.1 remote 192.168.251.2
ip link set aranym up
iptables -t nat -A POSTROUTING -s 192.168.251.2 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
