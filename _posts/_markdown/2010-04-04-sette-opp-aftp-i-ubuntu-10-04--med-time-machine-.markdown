---
layout: post
title: Sette opp AFTP i Ubuntu 10.04 (med Time Machine)
date: 2010-04-04 20:21:05
tags: 
- geeking
- time machine
---

Først og fremst så trenger man å installere [netatalk](http://netatalk.sourceforge.net/).

```sudo apt-get install netatalk```

Så må man legge til stien man ønsker å lagre Time Machine backupen i "/etc/netatalk/AppleVolumes.default"

	/<sti til lagerplass>        "TimeMachine"        options:tm

Legg til dette nederst i filen.

For å få Ubuntu serveren din til å dukke opp i Finder, så trenger du [Avahi](http://avahi.org/).

```sudo apt-get install avahi-daemon```

Etter installasjonen, må du opprette "/etc/avahi/services/afpd.service" med følgende innhold:

	<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
	<!DOCTYPE service-group SYSTEM "avahi-service.dtd)[
	<service-group>
	        <name replace-wildcards="yes)[%h</name>
	        <service>
	                <type>_afpovertcp._tcp</type>
	                <port>548</port>
	        </service>
	        <service>
	                <type>_device-info._tcp</type>
	                <port>0</port>
	                <txt-record>model=Xserve</txt-record>
	                </service>
	</service-group>

Restart både netatalk og avahi for å sette ny konfigurasjon i drift.

```sudo /etc/init.d/netatalk restart && sudo /etc/init.d/avahi-daemon restart```

For å bruke Ubuntu serveren din som mål for Time Machine, så må Time Machine settes opp til å bruke "ikke supporterte enheter", dette gjøres ved å skrive følgende i Terminal.app

```defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1```

Hvis du har oppgradert fra Ubuntu 9.04 til 10.04, så har netatalk forandret på database filene sine, og montering av shares vil feile fra din Mac, løsningen er å slette [.AppleDB](http://netatalk.sourceforge.net/wiki/index.php/SpecialFilesFolders) katalogene på dine shares.

```find <sti til lagerplass> -name '.AppleDB' -exec rm -rfv {} \;```