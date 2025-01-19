#!/bin/bash

yad --plug=12345 --tabnum=4 --text="Voice to Text" --columns=5 --form \
	--field="Record":FBTN "ffmpeg -f alsa -i default -t 60 output.mp3" \
	--field="Stop":FBTN  "Ctrl-D" \
	--field="MP3 to Text":FBTN "sudo -u batan bash /home/batan/check/voicetotext.sh" \
	--field="Paste Text":FBTN  "Ctrl-D" &> res4 & \
