FROM debian:10.4 AS debbase1 
#RUN apt-get update
COPY . .
RUN cp sources.list /etc/apt/sources.list
RUN apt-get update
#RUN apt-get install htop neofetch build-essential wget mc vim --assume-yes
RUN apt-get install htop wget vim --assume-yes
# These were libraries needed to compile nginx
RUN apt-get install build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev --assume-yes
RUN wget http://nginx.org/download/nginx-1.19.1.tar.gz

FROM debbase1
RUN echo 'alias ll="ls -alH"' >> ~/.bashrc
RUN echo 'alias q="exit"' >> ~/.bashrc
WORKDIR /damienworking
COPY --from=debbase1 nginx-1.19.1.tar.gz .
RUN tar -zxvf nginx-1.19.1.tar.gz && rm nginx-1.19.1.tar.gz

COPY . .