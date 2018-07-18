#!/bin/bash
command="kubectl --namespace=javademo create -f javademo-vertx-deployment.yaml --record --validate=false"
echo $command
$command