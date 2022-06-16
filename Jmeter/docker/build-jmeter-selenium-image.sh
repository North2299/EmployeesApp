#!/bin/bash

docker build --tag="mariemzouari/chromejmeter" -f Dockerfile-Selenium
#give the path to the folder  where you have your jmx file
export volume_path="../senario/testplan2.jmx"
#give the path within your container
export jmeter_path="/jmeter/sample/"
docker run --name mariemzouari/chromejmeter --volume "${volume_path}":${jmeter_path} jmeterdocker -n -t ${jmeter_path}/testplan2.jmx -l tmp/result_${NOW}.jtl -j tmp/jmeter_${NOW}.log
