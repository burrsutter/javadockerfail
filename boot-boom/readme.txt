mvn clean compile package

docker build -t burr/bootboom:v1 .

docker run -it -p 8080:8080 burr/bootboom:v1