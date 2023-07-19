# Author: Sai Karthik <kskarthik@disroot.org>

FROM debian:sid-slim

ARG NEXIAL_VER=4.5_1534

RUN apt update && apt install -y openjdk-19-jdk chromium wget unzip

RUN adduser --disabled-password nexial-user

USER nexial-user

WORKDIR /home/nexial-user/

RUN wget -O nexial.zip https://github.com/nexiality/nexial-core/releases/download/nexial-core-v$NEXIAL_VER/nexial-core-$NEXIAL_VER.zip \
		&& unzip -q nexial.zip -d nexial-core \
		&& rm nexial.zip

ENV NEXIAL_HOME=/home/nexial-user/nexial-core \
		PATH=/home/nexial-user/nexial-core/bin:$PATH \
		FIREFOX_BIN=/usr/bin/firefox \
		CHROME_BIN=/usr/bin/chromium \
		JAVA_OPT="$JAVA_OPT -Dnexial.browser=chrome.headless"

#TODO: fix tests failing with firefox headless mode
# JAVA_OPT=$JAVA_OPT -Dnexial.browser=chrome.headless -Dnexial.browser=firefox.headless

CMD [ "/bin/bash" ]

# uncomment for troubleshooting
# ENTRYPOINT [ "tail", "-F", "/dev/null" ]
