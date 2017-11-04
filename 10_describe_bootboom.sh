#!/bin/bash

PODID=$(kubectl -n javademo get pods | grep bootboom | cut -f1 -d' ')
echo $PODID
command1="kubectl -n javademo describe pod $PODID"
echo $command1
$command1
