#!/bin/bash

sudo apt update
sudo apt upgrade -y

. ./utilFunctions.sh

installGeneralSoftware
installChrome
installVSCode
installNodeJS
installPython
