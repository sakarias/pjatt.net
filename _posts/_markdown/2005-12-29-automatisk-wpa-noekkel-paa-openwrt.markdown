title="Automatisk WPA nøkkel på OpenWRT"
date="2005-12-29 12:00:56"
Her om dagen så satt jeg på ramma og tenkte på sikkerheten på det trådløse nettet hjemme. Og kom fram til at en automatisert metode for å bytte wpa nøkkelen ville ha vært det beste. Men det må også være en enkel måte for brukeren (meg) å hente ut nøkkelen slik at de trådløse enhetene kan benytte seg av nettet. Løsningen min er da å kopiere nøkkelen ut på en usb minnestikke.

Jeg har da en router med <a href="http://openwrt.org/">OpenWRT</a> RC4 installert og en vanlig <a href="http://www.linux.org/">Linux</a> boks stående bak sofaen. Jeg kunne sikkert ha gjort hele løsningen i routeren, men jeg synes det ble enklere å la Linux boksen generere wpa nøkkelen og sende denne til routeren(e) og legge den på minnestikken. Grunnen til at jeg legger wpa nøkkelen på minnebrikken istedet for f.eks å maile den til meg er hvis jeg har besøkende så har jeg liten lyst til å prøve å stave en 63 tegns langt "ord" med små og store bokstaver. Da er det bare å ta fram usb minnepinnen og gi den til besøkende som kopierer wpa koden fra wpa.txt fila og limer den inn i sitt wlan konfigurasjons program.

Linux boksen:
Vanlig <a href="http://www.ubuntu.com/">Ubuntu</a> Server installasjon, med shred og pwgen programmene installert.
Skriptet jeg lar cron kjøre den 1 hver måned er (husk dette er min kode, møkkete og fæl) :
<pre lang="bash">
#!/bin/bash

MOUNT="/mnt/usbstick/"
ROUTERS="192.168.1.1" #; seperated
FILENAME="wpa.txt"
PWGEN=`/usr/bin/pwgen -c -n -s 63 1`
####################################
DATE=`date +%F`
IFS=";"

if [ -d "$MOUNT" ]; then
        if [ -f "$MOUNT""$FILENAME" ]; then
                for ROUTER in $ROUTERS
                do
                        ping -c 1 -i 5 "$ROUTER" &>/dev/null
                        if [ $? -ne 0 ] ; then
                                echo "Sorry, but $ROUTER is down"
                        else
                                echo "$PWGEN" > /tmp/"$FILENAME"
                                echo "$DATE - $PWGEN" >> "$MOUNT""$FILENAME".log
                                scp -q /tmp/"$FILENAME" root@"$ROUTER":/etc/"$FILENAME"
                                cp /tmp/"$FILENAME" "$MOUNT""$FILENAME"
                                shred -z -u /tmp/"$FILENAME"
                        fi
                done
        else
                echo "Sorry, you have to create $FILENAME on $MOUNT"
        fi
else
        echo "Sorry, exiting because $MOUNT does not exist, nowhere to save wpa key."
        exit 0
fi

</pre>

Koden er lagt opp slik at den kan kunne oppdatere flere routere på engang, bare legge inn flere ipadresser i variablen ROUTERS med ; som seperator tegn.

På OpenWRT boksen er ikke koden så vanskelig, den kjøres en time senere enn den på Linux boksen, og er som følger:

<pre lang="bash">
#!/bin/sh

FILENAME="/etc/wpa.txt"
OLDWPA=`nvram get wl0_wpa_psk`
NEWWPA=`cat /etc/$FILENAME`

if [ "$OLDWPA" != "$NEWWPA" ]; then
        nvram set wl0_wpa_psk "$NEWWPA"
        nvram commit
        reboot
fi
</pre>

Dette er alt som skal til, nesten. Du må også sette opp crond på OpenWRT boksen og bruke ssh nøkkel slik at du slipper å taste passord når wpa nøkkelen skal kopieres over fra Linux boksen.
