
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#8D8C9C,fg+:#8E9492,bg:#2B2E33,bg+:#2B2E33
  --color=hl:#8D8C9C,hl+:#8D8C9C,info:#c4c477,marker:#8E9492
  --color=prompt:#8E9492,spinner:#8E9492,pointer:#8E9492,header:#44adad
  --color=border:#B9B6A7,scrollbar:#44adad,label:#44adad
  --color=query:#d9d9d9
  --border="sharp" --border-label=" [[[ LC-Linux ]]] " --border-label-pos="0" 
  --padding="1" --margin="1" --prompt="->" --marker=">>"
  --pointer="◆◆" --separator='─'  --scrollbar="│" --layout="reverse"
  --info=default'


while :; do abc=$(cat url.list |fzf)
	if [[ $abc = Exit ]];
	then
		break 
	fi
	input="$input $abc"
done
echo $input >> temp.input
/home/batan/.local/bin/yt-dlp -a temp.input
rm temp.input


