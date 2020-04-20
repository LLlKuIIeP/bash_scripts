#!/bin/bash

#       Install Apache MySQL PHP
echo -e "\n\n\tinstall lamp\n"
sudo apt-get update
sudo apt install tasksel -y
sudo tasksel install lamp-server

echo -e "\n\n\tinstall phpmyadmin\n"
sudo add-apt-repository ppa:phpmyadmin/ppa
sudo apt-get update
sudo apt-get install phpmyadmin -y

# https://qna.habr.com/q/535222
# https://stackoverflow.com/questions/49948350/phpmyadmin-on-mysql-8-0/49950165
echo -e "\n\n\tset password for user\n"
cd ~/
touch create_user.sql
echo -e "CREATE USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY '1111';\n" > create_user.sql
echo -e "GRANT ALL PRIVILEGES ON * . * TO 'user'@'localhost';\n" >> create_user.sql
echo -e "FLUSH PRIVILEGES;" >> create_user.sql
sudo mysql < create_user.sql
rm -f create_user.sql

echo -e "\n\n\tinstall modules for php\n"
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php-bcmath php-curl php-db php-mbstring php-mysql php-bz2 php-xml

sudo service apache2 reload
#************************************************


#       Composer
echo -e "\n\n\tinstall Composer\n"
sudo apt-get update
sudo apt-get install -y wget php-cli php-zip unzip curl
cd ~/
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer -v
#************************************************


#       Node.js
sudo apt update
sudo apt install nodejs


#       NPM
echo -e "\n\n\tinstall NPM\n"
sudo apt update
sudo apt install npm
#************************************************
