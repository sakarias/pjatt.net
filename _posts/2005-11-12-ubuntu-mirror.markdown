---
layout: post
title: Ubuntu mirror
date: 2005-11-12 16:00:46
tags: 
- geeking
---
Har nå satt opp et <a href="http://ubuntu.com/">Ubuntu</a> <a href="http://www.ubuntulinux.org/download/mirror/document_view">speil</a> på <a href="http://www.lilug.no/">LiLUG</a> serveren. Akkurat nå er det bare i386 jeg har tatt å satt opp. Skal nok legge AMD64 og PowerPC etter hvert også. Men må bare teste om speilet fungerer slik det skal først. Men jeg mangler Ubuntu maskiner. Jeg har pr. kun laptopen min og det er en iBook som kjører Mac OS X. Så hvis noen har lyst til å teste LiLUG sitt Ubuntu speil så legg til "deb <a href="http://mirrors.lilug.no/ubuntu">http://mirrors.lilug.no/ubuntu</a> breezy main restricted universe multiverse" inn i din "/etc/apt/sources.list" fil. Akkurat nå har vi mirror av hoary (hoary-backports, hoary-security og hoary-updates), breezy (breezy-backports, breezy-security og breezy-updates) og dapper (dapper-backports, dapper-security og dapper-updates). Vi har ikke sources enda, men det kan hende kommer. Må bare se hvor mye plass dette vil ta først.
