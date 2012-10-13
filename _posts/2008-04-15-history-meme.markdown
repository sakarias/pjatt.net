---
layout: post
title: History meme
date: 2008-04-15 06:47:31
tags: 
- geeking
- meme
---

	johnj@tenkepadda:~$ history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}'|sort -rn|head
	109 ls
	84 cd
	51 sudo
	36 ssh
	27 rm
	23 host
	20 ping
	20 bzr
	10 vim
	10 mv