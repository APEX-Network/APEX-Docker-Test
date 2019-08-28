FROM adoptopenjdk/openjdk12:jdk-12.0.1_12-slim

ARG PRIV_KEY
ARG TARGET_ADDRESS
ARG RPC_URL

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

CMD ["java", "-jar", "/apex/test.jar", "${PRIV_KEY}", "${TARGET_ADDRESS}", "${RPC_URL}"]