exec --no-startup-id dex --autostart --environment i3
exec --no-startup-id nm-applet
#bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
#bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
#bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
#bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status
bindsym $mod+d exec --no-startup-id dmenu_run
# bindcode $mod+40 exec --no-startup-id i3-dmenu-desktop
#exec --no-startup-id  $HOME/.config/i3/i3-master-stack/i3_master
bindsym XF86AudioRaiseVolume exec --no-startup-id "amixer -q set Master 5%+ && notify-send 'Volume: $(amixer get Master | grep -oP '\\d+%' | head -1)'"
bindsym XF86AudioLowerVolume exec --no-startup-id "amixer -q set Master 5%- && notify-send 'Volume: $(amixer get Master | grep -oP '\\d+%' | head -1)'"
bindsym XF86AudioMute exec --no-startup-id "amixer -q set Master toggle && notify-send 'Mute: $(amixer get Master | grep -o '\\[on\\]' | head -1 || echo '[off]')'"
bindsym $mod+Ctrl+u exec --no-startup-id "notify-send 'Now Playing' '$(mpc current)'"
bindsym $mod+Ctrl+i exec --no-startup-id "notify-send 'Now Playing' '$(playerctl metadata --format '{{ artist }} - {{ title }}')'"
bindsym $mod+c exec --no-startup-id "alacritty -o window.dimensions.lines=10 -o window.dimensions.columns=40 -e cava"



### Custom LC Startup Scripts
exec_always --no-startup-id xrdb merge /home/batan/.Xdefaults
exec_always --no-startup-id picom --config /home/batan/.config/picom/picom.conf
exec_always --no-startup-id /usr/bin/lc-i3-startup
exec_always --no-startup-id /usr/bin/lc-caps
exec --no-startup-id xrandr --output HDMI-1 --primary --auto --output VGA-1 --auto --right-of HDMI1
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork
exec --no-startup-id kill -9 $(pgrep xss-lock)



### Custom Startup Scripts
exec --no-startup-id ~/.config/i3/scripts/clipboard-notify.sh
exec --no-startup-id ~/.config/i3/scripts/network-notify.sh
exec --no-startup-id ~/.config/i3/scripts/update-notify.sh
exec --no-startup-id 
exec --no-startup-id 
exec --no-startup-id 
exec --no-startup-id 
