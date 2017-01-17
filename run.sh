#!/bin/bash

echo "Creating Docker Networks - Frontend and Backend"
docker network create frontend
docker network create backend
echo "Running Nginx Servers"
docker run --name ng1 --net=backend  -v ~/html1:/usr/share/nginx/html:ro -d nginx
docker run --name ng2 --net=backend  -v ~/html2:/usr/share/nginx/html:ro -d nginx

echo "Running HAProxy"
docker run --name hap --net=backend -v ~/haproxy.cfg:/usr/local/etc/haproxy.cfg:ro -d haproxy -d -f /usr/local/etc/haproxy.cfg
docker network connect frontend hap

