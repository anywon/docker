#!/bin/bash

docker run -d -it --name {CONTAINER_NAME} --pid="host" --net="host" \
                  --restart="always" --ulimit nofile=200000:200000 \
                  -v /etc/localtime:/etc/localtime:ro \
                  -e ENV='ENV' \
		  {PROJECT}:{VERSION} \
                  /usr/bin/supervisord
