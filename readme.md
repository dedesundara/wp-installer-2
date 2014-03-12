# WordPress Installer
---------------------------------------

> This bash script will fetch the latest WordPress and setup wp-config. It also adds Swedish translation files and installs some plugins.

## Installation
---------------------------------------

Clone to a folder ex. 'mysite.com'

	git clone https://github.com/urre/wp-installer.git mysite.com && cd mysite.com
	bash wp.sh
	cd .. && mv wp-installer/* ./
	rm -rf wp-installer

or run as root

	cp wp.sh /usr/bin/wp-installer

then type in any folder

	'wp-installer'