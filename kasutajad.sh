#!/bin/bash
FAIL=$1
KURSUS=$2

while read enimi pnimi sugu; do
#käsu käivitamisel tuleb defineerida fail kus andmed võetaks $1 ja ka $2 (nimed.txt ja kursus ITS24: ./kasutajad.sh nimed.txt ITS24)
	echo "$enimi $pnimi õpib $KURSUS kursusel."
done < "$FAIL"
