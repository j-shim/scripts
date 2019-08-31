#!/bin/bash -v

cd
############################
# Reverse scroll direction #
############################
echo "# Fix Natural Scrolling" >> ~/.profile
echo "synclient VertScrollDelta=-73" >> ~/.profile
echo "synclient HorizScrollDelta=-73" >> ~/.profile

######################
# Install essentials #
######################
sudo apt install arc-theme git vim zsh tree htop curl wget python3 gcc g++ make gparted xclip xsel sqlite3 snapd

#######################################
# Install tlp (improves battery life) #
#######################################
sudo apt install tlp
sudo tlp start

##########################
# Make zsh default shell #
##########################
chsh -s $(which zsh)

###########################################################################
# Log out and log back in, relaunch zsh, then run Part 2 of the script... #
###########################################################################

exit 0