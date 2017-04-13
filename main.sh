#!/bin/bash
#Main script
#Source Github
sudo apt-get update 
#&& sudo apt-get upgrade -y

#Installeer apache2
sudo apt-get install apache2 -y
#Install php
sudo apt-get install php libapache2-mod-php -y
#Application
sudo rm -f /var/www/html/* -r
sudo cp WorkingSite/* /var/www/html/ -r -f
sudo chmod -R 777 /var/InstallationApplication/bucket

clear

#Run script-bucket
sudo apt-get install curl -y
#Add the gcsfuse distribution URL as a package source and import its public key:
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

#Update the list of packages available and install gcsfuse.
sudo apt-get update
sudo apt-get install gcsfuse -y

#Maak locatie van bucket aan
sudo mkdir /var/InstallationApplication/bucket
sudo chmod 757 /var/InstallationApplication/bucket
#sudo chown $USER:$USER /var/InstallationApplication/bucket

sudo chmod 777 /etc/fstab
sudo echo "test-stage-cvo /var/InstallationApplication/bucket gcsfuse allow_other,rw,noauto,user,dir_mode=777,file_mode=777,key_file=/var/InstallationApplication/account.json" >> /etc/fstab
sudo chmod 777 /etc/fuse.conf
sudo echo "user_allow_other" >> /etc/fuse.conf
clear

#script-bucket in opstartfile plaatsen
#Laatste lijn van document verwijderen, meestal exit 0
#sudo chmod +x /var/InstallationApplication/script-mount.sh
sudo chmod 777 /etc/rc.local
sudo sed -i '$ d' /etc/rc.local
sudo echo "mount /var/InstallationApplication/bucket" >> /etc/rc.local
sudo echo "exit 0" >> /etc/rc.local


echo "Done"
