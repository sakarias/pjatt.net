[[!meta  title="Damn Wordpress, errr. Damn me"]]
[[!meta  date="2006-10-23 05:18:27"]]
Jeg driver å prøver å få dette themet til å fungere akkurat slik jeg vil ha den, men jeg har oppdaget noen problemer i databasen min. Mange av mine tidligere innlegg peker til tidligere domener/under domener, så det er ikke alle innlegg som vil fungere. Sånn jeg ser det nå uten å ha gjort noen undersøkelser så har jeg 2 valg.
<ul>
	<li>Begynne på nytt. Dvs tømme databasen og begynne å blogge på nytt.</li>
	<li>Skrive et skript som finner slaskdot.org og sakarias.net linkene og skriver dem om til pjatt.net.</li>
</ul>
Jeg har noen bugs i Wordpress som jeg er rimelig sikker på at blir borte hvis jeg begynner på nytt. Dem hadde vært kjekt å bli kvitt :P

Men jeg må skrive meg et skript som dumper ut databasen, finner alle de gamle domene og fyrer databasen tilbake. Noen som har noen forslag til hvordan jeg burde gjøre dette? Bash skript med hjelp av sed/awk eller php?

[[!tag  wordpress]]