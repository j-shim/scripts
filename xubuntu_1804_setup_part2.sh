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

##########################################
# Set copy/paste alias, similar to macOS #
##########################################
echo "alias pbcopy='xclip -selection clipboard'" >> ~/.zshrc
echo "alias pbpaste='xclip -selection clipboard -o'" >> ~/.zshrc

############################
# Install Homebrew (Linux) #
############################
sudo apt install linuxbrew-wrapper
brew

sudo apt install build-essential
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.zshrc
echo 'export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"' >> ~/.zshrc
echo 'export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"' >> ~/.zshrc
brew install gcc

###############################################
# Install libinput-gestures multitouch cont'd #
###############################################
sudo apt install xdotool wmctrl libinput-tools

git clone https://github.com/bulletmark/libinput-gestures.git
mv libinput-gestures .libinput-gestures
cd .libinput-gestures
sudo make install

##########################
# custom gestures config #
##########################
cp /etc/libinput-gestures.conf ~/.config/libinput-gestures.conf

libinput-gestures-setup autostart
libinput-gestures-setup start

cd

#############################################################
# Log out and log back in, then run Part 3 of the script... #
#############################################################
exit 0