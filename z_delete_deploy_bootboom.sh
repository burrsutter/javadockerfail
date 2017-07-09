#!/bin/bash

command1="kubectl delete deploy/bootboom --namespace=javademo"
echo $command1
$command1

