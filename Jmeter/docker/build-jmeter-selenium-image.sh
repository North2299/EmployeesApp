#!/bin/bash

docker build --tag="mariemzouari/chromejmeter" -f Dockerfile-Selenium .
#give the path to the folder  where you have your jmx file
export volume_path="/home/userpfe/EmployeesApp/Jmeter/senario/"
#give the path within your container
export jmeter_path="/opt/apache-jmeter-5.4.3/testSamples/"
docker run --name jmeter-selenium  --volume "${volume_path}":${jmeter_path} mariemzouari/chromejmeter 
