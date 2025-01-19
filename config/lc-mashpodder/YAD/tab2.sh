#!/bin/bash

yad --plug=12345 --tabnum=2 --text="Text to Speech" --borders=30 --image-on-top --image="/home/batan/100/icons/tts1.png" --title="TTS"  \
  --buttons-layout="spread" --form --title="Text-to-Speech Options" \
  --field="Voice":CB "en-US-AndrewMultilingualNeural! en-US-AndrewNeural! en-US-AriaNeural! en-US-AvaMultilingualNeural! en-US-AvaNeural! en-US-BrianMultilingualNeural! en-US-BrianNeural! en-US-ChristopherNeural! en-US-EmmaMultilingualNeural! en-US-EmmaNeural! en-US-EricNeural! en-US-GuyNeural! en-US-JennyNeural! en-US-MichelleNeural! en-US-RogerNeural! en-US-SteffanNeural" \
  --field="Pitch:":SCL --adjustment=-1 --integer --min-value=-100 --max-value=100 \
  --field="Volume:":SCL --adjustment=-1 --integer --min-value=-100 --max-value=100 \
  --field="Rate:":RO --adjustment=-1 --integer --min-value=-100 --max-value=100 \
  --field="Text:" "" \
  --field="Media":RO "output" \
  --button="Cancel:1" --button="Speak!:0" --width=500 --height=300 &> res2 & \
