#!/bin/bash
#Week days
MON=$(date --date="6 days ago" +'%Y-%m-%d')
SUN=$(date +'%Y-%m-%d')

#ajetaan aina sunnuntaina, joten voidaan käyttää date komentoa sunnuntain pvm saamiseen ja laittaa maanantai 6 päivää sitten, jolloin saadaan oikea pvm

#get logged in users from MON-SUN
#last -f /var/log/wtmp | sed s/yyyymmdd/`date --date="6 days ago" +%Y%m%d`/  > login.txt
sed -n '/^$MON/,/^$SUN/p' /var/log/wtmp | last > login.txt
