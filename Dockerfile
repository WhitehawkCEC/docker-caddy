FROM caddy:2.7-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-dynamicdns@f375a7248e67cf3e82b4f61f841424adb4ee958f \
    --with github.com/caddy-dns/route53@v1.3.3 \
    --with github.com/ss098/certmagic-s3@62a3ac98984dae7208ba2c126ecf6b0bf638dfa6

FROM caddy:2.7

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
