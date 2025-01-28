FROM jenkins/jenkins:lts

USER root

# ติดตั้ง dependencies
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    wget \
    unzip

# ติดตั้ง Robot Framework
RUN pip3 install --no-cache-dir robotframework robotframework-seleniumlibrary

USER jenkins