#!/bin/sh
# Installer script built by Joseph Marsden
# <joseph.clayton.marsden@gmail.com>
# http://contentplatformstriangle.com
# http://dreamsintellience.com
# http://unlicrea.com
# Content Platforms Triangle is licensed under the GNU GPL.
# http://www.gnu.org/licenses/gpl-3.0.txt

# Colour Definitions

RCol='\e[0m'    # Text Reset

# Regular           Bold                Underline           High Intensity      BoldHigh Intens     Background          High Intensity Backgrounds
Bla='\033[33;30m';
Red='\033[33;31m';
Gre='\033[33;32m';
Yel='\033[33;33m';
Blu='\033[33;34m';
Pur='\033[33;35m';
Cya='\033[33;36m';
Whi='\033[0m';

# Start Script here
whatuserami=`whoami`
if [ "$whatuserami" = "root" ]; then
echo "${Gre}Root privileges detected."
else
echo "${Red}Must run installer as root."
exit 0
fi
clear
echo "${Blu}Welcome to the Content Platforms Triangle installer script."
echo "${Blu}Make sure you have a working internet connection before starting this script."
echo "${Red}!!! WARNING !!!"
echo "${Red}Make sure you have a CLEAN SYSTEM before installing Content Platforms Triangle."
echo "${Red}This installer script will completely overwrite /var/www and apache configuration."
echo "${Red}Also, make sure you have at least 500MB of disk space. 1GB is reccomended."
echo "${Blu}This installer will install all prerequisites neccesary to run Content Platforms Triangle."
echo "${Yel}Continue? y/N"
read yesorno
if [ "$yesorno" = "Y" ]; then
echo "${Cya}Checking for working Internet connection..."
else
echo "${Blu}Installation cancelled."
exit 0
fi
isconnected=`nm-tool | grep "State: connected" | wc -l`
if [ "$isconnected" = "1" ]; then
echo "${Blu}Internet connection is up."
else
echo "${Red}You must have a working internet connection to continue."
fi
echo "${Cya}Installing prerequisites."
echo "${Cya}Updating package list."
sudo apt-get update
echo "${Cya}Upgrading packages."
sudo apt-get -y upgrade
echo "${Cya}Installing prerequisites."
sudo apt-get -y install mysql-server php5 php5-mysql apache2 git sed
echo "${Cya}Stopping apache2."
sudo /etc/init.d/apache2 stop
echo "${Cya}Downloading CPT from Github."
git clone https://github.com/UnliCrea/CPT.git
echo "${Cya}Removing unnessecary packages and files."
sudo apt-get -y remove git
rm -r /var/www
mkdir /var/www
echo "${Cya}Copying files."
cd CPT
cd ContentPlatformsTriangle
cp -r Index /var/www/Index
cp -r Library /var/www/Library
userpasswd=`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32`
echo "${Cya}Generating SQL query."
touch setup.sql
echo "CREATE DATABASE CJCommunity;" > setup.sql
echo "CREATE DATABASE CJDevblog;" > setup.sql
echo "CREATE DATABASE CJMain;" > setup.sql
echo "CREATE USER 'cptuser'@'%' IDENTIFIED BY '$userpasswd';" > setup.sql
echo "GRANT ALL ON CJCommunity.* TO 'cptuser'@'%';" > setup.sql
echo "GRANT ALL ON CJDevblog.* TO 'cptuser'@'%';" > setup.sql
echo "GRANT ALL ON CJMain.* TO 'cptuser'@'%';" > setup.sql
echo "SQL query generated."
echo "${Yel}Enter SQL root password, please."
mysql -u root -p < setup.sql
echo "${Blu}Databases created."
echo "${Cya}Initializing databases with data, please wait..."
echo "${Yel}Enter SQL root password, please."
mysql -u root -p CJCommunity < CJCommunity.sql
echo "${Yel}Enter SQL root password, please."
mysql -u root -p CJDevblog < CJDevblog.sql
echo "${Yel}Enter SQL root password, please."
mysql -u root -p CJMain < CJMain.sql
echo "${Blu}SQL initialization complete."
echo "${Cya}Modifying configuration accordingly..."
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
echo "${Blu}Configuration has been altered successfully."
echo "${Cya}Cleaning up..."
cd ./../../
rm -r CPT
rm -r /var/www/Index/community/cache
mkdir /var/www/Index/community/cache
echo "${Cya}Copying apache config..."
sed -i 's/html/Index/g' /etc/apache2/sites-available/000-default.conf
echo "${Cya}Starting apache..."
/etc/init.d/apache2 start
echo "${Gre}CPT has been installed to /var/www."
echo "${Gre}Installer now exiting."
