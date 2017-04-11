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

#Maak locatie van bucket aan
sudo mkdir bucket
#Install s3fs
sudo apt-get update
sudo apt-get install s3fs -y

sudo chmod 600 pass.txt

sudo "user-allow-other" >> /etc/fuse.conf

sudo s3fs test-stage-cvo bucket/ -o allow_other -o passwd_file=pass.txt -o url=https://storage.googleapis.com

