#!/bin/bash

# if not using sddm
if [ "$(tty)" = "/dev/tty1" ];then
  export WLR_NO_HARDWARE_CURSORS=1
  exec Hyprland
fi

# IF I WANT XORG
# if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx
# fi
