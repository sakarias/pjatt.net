[[!meta  title="Novell Groupwise 8 på Ubuntu"]]
[[!meta  date="2008-12-05 20:28:30"]]
<img src="http://pjatt.net/images/2008/12/groupwise-8-linux.png" alt="" title="Groupwise 8 Ubuntu" width="449" height="449" class="aligncenter size-full wp-image-688"  />

Besøk novell.com og last ned "<a href="http://download.novell.com/Download?buildid=v3w3LYhP1vU~">GroupWise 8 Linux Client</a>", om du velger US eller multi er helt opp til deg, om du vil ha ordbøker for andre språk enn amerikansk.

Kjør følgende kommando: “sudo apt-get install alien libstdc++5“.

Pakk ut .tar.gz filen du lastet ned i punkt 1: "tar xvfz gw800_client_linux_en.tar.gz".

Installer RPM-pakken: "sudo alien -i novell-groupwise-gwclient-8.0.0-84910.i586.rpm".

Last ned Sun JRE 1.6 fra <a href="http://java.com/">http://java.com/</a>.

Pakken den ut i GroupWise mappen:
<code>sudo mv jre-6u11-linux-i586.bin /opt/novell/groupwise/client
cd /opt/novell/groupwise/client
sudo chmod +x ./jre-6u11-linux-i586.bin
sudo ./jre-6u11-linux-i586.bin
sudo mv jre jre.old
sudo ln -s jre1.6.0_11 jre</code>

[[!tag  geeking]]
[[!tag  groupwise]]
[[!tag  linux]]
[[!tag  novell]]
[[!tag  ubuntu]]