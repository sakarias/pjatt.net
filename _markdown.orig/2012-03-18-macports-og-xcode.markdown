[[!meta  title="MacPorts og Xcode"]]
[[!meta  date="2012-03-18 00:34:06"]]
MacPorts og Xcode 4.3.1 er ikke helt venner. For at disse skal bli venner igjen, så må man kjøre følgende kommando:

<pre lang="bash">
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
</pre>

[[!tag  geeking]]
[[!tag  macports]]
[[!tag  osx]]
[[!tag  xcode]]