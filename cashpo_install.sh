#!/bin/bash

#wget https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
#bash install.sh

read -p "Now we will proceed make sure espoCRM becomes CashpoCRM by 510, do you want to contiue? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "currently you have installed a clean version of EspoCRM. You can run this installer again if you want to upgrade to CashpoCRM"
	exit 1
fi

wget https://github.com/tijsziere/cashpo/archive/main.tar.gz

tar -xzf "main.tar.gz" -C /var/www/html

cd /var/www/html
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom client/custom -type d -exec chmod 775 {} + && find data custom client/custom -type f -exec chmod 664 {} +;
chmod 775 application/Espo/Modules client/modules;
chmod 754 bin/command;

chown -R www-data:www-data .;

php rebuild.php

echo "CashpoCRM has been installed, you can use the credentials above to login"