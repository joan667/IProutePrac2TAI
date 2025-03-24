#!/bin/bash
# TODO(opcional) si se quieren se pueden meter mas comprovaciones de paramtros etc etc...
# Asignar parámetros a variables
activate=$1
subnet=$2

# Determinar la acción en iptables (-A para agregar, -D para eliminar)
if [ "$activate" -eq 1 ]; then
    action="-A"
    #eliminamos para asegurarnos que no hay duplcados
    iptables -t nat -D POSTROUTING -s "$subnet" -j MASQUERADE
elif [ "$activate" -eq 0 ]; then
    action="-D"
else
    echo "Error: El primer parámetro (activate) debe ser 0 o 1"
    exit 1
fi

# Ejecutar el comando iptables
iptables -t nat $action POSTROUTING -s "$subnet" -j MASQUERADE

# Mostramos el contenido de las reglas de la tabla nat de iptables
clear
iptables -t nat -v -L -n
