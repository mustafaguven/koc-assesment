FROM java:8
WORKDIR /
ADD target/hello-world-1.0-SNAPSHOT.jar hello-world-1.0-SNAPSHOT.jar
EXPOSE 38080
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
CMD java - jar hello-world-1.0-SNAPSHOT.jar