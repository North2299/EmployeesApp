#!/usr/bin/env bash
test_file_path = "/home/userpfe/test/sample_test.jmx"
test_name="$(basename "$test_file_path")"

#Get Master pod details

master_pod=`kubectl get po -n $tenant | grep jmeter-master | awk '{print $1}'`

kubectl cp "$test_file_path" -n jmeter "$master_pod:/$test_name"

## Echo Starting Jmeter load test

kubectl exec -ti -n jmeter $master_pod -- /bin/bash /load_test "$test_name"