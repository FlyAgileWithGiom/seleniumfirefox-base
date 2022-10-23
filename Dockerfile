FROM selenium/base:4.5.2

RUN apt update && \
    apt install -y curl 

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt update && apt-get install nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --shell /bin/bash jenkins
USER jenkins

WORKDIR /home/jenkins/src

COPY ./package.json ./

RUN npm install