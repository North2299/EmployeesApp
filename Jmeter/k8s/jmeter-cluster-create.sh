#!/usr/bin/env bash
echo "checking if kubectl is present"

if ! hash kubectl 2>/dev/null
then
    echo "'kubectl' was not found in PATH"
    echo "Kindly ensure that you can acces an existing kubernetes cluster via kubectl"
    exit
fi

kubectl version --short
echo "Creating Jmeter slave nodes"
nodes=`kubectl get no | egrep -v "master|NAME" | wc -l`
echo
echo "Number of worker nodes on this cluster is " $nodes

echo

#echo "Creating $nodes Jmeter slave replicas and service"

echo

kubectl create -n jmeter -f jmeter_slave_deployment.yml


echo "Creating Jmeter Master"

kubectl create -n jmeter -f jmeter_master_configmap.yml

kubectl create -n jmeter -f jmeter_master_deployment.yml
echo "Printout Of the $tenant Objects"

echo

kubectl get -n jmeter all
