---
layout: post
title: Ubuntu på iBook G4
date: 2006-12-16 20:36:49
tags: 
---
	Section "InputDevice"
		Identifier "Synaptics Touchpad"
		Driver "synaptics"
		Option "SendCoreEvents" "true"
		Option "Device" "/dev/psaux"
		Option "Protocol" "auto-dev"
		Option "MinSpeed" "0.60"
		Option "MaxSpeed" "1.10"
		Option "AccelFactor" " 0.030"
		Option "EdgeMotionMinSpeed" "200"
		Option "EdgeMotionMaxSpeed" "200"
	EndSection