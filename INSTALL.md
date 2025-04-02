# First USB Live boot

## Change font
    `setfont -d`

## Internet
Check if connected to the internet
    `ping google.com`
Start the iwd 
    `iwctl`
Connect to the internet
    `station wlan0 connect "*NAME*"`
Test the internet connection
    `ping google.com`

## Partitioning 
Get which drive it is
    `lsblk`
Partition disk
    `cfdisk /dev/*main drive*`
Clear everything
    `delete everything`
Create each sizing partition
    `100M`
    `4GB`
    `"REMAINING""`
write, then quit

## Formatting
Format root partition
    `mkfs.ext4 /dev/sda3`
Format boot partition
    `mkfs.fat -F 32 /dev/sda1`
Format swap partition
    `mkswap /dev/sda2`
    
## Mounting partitions
Mounting root
    `mount /dev/sda3 /mnt`
Making boot partitions directory
    `mkdir -p /mnt/boot/efi`
Mounting boot partition
    `mount /dev/sda1 /mnt/boot/efi`
Turn swap on for swap partition
    `swapon /dev/sda2`

## Installing packages
Install base Linux
    `pacstrap /mnt base linux linux-firmware sof-firmware base-devel networkmanager nano grub efibootmgr`

|------------------------------------------------------------------------------------------|

                                 this is where sam is up to
                                (as of 9:52pm 17th feb 2025)

|------------------------------------------------------------------------------------------|

## Configuration and localization
Generate and move file system tab to correct locations
    `genfstab -U /mnt > /mnt/etc/fstab`

Change root to /mnt
    `arch-chroot /mnt`

Sets a system link to create localtime of the correct timezone
    `ln -sf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime`

Sync system clock
    `hwclock --systohc`

### Locale
Editing locale
    `nano /etc/locale.gen`
scroll down and uncomment;
    `en_AU.UTF-8 UTF-8`
ctrl+o, enter, ctrl+x

Generate locale
    `locale-gen`

Edit other locale config that some applications could use
    `nano /etc/locale.conf`
add;
    `LANG=en_AU.UTF-8`
ctrl+o, enter, ctrl x

### Host name
Add a pc host name NOT USERNAME
    `nano /etc/hostname`
change to whatever you want the computer to be named NOT YOUR USERNAME

### Root password
Change root password
    `passwd`
change to whatever root password you want

### Adding a user
Creating and adding "USERNAME" to group wheel
    `useradd -m -G wheel -s /bin/bash "USERNAME"`
Change password of "USERNAME"
    `passwd "USERNAME"`
change to whatever you want 
HAVE DIFFERENT TO YOUR ROOT PASSWORD

### Changing user to be able to use sudo
Editing sudo Configuration file
    `EDITOR=nano visudo`
scroll down and uncomment;
`%whell ALL=(ALL) ALL`

### Testing if it worked
Switch user to "USERNAME"
    `su "USERNAME"`
Testing if sudo works with a system update
    `sudo pacman -Syu`
enter root password
if it doesnt work uncomment;
    `%whell ALL=(ALL) NOPASSWD: ALL`
Exit
    `exit`

### Finalising configurations
Enable network manager
    `systemctl enable NetworkManager`

#### Grub
Install grub
    `grub-install /dev/sda`
Changing grubs config to where it should be
    `grub-mkconfig -o /boot/grub/grub.cfg`
Exiting to red root
    `exit`

## Exiting usb install
Unmounting everything
    `umount -a`
Reboot the system
    `reboot now`
Take out usb
    
## Entering blank Arch Linux
log in with username and password

### Checking wifi
Checking if wifi works
    `ping google.com`
if it doesnt work use;
    `nmcli --ask device wifi connect "WIFI NAME"`

### Installing desktop enviornments
Install desktop enviornments
    `pacstrap /mnt hyprland waybar plasma sddm neofetch firefox thunar kitty kwrite obsidian ntfs-3g`

Enable sddm
    `sudo systemctl enable sddm`
Enable sddm now
    `sudo systemctl enable --now sddm`
log in with username and password again

## Entering Desktop Enviornment

