[[!meta  title="Sette opp AFTP i Ubuntu 10.04 (med Time Machine)"]]
[[!meta  date="2010-04-04 20:21:05"]]
Først og fremst så trenger man å installere <a href="http://netatalk.sourceforge.net/">netatalk</a>.

<code>sudo apt-get install netatalk</code>

Så må man legge til stien man ønsker å lagre Time Machine backupen i "/etc/netatalk/AppleVolumes.default"

<code>/&lt;sti til lagerplass&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"TimeMachine"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;options:tm</code>

Legg til dette nederst i filen.

For å få Ubuntu serveren din til å dukke opp i Finder, så trenger du <a href="http://avahi.org/">Avahi</a>.

<code>sudo apt-get install avahi-daemon</code>

Etter installasjonen, må du opprette "/etc/avahi/services/afpd.service" med følgende innhold:

<pre lang="xml">
<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
        <name replace-wildcards="yes">%h</name>
        <service>
                <type>_afpovertcp._tcp</type>
                <port>548</port>
        </service>
        <service>
                <type>_device-info._tcp</type>
                <port>0</port>
                <txt-record>model=Xserve</txt-record>
                </service>
</service-group>
</pre>

Restart både netatalk og avahi for å sette ny konfigurasjon i drift.

<code>sudo /etc/init.d/netatalk restart && sudo /etc/init.d/avahi-daemon restart</code>


For å bruke Ubuntu serveren din som mål for Time Machine, så må Time Machine settes opp til å bruke "ikke supporterte enheter", dette gjøres ved å skrive følgende i Terminal.app

<code>defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1</code>


Hvis du har oppgradert fra Ubuntu 9.04 til 10.04, så har netatalk forandret på database filene sine, og montering av shares vil feile fra din Mac, løsningen er å slette <a href="http://netatalk.sourceforge.net/wiki/index.php/SpecialFilesFolders">.AppleDB</a> katalogene på dine shares.

<code>find &lt;sti til lagerplass&gt; -name '.AppleDB' -exec rm -rfv {} \;</code>

[[!tag  geeking]]
[[!tag  mac]]
[[!tag  time-machine]]
[[!tag  ubuntu]]