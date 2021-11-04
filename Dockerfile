FROM debian:latest

LABEL name="pblan/latex"
LABEL maintainer="Patrick Gustav Blaneck <p.blaneck@gmail.com>"
LABEL build-date="2021-11-04"

ENV DEBIAN_FRONTEND noninteractive

# install basics
RUN apt-get update && apt-get install -y git

# install texlive distribution
RUN apt-get update && apt-get install -y texlive-full latexmk

WORKDIR /mnt/

# cleanup
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
