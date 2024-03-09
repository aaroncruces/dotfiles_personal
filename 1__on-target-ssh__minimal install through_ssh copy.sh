tmux -2
lsblk
cgdisk /dev/sda
# config partitions: 
# 2GB efi (ef00) (because multiple linux kernels)
# rest, root home (8300, default). no partitions since using btrfs
# no swap. I'll use zram
# efi part. DO NOT USE WINDOWS EFI, IS TOO SMALL
mkfs.fat -F 32 /dev/sda5
mkfs.btrfs  /dev/sda6
mount /dev/sda6 /mnt
btrfs sub cr /mnt/@
btrfs sub cr /mnt/@home
umount /mnt
mount -o noatime,space_cache=v2,compress=zstd,ssd,discard=async,subvol=@ /dev/sda6 /mnt
mkdir -p /mnt/{boot,home}
mount -o noatime,space_cache=v2,compress=zstd,ssd,discard=async,subvol=@home /dev/sda6 /mnt/home
mount /dev/sda5 /mnt/boot
pacstrap /mnt base base-devel linux linux-firmware linux-headers git openssh tmux networkmanager neovim tmux grub efibootmgr amd-ucode  btrfs-progs  mtools dosfstools ntfs-3g  os-prober zsh timeshift reflector  ansible dkms
mkdir -p /mnt/winfs
mount /dev/sda3 /mnt/winfs
genfstab -U /mnt >> /mnt/etc/fstab
# vim /mnt/etc/mkinitcpio.conf
# add MODULES=(btrfs)
arch-chroot /mnt
mkinitcpio -P
ln -sf /usr/share/zoneinfo/Chile/Continental /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
echo "es_CL.UTF-8 UTF-8" >> /etc/locale.gen
echo "es_CL ISO-8859-1" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
echo "whitetower" >> /etc/hostname
useradd -G wheel,network,video,audio,disk,input,kvm,optical,tty -s /bin/zsh -m aaron
systemctl enable {NetworkManager,sshd}
passwd aaron
passwd
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
exit
reboot

##############3 pacman multilib