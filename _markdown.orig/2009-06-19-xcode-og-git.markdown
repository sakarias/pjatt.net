[[!meta  title="Xcode og git"]]
[[!meta  date="2009-06-19 14:14:40"]]
For at Xcode og git skal virke sammen på en smertefri måte, så må du få git til å håndtere Xcode prosjekt filer korrekt. Du gjør dette ved å konfigurere git via .gitignore og .gitattributes.

Lag disse filene i ditt repository og legg til følgende linjer:

.gitignore
<code># xcode noise
build/*
*.pbxuser
*.mode1v3

# old skool
.svn

# osx noise
.DS_Store
profile</code>


.gitattributes
 <code>*.pbxproj -crlf -diff -merge</code>

[[!tag  geeking]]
[[!tag  git]]
[[!tag  os-x]]