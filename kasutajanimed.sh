#!/bin/bash

FAIL="nimed.txt"

#Funktsioon, mis muudab tähed väkeseks ja asenda täpitaähed
asenda_tahed(){
	echo "$1" | tr '[:upper:]' '[:lower:]' | sed -e 's/õ/o/g' -e 's/ö/o/g' -e 's/ü/y/g' -e 's/ä/a/g'
}
#Loeme faili rida realt
while read enimi pnimi sugu; do
 	#Töötleme ees- ja prenimed ära
	eesnimi=$(asenda_tahed"$enimi")
	perenimi=$(asenda_tahed"$pnimi")

	#Loome kasutaja ees- ja perekonnanimest
	kasutajanimi="${eesnimi}.${perenimi}"

	#Väljastame tulemuse
	echo "$kasutajanimi"
done < "$fail"
