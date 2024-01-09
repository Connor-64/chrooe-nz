FROM node:slim

WORKDIR /home/choreouser

COPY .. /home/choreouser/

RUN apt update &&\
    apt install --only-upgrade linux-libc-dev &&\
    apt-get install -y iproute2 vim netcat-openbsd curl openssl coreutils &&\
    addgroup --gid 10001 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10001 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x start.sh swith

ENTRYPOINT ["./start.sh"]

USER 10001
