#!/bin/bash

docker stop kpu_redis
docker rm kpu_redis
docker run -idt -p 16379:16379 --name redis_4 --restart=always \
    -v /Users/lmx/Documents/tools/docker/redis/redis.conf:/etc/redis/redis_default.conf \
    -v /Users/lmx/Documents/tools/docker/redis/data/:/data \
    -e TZ="Asia/Shanghai" \
    redis:7.4.2 redis-server /etc/redis/redis_default.conf --appendonly yes

