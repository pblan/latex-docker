FROM debian:latest

LABEL name="pblan/latex"
LABEL maintainer="Patrick Gustav Blaneck <p.blaneck@gmail.com>"
LABEL build-date="2021-11-04"
#LABEL vcs-url="https://github.com/pblan/latex-docker"

ENV DEBIAN_FRONTEND noninteractive

#COPY templates/ $HOME/share/latex
#RUN export TEXINPUTS=.:$HOME/share/latex//

# install basics
RUN apt-get update && apt-get install -y git

# install texlive distribution
RUN apt-get update && apt-get install -y texlive-full latexmk

# install document classes
#RUN mkdir -p /root/texmf/tex/latex/local/
#RUN mkdir -p /mnt/latex-docker
#COPY . /mnt/latex-docker
#COPY ./templates/*.cls /root/texmf/tex/latex/local/
#RUN texhash /root/texmf/

WORKDIR /mnt/

# cleanup
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
