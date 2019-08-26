#!/bin/bash -v

# Part 3
cd
# Install libinput-gestures multitouch cont'd
sudo apt install xdotool wmctrl libinput-tools

git clone https://github.com/bulletmark/libinput-gestures.git
mv libinput-gestures .libinput-gestures
cd .libinput-gestures
sudo make install

# custom gestures config
cp /etc/libinput-gestures.conf ~/.config/libinput-gestures.conf

libinput-gestures-setup autostart
libinput-gestures-setup start

cd

# Programming Fonts
git clone https://github.com/ProgrammingFonts/ProgrammingFonts.git
mv ProgrammingFonts .fonts

# Install Timeshift
# https://github.com/teejee2008/timeshift
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update
sudo apt install timeshift

# 10 Things to do after installing Xubuntu 18.04
# https://easylinuxtipsproject.blogspot.com/p/first-xubuntu.html#ID1.1
## reduce swap size
## cat /proc/sys/vm/swappiness

sudo apt install xubuntu-restricted-extras

# Enable Firewall
sudo ufw enable
# Check status
sudo ufw status verbose

# Set ROOT Password
sudo passwd

# Set LUKS Encryption
sudo apt install cryptsetup

# Install VSCode
sudo snap install code --classic

# Fix Black screen after Suspend Resume: Remove light-locker
# Note: Lock Screen is no longer functioning - Replace with xscreensaver
sudo apt remove light-locker
sudo apt install xscreensaver

# Fix inactivity-sleep-mode-on-battery (does not suspend after inactivity)
# if output of "xfconf-query -c xfce4-power-manager -lv" doesn't contain this line:
# "/xfce4-power-manager/inactivity-sleep-mode-on-battery   1"
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-sleep-mode-on-battery -n -t int -s 1

# Set Theme to "Arc-Dark"
xfconf-query -c xfwm4 -p /general/theme -s "Arc-Dark"
xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Dark"

# Set copy/paste alias, similar to macOS
echo "alias pbcopy='xclip -selection clipboard'" >> ~/.zshrc
echo "alias pbpaste='xclip -selection clipboard -o'" >> ~/.zshrc

# Fix Screen Problem (Intel GeminiLake corruption at top of screen caused by
# fbc)
# Refer to: https://bugs.freedesktop.org/show_bug.cgi?id=108085
sudo touch /etc/modprobe.d/i915.conf
sudo echo "options i915 enable_fbc=0" >> /etc/modprobe.d/i915.conf
sudo update-initramfs -u

# Done
echo "======================================"
echo "Reboot the system, and you're all set!"
echo "======================================"

exit 0