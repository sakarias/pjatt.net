title="Slå av touchpad når ekstern USB mus er tilkoblet"
date="2007-01-20 19:39:40"
Først og fremst må man få <a href="http://en.wikipedia.org/wiki/HAL_%28software%29" title="Hardware Abstraction Layer ">HAL</a> til å kjøre et skript når en ekstern USB mus blir tilkoblet, legg til følgende kode i "/etc/udev/rules.d/85-hal.rules"

<pre lang="bash">KERNEL=="mouse*", RUN+="/usr/bin/udevmice.sh"</pre>

Neste steg blir å opprette "/usr/bin/udevmice.sh" med følgende kode:

<pre lang="bash">#!/bin/bash
DEBUG=0
DATE=`date`
FLOG="/tmp/udev_test.log"

if [ "$DEBUG" -eq "1" ]; then
	echo "$DATE - [$*] - [$ACTION]" >> "$FLOG"
fi
case $ACTION in
	add)
		if [ "$DEBUG" -eq "1" ]; then
			echo "DEBUG: connected" >> "$FLOG"
		fi
		synclient TouchpadOff=1
	;;

	remove)
		if [ "$DEBUG" -eq "1" ]; then
			echo "DEBUG: disconnected" >> "$FLOG"
		fi
		synclient TouchpadOff=0
	;;
esac</pre>

Husk å gjøre skriptet kjørbar:

<pre lang="bash">sudo chmod 755 /usr/bin/udevmice.sh</pre>

Siste steg er å redigere "/etc/X11/xorg.conf". I xorg.conf finn "Identifier" for "Synaptics Touchpad", den skal ligge under "InputDevice". Når du har funnet den, så skal du legge til følgende opsjon.

<pre lang="bash">Option "SHMConfig" "on"</pre>

[[!tag  geeking
