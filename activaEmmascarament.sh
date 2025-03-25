#!/bin/bash
#per el router
iptables -t nat -A POSTROUTING -s 192.168.2.32/27 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.2.64/27 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.2.96/27 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.2.128/27 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.2.160/27 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.2.192/27 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.2.224/27 -j MASQUERADE


