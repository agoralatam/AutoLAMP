#!bin/bash
clear

# ---------------| Colores
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ---------------| Banner
echo -e "$YELLOW                  888            888             d8888 888b     d888 8888888b."
echo -e "                  888            888            d88888 8888b   d8888 888   Y88b"
echo -e "                  888            888           d88P888 88888b.d88888 888    888"
echo -e " 8888b.  888  888 888888 .d88b.  888          d88P 888 888Y88888P888 888   d88P"
echo -e "     88b 888  888 888   d88  88b 888         d88P  888 888 Y888P 888 8888888P"
echo -e ".d888888 888  888 888   888  888 888        d88P   888 888  Y8P  888 888"
echo -e "888  888 Y88b 888 Y88b. Y88  88P 888       d8888888888 888       888 888"
echo -e " Y888888   Y88888   Y888  Y88P   88888888 d88P     888 888       888 888"
echo -e "$RED---------------------------------------------------------------------------"
echo -e " >$YELLOW Automatic Installer for: APACHE$RED |$YELLOW PHP $RED|$YELLOW MYSQL $RED"
echo -e "$RED >$YELLOW Created by n4ss4u from AGORA . 2024"
echo -e ""
echo -e " Press$RED ENTER$YELLOW to continue... $NC"
read

echo -e ""

# ---------------| Actualizando gestor de paquetes
echo -e "$RED[+]$YELLOW Updating packages managers..."
apt update -qq && apt upgrade -qq -y > /dev/null 2>&1

# ---------------| Instalando Apache
echo -e "$RED[+]$YELLOW Installing Apache..."
apt install apache2 -y > /dev/null 2>&1
systemctl reload apache2 > /dev/null 2>&1

# ---------------| Instalando MySQL Server
echo -e "$RED[+]$YELLOW Installing Mysql Server..."
apt install mysql-server -y > /dev/null 2>&1

# ---------------| Instalando PHP8.3
echo -e "$RED[+]$YELLOW Installing PHP"
apt install php8.3 -y > /dev/null 2>&1

# ---------------| Instalando librerias necesarias para correr PHP en apache junto a MysqlServer
echo -e "$RED[+]$YELLOW Installing necessary libraries for PHP..."
apt install libapache2-mod-php8.3 php8.3-mysql php8.3-xml php8.3-gd php8.3-mbstring php8.3-bcmath php8.3-cli -y > /dev/null 2>&1

# ---------------| Instalando paquetes necesario parala instalacion de Composer
echo -e "$RED[+]$YELLOW Installing curl, git, unzip..."
apt install curl git unzip -y > /dev/null 2>&1

# ---------------| Descargando Composer
echo -e "$RED[+]$YELLOW Getting Composer..."
curl -sS https://getcomposer.org/installer -o composer-setup.php > /dev/null 2>&1

# ---------------| Instalando Composer
echo -e "$RED[+]$YELLOW Installing Composer..."
php composer-setup.php --install-dir=/usr/local/bin --filename=composer > /dev/null 2>&1

# ---------------| Instalando PhpMyAdmin
echo -e "$RED[+]$YELLOW Installing PhpMyAdmin..."
apt isntall phpmyadmin -y > /dev/null 2>&1

# ---------------| Habilitando Apache para el inicio del sistema
systemctl enable apache2 > /dev/null 2>&1
systemctl start apache2 > /dev/null 2>&1

echo -e ""
echo -e "$RED-----------------------------"
echo -e "$RED[!]$YELLOW COMPLETE !!!"
echo -e "$RED[!]$YELLOW Visit:$RED http://localhost:80 $NC"
