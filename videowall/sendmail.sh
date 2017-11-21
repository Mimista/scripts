#!/bin/bash
#määritetään sen viikon numero, josta tulee sähköpostin otsikko
weeknumber=`date +%V`

#Tulostetaan viesti sähköpostiin sekä lähetetään sen viikon tulokset sähköpostiin adminin tarkistettavaksi
echo "This week's userlog and running services" | mail -s "Week - $weeknumber" testi@testi.com -A output.txt  -A login.txt

