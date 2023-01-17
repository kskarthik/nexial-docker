FROM amazoncorretto:19-alpine

ENV NEXIAL_VER=4.5_1534 \
		NEXIAL_HOME=/root/nexial-core \
		PATH=/root/nexial-core/bin:$PATH

WORKDIR /root

RUN wget -O nexial.zip https://github.com/nexiality/nexial-core/releases/download/nexial-core-v$NEXIAL_VER/nexial-core-$NEXIAL_VER.zip \
		&& apk add bash \
		&& unzip -q nexial.zip -d nexial-core \
		&& rm nexial.zip

ENTRYPOINT [ "tail", "-F", "/dev/null" ]
