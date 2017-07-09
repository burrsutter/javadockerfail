#!/bin/bash

command='kubectl --namespace=javademo expose deployment --port=8080 bootboom --type=LoadBalancer'
echo $command
$command