FROM alpine:edge
RUN mkdir /src

WORKDIR /src

ENV DEBIAN_FRONTEND noninteractive

RUN apk add --update supervisor ruby ruby-dev openssl wget tar build-base && \
    gem install --no-document redis

RUN wget https://download.redis.io/releases/redis-7.4.1.tar.gz && \
    tar xzf redis-7.4.1.tar.gz && \
    cd redis-7.4.1 && \
    make && \
    make install

RUN rm -rf /src/redis-7.4.1* /var/cache/apk/*
    
ADD . /src/

COPY redis-trib.rb /usr/bin/redis-trib.rb
COPY redis.ini /etc/supervisor.d/redis.ini
COPY redis-start.sh  /bin/redis-start.sh
RUN chmod +x /bin/redis-start.sh

CMD . /bin/redis-start.sh     
