#!/bin/bash

docker run --name ng1 --net=backend  -v ~/html1:/usr/share/nginx/html:ro -d nginx
docker run --name ng2 --net=backend  -v ~/html2:/usr/share/nginx/html:ro -d nginx
docker run --name hap --net=backend -v ~/haproxy.cfg:/usr/local/etc/haproxy.cfg:ro -d haproxy -d -f /usr/local/etc/haproxy.cfg
docker network connect frontend hap

