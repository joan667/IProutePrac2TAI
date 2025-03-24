#!/bin/bash
#Por cada cliente/subred
#Aparentemente aqui no hay que añadir nada de scope realm... etc

ip route add default via 192.168.2.1 scope global
