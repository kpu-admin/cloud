#!/bin/bash
cur_dir=`pwd`

docker stop kpu_minio
docker rm kpu_minio
docker run -p 9000:9000 --name kpu_minio --restart=always \
  -d minio/minio server /data
#  -v /mnt/data:/data \
#  -v ${cur_dir}/config:/root/.minio \
