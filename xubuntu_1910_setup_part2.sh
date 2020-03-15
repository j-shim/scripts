#!/usr/bin/env bash -v

##########
# Part 2 #
##########
cd

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

##################
# Vim Solarized8 #
##################
git clone https://github.com/lifepillar/vim-solarized8.git \
      ~/.vim/pack/themes/opt/solarized8

############################################
# Oh My Zsh Theme: powerlevel10k           #
# https://github.com/romkatv/powerlevel10k #
############################################
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.

################################
# Nerd Fonts for powerlevel10k #
################################
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
cd
# Set Terminal font to: MesloLGS NF Regular

#############################################################
# Log out and log back in, then run Part 3 of the script... #
#############################################################
exit 0
