#!/bin/bash

docker stop kpu_nacos
docker rm kpu_nacos
#docker run -idt --name kpu_nacos \
#        -e JVM_XMS=512m -e JVM_XMX=512m -e JVM_XMN=384m \
#        -e PREFER_HOST_MODE=hostname -e MODE=standalone  -e SPRING_DATASOURCE_PLATFORM=mysql \
#        -e NACOS_AUTH_ENABLE=true -e NACOS_AUTH_TOKEN='a3B1bmFjb3NsbXgxMjMxMjUwMDBBQkNEMTIzNDU2Nzg5MA==' -e NACOS_AUTH_IDENTITY_KEY='lmx123125' -e NACOS_AUTH_IDENTITY_VALUE='lmx123125' \
#        -e MYSQL_DATABASE_NUM=1 \
#        -e MYSQL_SERVICE_HOST=192.168.1.60 -e MYSQL_SERVICE_DB_NAME=kpu_nacos -e MYSQL_SERVICE_PORT=3306 \
#        -e MYSQL_SERVICE_USER=root \
#        -e MYSQL_SERVICE_PASSWORD=lmx123125 \
#        -p 8848:8848 -p 7848:7848 -p 9848:9848 -p 9849:9849 \
#        -v `pwd`/logs/:/home/nacos/logs \
#        -v `pwd`/init.d/custom.properties:/home/nacos/init.d/custom.properties \JRpvCTOuF8
#        nacos/nacos-server:v2.4.3
#docker run --name nacos-standalone -e MODE=standalone -v -p 8848:8848 -d -p 9848:9848  nacos/nacos-server:latest
#docker run --name nacos-standalone -e MODE=standalone -v /path/application.properties:/home/nacos/conf/application.properties -p 8848:8848 -d -p 9848:9848  nacos/nacos-server:latest
docker run -idt --name kpu_nacos \
        -e NACOS_AUTH_ENABLE=true -e NACOS_AUTH_TOKEN='a3B1bmFjb3NsbXgxMjMxMjUwMDBBQkNEMTIzNDU2Nzg5MA==' -e NACOS_AUTH_IDENTITY_KEY='lmx123125' -e NACOS_AUTH_IDENTITY_VALUE='lmx123125' \
        -e NACOS_AUTH_ENABLE_USERAGENT_AUTHWHITE=true \
        -e MODE=standalone  -e SPRING_DATASOURCE_PLATFORM=mysql \
        -e MYSQL_DATABASE_NUM=1 \
        -e MYSQL_SERVICE_HOST=192.168.1.60 -e MYSQL_SERVICE_DB_NAME=kpu_nacos -e MYSQL_SERVICE_PORT=3306 \
        -e MYSQL_SERVICE_USER=root \
        -e MYSQL_SERVICE_PASSWORD=lmx123125 \
        -p 8848:8848 -p 9848:9848 \
        -v `pwd`/logs/:/home/nacos/logs \
        nacos/nacos-server:v2.4.0

#docker run --name nacos-standalone -e MODE=standalone \n
#      -v /path/application.properties:/home/nacos/conf/application.properties \
#      -p 8848:8848 -d -p 9848:9848  nacos/nacos-server:latest
#
#docker run --name nacos-standalone-auth -e MODE=standalone -e NACOS_AUTH_ENABLE=true \
#      -e NACOS_AUTH_TOKEN=${customToken} -e NACOS_AUTH_IDENTITY_KEY=${customKey} \
#      -e NACOS_AUTH_IDENTITY_VALUE=${customValue} \
#      -p 8848:8848 -d -p 9848:9848  nacos/nacos-server:latest