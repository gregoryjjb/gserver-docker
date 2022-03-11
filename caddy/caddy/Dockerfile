FROM caddy:2.4.6-builder-alpine AS builder

ADD ./modules /modules

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-auth-jwt@v1.3.15 \
    --with github.com/greenpau/caddy-auth-portal@v1.4.20

FROM caddy:2.4.6-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
