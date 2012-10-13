---
layout: post
title: AppleScript i TextExpander
date: 2011-02-22 13:42:56
tags: 
- geeking
- applescript
- textexpander
---

I forbindelse med jobb, så skriver jeg veldig mye av det samme opp igjen. F.eks «Ha en fin dag.» i slutten av epostene til kundene våre. Med hjelp av TextExpander og AppleScript så skrive jeg nå bare ```hdag```, og TextExpander vil kjøre det AppleScriptet jeg har assignet den forkortelsen. Så det blir en liten variasjon i hva kunden mottar.

	set toDay to (weekday of (current date)) as text
	set responsArray to {"fin", "trivelig", "god", "fantastisk"}
	set responsWord to some item of responsArray
	
	if toDay is not "Friday" then
 		set responsSentence to "Ha en " & responsWord & " dag" as text
	else
		set responsSentence to "Ha en " & responsWord & " helg" as text
	end if
	
	return responsSentence
