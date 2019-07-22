#!/bin/bash -v

cd
# Reverse scroll direction
echo "\n# Fix Natural Scrolling" >> ~/.profile
echo "synclient VertScrollDelta=-73" >> ~/.profile
echo "synclient HorizScrollDelta=-73" >> ~/.profile

# Install essentials
sudo apt install arc-theme git vim zsh tree htop curl wget python3 gcc g++ make gparted xclip xsel sqlite3

# Install tlp (improves battery life)
sudo apt install tlp
sudo tlp start

# Make zsh default shell
chsh -s $(which zsh)

# Logout and relaunch zsh
echo "========================================================="
echo "Log out and log back in, then run Part 2 of the script..."
echo "========================================================="

exit 0
# Part 2

cd
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh syntax highlighting
sudo apt install zsh-syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Enable Vim Keybinding on zsh
echo "bindkey -v" >> ~/.zshrc

# Install libinput-gestures multitouch
# https://github.com/bulletmark/libinput-gestures
sudo gpasswd -a $USER input

# Logout
echo "========================================================="
echo "Log out and log back in, then run Part 3 of the script..."
echo "========================================================="

exit 0
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
