#!/bin/bash
f=./restaurant
. functions
if [ ! -f $f ]
	then echo "`basename $f` nu exista" 1>&2
	exit 1
fi
while true
do
	echo -e "\n--- MENIU PRINCIPAL ---"
	select OPTION in Listeaza Adauga Sterge Modifica Cauta Iesire
	do
	case $OPTION in
	Listeaza)	(echo "NUME RESTAURANT:ADRESA:SPECIALITATE:TELEFON:AN DESCHIDERE"; cat restaurant) | column -s ":" -t
			read -p "Apasati ENTER pentru a continua..." key;;
	Adauga)		adaugare;;
	Sterge)		stergere;;
	Modifica)	modificare;;
	Cauta)		cautare;;
	Iesire)		echo "La revedere!"; exit 0;;
	*)		echo "Selectie invalida";;
	esac
	break
	done
done

