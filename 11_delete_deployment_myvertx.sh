#!/bin/bash

echo "Delete the Deployment"

command1="kubectl delete deploy/myvertx --namespace=javademo"
echo $command1
$command1

echo "and delete Service"


command1="kubectl delete svc/myvertx --namespace=javademo"
echo $command1
$command1
