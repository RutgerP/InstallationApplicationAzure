#!/bin/bash
#Main script
#Source Github
sudo apt-get update && sudo apt-get upgrade -y

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
./script-bucket.sh
clear

#script-bucket in opstartfile plaatsen
#Laatste lijn van document verwijderen, meestal exit 0
sudo sed -i '$ d' /etc/rc.local
sudo echo "/var/InstallationApplication/script-bucket.sh" >> /etc/rc.local
sudo echo "exit 0" >> /etc/rc.local

echo "Done"
