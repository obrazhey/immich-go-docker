FROM alpine:3.20
ENV IMMICH_INSTANCE_URL
ENV IMMICH_API_KEY

RUN apk update \
&& apk add tzdata \
&& ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime
ENV TZ=Europe/Moscow

RUN mkdir /app

WORKDIR /app

ADD https://github.com/simulot/immich-go/releases/download/0.22.0/immich-go_Linux_x86_64.tar.gz
ADD https://github.com/simulot/immich-go/releases/download/0.22.0/immich-go_Linux_x86_64.tar.gz ./ 
RUN tar -xzf immich-go_Linux_x86_64.tar.gz \
&& rm immich-go_Linux_x86_64.tar.gz \
&& chmod +x immich-go

ENTRYPOINT ["run.sh"]   