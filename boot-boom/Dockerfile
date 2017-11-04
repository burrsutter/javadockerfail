FROM openjdk:8
ENV JAVA_APP_JAR boot-boom-0.0.1-SNAPSHOT.jar
WORKDIR /app/
COPY target/boot-boom-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
CMD java -XX:+PrintFlagsFinal -XX:+PrintGCDetails $JAVA_OPTIONS -jar $JAVA_APP_JAR