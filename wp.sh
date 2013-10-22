#!/bin/bash

# Get latest WordPress, download, untar, move to correct folder, remove install file
wget --quiet http://sv.wordpress.org/wordpress-3.6.1-sv_SE.zip
unzip -q wordpress-3.6.1-sv_SE.zip
mv wordpress/* .
rm -rf wordpress
rm wordpress-3.6.1-sv_SE.zip

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

wget --quiet http://downloads.wordpress.org/plugin/admin-menu-tree-page-view.zip
unzip -q admin-menu-tree-page-view.zip
mv admin-menu-tree-page-view/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/regenerate-thumbnails.zip
unzip -q regenerate-thumbnails.zip
mv regenerate-thumbnails/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/simple-history.zip
unzip -q simple-history.zip
mv simple-history/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/my-page-order.zip
unzip -q my-page-order.zip
mv simple-history/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/wordpress-seo.zip
unzip -q wordpress-seo.zip
mv wordpress-seo/ wp-content/plugins/

wget --quiet http://downloads.wordpress.org/plugin/relevanssi.zip
unzip -q relevanssi.zip
mv relevanssi/ wp-content/plugins/

# Install my language file for Advanced custom fields
git clone https://github.com/urre/ACF-Swedish-Translation.git acf-swe
mv acf-swe/* wp-content/plugins/advanced-custom-fields/lang
rm -rf acf-swe

# Delete zip files
rm -rf *.zip

# Delete plugins Hello dolly
rm wp-content/plugins/hello.php

# Grab my start settings plugin
git clone https://github.com/urre/WordPress-Start-Settings.git
mv WordPress-Start-Settings/ wp-content/plugins
rm -rf WordPress-Start-Settings