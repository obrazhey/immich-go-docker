FROM alpine:3.20
ARG IMMICH_SERVER
ARG IMMICH_API_KEY
ADD https://github.com/simulot/immich-go/releases/download/0.22.0/immich-go_Linux_x86_64.tar.gz /immich
WORKDIR /immich

ENTRYPOINT ["./immich-go", "-server=${IMMICH_SERVER}", "-key=${IMMICH_API_KEY}", "upload", "/import"]   