#!/bin/bash

sudo apt update
sudo apt upgrade -y

wget -P ~/Downloads https://raw.githubusercontent.com/camiloaromero23/systemInitialization/main/utilFunctions.sh
. ~/Downloads/utilFunctions.sh

installGeneralSoftware
installChrome
installVSCode
installNodeJS
installPython

rm ~/Downloads/utilFunctions.sh
