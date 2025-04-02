# First USB Live boot

## Change font
    `setfont -d`

## Internet
Check if connected to the internet
    `ping google.com` <br>
Start the iwd 
    `iwctl` <br> 
Connect to the internet
    `station wlan0 connect [NAME]` <br>
Test the internet connection
    `ping google.com`

## Partitioning 
Get which drive it is
    `lsblk` <br>
Partition disk
    `cfdisk /dev/main drive` <br>
Clear everything
    `delete everything` <br>
Create each sizing partition
    `100M` <br> 
    `4GB` <br> 
    `[REMAINING]` <br>
write, then quit

## Formatting
Format root partition
    `mkfs.ext4 /dev/sda3` <br>
Format boot partition
    `mkfs.fat -F 32 /dev/sda1` <br> 
Format swap partition
    `mkswap /dev/sda2`
    
## Mounting partitions
Mounting root
    `mount /dev/sda3 /mnt` <br> 
Making boot partitions directory
    `mkdir -p /mnt/boot/efi` <br> 
Mounting boot partition
    `mount /dev/sda1 /mnt/boot/efi` <br> 
Turn swap on for swap partition
    `swapon /dev/sda2`

## Installing packages
Install base Linux
    `pacstrap /mnt base linux linux-firmware sof-firmware base-devel networkmanager nano grub efibootmgr` <br>
(Include any other packages if you wish, such as firefox or discord)

## Configuration and localization
Generate and move file system tab to correct locations
    `genfstab -U /mnt > /mnt/etc/fstab` <br> 
Change root to /mnt
    `arch-chroot /mnt` <br> 
List timezones
    `timedatectl list-timezones` <br> 
Sets a system link to create localtime of the correct timezone
    `ln -sf /usr/share/zoneinfo/[TIMEZONE] /etc/localtime` <br> 
Sync system clock
    `hwclock --systohc`

### Locale
Editing locale
    `nano /etc/locale.gen` <br> 
scroll down and uncomment: 
    `en_AU.UTF-8 UTF-8` <br> 
(Instead of "AU", for americans uncomment "en_US", or other locales)<br>
ctrl+o, enter, ctrl+x <br> 

Save and generate locale
    `locale-gen` <br>
Edit other locale config that some applications could use
    `nano /etc/locale.conf` <br> 
add;
    `LANG=en_AU.UTF-8` <br> 
ctrl+o, enter, ctrl x

### Host name
Add a pc host name (NOT USERNAME)
    `nano /etc/hostname` <br> 
change to whatever you want the computer to be named (NOT YOUR USERNAME)

### Root password
Change root password
    `passwd` <br> 
change to whatever root password you want

### Adding a user
Creating and adding "USERNAME" to group wheel
    `useradd -m -G wheel -s /bin/bash [USERNAME]` <br> 
Change password of [USERNAME]
    `passwd [USERNAME]` <br> 
change to whatever you want <br>
(HAVE DIFFERENT TO YOUR ROOT PASSWORD)

### Changing user to be able to use sudo
Editing sudo Configuration file
    `EDITOR=nano visudo` <br>
(or instead of nano, if you prefer vim, use vim) <br>
scroll down and uncomment; 
`%whell ALL=(ALL) ALL`

### Testing if it worked
Switch user to [USERNAME] <br>
    `su [USERNAME]` <br>
Test sudo works with a system update
    `sudo pacman -Syu` <br>
enter root password <br>
if it doesnt work uncomment;
    `%whell ALL=(ALL) NOPASSWD: ALL` <br>
Exit
    `exit`

### Finalising configurations
Enable network manager
    `systemctl enable NetworkManager`

#### Grub
Install grub
    `grub-install /dev/sda` <br>
Changing grubs config to where it should be
    `grub-mkconfig -o /boot/grub/grub.cfg` <br> 
Exiting to red root
    `exit`

## Exiting usb install
Unmounting everything
    `umount -a` <br>
Reboot the system
    `reboot now` <br>
Take out usb
    
## Entering blank Arch Linux
log in with username and password

### Checking wifi
Checking if wifi works
    `ping google.com` <br>
if it doesnt work use;
    `nmcli --ask device wifi connect [WIFI NAME]` <br>
(if you dont know your wifi name do; `nmcli`)

