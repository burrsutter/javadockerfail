#!/bin/bash

command1="kubectl delete deploy/myvertx --namespace=javademo"
echo $command1
$command1

