FROM amazoncorretto:19-alpine

ARG NEXIAL_VER=4.5_1534

RUN apk add --no-cache bash firefox \
		&& apk add --no-cache chromium chromium-chromedriver --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community

RUN adduser --disabled-password nexial-user

USER nexial-user

WORKDIR /home/nexial-user/

RUN wget -O nexial.zip https://github.com/nexiality/nexial-core/releases/download/nexial-core-v$NEXIAL_VER/nexial-core-$NEXIAL_VER.zip \
		&& unzip -q nexial.zip -d nexial-core \
		&& rm nexial.zip

ENV NEXIAL_HOME=/home/nexial-user/nexial-core \
		PATH=/home/nexial-user/nexial-core/bin:$PATH \
		FIREFOX_BIN=/usr/bin/firefox \
		CHROME_BIN=/usr/bin/chromedriver

ENTRYPOINT [ "tail", "-F", "/dev/null" ]
