#!/bin/bash
LOGIFAIL="/mnt/c/GitHub-ITS24/teenused.log"
RUN=$1

for teenus in apache2 ssh; do
	if systemctl is-active --quiet $teenus; then
		echo "Teenus $teenus töötab"
	else
		echo "Teenus $teenus ei tööta - käivitan..."
		sudo systemctl start "$teenus"

		#Kontrollin
		if systemctl is-active --quiet "$teenus"; then
			echo "$teenus kävitati edukalt."
			echo "$(date '+%d.%m.%Y %H.%M.%S') - $teenus ei töötanud, kävitatud uuesti. Kontrollijaks oli $RUN" >> "$LOGIFAIL"
		else
			echo "Viga; $teenus ei käivitanud."
		fi
	fi
echo $RUN
done
