#!/bin/bash

# Install some usefull tools
apt update
apt install -y net-tools sudo wget curl bash-completion ca-certificates apt-transport-https git

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
