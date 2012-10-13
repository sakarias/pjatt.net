---
layout: post
title: Novell Groupwise på Ubuntu
date: 2008-03-27 14:26:40
tags: 
- geeking
- groupwise
- linux
- novell
- ubuntu
---

Jeg har kun testet dette på Ubuntu 8.04 beta.

Besøk novell.com og last ned "GroupWise 7 SP3 Linux Client", om du velger US eller multi er helt opp til om deg, du vil ha ordbøker for andre språk enn amerikansk.

Kjør følgende kommando: "```sudo apt-get install alien libstdc++5```".

Pakk ut <a href="http://filext.com/file-extension/gz">.tar.gz</a> filen du lastet ned i punkt 1: "```tar xvfz gw703_client_linux_multi.tar.gz```".

Installer <a href="http://filext.com/file-extension/rpm">RPM</a>-pakken: "```sudo alien -i novell-groupwise-gwclient-7.0.3-20080309.i386.rpm```".

Last ned Sun JRE 1.5 fra <a href="http://java.sun.com/javase/downloads/index_jdk5.jsp">http://java.sun.com/javase/downloads/index_jdk5.jsp</a>.

Pakken den ut i GroupWise mappen:

	sudo mv jre-1_5_0_15-linux-i586.bin /opt/novell/groupwise/client
	cd /opt/novell/groupwise/client
	sudo chmod +x ./jre-1_5_0_15-linux-i586.bin
	sudo ./jre-1_5_0_15-linux-i586.bin
	sudo ln -sf jre1.5.0_15 jre

Hvis du kjører "compiz" på din maskin, rediger oppstarts skriptet og legg til "```export AWT_TOOLKIT=MToolkit```" i filen "```/opt/novell/groupwise/client/bin/groupwise.sh```" rett under "```/bin/bash```" linjen.