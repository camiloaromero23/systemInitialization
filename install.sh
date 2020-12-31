#!/bin/bash

sudo apt update
sudo apt upgrade -y

wget -P ~/Downloads https://raw.githubusercontent.com/camiloaromero23/systemInitialization/main/utilFunctions.sh
. ~/Downloads/utilFunctions.sh

installFonts
gnomeTerminalSetup
installGeneralSoftware
gitSetup
installChrome
installVSCode
installNodeJS
installPython
neofetchSetup
neovimSetup
installOhMyZsh

rm ~/Downloads/utilFunctions.sh
