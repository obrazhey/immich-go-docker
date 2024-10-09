FROM alpine:3.20
ARG IMMICH_INSTANCE_URL
ARG IMMICH_API_KEY

RUN mkdir /app

ADD https://github.com/simulot/immich-go/releases/download/0.22.0/immich-go_Linux_x86_64.tar.gz /app

WORKDIR /app

RUN chmod 0755 /app/immich-go

ENTRYPOINT ["./immich-go", "-server=${IMMICH_INSTANCE_URL}", "-key=${IMMICH_API_KEY}", "upload", "/import"]   