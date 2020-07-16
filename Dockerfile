FROM jrottenberg/ffmpeg:4.3-vaapi
LABEL maintainer="https://yucca.app, jidckii@gmail.com"

RUN set -xe \
    && mkdir -p /hls \
    && rm -f /hls/* \
    && apt-get update \
    && apt-get install ttf-dejavu tzdata -y \
    && apt-get autoremove \
    && apt-get clean
