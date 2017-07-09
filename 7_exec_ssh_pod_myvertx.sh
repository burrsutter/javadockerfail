#!/bin/bash

POD=$(kubectl get pods --namespace=javademo -o yaml | grep "name: myvertx-" | cut -f2 -d':')
echo $POD
command1="kubectl exec -it --namespace=javademo $POD /bin/bash"
$command1
