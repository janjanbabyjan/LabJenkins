FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir --break-system-packages robotframework-seleniumlibrary

USER jenkinsDA