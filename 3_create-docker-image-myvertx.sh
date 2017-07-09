#!/bin/bash

cd vertx-demo
mvn clean compile package
docker build -t burr/myvertx:v1 .
cd ..

# oc get projects