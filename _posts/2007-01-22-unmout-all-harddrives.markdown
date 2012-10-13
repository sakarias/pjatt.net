---
layout: post
title: Unmout all harddrives
date: 2007-01-22 05:04:03
tags: 
- geeking
---
Kom over <a href="http://3am.com/pix/unmount.txt">dette</a> lille bash skriptet på <a href="http://www.twit.tv/mbw">MacBreak Weekly</a>.

	#!/bin/bash
	for i in $( disktool -l | grep "Mountpoint = '/" | sed s/^.*Mountpoint\ =\ \'// | sed s/\',.*// | sed 's/ /\\/g' )
	do
		case "${i}" in 
			# Add any volumes you might want to skip as alternate case, for example the root volume: /)
			;;
			# This case will take care of all the others, the drives you do want to eject:
			*)
				umount "`echo $i | sed 's/\\\/ /g'`" && echo "$i unmounted"
				diskutil eject "`echo $i | sed 's/\\\/ /g'`" && echo "$i unmounted"
				;;
			esac
	done
