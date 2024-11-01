FROM ubuntu:24.04

VOLUME /output
WORKDIR /output

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common && \
    add-apt-repository ppa:alex-p/tesseract-ocr5

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tesseract-ocr-all && \
    apt-get clean

ENTRYPOINT ["/usr/bin/tesseract"]
