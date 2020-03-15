#!/usr/bin/env bash -v

##########
# Part 1 #
##########
cd

############################
# Reverse scroll direction #
############################
echo "# Fix Natural Scrolling" >> ~/.profile
echo "synclient VertScrollDelta=-73" >> ~/.profile
echo "synclient HorizScrollDelta=-73" >> ~/.profile

#########################
# Enable Palm Detection #
#########################
echo "synclient PalmDetect=1" >> ~/.profile

######################
# Install essentials #
######################
sudo apt install arc-theme git vim zsh tree htop curl wget python3 gcc g++ make gparted xclip xsel sqlite3 snapd
sudo apt install ubuntu-restricted-extras

#######################################
# Install tlp (improves battery life) #
#######################################
sudo apt install tlp
sudo tlp start

###################
# Enable Firewall #
###################
sudo ufw enable
#########################
# Check Firewall status #
#########################
sudo ufw status verbose

#####################
# Set ROOT Password #
#####################
sudo passwd

#######################
# Set LUKS Encryption #
#######################
#sudo apt install cryptsetup # Not needed for now

##################
# Install VSCode #
##################
sudo snap install code --classic

###############################################################################
# Fix Black screen after Suspend Resume: Remove light-locker                  #
# Note: Lock Screen is no longer functioning - Replace with xfce4-screensaver #
# UPDATE: No longer needed after upgrading from 18.04 to 19.10                #
###############################################################################
#sudo apt remove light-locker
#sudo apt install xfce4-screensaver

#####################################################################################
# Fix inactivity-sleep-mode-on-battery (does not suspend after inactivity)          #
# if output of "xfconf-query -c xfce4-power-manager -lv" doesn't contain this line: #
# "/xfce4-power-manager/inactivity-sleep-mode-on-battery   1"                       #
#####################################################################################
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/inactivity-sleep-mode-on-battery -n -t int -s 1

###########################
# Set Theme to "Arc-Dark" #
###########################
xfconf-query -c xfwm4 -p /general/theme -s "Arc-Dark"
xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Dark"

#####################
# Programming Fonts #
#####################
git clone https://github.com/ProgrammingFonts/ProgrammingFonts.git
mv ProgrammingFonts .fonts

##########################
# Free fonts from Google #
##########################
sudo apt install fonts-crosextra-carlito fonts-crosextra-caladea

###########################################
# Install Timeshift                       #
# https://github.com/teejee2008/timeshift #
###########################################
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt update
sudo apt install timeshift

###################################################
# Install libinput-gestures multitouch            #
# https://github.com/bulletmark/libinput-gestures #
###################################################
sudo gpasswd -a $USER input

###########################################################################
# Log out and log back in, relaunch zsh, then run Part 2 of the script... #
###########################################################################

#####################
# Install oh-my-zsh #
#####################
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

exit 0
