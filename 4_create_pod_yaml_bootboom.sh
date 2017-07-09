#!/bin/bash
command="kubectl --namespace=javademo create -f javademo-bootboom-deployment.yaml --record --validate=false"
echo $command
$command