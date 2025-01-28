FROM jenkins/jenkins:lts

USER root

# ติดตั้ง dependencies
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    wget \
    unzip

# สร้าง virtual environment และติดตั้ง Robot Framework
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip3 install robotframework robotframework-seleniumlibrary

USER jenkins