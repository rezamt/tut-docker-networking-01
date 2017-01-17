# tut-docker-networking-01
Creating HAProxy and 2 Nginx - Load balancing traffic to the backend servers

# Creating Docker Networks
> docker network create frontend
> docker network create backend

# Running Nginx Servers
> docker run --name ng1 --net=backend  -v ~/html1:/usr/share/nginx/html:ro -d nginx
> docker run --name ng2 --net=backend  -v ~/html2:/usr/share/nginx/html:ro -d nginx

# Running HAProxy Server
> docker run --name hap --net=backend -v ~/haproxy.cfg:/usr/local/etc/haproxy.cfg:ro -d haproxy -d -f /usr/local/etc/haproxy.cfg

# Connecting HAProxy to Frontend Network
> docker network connect frontend hap

# Testing 
> docker run -it --net=frontend busybox wget -qO- hap/index.html
