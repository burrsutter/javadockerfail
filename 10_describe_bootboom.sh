#!/bin/bash

PODID=$(kubectl get pods | grep bootboom | cut -f1 -d' ')
echo $PODID
command1="kubectl describe pod $PODID"
echo $command1
$command1
