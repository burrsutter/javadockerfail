#!/bin/bash

command1="kubectl delete deploy/myvertx --namespace=javademo"
echo $command1
$command1

command2="kubectl delete namespace javademo"
echo $command2
$command2

