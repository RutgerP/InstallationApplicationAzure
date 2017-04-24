#!/bin/bash
#Main script
sudo apt-get update 

#Installation apache2
sudo apt-get install apache2 -y
#Installation php
sudo apt-get install php libapache2-mod-php -y
#Clear any docs in /html and copy docs from Application into /html
sudo rm -f /var/www/html/* -r
sudo cp /var/InstallationApplication/WorkingSite/* /var/www/html/ -r -f
clear

#Installation Curl
sudo apt-get install curl -y
#Add the gcsfuse distribution URL as a package source and import its public key:
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

#Update the list of packages available and install cifs-utils.
sudo apt-get update
sudo apt-get install cifs-utils -y
clear

#Create location bucket +rights
sudo mkdir /var/InstallationApplication
sudo mkdir /var/InstallationApplication/bucket
sudo chmod 757 /var/InstallationApplication/bucket
sudo chmod 777 /etc/fstab
sudo echo "//testcvostorage.file.core.windows.net/testcvoshare var/InstallationApplication/bucket -o vers=3.0,username=testcvostorage,password=c2q52SLd4BUqaOFGzeGAFWLHfp65RPMQ+MnnFX5Z9Yd0DWtT3du/0VYI8onj/ZIGPmkoGySMWn5Hbs2nSYt81A==,dir_mode=0777,file_mode=0777" >> /etc/fstab
clear

#Mount bucket at startup
sudo chmod 777 /etc/rc.local
sudo sed -i '$ d' /etc/rc.local
sudo echo "mount /var/InstallationApplication/bucket" >> /etc/rc.local
sudo echo "exit 0" >> /etc/rc.local

mount /var/InstallationApplication/bucket

sudo chmod +x /var/InstallationApplication/Tests/test.sh
sudo chmod 777 /var/InstallationApplication/Tests/test.sh
sudo chmod 777 /var/InstallationApplication/Tests/configyamllint.yml
/var/InstallationApplication/Tests/test.sh

echo "Done"
