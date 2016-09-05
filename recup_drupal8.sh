#!/bin/bash
nomsite=$1
version=8.1.8
wget https://www.drupal.org/files/projects/drupal-$version.tar.gz
tar -zxvf drupal-$version.tar.gz
mkdir /var/www/html/$nomsite
mv drupal-$version/* /var/www/html/$nomsite/

cp /var/www/html/$nomsite/sites/default/default.settings.php /var/www/html/$nomsite/sites/default/settings.php
chmod a+w /var/www/html/$nomsite/sites/default/settings.php
mkdir -p /var/www/html/$nomsite/sites/default/files/translations
chmod -R a+w /var/www/html/$nomsite/sites/default/files

mysql -u 'root' -p create $nomsite
