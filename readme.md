# WordPress Installer
---------------------------------------

> The 1 minute setup!

This bash script will fetch the latest WordPress and setup wp-config. It also adds Swedish translation files and installs some plugins.

## Contents
+ Downloads the latest version of WordPress
+ Adds security keys, salt data to wp-config.php
+ Lets you typ your local database name, user and password and setup wp-config.php
+ Configure Swedish language settings and installs language files
+ Deletes plugin Hello Dolly
+ Setup some default settings via my plugin [WordPress-Start-Settings](https://github.com/urre/WordPress-Start-Settings.git)

### Installs plugins:

+ [Advanced Custom fields](http://wordpress.org/plugins/advanced-custom-fields)
+ [Admin Menu Tree Page View](http://wordpress.org/plugins/admin-menu-tree-page-view)
+ [Enable Media Replace](http://wordpress.org/plugins/enable-media-replace)
+ [Post Thumbnail Editor](http://wordpress.org/plugins/post-thumbnail-editor)
+ [Search and replace](http://wordpress.org/plugins/search-and-replace)
+ [Regenerate thumbnails](http://wordpress.org/plugins/regenerate-thumbnails)
+ [Simple History](http://wordpress.org/plugins/simple-history)
+ [My page order](http://wordpress.org/plugins/my-page-order)
+ [WordPress SEO](http://wordpress.org/plugins/wordpress-seo)
+ [Relevanssi](http://wordpress.org/plugins/relevanssi)

## Installation
---------------------------------------

Install to a folder ex. 'mysite.com'

	git clone https://github.com/urre/wp-installer.git mysite.com && cd mysite.com
	bash wp.sh

or run as root

	cp wp.sh /usr/bin/wp-installer

then type in any folder

	'wp-installer'