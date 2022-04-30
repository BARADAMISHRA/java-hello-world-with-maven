FROM ubuntu:21.04
ENV JAVA_HOME=/u01/data/jdk-11
ENV PATH=${PATH}:${JAVA_HOME}/bin
RUN mkdir -p /u01/data

WORKDIR /u01/data

RUN apt-get update


ADD https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz .

#RUN apt install gunzip

RUN gunzip openjdk-11+28_linux-x64_bin.tar.gz
RUN tar -xvf openjdk-11+28_linux-x64_bin.tar

RUN rm -rf openjdk-11+28_linux-x64_bin.tar

COPY target/jb-hello-world-maven-0.2.0.jar .
RUN chmod u+x jb-hello-world-maven-0.2.0.jar
COPY shp.sh .
RUN chmod u+x shp.sh

CMD ["/bin/sh","-c","java -version"]
CMD ["./shp.sh"]
