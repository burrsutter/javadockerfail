#!/bin/bash

# Get the IP address of the VM
IP=$(minishift console --url | cut -f2 -d':' | cut -f3 -d'/')

echo $IP

# Get the NodePort of the service
NODEPORT=$(kubectl --namespace=javademo get services vertxdemo -o yaml | grep nodePort | cut -f2 -d:)

echo $NODEPORT

# Combine the two, trimming off whitespace
THEURL=$IP:$(echo $NODEPORT | awk '{print $1}')

echo $THEURL/memory

# curl it
while true
do 
  curl --connect-timeout 1 -s $THEURL/memory;
  echo
  sleep 1;
done
