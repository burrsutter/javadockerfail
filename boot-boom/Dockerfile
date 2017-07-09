FROM openjdk:8
WORKDIR /usr/src/myapp
COPY target/boot-boom-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
CMD java -XX:+PrintFlagsFinal -XX:+PrintGCDetails $JAVA_OPTIONS -jar boot-boom-0.0.1-SNAPSHOT.jar