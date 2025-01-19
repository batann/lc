#!/bin/bash
while true; do
    updates=$(apt list --upgradable 2>/dev/null | wc -l)
    if [ "$updates" -gt 1 ]; then
        notify-send "System Updates Available" "$((updates - 1)) packages available."
    fi
    sleep 3600  # Check every hour
done

