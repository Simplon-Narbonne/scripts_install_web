#!/bin/bash
nomsite=$1
 wget https://www.drupal.org/files/projects/drupal-8.1.0.tar.gz

  tar -zxvf drupal-8.1.0.tar.gz

 mv drupal-8.1.0 /var/www/html/$nomsite

 cp /var/www/html/$nomsite/sites/default/default.settings.php /var/www/html/$nomsite/sites/default/settings.php
 chmod a+w /var/www/html/$nomsite/sites/default/settings.php
 mkdir -p /var/www/html/$nomsite/sites/default/files/translations
 chmod -R a+w /var/www/html/$nomsite/sites/default/files

 mysqladmin -u 'root' -p create $nomsite