### Nvidia Drivers
Update the system
    `sudo pacman -Syu`
Installed reuqired packages
    `sudo pacman -S base-devel linux-headers git nano --needed`
Insatll the AUR (yay)
    `cd ~`
    `git clone https://aur.archlinux.org/yay.git`
    `cd yay`
    `makepkg -si`
    
Enable multilib repositories
    `sudo nano /etc/pacman.conf`
Uncomment the following lines by removing the # -character at the start them;
    `[multilib]'
    `Include = /etc/pacman.d/mirrorlist`
Save the file with ctrl+o ctrl+x

Installing the driver packages (Reference)[<https://github.com/korvahannu/arch-nvidia-drivers-installation-guide>]
Find your nvidia drivers code name from (Here)[<https://nouveau.freedesktop.org/CodeNames.html>]
- For the 1650 its "NV16x"
- Drivers for the 1650 are "nvidia-open nvidia-utils lib32-nvidia-utils"
Install the correct Base driver, OpenGL, and OpenGL (multilib) packages 
For example the 1650 uses;
    `yay -s nvidia-open nvidia-utils lib32-nvidia-utils`
Install nvidia-settings with;
    `yay -S nvidia-settings`

### Enabling DRM kernel mode settings
Edit the grub config file
    `sudo nano /etc/default/grub`
Find the line with;
    "GRUB_CMDLINE_LINUX_DEFAULT"
add;
    `nvidia-drm.modeset=1`
if using Linux kernel 6.11 or newer also add;
    `nvidia-drm.fbdev=1`
ctrl+o, enter, ctrl+x
Update grub config
    `sudo grub-mkconfig -o /boot/grub/grub.cfg`

#### Add earler loading of nvidia modules
edit the *mkinitcpio* config
    `sudo nano /etc/mkinitcpio.conf`
Find the line that says;
    "MODULES=()"
add;
    `nvidia nvidia_modeset nvidia_uvm nvidia_drm`
Find the line that says;
    "HOOLS=()"
remove;
    "kms"
ctrl+o, enter, ctrl+x

### Adding the packman hook
Get the nvidia.hook file
    `cd ~`
    `wget https://raw.githubusercontent.com/korvahannu/arch-nvidia-drivers-installation-guide/main/nvidia.hook`
    `nano nvidia.hook`
Find the line that says;
    "Target=nvidia""
replace "nvidia" with the base driver you insatlled
for example the 1650 uses;
    `nvidia-open`
ctrl+o, enter, ctrl+x
move the file to the correct place with;
    `sudo mkdir -p /etc/pacman.d/hooks/ && sudo mv ./nvidia.hook /etc/pacman.d/hooks/`
reboot
    `sudo reboot now`

### Installing optimus-manager
- **Needed for using a dedicated and descreet graphics cards**
Installing optimus-manager
    `sudo pacman -S optimus-manager`
Edit the boot loading config;
    `sudo nano /etc/default/grub`
find the line with;
    "GRUB_CMDLINE_LINUX_DEFAULT"
to have the kernel parameter;
    `optimus-manager.startup=hybrid`
reboot
    `sudo reboot now `

## Insatlling hyprland config
steal (prasanthrangan's config)[<https://github.com/prasanthrangan/hyprdots>]
    `pacman -S --needed git base-devel`
    `git clone --depth 1 https://github.com/prasanthrangan/hyprdots ~/HyDE`
    `cd ~/HyDE/Scripts`
    `./install.sh`
Follow the steps

## Copying old hyprland config
After mounting the 4tb hard drive;
copy the config files
    `sudo cp -rf /mnt/4tb/Media/dotfiles/.config/ /home/irvyne/`
    `sudo cp -rf /mnt/4tb/Media/dotfiles/.git/ /home/irvyne/`
    `sudo cp -rf /mnt/4tb/Media/dotfiles/.local/ /home/irvyne/`
    `sudo cp -rf /mnt/4tb/Media/dotfiles/.gitignore /home/irvyne/`
    `sudo cp -rf /mnt/4tb/Media/dotfiles/.zshrc /home/irvyne/`
reboot system
    `sudo reboot now`

