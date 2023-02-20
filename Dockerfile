FROM ubuntu:22.04

WORKDIR /app

RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install uuid-runtime \
  && rm -rf /var/lib/apt/lists/*

RUN echo "Download ad4m."
RUN wget -O ad4m https://github.com/perspect3vism/ad4m/releases/download/v0.2.14/ad4m-linux-0.2.14-x64
RUN chmod 755 ad4m
RUN ./ad4m init

RUN wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
RUN dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb

COPY scripts/ad4m-serve.sh ad4m-serve.sh

EXPOSE 12000

ENTRYPOINT [ "./ad4m-serve.sh" ]
