source ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

source /home/batan/.config/ghostty/shell-integration/bash/bash-preexec.sh



