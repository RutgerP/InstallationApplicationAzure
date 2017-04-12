#!/bin/bash
#Script bucket connecten
sudo apt-get update
#sudo apt-get upgrade -y

#Install curl
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

#sudo GOOGLE_APPLICATION_CREDENTIALS=/var/InstallationApplication/account.json gcsfuse --dir-mode "777" -o allow_other test-stage-cvo /var/InstallationApplication/bucket
#mount /var/InstallationApplication/bucket
#sudo google_metadata_script_runner --script-type startup
