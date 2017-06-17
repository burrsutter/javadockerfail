#!/bin/bash

command='kubectl --namespace=javademo expose deployment --port=8080 myvertx --type=LoadBalancer'
echo $command
$command