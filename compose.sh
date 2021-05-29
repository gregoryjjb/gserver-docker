#! /bin/bash
docker-compose \
  -p gserver-dockers \
  -f dokuwiki/docker-compose.yml \
  -f hedgedoc/docker-compose.yml \
  $@
