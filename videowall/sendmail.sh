#!/bin/bash
weeknumber=`date +%V`
echo "This week's userlog and running services" | mail -s "Week - $weeknumber" mirasalenius1@kamk.fi -A output.txt  -A login.txt

