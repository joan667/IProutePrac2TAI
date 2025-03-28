#!/bin/bash
#Esto es para el router

#TODO a verificar que los pesos son numeros

# Verificar si se pasó una subred como parámetro
if [ -z "$1" ]; then
    echo "Uso: $0 <subred>"
    exit 1
fi

# Lista de subredes y sus valores correspondientes
declare -A SUBNET_MAP=(
    ["192.168.2.32/27"]=2
    ["192.168.2.64/27"]=3
    ["192.168.2.96/27"]=4
    ["192.168.2.128/27"]=5
    ["192.168.2.160/27"]=6
    ["192.168.2.192/27"]=7
    ["192.168.2.224/27"]=8
)


VALOR=${SUBNET_MAP[$1]}

# Buscar el valor asociado a la subred dada

#SE PODRIA VERFICAR LA BANDA
A_Banda=$2

tc qdisc change dev eth0 parent 1:$VALOR handle ${VALOR}: tbf rate $A_Banda latency 50ms burst 1540
tc qdisc change dev eth1 parent 1:$VALOR handle ${VALOR}: tbf rate $A_Banda latency 50ms burst 1540
