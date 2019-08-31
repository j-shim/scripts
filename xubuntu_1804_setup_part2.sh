#!/bin/bash -v

##########
# Part 2 #
##########
cd

#####################
# Install oh-my-zsh #
#####################
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
exit

###################################
# Install zsh syntax highlighting #
###################################
sudo apt install zsh-syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

################################
# Enable Vim Keybinding on zsh #
################################
echo "bindkey -v" >> ~/.zshrc

###################################################
# Install libinput-gestures multitouch            #
# https://github.com/bulletmark/libinput-gestures #
###################################################
sudo gpasswd -a $USER input

#############################################################
# Log out and log back in, then run Part 3 of the script... #
#############################################################
exit 0