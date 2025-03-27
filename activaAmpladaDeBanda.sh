#!/bin/bash

#Definimos los realms de ip route para filtrar posteriormente
ip route add 192.168.2.32/27 dev eth0 realm 1
ip route add 192.168.2.64/27 dev eth0 realm 2
ip route add 192.168.2.96/27 dev eth0 realm 3
ip route add 192.168.2.128/27 dev eth0 realm 4
ip route add 192.168.2.160/27 dev eth0 realm 5
ip route add 192.168.2.192/27 dev eth0 realm 6
ip route add 192.168.2.224/27 dev eth0 realm 7

ip route add 192.168.2.32/27 dev eth1 realm 1
ip route add 192.168.2.64/27 dev eth1 realm 2
ip route add 192.168.2.96/27 dev eth1 realm 3
ip route add 192.168.2.128/27 dev eth1 realm 4
ip route add 192.168.2.160/27 dev eth1 realm 5
ip route add 192.168.2.192/27 dev eth1 realm 6
ip route add 192.168.2.224/27 dev eth1 realm 7

#creamos la cola root con tantas bandas/classes como realms + propio router

tc qdisc add dev eth0 root handle 1: prio bands 8
tc qdisc add dev eth1 root handle 1: prio bands 8

#asignamos las colas a la tipologia TBF

tc qdisc add dev eth0 parent 1:1 handle 20: tbf rate 10mbit latency 50ms burst 1540
tc qdisc add dev eth0 parent 1:2 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth0 parent 1:3 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth0 parent 1:4 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth0 parent 1:5 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth0 parent 1:6 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth0 parent 1:7 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth0 parent 1:8 handle 20: tbf rate 10kbit latency 50ms burst 1540

tc qdisc add dev eth1 parent 1:1 handle 20: tbf rate 10mbit latency 50ms burst 1540
tc qdisc add dev eth1 parent 1:2 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth1 parent 1:3 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth1 parent 1:4 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth1 parent 1:5 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth1 parent 1:6 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth1 parent 1:7 handle 20: tbf rate 10kbit latency 50ms burst 1540
tc qdisc add dev eth1 parent 1:8 handle 20: tbf rate 10kbit latency 50ms burst 1540

#añadimos los filtros 
tc filter add dev eth0 parent 1: protocol ip prio 1 route from 1 flowid 1:2
tc filter add dev eth0 parent 1: protocol ip prio 1 route from 1 flowid 1:3
tc filter add dev eth0 parent 1: protocol ip prio 1 route from 1 flowid 1:4
tc filter add dev eth0 parent 1: protocol ip prio 1 route from 1 flowid 1:5
tc filter add dev eth0 parent 1: protocol ip prio 1 route from 1 flowid 1:6
tc filter add dev eth0 parent 1: protocol ip prio 1 route from 1 flowid 1:7
tc filter add dev eth0 parent 1: protocol ip prio 1 route from 1 flowid 1:8

tc filter add dev eth1 parent 1: protocol ip prio 1 route from 1 flowid 1:2
tc filter add dev eth1 parent 1: protocol ip prio 1 route from 1 flowid 1:3
tc filter add dev eth1 parent 1: protocol ip prio 1 route from 1 flowid 1:4
tc filter add dev eth1 parent 1: protocol ip prio 1 route from 1 flowid 1:5
tc filter add dev eth1 parent 1: protocol ip prio 1 route from 1 flowid 1:6
tc filter add dev eth1 parent 1: protocol ip prio 1 route from 1 flowid 1:7
tc filter add dev eth1 parent 1: protocol ip prio 1 route from 1 flowid 1:8
