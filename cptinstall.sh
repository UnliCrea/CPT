#!/bin/sh
# Installer script built by Joseph Marsden
# <dreamsintel@gmail.com>
# https://cryosim.co
# http://unlicrea.com
# Content Platforms Triangle is licensed under the MIT License..
# https://github.com/UnliCrea/CPT/blob/master/LICENSE

# Start Script here
whatuserami=`whoami`
if [ "$whatuserami" = "root" ]; then
echo "Root privileges detected."
else
echo "Must run installer as root."
exit 0
fi
clear
echo "Welcome to the Content Platforms Triangle installer script."
echo "Make sure you have a working internet connection before starting this script."
echo "!!! WARNING !!!"
echo "Make sure you have a CLEAN SYSTEM before installing Content Platforms Triangle."
echo "This installer script will completely overwrite /var/www and the Apache configuration."
echo "Also, make sure you have at least 500MB of disk space. 1GB is reccomended."
echo "This installer will install all prerequisites neccesary to run Content Platforms Triangle."
echo "Continue? y/N"
read yesorno
if [ "$yesorno" = "Y" ]; then
echo "Checking for working Internet connection..."
else
echo "Installation cancelled."
exit 0
fi
isconnected=`nm-tool | grep "State: connected" | wc -l`
if [ "$isconnected" = "1" ]; then
echo "Internet connection is up."
else
echo "You must have a working internet connection to continue."
fi
echo "Installing prerequisites."
echo "Updating package list."
sudo apt-get update
echo "Upgrading packages."
sudo apt-get -y upgrade
echo "Installing prerequisites."
sudo apt-get -y install mysql-server php5 php5-mysql apache2 git sed
echo "Stopping apache2."
sudo /etc/init.d/apache2 stop
echo "Downloading CPT from Github."
git clone https://github.com/UnliCrea/CPT.git
echo "Removing unnessecary packages and files."
sudo apt-get -y remove git
rm -r /var/www
mkdir /var/www
echo "Copying files."
cd CPT
cd ContentPlatformsTriangle
cp -r Index /var/www/Index
cp -r Library /var/www/Library
userpasswd=`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32`
echo "Generating SQL query."
touch setup.sql
echo "CREATE DATABASE CJCommunity;" > setup.sql
echo "CREATE DATABASE CJDevblog;" > setup.sql
echo "CREATE DATABASE CJMain;" > setup.sql
echo "CREATE USER 'cptuser'@'%' IDENTIFIED BY '$userpasswd';" > setup.sql
echo "GRANT ALL ON CJCommunity.* TO 'cptuser'@'%';" > setup.sql
echo "GRANT ALL ON CJDevblog.* TO 'cptuser'@'%';" > setup.sql
echo "GRANT ALL ON CJMain.* TO 'cptuser'@'%';" > setup.sql
echo "SQL query generated."
echo "Enter SQL root password, please."
mysql -u root -p < setup.sql
echo "Databases created."
echo "Initializing databases with data, please wait..."
echo "Enter SQL root password, please."
mysql -u root -p CJCommunity < CJCommunity.sql
echo "Enter SQL root password, please."
mysql -u root -p CJDevblog < CJDevblog.sql
echo "Enter SQL root password, please."
mysql -u root -p CJMain < CJMain.sql
echo "SQL initialization complete."
echo "Modifying configuration accordingly..."
sed -i 's/MainDB/CJMain/g' /var/www/Library/Model/DBConnectionModel.php
sed -i 's/COMMUNITYDB/CJCommunity/g' /var/www/Library/Model/DBConnectionModel.php
sed -i 's/root/cptuser/g' /var/www/Library/Model/DBConnectionModel.php
sed -i 's/DATABASEPASSWORD/'$userpasswd'/g' /var/www/Library/Model/DBConnectionModel.php
sed -i 's/COMMUNITYDB/CJCommunity/g' /var/www/Index/community/config.php
sed -i 's/root/cptuser/g' /var/www/Index/community/config.php
sed -i 's/DATABASEPASSWORD/'$userpasswd'/g' /var/www/Index/community/config.php
sed -i 's/BLOGDB/CJDevblog/g' /var/www/Index/devblog/wp-config.php
sed -i 's/root/cptuser/g' /var/www/Index/devblog/wp-config.php
sed -i 's/DATABASEPASSWORD/'$userpasswd'/g' /var/www/Index/devblog/wp-config.php
echo "Configuration has been altered successfully."
echo "Cleaning up..."
cd ./../../
rm -r CPT
rm -r /var/www/Index/community/cache
mkdir /var/www/Index/community/cache
echo "Copying apache config..."
sed -i 's/html/Index/g' /etc/apache2/sites-available/000-default.conf
echo "Starting apache..."
/etc/init.d/apache2 start
echo "CPT has been installed to /var/www."
echo "Installer now exiting."
