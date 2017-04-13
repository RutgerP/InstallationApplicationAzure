#!/bin/bash
#Script to start packer
sudo apt-get install git -y
cd /var
git clone https://github.com/KoenHaemels/InstallationApplication.git
./main.sh
