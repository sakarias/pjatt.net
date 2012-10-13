---
layout: post
title: Slette "download" mappen i OS X, automagisk
date: 2011-01-27 19:21:52"
tags: 
- geeking
- applescript
---

Så et innlegg av [MacGeeky](http://www.macgeeky.no/slett-filer-og-mapper-i-nedlastinger-med-tast)" i dag, og prøve å gjøre det samme med hans kode. Men den bare feilet, så jeg skrev min egen kode.

	set downloadFolder to (((path to home folder) as text) & "Downloads") as alias
	tell application "Finder"
		delete (every item of folder downloadFolder whose label index = 0)
		empty trash
		beep
	end tell

Synes koden min er litt mer effektiv og korrekt, pluss at jeg har lagt til bittelitt mer. Automagisk tømming av søppelbøtta pluss en lyd når den er ferdig.

Mitt andre AppleScript så langt.