### Installing desktop enviornments
Install desktop enviornments (hyprland with plasma backup)
    `pacstrap /mnt hyprland waybar plasma sddm neofetch firefox thunar kitty kwrite code obsidian steam keepass ntfs-3g` <br>
(Add any other packages if you wish) <br>

Enable sddm
    `sudo systemctl enable sddm` <br> 
Enable sddm now
    `sudo systemctl enable --now sddm` <br>
log in with username and password again

## Entering Desktop Enviornment

### Nvidia Drivers (If you're using AMD skip this)
Update the system
    `sudo pacman -Syu` <br>
Installed reuqired packages
    `sudo pacman -S base-devel linux-headers git nano --needed` <br> 
Insatll the AUR (yay)
    `cd ~` <br> 
    `git clone https://aur.archlinux.org/yay.git` <br> 
    `cd yay` <br> 
    `makepkg -si` <br>
    
Enable multilib repositories
    `sudo nano /etc/pacman.conf` <br>
Uncomment the following lines by removing the # character at the start;
    `[multilib]` <br>
    `Include = /etc/pacman.d/mirrorlist` <br> 
Save the file with ctrl+o ctrl+x <br> 


Installing the driver packages [Reference](<https://github.com/korvahannu/arch-nvidia-drivers-installation-guide>) <br>
Find your nvidia drivers code name from [here](<https://nouveau.freedesktop.org/CodeNames.html>) <br>
- For the 1650 its "NV16x"  <br>
- Drivers for the 1650 are "nvidia-open nvidia-utils lib32-nvidia-utils" <br>
Install the correct Base driver, OpenGL, and OpenGL (multilib) packages <br>
For example the 1650 uses;
    `yay -s nvidia-open nvidia-utils lib32-nvidia-utils` <br>
Install nvidia-settings with;
    `yay -S nvidia-settings`

### Enabling DRM kernel mode settings
Edit the grub config file
    `sudo nano /etc/default/grub` <br>
Find the line with;
    "GRUB_CMDLINE_LINUX_DEFAULT" <br>
add;
    `nvidia-drm.modeset=1` <br>
(if using Linux kernel 6.11 or newer also add;
    `nvidia-drm.fbdev=1`) <br>
ctrl+o, enter, ctrl+x <br>
Update grub config
    `sudo grub-mkconfig -o /boot/grub/grub.cfg`

#### Add earler loading of nvidia modules
edit the mkinitcpio config
    `sudo nano /etc/mkinitcpio.conf` <br>
Find the line that says;
    "MODULES=()" <br>
add;
    `nvidia nvidia_modeset nvidia_uvm nvidia_drm` <br>
Find the line that says;
    "HOOLS=()" <br>
remove;
    "kms" <br> 
ctrl+o, enter, ctrl+x

### Adding the packman hook
Get the nvidia.hook file
    `cd ~` <br>
    `wget https://raw.githubusercontent.com/korvahannu/arch-nvidia-drivers-installation-guide/main/nvidia.hook` <br>
    `nano nvidia.hook` <br>
Find the line that says;
    "Target=nvidia" <br>
replace "nvidia" with the base driver you insatlled <br>
for example the 1650 uses;
    `nvidia-open` <br> 
ctrl+o, enter, ctrl+x <br>
move the file to the correct place with;
    `sudo mkdir -p /etc/pacman.d/hooks/ && sudo mv ./nvidia.hook /etc/pacman.d/hooks/` <br>
reboot
    `sudo reboot now`

### Installing optimus-manager
- **Needed for using a dedicated and descreet graphics cards** <br>
Installing optimus-manager
    `sudo pacman -S optimus-manager` <br>
Edit the boot loading config;
    `sudo nano /etc/default/grub` <br>
find the line with;
    "GRUB_CMDLINE_LINUX_DEFAULT" <br>
to have the kernel parameter;
    `optimus-manager.startup=hybrid` <br>
reboot
    `sudo reboot now `

## Insatlling hyprland config
steal [prasanthrangan's config](<https://github.com/prasanthrangan/hyprdots>) <br>
    `pacman -S --needed git base-devel` <br>
    `git clone --depth 1 https://github.com/prasanthrangan/hyprdots ~/HyDE` <br>
    `cd ~/HyDE/Scripts` <br> 
    `./install.sh` <br>
Follow the steps <br>
Then enjoy :3

