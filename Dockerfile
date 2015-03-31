FROM debian:wheezy
MAINTAINER Michael Barton, mail@michaelbarton.me.uk

ENV PACKAGES pngcrush imagemagick
RUN apt-get update -y && apt-get install -y --no-install-recommends ${PACKAGES}
