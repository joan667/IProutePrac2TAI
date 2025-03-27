#!/bin/bash

#ponemos todos los paquetes no marcados que passen por la cola 1, es decir la que tiene el ancho de banda maximo
tc qdisc change dev eth0 root handle 1: prio priomap 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
