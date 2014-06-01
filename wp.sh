#!/bin/bash

# Get latest WordPress, download, untar, move to correct folder, remove install file
echo "$(tput setaf 4)Downloading latest WordPress...$(tput sgr0)"
curl -O http://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz
mv wordpress/* .
rm -rf wordpress
rm latest.tar.gz

# Get some Salt data
curl -o salt.txt https://api.wordpress.org/secret-key/1.1/salt/
sed '45,52d'  wp-config-sample.php > wp-config-stripped.php
sed '44 r salt.txt' wp-config-stripped.php > wp-config-salt.php
sed '82 r extras.txt' wp-config-salt.php > wp-config.php
rm salt.txt
rm wp-config-sample.php
rm wp-config-stripped.php
rm wp-config-salt.php

# User input for database name
echo "$(tput setaf 4)Type database name (existing db):$(tput sgr0)"
read DBNAME
echo %s/database_name_here/$DBNAME"
w
q
" | ex wp-config.php

# User input for database username
echo "$(tput setaf 4)Type database user (existing db): $(tput sgr0)"

read DBUSER
echo "%s/username_here/$DBUSER/g
w
q
" | ex wp-config.php


# User input for database password
echo "$(tput setaf 4)Type database password (existing db): $(tput sgr0)"

read DBPASS
echo "%s/password_here/$DBPASS/g
w
q
" | ex wp-config.php

# User input for database table prefix
echo "$(tput setaf 4)Choose database prefix: $(tput sgr0)"
read DBPREFIX
echo "%s/wp_/$DBPREFIX/g
w
q
" | ex wp-config.php

# Insert language settings
LANG="define('WPLANG', '')"
SVLANG="define('WPLANG', 'sv_SE')"
echo "%s/$LANG/$SVLANG/g
w
q
" | ex wp-config.php

echo "$(tput setaf 4)Downloading Swedish language files...$(tput sgr0)"

# Download Swedish language files
wget --quiet http://svn.automattic.com/wordpress-i18n/sv_SE/tags/3.9.1/messages/admin-network-sv_SE.mo
wget --quiet http://svn.automattic.com/wordpress-i18n/sv_SE/tags/3.9.1/messages/admin-sv_SE.mo
wget --quiet http://svn.automattic.com/wordpress-i18n/sv_SE/tags/3.9.1/messages/admin-sv_SE.po
wget --quiet http://svn.automattic.com/wordpress-i18n/sv_SE/tags/3.9.1/messages/sv_SE.mo
wget --quiet http://svn.automattic.com/wordpress-i18n/sv_SE/tags/3.9.1/messages/sv_SE.po
wget --quiet http://svn.automattic.com/wordpress-i18n/sv_SE/tags/3.9.1/messages/continents-cities-sv_SE.mo
wget --quiet http://svn.automattic.com/wordpress-i18n/sv_SE/tags/3.9.1/messages/continents-cities-sv_SE.po
mkdir wp-content/languages
mv *.mo wp-content/languages/
mv *.po wp-content/languages/

# Create uploads folder and set permissions
mkdir wp-content/uploads
chmod 755 wp-content/uploads

echo "$(tput setaf 4)Downloading some plugins...$(tput sgr0)"

# Install some plugins
wget --quiet http://downloads.wordpress.org/plugin/advanced-custom-fields.zip;
unzip -q  advanced-custom-fields.zip
mv advanced-custom-fields/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/admin-menu-tree-page-view.zip
unzip -q admin-menu-tree-page-view.zip
mv admin-menu-tree-page-view/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/enable-media-replace.zip
unzip -q enable-media-replace.zip
mv enable-media-replace/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/post-thumbnail-editor.zip
unzip -q post-thumbnail-editor.zip
mv post-thumbnail-editor/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/search-and-replace.zip
unzip -q search-and-replace.zip
mv search-and-replace/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/regenerate-thumbnails.zip
unzip -q regenerate-thumbnails.zip
mv regenerate-thumbnails/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/simple-history.zip
unzip -q simple-history.zip
mv simple-history/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/my-page-order.zip
unzip -q my-page-order.zip
mv my-page-order/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/wordpress-seo.zip
unzip -q wordpress-seo.zip
mv wordpress-seo/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/relevanssi.zip
unzip -q relevanssi.zip
mv relevanssi/ wp-content/plugins/

# Delete zip files
rm -rf *.zip

# Delete plugins Hello dolly
rm wp-content/plugins/hello.php

# Grab my start settings plugin
git clone https://github.com/urre/WordPress-Start-Settings.git
mv WordPress-Start-Settings/ wp-content/plugins
rm -rf WordPress-Start-Settings

echo "$(tput setaf 2)Installation ok!$(tput sgr0)"