# Linux Apache MySQL PHP
## A script that install a LAMP server

### Supported System
___
+ Debian 9.x
+ Ubuntu 18.x

### Supported Software
___
+ Apache 2.4
+ PHP 7.3
+ MariaDB 10.1
+ Composer 1.8.4
+ phpMyAdmin 4.8.5
+ Tools :
  - net-tools
  - curl
  - bash-completion
  - ca-certificates
  - apt-transport-https

### Installation
___
```bash
sudo apt install -y wget git
git clone https://github.com/codbear/lamp.git
cd lamp
chmod 755 *.sh
sudo ./lamp.sh
```
