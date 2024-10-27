#!/bin/bash

BASE_DIR="/home/batan/.config/bin"

# check location

if [[ ! -d "/home/batan/.config/bin" ]] ;
then
	echo -e "\033[34mBin files are not in \033[31m${BASE_DIR}\033[0m"
fi
for i in $(ls ${BASE_DIR}/lc-*);
do
	sudo cp $i /usr/bin/
done
	sudo chmod +x /usr/bin/lc-*
clear
for i in $(ls ${BASE_DIR}/lc-*);
do
	echo -e "   \033[31m>>>   \033[34m $i \033[36mis now executable.\033[0m"
done

