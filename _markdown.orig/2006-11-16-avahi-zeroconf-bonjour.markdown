[[!meta  title="avahi / zeroconf / bonjour"]]
[[!meta  date="2006-11-16 15:56:13"]]
Jeg må først og fremst si at kjært barn har mange navn :P

Jeg nå satt opp <a href="http://en.wikipedia.org/wiki/Avahi_%28software%29">avahi</a> / <a href="http://en.wikipedia.org/wiki/Zeroconf">zeroconf</a> / <a href="http://en.wikipedia.org/wiki/Bonjour_%28software%29">bonjour</a> (kjært barn har mange navn) i mitt lille nettverk. Avahi er et system for <a href="http://en.wikipedia.org/wiki/Multicast_DNS">multicast DNS</a>, så jeg slipper å gå rundt å huske IP adresser og sette opp en <a href="http://en.wikipedia.org/wiki/Dns">DNS</a> server selv. Gjør ting litt enklere :P

I <a href="http://en.wikipedia.org/wiki/Ubuntu_%28Linux_distribution%29">Ubuntu</a> <a href="http://www.ubuntu.com/news/610released">Edgy Eft</a> så mangler det en liten pakke før du kan sette opp saken. Installer libnss-mdns pakken (apt-get install libnss-mdns), rediger /etc/default/avahi-daemon og sett AVAHI_DAEMON_START= til 1. Neste steg er å redigere /etc/nsswitch.conf og legge til "mdns" først i listen på linjen som starter med hosts:.

Over til neste prosjekt, finne ut hvordan jeg synkronisere musikk filer mellom <a href="http://en.wikipedia.org/wiki/Itunes">iTunes</a> og <a href="http://en.wikipedia.org/wiki/Amarok_%28audio%29">amaroK</a>. Finner jeg ingen smart løsning på det så får jeg bare bytte avspilleren på Linux til noe annet enn amaroK

[[!tag  geeking]]