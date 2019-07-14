#!/bin/bash

# Iterate through files and show pattern
#
# I wrote up this script while searching for which XML file included the settings for
# window themes. (Because I wanted to automate restoring settings just in case)
# Specifically, I ran this script in this directory (Xubuntu 18.04):
# $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
# with this input: "Arc-Dark" (which is one of the themes in Xubuntu)

for filename in $(ls); do
  echo $filename;
  cat $filename | grep "$1";
done
