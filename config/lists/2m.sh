#!/bin/bash

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
#--preview-window="border-rounded"


# Base directory containing your MP3 files
MP3_DIR="/media/batan/100/Music"

# Build an associative array to map filenames back to their full paths
declare -A FILE_MAP
while IFS= read -r file; do
  filename=$(basename "$file" .mp3) # Strip path and suffix
  FILE_MAP["$filename"]="$file"
done < <(find "$MP3_DIR" -type f -name '*.mp3')

# Display filenames in fzf and capture user selection
selected_file=$(printf "%s\n" "${!FILE_MAP[@]}" | fzf --prompt="Select an MP3 ->")

# If a file is selected, find its full path and play it
if [[ -n "$selected_file" ]]; then
  full_path="${FILE_MAP[$selected_file]}"
  echo "Playing: $full_path"
  play "$full_path" # Replace with your preferred player, e.g., `ffplay`, `mpv`, etc.
else
  echo "No selection made."
fi

