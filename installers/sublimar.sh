#!/bin/bash
if [ "$(whoami)" == 'root' ]; then
echo "Please exec this command a non-root user."
exit 1;
fi
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
sudo apt-get install wordpress sublime-text git
 
if [ ! -d /var/www ]
then
sudo mkdir /var/www
fi
UGROUPS=$( groups )
 
TEST=1
for GROUP in $UGROUPS
do
if [ 1 == $TEST ]
then
sudo chgrp $GROUP /var/www
TEST=2
fi
done
 
 
sudo chmod 775 /var/www
 
cd /var/www
 
 
git clone https://bitbucket.org/4mc/4mcwebartisans.git
