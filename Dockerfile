FROM debian:jessie
MAINTAINER Michael Barton, mail@michaelbarton.me.uk

ENV PACKAGES librsvg2-bin pngquant imagemagick make inkscape wget unzip
RUN apt-get update -y && apt-get install -y --no-install-recommends ${PACKAGES}

ENV URL http://www.google.com/fonts/download?kit=3hvsV99qyKCBS55e5pvb3ltkqrIMaAZWyLYEoB48lSQ
RUN wget ${URL} --output-document fonts.zip && \
    unzip fonts.zip && \
    rm fonts.zip && \
    mv *.ttf /usr/local/share/fonts && \
    chmod 644 /usr/local/share/fonts

RUN fc-cache -fv

ADD Makefile .
