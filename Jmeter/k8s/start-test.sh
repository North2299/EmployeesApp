#!/bin/bash
test_file_path="/home/userpfe/test/sample_test.jmx"
test_name="$(basename "$test_file_path")"

#Get Master pod details

master_pod=`kubectl get pod -n jmeter | grep jmeter-master | awk '{print $1}'`
echo $master_pod

kubectl cp $test_file_path jmeter/$master_pod:/jmeter/apache-jmeter-5.4.3/$test_name

#echo Starting Jmeter load test

kubectl exec -ti -n jmeter $master_pod -- /bin/bash /load_test "$test_name"