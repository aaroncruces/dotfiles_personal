#xrandr --output HDMI-1-0 --primary --mode 1920x1080 --pos 0x0 --output eDP --mode 1920x1080 --pos 1920x0

setxkbmap -model pc105 -layout latam 
# setxkbmap -model pc105 -layout us -variant intl -option terminate:ctrl_alt_bksp
# setxkbmap -model pc105 -layout us -variant intl


picom &
exec i3
