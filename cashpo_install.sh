#!/bin/bash

wget https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
bash install.sh

read -p "Now we will proceed make sure espoCRM becomes CashpoCRM by 510, do you want to contiue? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "currently you have installed a clean version of EspoCRM. You can run this installer again if you want to upgrade to CashpoCRM"
	exit 1
fi

wget https://github.com/tijsziere/cashpo/archive/main.tar.gz

tar -xzf "main.tar.gz"

rm -R /var/www/espocrm/data/espocrm/custom/
cp -R cashpo-main/custom /var/www/espocrm/data/espocrm/
rm -R cashpo-main
rm install.sh
rm main.tar.gz


cd /var/www/espocrm/data/espocrm/
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom client/custom -type d -exec chmod 775 {} + && find data custom client/custom -type f -exec chmod 664 {} +;
chmod 775 application/Espo/Modules client/modules;
chmod 754 bin/command;

chown -R www-data:www-data .;

bash /var/www/espocrm/command.sh rebuild

echo "510 CashpoCRM has been installed, you can use the credentials above to login"