---
layout: post
title: Control Time Machine from the Command Line
date: 2012-06-19 03:08:19
tags:
- geeking
- time machine
- osx
---

{{ page.title }}
================

[Time Machine](http://en.wikipedia.org/wiki/Time_Machine_%28Mac_OS%29) (TM for short) is Apples take on consumers needs to make backup of your files. You can make backups to either removable drives like USB drives or a network drive over [Apple Filing Protocol](http://en.wikipedia.org/wiki/Apple_Filing_Protocol) (AFP). There is hacks to get TM to make backup on to other things as well, but that is beside the scope of this intro.

I use a [Qnap](http://www.qnap.com/) [TS-410](http://www.qnap.com/en/index.php?lang=en&sn=822&c=351&sc=514&t=522&n=3388) for my Time Machine needs. But I also use [CrashPlan](http://www.crashplan.com) to make a [off-site](http://en.wikipedia.org/wiki/Off-site_data_protection) backup of my files, no point on having a backup of my files in the house, if the house burns down.

For business users, I recommend looking at somehing more "*enterprise*" ready software like [IBM](http://www.ibm.com/) [Tivoli Storage Manager](http://www-01.ibm.com/software/tivoli/products/storage-mgr/)

### Exclude/de-exclude items

First of all, there is no need to backup all the files in your home folder (/Users/"username"), so take your time to exclude files/folders that you do not need backup of. Like your Downloads, Dropbox, Desktop folders and so on. 

But you really want backup of your Documents and Library folders.

To exclude files/folders use the command `tmutil addexclusion`.

	tmutil addexclusion Desktop Downloads Dropbox Google\ Drive SkyDrive
	
If you use [VMware Fusion](http://www.vmware.com/products/fusion/overview.html) or [Parallels Desktop](http://www.parallels.com/products/desktop/), they store their virtual machines in the Documents folder. If you don't need a backup of them, remember to exclude them, but not the Documents folder it self.

If you have excluded a file or a folder that you realice that you need to have in your backup, use the command `tmutil removeexclusion`.
	
	tmutil removeexclusion Documents
	
If you are not sure if a file or folder is included or excluded from your backup set, use the command `tmutil isexcluded` to see the status.
	
	john at pinova in ~
	$ tmutil isexcluded Dropbox/
	-	/Users/john/Dropbox

The "-" sign means that the item is excluded from your backup set.

	john at pinova in ~
	$ tmutil isexcluded Documents/
	+	/Users/john/Documents
	
And the "+" sign means that the item is included in your backup set.

You can also check all the items in your home folder by using `tmutil isexcluded *`. But it will not show you the status of subfolders or files.

### Set/change the backup disk

To be able to make a backup, TM needs to be told where to make those backups.

	sudo tmutil setdestination /Volumes/mydisk
	sudo tmutil setdestination afp://user[:pass]@host/share

### Enabling / Disabling Time Machine

To make TM make backups, we need to enable the software, this is done with the command `sudo tmutil enable`. Likewise we can disable TM with `sudo tmutil disable`.

### Enabling / Disabling local backup

TM supports local "*backup*", this is not a true backup, but a place holder while you are disconnected from your TM device. This means that TM will take its hourly backup, but store them locally until you have connected your devices again. If your hard drive fails, your local *backups* will also be lost.

To enable local "*backup*", run `tmutil enablelocal`, to disable it run `tmutil disablelocal`. 

### Backup

TM will make a backup every hour, but sometimes you want it to make a backup right now, this is done with `tmutil startbackup`. This is useful if you just have done some work, and are going away, just run the command before you shutdown your computer. Or you can make an alias of it in your `.profile`.

	alias dobackup="tmutil startbackup"

Next time you want to make a TM backup, run the command `dobackup`.

You can also stop a running backup with `tmutil stopbackup`.

### List the latest backup

To view the latest backup that TM have made, run the command `tmutil latestbackup`.

	john at pinova in ~
	$ tmutil latestbackup
	/Volumes/Time Machine Backups/Backups.backupdb/pinova/2012-06-19-023144
	
### List backups

To view all the backups that TM have, run the command `tmutil listbackups`.
	
	john at pinova in ~
	$ tmutil listbackups
	/Volumes/Time Machine Backups/Backups.backupdb/pinova/2012-05-13-155604
	/Volumes/Time Machine Backups/Backups.backupdb/pinova/2012-05-20-000215
	/Volumes/Time Machine Backups/Backups.backupdb/pinova/2012-05-21-000219
	/Volumes/Time Machine Backups/Backups.backupdb/pinova/2012-05-27-152658
	/Volumes/Time Machine Backups/Backups.backupdb/pinova/2012-05-28-192633

	-- snip --

	/Volumes/Time Machine Backups/Backups.backupdb/pinova/2012-06-19-003223
	/Volumes/Time Machine Backups/Backups.backupdb/pinova/2012-06-19-012408
	/Volumes/Time Machine Backups/Backups.backupdb/pinova/2012-06-19-023144
	
### Tidbits


#### Battery power

By default, TM does not make a backup if your laptop is running on battery power, but you can override this.

	defaults write /Library/Preferences/com.apple.TimeMachine RequiresACPower 0

#### Interval

By default, TM makes a backup every hour. This can be overridden by changing the default values in `com.apple.backupd-auto.plist` (this file is located at /System/Library/LaunchDaemons/)

	<key>Backup Interval</key>
	<dict>
		<key>Interval</key>
		<integer>3600</integer>
		<key>MaintenanceWakeBehavior</key>
		<string>Once</string>
	</dict>
	
Change the integer interval (value in seconds) from 3600 (every hour) to 14400 if you only want it do make backups every four hours.

#### Annoyance

By default OS X asks if you want to make the USB disk you have just connected for Time Machine, this is annoying after awhile, you can override this with:

	defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES