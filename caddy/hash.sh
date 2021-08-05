#! /bin/sh

docker exec -w /etc/caddy -it caddy_proxy caddy hash-password
