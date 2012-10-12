---
layout: post
title: Slette "download" mappen i OS X, automagisk
date: 2011-01-27 19:21:52"
tags: 
- geeking
- applescript
---

{{ page.title }}
================

Så et innlegg av <a href="http://www.macgeeky.no/slett-filer-og-mapper-i-nedlastinger-med-tast">MacGeeky</a> i dag, og prøve å gjøre det samme med hans kode. Men den bare feilet, så jeg skrev min egen kode.

<pre lang="applescript">
set downloadFolder to (((path to home folder) as text) & "Downloads") as alias
tell application "Finder"
	delete (every item of folder downloadFolder whose label index = 0)
	empty trash
	beep
end tell
</pre>

Synes koden min er litt mer effektiv og korrekt, pluss at jeg har lagt til bittelitt mer. Automagisk tømming av søppelbøtta pluss en lyd når den er ferdig.

Mitt andre AppleScript så langt.