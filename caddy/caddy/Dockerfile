FROM caddy:2.3.0-builder-alpine AS builder

ADD ./modules /modules

# RUN xcaddy build \
#     --with github.com/greenpau/caddy-auth-jwt=/modules/caddy-auth-jwt \
#     --with github.com/greenpau/caddy-auth-portal=/modules/caddy-auth-portal

RUN xcaddy build \
    --with github.com/greenpau/caddy-auth-jwt@v1.3.15 \
    --with github.com/greenpau/caddy-auth-portal@v1.4.20

FROM caddy:2.3.0-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
