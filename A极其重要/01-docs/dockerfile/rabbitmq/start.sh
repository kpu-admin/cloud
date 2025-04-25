#!/bin/bash

mkdir -p `pwd`/rabbitmq-data/

docker stop kpu_rabbitmq
docker rm kpu_rabbitmq

docker run -d --hostname kpu_rabbitmq --name kpu_rabbitmq --restart=always \
    -e RABBITMQ_DEFAULT_USER=kpu -e RABBITMQ_DEFAULT_PASS=kpu \
    -v `pwd`/rabbitmq-data/:/var/rabbitmq/lib \
    -p 15672:15672 -p 5672:5672 -p 25672:25672 -p 61613:61613 -p 1883:1883 \
    -e TZ="Asia/Shanghai" \
    rabbitmq:management
