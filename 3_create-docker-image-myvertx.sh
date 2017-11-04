#!/bin/bash

cd vertx-demo
echo 'mvn clean compile package'
mvn clean compile package
echo 'docker build -t burr/myvertx:v1 .'
docker build -t burr/myvertx:v1 .
cd ..

