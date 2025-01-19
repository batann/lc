#!/bin/bash
while true; do
    if nmcli -t g | grep -q "disconnected"; then
        notify-send -u critical "Wi-Fi Disconnected"
    else
        notify-send "Wi-Fi Connected"
    fi
    sleep 10  # Check every 10 seconds
done

