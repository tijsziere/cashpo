# CashpoCRM install script

This script automatically installs CashpoCRM as a Docker image with NGINX server and MySQL database. It is build upon the [espoCRM install script](https://github.com/espocrm/espocrm-installer) provided by the espoCRM core team.

## Requirements

1. Operating system:
	* Ubuntu
	* Debian
	* Linux Mint
2. Access via command line.
3. Root or sudo access.

## installation

Open your server's command line and run the commands:

``` wget https://raw.githubusercontent.com/tijsziere/cashpo/main/cashpo_install.sh ```

then

``` sudo bash cashpo_install.sh ```

Or, for your own domain including a letsencrypt certificate, run:

``` bash install.sh -y --ssl --letsencrypt --domain=my-espocrm.com --email=email@my-domain.com ```

## Documentation

For more information about `options`, `installation modes` and more, see [documentation](https://github.com/espocrm/documentation/blob/master/docs/administration/installation-by-script.md).