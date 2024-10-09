FROM alpine:3.20
ENV TZ=Europe/Moscow

RUN apk update \
&& apk add tzdata \
&& ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime

RUN mkdir /app

WORKDIR /app

RUN git clone https://github.com/obrazhey/immich-go-docker.git ./
ADD https://github.com/simulot/immich-go/releases/download/0.22.0/immich-go_Linux_x86_64.tar.gz ./ 
RUN tar -xzf immich-go_Linux_x86_64.tar.gz \
&& rm immich-go_Linux_x86_64.tar.gz \
&& chmod +x immich-go && chmod +x run.sh

ENTRYPOINT ["./run.sh"]   