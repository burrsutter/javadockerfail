#!/bin/bash

POD=$(kubectl get pods -n javademo -l app=bootboom -o 'jsonpath={.items[0].metadata.name}')
echo $POD
command1="kubectl exec -it --namespace=javademo $POD /bin/bash"
$command1
