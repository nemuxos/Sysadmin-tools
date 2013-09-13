#!/bin/bash

#setup rutes of bin
#WHOAMI=
#LSB_RELEASE
#CHGRP
#CHOWN
#groups

#check running


if [ "$(whoami)" == 'root' ]; then
        echo "Please exec this command a non-root user."
        exit 1;
fi
#check lsb_relase
typeset TYPE_RESULT="`type -t lsb_release`"
if [ ! "$TYPE_RESULT" == 'file' ]; then

	echo "This script need lsb_release to correct determine routes."
        exit 1;
fi

#get data from system


DISTRO=$(lsb_release -si)
UGROUPS=$( groups )

#set routes to distro

WWWDIR="/var/www"


PACKAGES_PHP="php-pear php5-cli apache2 mysql-client libapache2-mod-php5 php5 php5-mysql libphp-phpmailer php5-gd libphp-snoopy libjs-jquery php-gettext mysql-server"
PACKAGES_IDE="sublime-text"
PACKAGES_GIT="git"



#exec especific code of the distro

#sudo add-apt-repository ppa:webupd8team/sublime-text-2
#sudo apt-get update
#sudo apt-get install $PACKAGES_PHP $PACKAGES_IDE $PACKAGES_GIT

echo $PACKAGES_PHP $PACKAGES_IDE $PACKAGES_GIT





if [ ! -d $WWWDIR ]
then
    sudo mkdir $WWWDIR
fi


TEST=1
for GROUP in $UGROUPS
do
	if [ 1 == $TEST ]
		then
			#sudo chgrp $GROUP $WWWDIR
			TEST=2
		fi
done


#sudo chmod 775 $WWWDIR

cd $WWWDIR


#git clone https://bitbucket.org/4mc/4mcwebartisans.git
