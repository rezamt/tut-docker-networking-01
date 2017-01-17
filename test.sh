#!/bin/bash

docker run -it --net=frontend busybox wget -qO- hap/index.html
echo ""
