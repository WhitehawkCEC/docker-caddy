FROM caddy:2.11-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-dynamicdns@1af4f88765982db86ce091eeb075cfb2d9348dc8 \
    --with github.com/caddy-dns/cloudflare@6dc1fbb7e925b0da6736780db2e90f4816b79ab7 \
    --with github.com/caddy-dns/duckdns@v0.5.0 \
    --with github.com/caddy-dns/route53@v1.6.0 \
    --with github.com/ss098/certmagic-s3@8af482af5f392bcd01b5f3e72653dc24e0b96012

FROM caddy:2.11

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
