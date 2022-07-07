#!/bin/bash
test_file_path="/home/userpfe/EmployeesApp/Jmeter/senario/testplan2.jmx"
test_name="$(basename "$test_file_path")"
testDB_file_path="/home/userpfe/EmployeesApp/Jmeter/testDB/TC1_ADD.csv"
testDB_name="$(basename "$testDB_file_path")"
testDB_Split_files_path="/home/userpfe/test"

#Get Master pod details

master_pod=`kubectl get pod -n jmeter | grep jmeter-master | awk '{print $1}'`
echo $master_pod

kubectl cp $test_file_path jmeter/$master_pod:/jmeter/apache-jmeter-5.4.3/$test_name

# Get slaves

printf "Get number of slaves\n"

slave_pods=($(kubectl get po -n jmeter | grep jmeter-slave | awk '{print $1}'))

# for array iteration
slavesnum=${#slave_pods[@]}

# for split command suffix and seq generator
slavedigits="${#slavesnum}"

printf "Number of slaves is %s\n" "${slavesnum}"


# Split and upload csv files

csvfile="${testDB_name}"

printf "Processing %s file..\n" "$csvfile"

split --suffix-length="${slavedigits}" --additional-suffix=.csv -d --number="l/${slavesnum}" "${testDB_file_path}" "${testDB_Split_files_path}/"

j=0
for i in $(seq -f "%0${slavedigits}g" 0 $((slavesnum-1)))
do
printf "Copy %s to %s on %s\n" "${i}.csv" "${csvfile}" "${slave_pods[j]}"
kubectl -n jmeter cp "${testDB_Split_files_path}/${i}.csv" "${slave_pods[j]}":/
kubectl -n jmeter exec "${slave_pods[j]}" -- mv -v /"${i}.csv" /"${csvfile}"
rm -v "${jmx_dir}/${i}.csv"

let j=j+1
done # for i in "${slave_pods[@]}"




#echo Starting Jmeter load test

kubectl exec -ti -n jmeter $master_pod -- /bin/bash /load_test "$test_name -l /jmeter/res.jtl"

kubectl cp  jmeter/jmeter-master-66d8b96fb4-fnl96:/jmeter/res.jtl /home/userpfe/EmployeesApp/Jmeter/senario/res1.jtl
