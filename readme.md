# WordPress Installer
---------------------------------------
This shell script will fetch the latest WordPress and finally setup wp-config. It also installs some plugins.

## Installation
---------------------------------------
	mkdir mysite.com
	cd mysite.com
	git clone https://github.com/urre/wp-installer.git && cd wp-installer
	./wp-installer.sh

or run as root

		$ cp wp.sh /usr/bin/wp-installer
		Run the script by typing 'wp-installer' in any folder