[[!meta  title="Oppdatert TextExpander skript"]]
[[!meta  date="2011-08-28 10:41:55"]]
<p>Kollega på jobb, spurte for en evighet siden om jeg kunne utvide <a href="http://pjatt.net/2011/02/22/applescript-i-textexpander/">TextExpander skriptet</a> mitt til å si "ha en fortsatt xxxx helg" når man svarte på tickets på lørdag/søndag.</p>

<pre lang="applescript">
set namesWeekend to {Saturday, Sunday}
set toDay to (weekday of (current date)) as text
set responsArray to {"fin", "trivelig", "god", "fantastisk"}
set responsWord to some item of responsArray

if namesWeekend contains toDay then
	set responsSentence to "Ha en fortsatt " & responsWord & " helg" as text
else
	if toDay is not "Friday" then
		set responsSentence to "Ha en " & responsWord & " dag" as text
	else
		set responsSentence to "Ha en " & responsWord & " helg" as text
	end if
end if

-- display dialog responsSentence with icon 1 buttons {"OK"} default button 1
return responsSentence
</pre>


[[!tag  applescript]]
[[!tag  geeking]]
[[!tag  textexpander]]