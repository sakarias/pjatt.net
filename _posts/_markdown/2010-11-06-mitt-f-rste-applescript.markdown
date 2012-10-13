---
layout: post
title: Mitt første AppleScript
date: 2010-11-06 19:25:44
tags: 
- geeking
- applescript
---

Skrev mitt første AppleScript i dag. Til bruk i <a href="http://www.thesparklabs.com/viscosity/">Viscosity</a> VPN klienten for Mac, for å montere opp afp shares fra office serveren når jeg koblet meg til jobben sitt VPN nett.

	-- Written by John Johannessen - 2010

	set MyUserName to "username"
	set MyPassword to "password"
	set MyServer to "servername/ip"
	set MyDisks to {"share1","share2"}
	set PingResult to (do shell script "ping -c 1 " & MyServer & "; echo -n")
	if PingResult contains "100.0% packet loss" then
		display dialog "Could not access " & MyServer & " at this time" ¬
			with icon 1 ¬
			buttons {"OK"} ¬
			default button 1
	else
		repeat with MountDisks in MyDisks
			tell application "Finder"
				try
					mount volume "afp://" & MyUserName & ":" & MyPassword & "@" & MyServer & "/" & MountDisks
				on error
					display dialog "Could not access " & MountDisks & " at this time." ¬
						with icon 1 ¬
						buttons {"OK"} ¬
						default button 1
					exit repeat
				end try
			end tell
		end repeat
	end if