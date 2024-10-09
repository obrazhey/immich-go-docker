FROM alpine:3.20
ENV TZ=Europe/Moscow

RUN apk update \
&& apk add tzdata \
&& ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime

RUN mkdir /app
WORKDIR /app

ADD https://github.com/simulot/immich-go/releases/download/0.22.0/immich-go_Linux_x86_64.tar.gz ./ 
RUN tar -xzf immich-go_Linux_x86_64.tar.gz \
&& rm immich-go_Linux_x86_64.tar.gz \
&& chmod +x immich-go

ENTRYPOINT ["sh", "-c", "'./immich-go -server=$IMMICH_INSTANCE_URL -key=$IMMICH_API_KEY upload /import'"]   