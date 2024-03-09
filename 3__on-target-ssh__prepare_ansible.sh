ansible-galaxy collection install kewlfft.aur
su
EDITOR=nvim visudo
# edit to sudo
# to dualboot
grub-mkconfig -o /boot/grub/grub.cfg
exit