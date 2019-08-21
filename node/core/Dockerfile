FROM adoptopenjdk/openjdk12:jdk-12.0.1_12-slim

ARG GRADLE_VERSION
ARG CORE_VERSION
ARG CORE_BRANCH
ARG CLI_VERSION
ARG CLI_BRANCH
ARG CONF_TIMESTAMP
ARG CONF_HOST_IP
ARG CONF_PORT
ARG CONF_PRIV_KEY
ARG CONF_PEER_1
ARG CONF_PEER_2
ARG CONF_NAME

RUN     mkdir -p /apex
WORKDIR /apex

RUN     apt update -y && \
        apt install unzip -y && \
        apt install git -y && \
        apt install wget

RUN     cd /usr/local && \
        curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-${GRADLE_VERSION}-bin.zip && \
        unzip gradle-${GRADLE_VERSION}-bin.zip && \
        rm gradle-${GRADLE_VERSION}-bin.zip

ENV GRADLE_HOME=/usr/local/gradle-${GRADLE_VERSION}
ENV PATH=$PATH:$GRADLE_HOME/bin

RUN     git clone https://github.com/APEX-Network/APEX-Blockchain-Core.git && \
        cd APEX-Blockchain-Core && \
        git checkout ${CORE_BRANCH} && \
        gradle shadowJar && \
        cp build/libs/APEX-Blockchain-Core-${CORE_VERSION}.jar /apex/apex-blockchain-core.jar

RUN     wget -O generator-settings.conf https://github.com/APEX-Network/APEX-Docker-Test/blob/master/generator-settings.conf?raw=true && \
        wget -O configure.sh https://github.com/APEX-Network/APEX-Docker-Test/blob/master/configure.sh?raw=true && \
        chmod +x configure.sh && \
        sh configure.sh -h ${CONF_HOST_IP} -p ${CONF_PORT} -k ${CONF_PRIV_KEY} -t ${CONF_TIMESTAMP} -a ${CONF_PEER_1} -b ${CONF_PEER_2} -n ${CONF_NAME}

CMD [ "java", "-jar", "-Xms512m", "-Xmx4G", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseShenandoahGC", "/apex/apex-blockchain-core.jar", "settings.conf" ]
