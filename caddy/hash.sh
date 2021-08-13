#! /bin/sh

docker exec -w /etc/caddy -it caddy caddy hash-password
