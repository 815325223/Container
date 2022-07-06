#!/bin/bash

mkdir -p /dev/net

if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

iptables -F
iptables -I INPUT -p udp --dport 1195  -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.10.0.0/24 -j MASQUERADE

openvpn $OPENVPN/openvpn.conf
