FROM alpine:3.20
ARG IMMICH_INSTANCE_URL
ARG IMMICH_API_KEY
ADD https://github.com/simulot/immich-go/releases/download/0.22.0/immich-go_Linux_x86_64.tar.gz /immich-go

WORKDIR /immich-go

RUN ["chmod", "+x", "immich-go"]

ENTRYPOINT ["./immich-go", "-server=${IMMICH_INSTANCE_URL}", "-key=${IMMICH_API_KEY}", "upload", "/import"]   