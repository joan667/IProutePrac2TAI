#!/bin/bash
#Esto es para el router

#TODO a verificar que los pesos son numeros

P1=$1
P2=$2

ip route replace default scope global nexthop via 192.168.0.1 dev eth0 weight $P1 \
nexthop via 192.168.1.1 dev eth1 weight $P2

#Finalmente mostramos el contenido de las tablas de routing

clear
ip route
