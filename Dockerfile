FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/dunglas/mercure \
    --with github.com/dunglas/mercure/caddy \
    --with github.com/dunglas/vulcain \
    --with github.com/dunglas/vulcain/caddy \
    --with github.com/corazawaf/coraza-caddy \
    --with github.com/greenpau/caddy-security

FROM caddy:2

RUN wget -O coreruleset.zip https://github.com/coreruleset/coreruleset/archive/refs/tags/v4.7.0.zip && \
    unzip coreruleset.zip && \
    mv coreruleset-4.7.0 /etc/caddy/coreruleset && \
    rm coreruleset.zip