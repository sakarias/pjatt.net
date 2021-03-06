---
layout: post
title: Growl notiser fra irssi over ssh
date: 2010-09-16 16:33:10
tags: 
- geeking
- irc
---

Først og fremst så trenger du fnotify plugin til irssi, denne kan du laste ned fra <a href="http://www.leemhuis.info/files/fnotify/">http://www.leemhuis.info/files/fnotify/</a>. Putt denne i "~```/.irssi/scripts```" og lag en symlink til denne i "```~/.irssi/scripts/autorun```", slik at den blir lastet neste gang irssi blir startet på nytt. Neste steg er å laste modulen, dette gjøres i irssi, "```/script load fnotify```".

Husk å installer growlnotify, denne finnes i Extras mappen i .dmg fila du laster ned fra <a href="http://growl.info/">growl.info</a>.

Neste steg er å sette opp ssh til å hente notisene og sende dette videre til growl på din maskin.

~/.ssh/config

	Host serverNavn
	Hostname serverNavn
	PermitLocalCommand yes
	LocalCommand ~/bin/IrssiNotify.sh

	Host irssi_screen
	Hostname serverNavn
	PermitLocalCommand no


~/bin/IrssiNotify.sh

	#!/bin/sh

	# Kill all current fnotify sessions
	ps | awk '{if($0 ~ /fnotify/ && $1 ~ /[0-9]+/ && $4 !~ /awk/) print $1}' | \
	while read id
	do
	        kill $id
	done

	# SSH to host, clear file and listen for notifications
	(ssh irssi_screen "> .irssi/fnotify; tail -f .irssi/fnotify" | \
	while read heading message
	do
	        growlnotify -t "${heading}" -m "${message}";
	fi
	done)&
