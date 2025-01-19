#!/bin/bash
clear
BASE_DIR="/home/batan/.config/lc-mashpodder"

if [[ ! -d "/home/batan/.config/lc-mashpodder" ]]; then
    mkdir -p "$BASE_DIR/podcasts"
    mv /home/batan/lc-mashpodder/* $BASE_DIR 

    echo -e "\033[33m       Following files have been moved to \033[31m$BASE_DIR \033[37m"
    echo -e "\033[31m- \033[37mlc-get-podcasts"
    echo -e "\033[31m- \033[37mlc-sample-wrapper-for-cron.sh"
    echo -e "\033[31m- \033[37mmp.conf"
    echo -e "\033[31m- \033[37mparse_enclosure.xsl"
    echo -e "\033[31m- \033[37myad-add-podcast.sh"
    echo -e "\033[33m        as well as the directory: \033[31m"
    echo -e "\033[31m- \033[37mpodcasts\033[0m"
fi

echo -e "\033[34mThe Base-Directory on \033[31m/home/batan/.config/lc-mashpodder/\033[34mexists"


