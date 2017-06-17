#!/bin/bash
command="kubectl --namespace=javademo create -f javademo-deployment.yaml --record --validate=false"
echo $command
$command