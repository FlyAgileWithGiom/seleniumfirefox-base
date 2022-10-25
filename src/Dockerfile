FROM duquesnay/wdiobase:1.1
ARG UID=501
ARG GID=501

RUN useradd --create-home --shell /bin/bash -u $UID -g $GID jenkins
USER jenkins
VOLUME '/usr/src'
