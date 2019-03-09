#!/bin/bash

# Install some usefull tools
apt update
apt install -y net-tools sudo wget curl bash-completion ca-certificates apt-transport-https git

# Install Apache 2
apt install -y apache2 apache2-doc
a2enmod rewrite ssl headers
a2ensite default-ssl.conf
systemctl restart apache2
