#!/bin/bash
# clipboard-notify.sh
while true; do
    new_clip=$(xclip -o -selection clipboard 2>/dev/null)
    if [[ "$new_clip" != "$last_clip" ]]; then
        notify-send "Copied to Clipboard" "$new_clip"
        last_clip="$new_clip"
    fi
    sleep 1
done

