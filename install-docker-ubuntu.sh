#!/usr/bin/env bash -v


# https://docs.docker.com/engine/install/ubuntu/

##########################
# Uninstall old versions #
##########################
sudo apt remove docker docker-engine docker.io containerd runc

#########################
# SET UP THE REPOSITORY #
#########################
sudo apt update

sudo apt install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

########################################################################
# VEROFY KEY FINGERPRINT BELOW                                         #
#                                                                      #
# pub   rsa4096 2017-02-22 [SCEA]                                      #
#      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88              #
# uid           [ unknown] Docker Release (CE deb) <docker@docker.com> #
# sub   rsa4096 2017-02-22 [S]                                         #
########################################################################

# https://unix.stackexchange.com/questions/293940/how-can-i-make-press-any-key-to-continue
read -n 1 -s -r -p "Press any key to continue"

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

#########################
# INSTALL DOCKER ENGINE #
#########################
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

##########################
# INSTALL DOCKER COMPOSE #
##########################
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

