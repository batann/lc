#!/bin/bash
BASE_DIR="/home/batan/.config/mashpodder/"

yad --plug=12345 --tabnum=1 --text="LC-Linux Podcast and Audio-Process App" --boarders=20 --form --field="Update Podcast Episodes":FBTN "sudo -u batan bash $BASE_DIR/lc-get-podcasts" &> res1 &\
