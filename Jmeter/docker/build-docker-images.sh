#!/bin/bash -e

docker build --tag="mariemzouari/jmeter-base:latest" -f ../docker//Dockerfile-base .
docker push mariemzouari/jmeter-base:latest
docker build --tag="mariemzouari/jmeter-master:latest" -f ../docker//Dockerfile-master .
docker push mariemzouari/jmeter-master:latest
docker build --tag="mariemzouari/jmeter-slave:latest" -f ../docker/Dockerfile-slave .
docker push mariemzouari/jmeter-slave:latest
