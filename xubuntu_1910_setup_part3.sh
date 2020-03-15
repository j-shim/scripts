#!/usr/bin/env bash -v

##########################
# Part 3 (needs cleanup) #
##########################
cd

# 10 Things to do after installing Xubuntu 18.04
# https://easylinuxtipsproject.blogspot.com/p/first-xubuntu.html#ID1.1
## reduce swap size
## cat /proc/sys/vm/swappiness
# run gedit admin:///etc/sysctl.conf
# paste-># Decrease swap usage to a more reasonable level
# paste->vm.swappiness=1
## should reboot

# Fix Screen Problem (Intel GeminiLake corruption at top of screen caused by
# fbc)
# Refer to: https://bugs.freedesktop.org/show_bug.cgi?id=108085
#sudo touch /etc/modprobe.d/i915.conf
#sudo echo "options i915 enable_fbc=0" >> /etc/modprobe.d/i915.conf
#sudo update-initramfs -u

##########################################
# Reboot the system, and you're all set! #
##########################################
exit 0
