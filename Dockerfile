FROM alpine:edge

RUN mkdir /src

WORKDIR /src

ENV DEBIAN_FRONTEND noninteractive

RUN apk add --update supervisor ruby ruby-dev redis openssl && gem install --no-document redis

ADD . /src/

COPY redis-trib.rb /usr/bin/redis-trib.rb
COPY redis.ini /etc/supervisor.d/redis.ini
COPY redis-start.sh  /bin/redis-start.sh

RUN chmod +x /bin/redis-start.sh

CMD . /bin/redis-start.sh     
