title="Få sms når en podcast er nedlastet"
date="2009-02-24 23:35:27"
Jeg sjekker til tider om det har blitt lastet ned en ny vidcast (video postcast) på filserveren, og det er ikke bestandig jeg husker hva som er nytt og ikke.

Satte meg ned i dag for å se om det var noen måte jeg kunne få beskjed om nye filer i en spesifikk mappe via e-post. Og kom på at jeg har NetCom GSM post, så jeg kan sende epost til mobilen min, og de blir mottatt som sms :D

	fileschanged --show=changed -r /home/media/Podcasts | while read file; do echo "$file" | sed 's/\/home\/media\/Podcasts\///' |  mail -s "Podcast" xxxxxxxx@sms.netcom.no; done

[[!tag  geeking sms linux
