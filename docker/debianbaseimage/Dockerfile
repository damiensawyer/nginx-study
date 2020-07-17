FROM debian:10.4 AS debbase1 
RUN apt-get update
RUN apt-get install htop --assume-yes

FROM debbase1
RUN echo 'alias ll="ls -alH"' >> ~/.bashrc
RUN echo 'alias q="exit"' >> ~/.bashrc
WORKDIR /damienworking
COPY . .