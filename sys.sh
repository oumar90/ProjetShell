#!/bin/bash

while true
clear
do
#mot de bien venue

echo    "	================================================================
	*								*
	*   BIENVENUE SUR MON PROJET SYS SAISIR L'ATION À EXÉCUTER      *
        *								*
        *===============================================================*"

#menu qui nous permet d'exécuter notre projet sys

	echo " a) Informations des utilisateurs enregistré il y'a trois (03) jours"
	echo " b) Aquisition, Installation et Lancement de l'environnement XAMPP "
	echo " c) Archivage des éléments du repertoire personnel qui ont été modifier par l'utilisateur sudoer il y'a deux jour dans le peripherique eterne"
	echo " d) Information sur l'utilisation du disque, de la mémoire, du processeur et du swap"
	echo " q) Quitter !!! "

	echo -e "\n"
	echo -e "Entrer votre selction : \c "
	read reponse

	case "$reponse" in 
		a) who ;; 
		#prémiere commande "weget" permet de recupere le fichier executable depuis le site officiel xampp
		#deuxième commande "sudo chmod xampp..." permet de donner tous les droit au users et executer et lecture pour les autres
		#toisieme commande "sudo ./xamp......." permet d'executer le programme
		#quatrième commande "sudo /opt/lampp/lampp start" permet de demarer xampp
		b)sudo /opt/lampp/lampp start 2> errtest ;
		  echo "XAMPP est déjà installé ";
			if [ $? -ne 0 ]; then
                		wget https://www.apachefriends.org/xampp-files/7.0.18/xampp-osx-7.0.18-0-installer.dmg;
				sudo chmod 755 xampp-linux-*-installer.run;
				sudo ./xampp-linux-*-installer.run;
				sudo /opt/lampp/lampp start 2> errtest;
			fi ;;
		c) ;;
		#la commande vmstat permet de donner les informations sur la memoire, cpu, disque dur et swap
		d)vmstat ;;
		#permt de quit le processus
		q) exit ;;
  	esac
     echo -e " Cliquer sur enter pour continue.... \c"
     read input

done		
