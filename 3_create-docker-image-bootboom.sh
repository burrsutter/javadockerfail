#!/bin/bash

cd boot-boom
echo 'mvn clean compile package'
mvn clean compile package
echo 'docker build -t burr/bootboom:v1 .'
docker build -t burr/bootboom:v1 .
cd ..

