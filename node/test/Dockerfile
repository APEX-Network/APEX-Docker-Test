FROM adoptopenjdk/openjdk12:jdk-12.0.1_12-slim

RUN     mkdir -p /apex
WORKDIR /apex

RUN     apt-get update -y && \
        apt-get install git -y && \
        apt-get install wget -y && \
        apt-get install maven -y

RUN     git clone https://github.com/yuomii/APEX-Integration-Test.git && \
        cd APEX-Integration-Test && \
        mvn -U clean install && \
        cp target/APEX-Integration-Test-1.0-SNAPSHOT-jar-with-dependencies.jar /apex/test.jar

CMD ["java", "-jar", "/apex/test.jar", "97b7c5875b8a5207e0cdf5b4050cb8215065ddcb36622bf733d55eca40250c39", "APEt5ThLdoXiMGQkDmGnfY271vJrii5LxxM", "http://172.28.1.1:8080"]