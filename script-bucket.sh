#!/bin/bash
#Script bucket connecten
sudo apt-get update
sudo apt-get upgrade -y

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
sudo mkdir /var/bucket
sudo chown $USER:$USER /var/bucket

GOOGLE_APPLICATION_CREDENTIALS=/var/account.json gcsfuse test-stage-cvo /var/bucket

