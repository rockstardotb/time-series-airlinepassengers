# make build

cwd = $(shell pwd)
IP = $(shell ifconfig en0 | grep inet | awk '$$1=="inet" {print $$2}')
user = $(shell whoami)
build:
	docker build -t mlearn .
# make run
run:
	docker run -i -t --name mlearn -v /${cwd}:/app/ -p 8000:8000 -e DISPLAY=${IP}:0 -v /tmp/.X11-unix:/tmp/.X11-unix -d mlearn /bin/bash
# make exec
exec:
	docker exec -i -t mlearn /bin/bash
# start
start:
	docker start mlearn
# stop
stop:
	docker stop mlearn
# rm
remove:
	docker rm mlearn

