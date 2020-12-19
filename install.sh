#!/bin/sh
sudo sed -i 's/Defaults        env_reset/Defaults        env_reset,timestamp_timeout=60/' visudo
sudo apt update
sudo apt upgrade -y
sudo apt install -y git zsh 
