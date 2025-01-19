#!/bin/bash

# Base directory containing your MP3 files
MP3_DIR="/media/batan/100/Music"

# Build an associative array to map filenames to their full paths
declare -A FILE_MAP
while IFS= read -r file; do
  filename=$(basename "$file" .mp3) # Strip path and suffix
  FILE_MAP["$filename"]="$file"
done < <(find "$MP3_DIR" -type f -name '*.mp3')

# Display filenames in fzf with multi-select enabled
selected_files=$(printf "%s\n" "${!FILE_MAP[@]}" | \
  fzf --multi --bind 'tab:toggle+down' --prompt="Select MP3s ->" --preview 'echo {}')

# If files were selected, find their full paths and play them
if [[ -n "$selected_files" ]]; then
  echo "Selected files:"
  while IFS= read -r filename; do
    full_path="${FILE_MAP[$filename]}"
    echo "Playing: $full_path"
    play "$full_path" # Replace with your preferred player
  done <<< "$selected_files"
else
  echo "No selection made."
fi

