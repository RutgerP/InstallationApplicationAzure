#!/bin/bash
#Main script
sudo apt-get update 

#Installation apache2
sudo apt-get install apache2 -y
#Installation php
sudo apt-get install php libapache2-mod-php -y
#Clear any docs in /html and copy docs from Application into /html
sudo rm -f /var/www/html/* -r
sudo cp /var/InstallationApplicationAzure/WorkingSite/* /var/www/html/ -r -f
clear

#Update the list of packages available and install cifs-utils.
sudo apt-get update
sudo apt-get install cifs-utils -y
clear

#Create location bucket +rights
sudo mkdir /var/InstallationApplicationAzure
sudo mkdir /var/InstallationApplicationAzure/bucket
sudo chmod 757 /var/InstallationApplicationAzure/bucket
sudo chmod 777 /etc/fstab
sudo echo "//stagecvostorage.file.core.windows.net/stagecvofileshare var/InstallationApplication/bucket -o vers=3.0,username=stagecvostorage,password=+OXKp2KtfrrA8zMz03azjasOo1rHh2bZrA4+kyeL4q0LuVLiiPzE+xU7gSoAVyf6jX9vlq/zDATmy1VKWFVWAg==,dir_mode=0777,file_mode=0777" >> /etc/fstab
clear

#Mount bucket at startup
#sudo chmod 777 /etc/rc.local
#sudo sed -i '$ d' /etc/rc.local
#sudo echo "mount /var/InstallationApplication/bucket" >> /etc/rc.local
#sudo echo "exit 0" >> /etc/rc.local

#mount /var/InstallationApplication/bucket

#sudo chmod +x /var/InstallationApplication/Tests/test.sh
#sudo chmod 777 /var/InstallationApplication/Tests/test.sh
#sudo chmod 777 /var/InstallationApplication/Tests/configyamllint.yml
#/var/InstallationApplication/Tests/test.sh

echo "Done"
