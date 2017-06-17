#!/bin/bash

command="kubectl delete deploy/myvertx --namespace=javademo"
echo $command
$command
