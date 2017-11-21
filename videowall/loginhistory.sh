#!/bin/bash
#Week days
#Määritetään maanantai päivä joka on 6pv ennen nykyistä päivämäärää. Skripti ajetaan aina sunnuntaisin, jolloin nykyinen päivä=sunnuntai. näin saadaan koko viikon käyttäjät
MON=$(date --date="6 days ago" +'%Y-%m-%d')
SUN=$(date +'%Y-%m-%d')



#get logged in users from MON-SUN
#Ottaa /var/log/wtmp hakemistosta käyttäjät mon-sun ajalta ja lisää kirjautuneet login.txt tiedostoon.
sed -n '/^$MON/,/^$SUN/p' /var/log/wtmp | last > login.txt



#Huom! cronilla pitää vielä erikseen ajastaa erikseen tämä skripti ajettavaksi joka sunnuntai klo 23.59.
