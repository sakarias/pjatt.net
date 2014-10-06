#! /bin/bash

case "$1" in
  build)  jekyll build
          ;;

  deploy) rsync -az -e ssh --delete _site/* charlie.rockstable.net:/home/sites/pjatt.net/www/site/
          open http://pjatt.net/
          ;;

  test)   rsync -az -e ssh --delete _site/* rs-web01.home.rockstable.net:/home/sites/pjatt/www/
          open http://pjatt.home.rockstable.net/
          ;;

  *)      echo "Usage, $0 [build|deploy|test]"
          ;;
esac
