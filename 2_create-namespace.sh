#!/bin/bash
command="kubectl create -f ./javademo-namespace.yaml" 
echo $command 
$command

# oc new-project javademo