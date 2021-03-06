#!/bin/bash

# Install some usefull tools
apt update
apt install -y net-tools curl bash-completion ca-certificates apt-transport-https

# Install Apache 2
apt install -y apache2 apache2-doc
a2enmod rewrite ssl headers
a2ensite default-ssl.conf
systemctl restart apache2

# Install php 7.3 and create /var/www/html/info.php
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list
apt update
apt upgrade -y
apt install -y php7.3 php7.3-cli php7.3-common php7.3-curl php7.3-mbstring php7.3-mysql php7.3-xml php7.3-gd php7.3-xmlrpc
echo "<?php phpinfo(); ?>" | tee /var/www/html/info.php

# Install composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

# Install and configure MariaDB
apt install -y mariadb-server
systemctl start mariadb
mysql_secure_installation
mysql

# Install and configure phpMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.8.5/phpMyAdmin-4.8.5-all-languages.tar.gz
tar xzvf phpMyAdmin-4.8.5-all-languages.tar.gz
mv phpMyAdmin-4.8.5-all-languages /usr/share/phpmyadmin
chmod -R 0755 /usr/share/phpmyadmin
cp conf/phpmyadmin.conf /etc/apache2/conf-available/
a2enconf phpmyadmin
systemctl restart apache2
rm phpMyAdmin-4.8.5-all-languages.tar.gz

# Enable Apache 2 and MariaDB to run on system startup
systemctl enable apache2 mariadb
