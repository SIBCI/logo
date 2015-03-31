FROM debian:jessie
MAINTAINER Michael Barton, mail@michaelbarton.me.uk

ENV PACKAGES librsvg2-bin pngquant imagemagick make
RUN apt-get update -y && apt-get install -y --no-install-recommends ${PACKAGES}

ADD Makefile .
