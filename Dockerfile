# Stage 1: Build Hugo site
FROM docker.io/hugomods/hugo:0.115.4 AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

# Stage 2: Get official Caddy binary
FROM caddy:latest AS caddy_dist

# Stage 3: Final distroless image
FROM gcr.io/distroless/base-debian12:nonroot AS final
WORKDIR /srv
COPY --from=builder /src/public /srv
COPY ./extra/robots.txt /srv/robots.txt
COPY --from=caddy_dist /usr/bin/caddy /usr/bin/caddy

USER nonroot:nonroot
EXPOSE 8080
ENTRYPOINT ["/usr/bin/caddy", "file-server", "--root", "/srv", "--listen", ":8080"]
