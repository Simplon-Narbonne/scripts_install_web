#Aide pour créer un script bash  

$1 utilisé à l'intérieur d'un script : Affiche le premier argument mis sur la ligne de commande après le nom du script exemple:  

./recup_spip.sh monNouveausite  

Un "echo $1" dans le script affichera "monNouveauSite"  

Créer un répertoire:  

mkdir /var/www/$1 Pour télécharger un zip  
par exemple : wget http://files.spip.org/spip/stable/spip.zip  

Dézipper : unzip -d spip$1 spip.zip  

Conditions  
---
if [ -d '/home/nicolas' ]  
then  
    echo "Le repertoire existe"  
else  
	echo "Le repertoire n'existe pas"  
fi  
---
