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
sudo chmod -R 777 /var/www/html/uploads

clear
#Run script-bucket
./script-bucket.sh

echo "Done"
