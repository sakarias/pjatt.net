---
layout: post
title: Rydde skrivebordet
date: 2011-01-30 20:28:44
tags: 
- geeking
- applescript
---

{{ page.title }}
================

Jeg er verdensmester i å lagre alt mulig på skrivebordet. Av og til så flytter jeg alt over i en egen mappe, som jeg sorterer senere. Istedet for å gjøre dette manuelt hver gang, så skrev jeg meg nettopp et AppleScript som gjør jobben for meg, og assignet en hurtigtast for dette.

<pre lang="applescript">
-- setter variabel for hjemmeområdet til brukeren
set homeFolder to (path to home folder) as alias
-- setter variabel for skrivebordet til brukeren
set desktopFolder to (path to desktop folder) as alias
-- setter variabel for navnet dumpkatalogen skal ha
set desktopRot to "ROT" as text

tell application "Finder"
	-- hvis katalogen "desktopRot" ikke finnes, opprett den
	if not (exists folder desktopRot of homeFolder) then
		make new folder at homeFolder with properties {name:desktopRot}
	end if
	-- setter sammen homeFolder og desktopRot variablene til en variabel
	set rotFolder to {(homeFolder as text) & desktopRot} as alias
	-- flytter filene
	move entire contents of desktopFolder to rotFolder
end tell
</pre>

Ved å manuelt gå igjennom ROT mapppen min senere og sette «labels» på det jeg vil beholde, så kan jeg bruke opp igjen forrige AppleScript som tømmer «Download» mappen, untatt filer som har fått en «label».

<pre lang="applescript">
set desktopRot to "ROT" as text
set rotFolder to (((path to home folder) as text) & desktopRot) as alias

tell application "Finder"
	delete (every item of folder rotFolder whose label index = 0)
end tell
</pre>