FROM debian:10.4 AS debbase1 
RUN apt-get update
RUN apt-get install htop neofetch build-essential wget mc --assume-yes
RUN wget http://nginx.org/download/nginx-1.19.1.tar.gz

FROM debbase1
RUN echo 'alias ll="ls -alH"' >> ~/.bashrc
RUN echo 'alias q="exit"' >> ~/.bashrc
WORKDIR /damienworking
COPY --from=debbase1 nginx-1.19.1.tar.gz .
RUN tar -zxvf nginx-1.19.1.tar.gz && rm nginx-1.19.1.tar.gz

COPY . .