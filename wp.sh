#!/bin/bash

# Get latest wp
curl -O http://wordpress.org/latest.tar.gz
# Untar
tar -zxvf latest.tar.gz
# move to root folder
mv wordpress/* .
# Delete folder
rm -rf wordpress
# Delete tar file
rm latest.tar.gz

# Get some Salt data
curl -o salt.txt https://api.wordpress.org/secret-key/1.1/salt/
sed '45,52d'  wp-config-sample.php > wp-config-stripped.php
sed '44 r salt.txt' wp-config-stripped.php > wp-config-salt.php
sed '82 r extras.txt' wp-config-salt.php > wp-config.php
rm salt.txt
rm extras.txt
rm wp-config-sample.php
rm wp-config-stripped.php
rm wp-config-salt.php

# User input for database name
echo "Type database name: "
read DBNAME
echo "%s/database_name_here/$DBNAME/g
w
q
" | ex wp-config.php

# User input for database username
echo "Type datebase username: "
read DBUSER
echo "%s/username_here/$DBUSER/g
w
q
" | ex wp-config.php


# User input for database password
echo "Type database password: "
read DBPASS
echo "%s/password_here/$DBPASS/g
w
q
" | ex wp-config.php

# User input for database table prefix
echo "Type database table prefix: "
read DBPREFIX
echo "%s/wp_/$DBPREFIX/g
w
q
" | ex wp-config.php

# Create uploads folder and set permissions
mkdir wp-content/uploads
chmod 755 wp-content/uploads

# Download language files
wget --quiet http://wpsv.se/fil/sv_SE-3.5.zip
unzip -q sv_SE-3.5.zip
mkdir wp-content/languages
mv *.mo wp-content/languages/
mv *.po wp-content/languages/
rm sv_SE-3.5.zip
# Activate language files
sed -i "" "s/define('WPLANG', '')/define('WPLANG', 'sv_SE')/g" wp-config.php

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
wget --quiet http://downloads.wordpress.org/plugin/regenerate-thumbnails.zip
unzip -q regenerate-thumbnails.zip
mv regenerate-thumbnails/ wp-content/plugins/
wget --quiet http://downloads.wordpress.org/plugin/simple-history.zip
unzip -q simple-history.zip
mv simple-history/ wp-content/plugins/
wget --quiet http://downloads.wordpress.org/plugin/my-page-order.zip
unzip -q my-page-order.zip
mv my-page-order/ wp-content/plugins/
# Delete zip files
rm -rf *.zip

# Delete plugins Hello dolly and Askismet
rm -rf wp-content/plugins/hello-dolly
rm -rf wp-content/plugins/akismet

# Get my start settings
git clone https://github.com/urre/WordPress-Start-Settings.git
mv WordPress-Start-Settings/ wp-content/plugins
rm -rf WordPress-Start-Settings