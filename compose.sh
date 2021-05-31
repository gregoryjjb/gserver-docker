#! /bin/bash

echo "Don't use this, it definitely doesn't work anymore"
exit 0

docker-compose \
  -p gserver-dockers \
  -f dokuwiki/docker-compose.yml \
  -f hedgedoc/docker-compose.yml \
  $@
