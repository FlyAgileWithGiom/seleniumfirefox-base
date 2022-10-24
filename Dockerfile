FROM --platform=linux/amd64 node:16.13.1-bullseye-slim

# works (if needed)
RUN apt update && \
    apt install -y curl firefox-esr && \
    apt install -y  --no-install-recommends  xvfb && \
    rm -rf /var/lib/apt/lists/*

# Install the base requirements to run and debug webdriver implementations:

RUN set -e
RUN echo "Starting X virtual framebuffer (Xvfb) in background..."
RUN Xvfb -ac :99 -screen 0 1280x1024x16 > /dev/null 2>&1 &
RUN export DISPLAY=:99
RUN exec "$@"

RUN useradd --create-home --shell /bin/bash jenkins
USER jenkins

WORKDIR /home/jenkins/src

COPY --chown=jenkins src/package.json ./

ENV HOME=/home/jenkins/
RUN npm install
