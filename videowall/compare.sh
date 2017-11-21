#!/bin/bash

#vertaa output.txt tiedostoa ja vertaa sitä pyörivien palvelujen kanssa. Jos tiedostossa on eroa se lisätään output.txt tiedostoon, jos muutoksia ei ole tiedosto pysyy samana

diff <(cat output.txt) <(service --status-all | grep + -C 0) >> output.txt

