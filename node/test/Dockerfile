FROM adoptopenjdk/openjdk12:jdk-12.0.1_12-slim

ARG PRIV_KEY
ARG TARGET_1
ARG RPC_URL_1
ARG TARGET_2
ARG RPC_URL_2


RUN     mkdir -p /apex
WORKDIR /apex

RUN     apt-get update -y && \
        apt-get install git -y && \
        apt-get install wget -y && \
        apt-get install maven -y

RUN     git clone https://github.com/APEX-Network/APEX-Integration-Test.git && \
        cd APEX-Integration-Test && \
        mvn -U clean install && \
        cp target/APEX-Integration-Test-1.0-SNAPSHOT-jar-with-dependencies.jar /apex/test.jar

RUN echo "java -jar /apex/test.jar ${PRIV_KEY} ${TARGET_1} ${RPC_URL_1} ${TARGET_2} ${RPC_URL_2}" > entrypoint.sh && \
    chmod +x entrypoint.sh

CMD ["/bin/bash", "entrypoint.sh"]