#!/bin/bash
#fonction qui permet de liste les utilisateur integre il y'a 3 jour
	function showUsers(){
	 ### on détermine d'abord la liste des différents utilisateurs enregistrés sachant qu'ils ont un dossier personnel à leur nom dans /home/
	   cat /etc/passwd | cut -d ":" -f1 > users.txt
	   cat users.txt | while read ligne
	 do
	   ls /home/ | grep $ligne > users.txt
	 done
	 echo "la liste des utilisateurs est : "
	 while read ligne
	 do
	  echo "- $ligne"
	 done < users.txt
	 ##### ici il doit être question de filtrer les utilisateurs des 03 derniers jours
	}

#fonction qui permet d'archiver les element du repertoire edit par sudoer
	function archive(){
           read -p "entrer le chemin du périphérique externe : " path
	   user=$(cat /etc/group | grep sudo | cut -d ":" -f4)
	   sudo find /home/$user/* -ctime 2 > fichierstock.txt #on stocke tout les fichiers modifiés il y a deux jours dans le fichier fichierstock.txt
	   mkdir archive
           cat fichierstock.txt | while read ligne
	 do
	   mv $ligne archive
	done
	  tar -cvs archive.tar archive/
	  gzip archive.tar	
	  cp archive.tar.gz $path
	}


question=1

while [ "$question" -eq 1 ];
do
 clear
#menu qui nous permet d'exécuter notre projet sys
 echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
 echo "*                                                                                            *"
 echo "*                              BIENVENU DANS MON PROJET SYS                                  *"
 echo "**********************************************************************************************"
 echo "*                                                                                            *"
 echo "* a) Informations des utilisateurs enregistré il y'a trois (03) jours                        *"
 echo "* b) Aquisition, Installation et Lancement de l'environnement XAMPP                          *"
 echo "* c) Archivage des éléments du repertoire personnel qui ont été modifier par l'utilisateur   *" 
 echo "*    sudoer il y'a deux jours dans le peripherique externe                                   *"
 echo "* d) Information sur l'utilisation du disque, de la mémoire, du processeur et du swap        *"
 echo "* q) Quitter (Q/q) !                                                                               *"
 echo "*											    *"
 echo "*                                                                                            *"
 echo "*                     RÉALISER PAR OUMAR DJIME RATOU 14B486FS                                *"
 echo "*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*"


	echo -e "\n"
	echo -e "Entrer votre selction : \c "
	read reponse

	case "$reponse" in 
		a) showUsers ;; 
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
		#appel de la fonction archive();
		c) archive;;
		#la commande vmstat permet de donner les informations sur la memoire, cpu, disque dur et swap
		d)vmstat ;;
		#permt de quit le processus
		q) exit ;;
  	esac
     echo -e " Cliquer sur enter pour continue.... \c"
     read input

done		
