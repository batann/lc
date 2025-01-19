
#!/bin/bash
	yad --plug=12345 --tabnum=7 --text="Add a Podcast Subsctiption" --borders=30 --image="/home/batan/100/icons/icon.podcast.96.png" --form \
	--field="RSS Feed-URL:" \
	--field="Directory:" \
	--field="Nu of latest episodes:":NUM &> res7 & \
