# cloudshell_lcd
ODROID-XU4 Cloudshell LCD Informations for Server
Tested on Ubuntu 16.04

# Requirements
The only requirement that the CloudShell LCD Information Screen needs to operate on the first boot, is that the LCD screen must
already be set up and working. I have also made a script to make this as easy as possible. (Including some oDroid CPU Control)
https://github.com/digital-dev/ODROID-XU4-CloudShell-Setup

# Installation:
git clone https://github.com/digital-dev/cloudshell_lcd && ./cloudshell_lcd/build_deb.sh

# Note
This is a highly updated verion of the same CloudShell LCD Information that we have all come to love on our oDroids.
It still functions exactly the same as the old CloudShell, although with some redone colors and various parts of the script.
Notably one of the biggest changes is the installation method. The compiling script for the package has been reworked to install
all prerequisite software for CloudShell to run.