#!/bin/bash

cd boot-boom
mvn clean compile package
docker build -t burr/bootboom:v1 .
cd ..

# oc get projects