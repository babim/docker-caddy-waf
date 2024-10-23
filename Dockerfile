# Stage 1: Build stage
FROM caddy:2-builder AS builder                        # ➊ Image gốc để build
RUN xcaddy build \                                     # ➋ Build Caddy với plugin
    --with github.com/corazawaf/coraza-caddy

# Stage 2: Final stage
FROM caddy:2                                           # ➌ Image gốc cho container cuối
COPY --from=builder /usr/bin/caddy /usr/bin/caddy      # ➍ Copy binary từ build stage
