title="Installasjon av netatalk (AFP) på Ubuntu 8.04"
date="2008-06-12 23:13:27"
For å få netatalk (AFP) til å fungere mot Mac OSX 10.5.x så trenger man netatalk som støtter kryptering, på grunn av lisens problematikk, så kommer ikke natatalk pakken i Ubuntu med støtte for kryptering, derfor må man kompilere en netatalk pakke selv, med støtte for kryptering.

<code>
$ mkdir -p ~/src/netatalk
$ cd ~/src/netatalk
$ sudo apt-get install devscripts cracklib2-dev dpkg-dev libssl-dev
$ apt-get source netatalk
$ sudo apt-get build-dep netatalk
$ cd netatalk-2.0.3
$ sudo -s
# cd debian
# mv copyright_newhints copyright_hints
# cd ..
# DEB_BUILD_OPTIONS=ssl dpkg-buildpackage -us -uc
# debi
# echo "netatalk hold" | dpkg --set-selections
# exit
</code>

[[!tag  afp
[[!tag  geeking
[[!tag  linux
[[!tag  mac-osx
