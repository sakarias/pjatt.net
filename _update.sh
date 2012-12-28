#! /bin/bash

jekyll

if [ $? -eq 0  ]
then
	rsync -avz -e ssh --delete _site/* delta.rockstable.net:/home/sites/pjatt.net/new_site/

	open http://pjatt.net
fi

