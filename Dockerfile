FROM ubuntu:22.04

WORKDIR /app

RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install uuid-runtime \
  && rm -rf /var/lib/apt/lists/*

RUN echo "Download ad4m."
RUN wget -O ad4m https://github.com/perspect3vism/ad4m-host/releases/download/v0.0.27/ad4m-linux-x64
RUN chmod 755 ad4m
RUN ./ad4m init

COPY scripts/ad4m-serve.sh ad4m-serve.sh

ENTRYPOINT [ "./ad4m-serve.sh" ]
