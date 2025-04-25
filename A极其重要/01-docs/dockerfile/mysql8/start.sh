#!/bin/bash
cur_dir=`pwd`

docker stop kpu_mysql
docker rm kpu_mysql
docker run --name mysql_8 --restart=always \
    -v /Users/lmx/Documents/tools/docker/mysql/conf:/etc/mysql/conf.d \
    -v /Users/lmx/Documents/tools/docker/mysql/data/:/var/lib/mysql \
    -p 3306:3306 \
    -e TZ=Asia/Shanghai \
    -d mysql:8.4
