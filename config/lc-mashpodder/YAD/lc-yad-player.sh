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
#!/usr/bin/env bash
#atualizar(){ yad --center --entry --entry-label='Title' >> musicas.txt; }
#export -f atualizar
#tail -f musicas.txt | yad --list --column='Title' --button='Add':'bash -c atualizar'
clear
sudo ipcrm -M 12345
###   DEFINE VARIABLES   ####################################
counter=1
podcast_dir="/media/batan/100/mashpodder/podcasts/"
mash_dir="/media/batan/100/mashpodder/"

#abc=$(ls -1 /media/batan/100/mashpodder/podcasts/ |grep -v m3u)
#bcd=$(for i in $(echo $abc|sed 's/ /\n/g');do echo $counter $i, "/media/batan/100/mashpodder/podcasts "  && ((counter++));done)
#abc=$(ls /media/batan/100/mashpodder/podcasts/ | grep -v m3u | awk '{print NR, $0, "/media/batan/100/mashpodder/podcasts"}')
abc=$( for i in $(ls $podcast_dir|grep -v m3u); do find $podcast_dir$i -maxdepth 1 -type f -name '*mp3'|rev|sed 's!/! !'|rev| awk '{print NR, $0, "/media/batan/100/mashpodder/podcasts"}';done )
bcd=$(for i in $(ls $podcast_dir|grep -v m3u); do find $podcast_dir$i -maxdepth 1 -type f -name '*mp3'|rev|sed 's!/! !'|rev|sed 's!/media/batan/100/mashpodder/podcasts/!!g'| awk '{print NR, $0, "/media/batan/100/mashpodder/podcasts"}';done)
###   TAB 1   ###########################################################################################
yad --plug=12345 --tabnum=1 --text="LC-Linux Podcast and Audio-Process App" --boarders=20 --form --field="Update Podcast Episodes":FBTN "sudo -u batan bash $mash_dir/lc-get-podcasts" &> res1 &\
###   TAB 2   ###########################################################################################
yad --plug=12345 --tabnum=2 --text="Text to Speech" --borders=30 --image-on-top --image="/home/batan/100/icons/tts1.png" --title="TTS"  \
  --buttons-layout="spread" --form --title="Text-to-Speech Options" \
  --field="Voice":CB "en-US-AndrewMultilingualNeural! en-US-AndrewNeural! en-US-AriaNeural! en-US-AvaMultilingualNeural! en-US-AvaNeural! en-US-BrianMultilingualNeural! en-US-BrianNeural! en-US-ChristopherNeural! en-US-EmmaMultilingualNeural! en-US-EmmaNeural! en-US-EricNeural! en-US-GuyNeural! en-US-JennyNeural! en-US-MichelleNeural! en-US-RogerNeural! en-US-SteffanNeural" \
  --field="Pitch:":SCL --adjustment=-1 --integer --min-value=-100 --max-value=100 \
  --field="Volume:":SCL --adjustment=-1 --integer --min-value=-100 --max-value=100 \
  --field="Rate:":RO --adjustment=-1 --integer --min-value=-100 --max-value=100 \
  --field="Text:" "" \
  --field="Media":RO "output" \
  --button="Cancel:1" --button="Speak!:0" --width=500 --height=300 &> res2 & \
###   TAB 3   ################################################################################################
yad --plug=12345 --tabnum=3 --text="MP3 Player" --borders=20 --list  --mouse \
  --listen \
  --quoted-output \
  --regex-search \
  --grid-lines=both \
  --selectable-labels \
  --columns 4 \
  --search-column=3 \
  --search-column=2 \
  --search-column=1 \
  --wrap-cols=4 \
  --focus-column=3 \
  --column=Position:TEXT \
  --column=Subscription:TEXT \
  --column=Title:TEXT \
  --column=URI:TEXT \
  $(echo "$bcd") \
  --tail \
  --dclick-action="mp trackgo %s" \
  --select-action="mp indice.selected %s" &> res3 & \
#  ${(s:|:)"$(< /tmp/mptemp)"}
###   TAB 4   ##########################################################################################
yad --plug=12345 --tabnum=4 --text="Voice to Text" --columns=5 --form \
	--field="Record":FBTN "ffmpeg -f alsa -i default -t 60 output.mp3" \
	--field="Stop":FBTN  "Ctrl-D" \
	--field="MP3 to Text":FBTN "sudo -u batan bash /home/batan/check/voicetotext.sh" \
	--field="Paste Text":FBTN  "Ctrl-D" &> res4 & \
###  TAB 5   ###########################################################################################
	yad --plug=12345 --tabnum=5 --text="Add a Podcast Subsctiption" --borders=30 --image="/home/batan/100/icons/icon.podcast.96.png" --form \
	--field="RSS Feed-URL:" \
	--field="Directory:" \
	--field="Nu of latest episodes:":NUM &> res5 & \
#cp $mash_dir/mp.conf $mash_dir/mp.conf.$(date +%j)
#mkdir -p podcasts/$(echo $abc|sed 's/|/ /g'|awk '{print $2}')
#echo -e "\033[31mThe following code was added to your podcast configuration file:\n \033[37m$(echo $abc|sed 's/|/ /g')\033[0m"
#echo $abc|sed 's/|/ /g' >> mp.conf
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
  --button="One" --button="Two" --button="Three" --button="Four" --tab-borders=10 --tab-pos=left --tab="Welcome" --tab="TTS" --tab="MP3 Player" --tab="Voice to Text" --tab="Add a Podcast Subscription"
rm res*

