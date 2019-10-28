# scripts

Collection of personal scripts (bash, etc)

## xubuntu_1910_setup_part*.sh

This script is intended to be run after fresh installation of **Xubuntu 19.10**
on my secondary 11.6-inch laptop **ASUS L203MA**.

I wrote this script while setting up (or tweaking) Xubuntu 19.10, because
I didn't want to set everything manually (which took a lot of time and effort)
in case Xubuntu needs to be reinstalled.

### Usage

In terminal, cd to where this script is saved to, and run:

```bash
./xubuntu_1910_setup_part*.sh
```

or

```bash
bash xubuntu_1910_setup_part*.sh
```

if not executable.

*NOTE:* Most commands should work with other laptops; however, some constants
such as natural scrolling may be specific to ASUS-L203MA.

## search_pattern_in_files.sh

This is a simple script that iterates through files and show pattern given by
the user (takes one argument in command line).

I wrote up this script while searching for which XML file included the settings for
window themes. (Because I wanted to automate restoring settings just in case)
Specifically, I ran this script in this directory (Xubuntu 18.04):
$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
with this input: "Arc-Dark" (which is one of the themes in Xubuntu)

### Usage

In terminal, cd to where you want to perform a search, and run:

```bash
/path/to/search_pattern_in_files.sh <search-string-in-quotes>
```
