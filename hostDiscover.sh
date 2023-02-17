#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

status=$(echo $?)

function ctrl_c(){
  echo -e "\n\n${yellowColour}[!]${endColour} ${redColour}Saliendo...${endColour}\n"
  exit 1

}

#CTRL C
trap ctrl_c INT

#Ping
for i in $(seq 1 254); do
  timeout 1 bash -c "ping -c 1 10.10.11.$i" &> /dev/null && echo -e ${yellowColour}[+]${endColour} ${grayColour}HOST 10.10.11.$i$ -${endColour} ${blueColour}ACTIVE${endColour} &
done; wait

if [ $status -ne 0 ]; then
  echo -e ${yellowColour}[+]${endColour} ${redColour}No hay máquina activas en la red.${endColour}
fi

