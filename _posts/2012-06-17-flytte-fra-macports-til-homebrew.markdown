---
layout: post
title: Flytte fra MacPorts til Homebrew
date: 2012-06-17 19:52:00
tags:
- geeking
- osx
---

{{ page.title }}
================

Grunnen til at jeg har byttet fra [MacPorts](http://www.macports.org/) til [Homebrew](http://mxcl.github.com/homebrew/), var ["mr"](http://joeyh.name/code/mr/). 
Denne er ikke i MacPorts enda, og manualen for å lage pakker for MacPorts var lang, alt for lang til at jeg orket å sette meg inn i 
dette. Homebrew har mr :)

Først og fremst, hvis du har installert [MySQL](http://www.mysql.com/) via MacPorts på din maskin, ta en skikkelig backup av denne først. 
Databasene blir borte ved å følge denne guiden.

### 1) Avinstaller pakker du har installert med MacPorts

	sudo port -f uninstall installed

### 2) Fjern alt som MacPorts har lagt igjen på systemet ditt

	sudo rm -rf /opt/local
	sudo rm -rf /Applications/DarwinPorts
	sudo rm -rf /Applications/MacPorts
	sudo rm -rf /Library/LaunchDaemons/org.macports.*
	sudo rm -rf /Library/Receipts/DarwinPorts*.pkg
	sudo rm -rf /Library/Receipts/MacPorts*.pkg
	sudo rm -rf /Library/StartupItems/DarwinPortsStartup
	sudo rm -rf /Library/Tcl/darwinports1.0
	sudo rm -rf /Library/Tcl/macports1.0
	sudo rm -rf ~/.macports

### 3) Installer Homebrew

	/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"

### 4) Installer programvaren du liker

	brew update && brew upgrade
	brew install wget --enable-iri
	brew install git