#!/bin/bash
#############################################################
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
White='\033[1;37m'
#				clear
#				echo -e "${White}\033[43mTaskwarrior Common Commands :\033[0m"
#				echo -e ""
#				echo -e "${Cyan} >>>${White} 1${Cyan})${Blue} Add New Tasks to existing List\033[0m"
#				echo -e "${Cyan} >>>${White} 2${Cyan})${Blue} Mark existing Tasks as Done\033[0m"
#				read -p ' >>>     ' abc
#				if [[ $abc -eq 1 ]]; then
#				while :; do
#				clear
#				tput cup 9 0
#				echo -e "${Blue}==========   ${White}\033[43mPENDING TASKS${NC}${Blue}   =========${NC}"
#				tput cup 10 0
#				task
#				tput cup 0 0
#				echo -e "${White}\033[43mAdding tasks to be Done to Taskwarrior\033[0m"
#				echo -e "${Blue}======================================${NC}"
#				echo -e "\033[33m"
#				read -p 'description   >>>   ' a1
#				if [[ -z $a1 ]]; then
#					sudo -u batan bash taskadd.sh
#					fi
#					read -e -p 'project       >>>   ' -i "PC" a2
#					read -p 'priority      >>>   ' a3
#					read -e -p 'tag           >>>   ' -i "+" a4
#					read -e -p 'due           >>>   ' -i "2024-05-" user_input
#					tput cup 7 0
#					tput el
#					read -e -p 'due           >>>   ' -i "${user_input}T" a5
#
#					task add $a1 project:$a2 priority:$a3 $a4 due:$a5;
#					done
#					else
#						while :; do
#								clear
#								tput cup 9 0
#								echo -e "${Blue}==========   ${White}\033[43mPENDING TASKS${NC}${Blue}   =========${NC}"
#								tput cup 10 0
#								task
#								tput cup 0 0
#								echo -e "${White}\033[43mMark existing Tasks as Done\033[0m"
#								echo -e "${Blue}======================================${White}"
#								echo -e ""
#								read -p 'Enter [Task ID]    >>> ' bcd
#								if [[ -z $bcd ]]; then
#									sudo -u batan bash taskadd.sh
#									fi
#									task $bcd done
#									done
#									fi
#
#
#
