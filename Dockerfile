FROM caddy:2.7-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-dynamicdns@a0a2581345050f0854626c89ab6d4690b6606dd4 \
    --with github.com/caddy-dns/route53@v1.3.3 \
    --with github.com/ss098/certmagic-s3@62a3ac98984dae7208ba2c126ecf6b0bf638dfa6

FROM caddy:2.7

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
