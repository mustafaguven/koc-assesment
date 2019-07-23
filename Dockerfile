FROM java:8
WORKDIR /
ADD target/hello-world-1.0-SNAPSHOT.jar hello-world-1.0-SNAPSHOT.jar
EXPOSE 38080
CMD java - jar hello-world-1.0-SNAPSHOT.jar