title="Velge bibliotek i iTunes med tastatursnarveier"
date="2011-01-30 05:12:56"
Som vi alle vet, så er ikke det mulig å velge bibilotek i iTunes med tastatursnarveier. Men det er en løsning på dette, min nye favoritt, AppleScript. Start opp «AppleScript Editor», og skriv inn følgende kode:
<pre lang="applescript">tell application "iTunes"
	try
		set view of front browser window to (get some playlist whose special kind is Podcasts)
	end try
end tell</pre>
<img class="alignright size-full wp-image-1063" title="KeyboardShortcuts" src="http://pjatt.net/images/2011/01/KeyboardShortcuts.png" alt="" width="449" height="406"  />
Type kan være <strong>Music</strong>, <strong>Books</strong>, <strong>iTunes U</strong>, <strong>Movies</strong>, <strong>Podcasts</strong> og <strong>TV Show</strong>s.

Lagre disse filene i «~/Library/iTunes/Scripts» (finnes ikke scripts mappen, må du opprette denne).

Gå så til «System Prefrences -&gt; Keyboard -&gt; Keyboard Shortcuts», velg «Application Shortcuts» og trykke på +-tegnet.

I dette nye vinduet, under «Application», velg iTunes. I neste felt, «Menu Title» skriv inn det navnet du ga skriptene. I feltet «Keyboard Shortcut», trykk på de knappene du vil ha som snarvei, f.eks «cmd+1».
<img class="size-full wp-image-1085 alignleft" title="AddShortCut" src="http://pjatt.net/images/2011/01/AddShortCut.png" alt="" width="397" height="197"  />

Hvis du ønsker, kan du også lage snarveier for dine egne spillelister ved å forandre litte gran på koden.

<pre lang="applescript">
tell application "iTunes"
	try
		set view of front browser window to playlist "Recently Added"
	end try
end tell
</pre>

[[!tag  applescript
[[!tag  geeking
[[!tag  itunes
