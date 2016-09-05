#!/bin/bash
nomsite=$1
version=8.1.8
if [ ! -f ./drupal-$version.tar.gz ]
then 
    wget https://www.drupal.org/files/projects/drupal-$version.tar.gz
    tar -zxvf drupal-$version.tar.gz
fi
mkdir /var/www/html/$nomsite
cp -ra drupal-$version/* /var/www/html/$nomsite/
cp -ra drupal-$version/.htaccess /var/www/html/$nomsite/

cp /var/www/html/$nomsite/sites/default/default.settings.php /var/www/html/$nomsite/sites/default/settings.php
chmod a+w /var/www/html/$nomsite/sites/default/settings.php
mkdir -p /var/www/html/$nomsite/sites/default/files/translations
chmod -R a+w /var/www/html/$nomsite/sites/default/files

mysqladmin -u 'root' -p create $nomsite

echo "http://localhost/$nomsite"
