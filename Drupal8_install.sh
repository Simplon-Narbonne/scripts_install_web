#!/bin/bash
# Installation de Drupal 8 sur Linux
echo "Démarrage de l'Installation de Drupal-8"
echo "Non de votre site Drupal-8 ?"
read monsite
#librairies / paquets comme php5-dev:
sudo apt-get install make php5-dev php-pear git curl

#Installation de Composer:
sudo curl -sS https://getcomposer.org/installer | php

#Pour rendre accessible Composer globalement avec la commande composer:
sudo mv composer.phar /usr/local/bin/composer

#Installation de Drush:
#Drush est un outil qui permet d'administrer son sites en ligne de commandes
sudo apt-get install drush
sudo composer global require drush/drush:dev-master

#Pour utiliser Drush on indique le path dans le fichier profil .bashrc :
cd /home/patrick/.bashrc
echo "export PATH="$HOME/.composer/vendor/bin:$PATH" ">>

#On crée la base de donnée drupal:
echo "Nom de la base de donnée"
echo "Nom d'utilisateur de la base de donnée ?"
read nom_utilisateur
echo "Mot de passe utilisateur de la base de donnée"
read mdp
sudo mysqladmin -u $nom_utilisateur -p$mdp create bdd_Drupal8

#On télécharge Drupal8
sudo drush dl drupal-8.0.6

#On se place dans le répertoire Drupal pour le configurer :
cd /var/wwww/html/drupal-8.0.6/
cp /var/www/html/$nomsite/sites/default/default.settings.php /var/www/html/$nomsite/sites/default/settings.php
sudo chmod a+w /var/www/html/$nomsite/sites/default/settings.php
sudo mkdir -p /var/www/html/$nomsite/sites/default/files/translations
sudo chmod -R a+w /var/www/html/$nomsite/sites/default/files
