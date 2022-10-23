FROM --platform=linux/amd64 node:16.13.1-bullseye-slim

# works (if needed)
RUN apt update && \
    apt install -y curl firefox-esr
    # \ && rm -rf /var/lib/apt/lists/*


# RUN add-apt-repository ppa:mozillateam/ppa
# RUN echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
# RUN apt update && apt install -y firefox

#RUN wget -O firefox-nightly.tar.bz2 https://ftp.mozilla.org/pub/firefox/nightly/2022/08/2022-08-31-21-54-47-mozilla-central/firefox-106.0a1.en-US.linux-x86_64.tar.bz2 && \
    # tar xj -C /opt/ firefox-nightly.tar.bz2 && \
    # rm firefox-nightly.tar.bz2

RUN curl -L https://github.com/mozilla/geckodriver/releases/download/v0.32.0/geckodriver-v0.32.0-linux64.tar.gz | tar xz -C /usr/local/bin 

RUN apt install --no-install-recommends -y xvfb
RUN set -e
RUN echo "Starting X virtual framebuffer (Xvfb) in background..."
RUN Xvfb -ac :99 -screen 0 1280x1024x16 > /dev/null 2>&1 &
RUN export DISPLAY=:99
RUN exec "$@"

RUN useradd --create-home --shell /bin/bash jenkins
USER jenkins

WORKDIR /home/jenkins/src

COPY ./package.json ./

RUN npm install