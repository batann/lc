#!/bin/bash
clear
###   DEFINE VARIABLES   ####################################
TAB_DIR="/home/batan/.config/mashpodder/YAD/"
counter=1
#podcast_dir="/media/batan/100/mashpodder/podcasts/"
#abc=$( for i in $(ls $podcast_dir|grep -v m3u); do find $podcast_dir$i -maxdepth 1 -type f -name '*mp3'|rev|sed 's!/! !'|rev| awk '{print NR, $0, "/media/batan/100/mashpodder/podcasts"}';done )
#bcd=$(for i in $(ls $podcast_dir|grep -v m3u); do find $podcast_dir$i -maxdepth 1 -type f -name '*mp3'|rev|sed 's!/! !'|rev|sed 's!/media/batan/100/mashpodder/podcasts/!!g'| awk '{print NR, $0, "/media/batan/100/mashpodder/podcasts"}';done)


	###  LOAD TABS   ########################
bash "${TAB_DIR}tab1.sh"
bash "${TAB_DIR}tab2.sh"
bash "${TAB_DIR}tab3.sh"
bash "${TAB_DIR}tab4.sh"
bash "${TAB_DIR}tab5.sh"
bash "${TAB_DIR}tab6.sh"
bash "${TAB_DIR}tab7.sh"
bash "${TAB_DIR}tab8.sh"
bash "${TAB_DIR}tab9.sh"






###   YAD NOTEBOOK   #################3
	yad --notebook --key=12345 --width=1400 --height=600 --grid-lines="BOTH" --title="Your Friendly AI 2.0" --center --text="A little something something to make the Post Installation Conandrum a littlebit easier!!!" --borders=20 --image-on-top --image="/home/batan/10/postinstall/yad.png" \
  --buttons-layout=spread \
  --button="    ":0 \
  --button="    ":10 \
  --button="    ":11 \
  --button="    ":"mp" \
  --button="    ":"@mp select.file" \
  --button="    ":"mp save" \
  --button="    ":"mp playlist.clear" \
  --button="    ":"mp prev" \
  --button=" | ":"mp pause.toggle" \
  --button="One" --button="Two" --button="Three" --button="Four" --tab-borders=10 --tab-pos=left --tab="Welcome" --tab="TTS" --tab="MP3 Player" --tab="Voice to Text" --tab="Add a Podcast Subscription" --tab="PLACE HOLDER" --tab="PLACE HOLDER" --tab="PLACE HOLDER" --tab="Package Manager"





sudo ipcrm -M 12345
