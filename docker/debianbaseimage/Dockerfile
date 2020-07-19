FROM debian:10.4 AS debbase1 
COPY . .
RUN cp sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install htop wget vim procps systemd --assume-yes
# These were libraries needed to compile nginx
RUN apt-get install build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev --assume-yes
RUN wget http://nginx.org/download/nginx-1.19.1.tar.gz
RUN tar -zxvf nginx-1.19.1.tar.gz && rm nginx-1.19.1.tar.gz
WORKDIR nginx-1.19.1
#RUN ./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx.error.log --http-log-path=/var/log/nginx/access.log --with-pcre --pid-path=/var/run/nginx.pid --with-http_ssl_module
RUN ./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx.error.log --http-log-path=/var/log/nginx/access.log --with-pcre --pid-path=/var/run/nginx.pid
RUN make install 

FROM debbase1
RUN echo 'alias ll="ls -alH"' >> ~/.bashrc
RUN echo 'alias q="exit"' >> ~/.bashrc

COPY --from=debbase1 nginx-1.19.1 ./nginx-1.19.1
COPY . .

## This configures and runs systemd however doesn't work as systemd isn't running inside the container https://stackoverflow.com/a/62489079/494635. 
## If you were doing this on a VM or bare metal though you'd probably do this. 
##RUN cp nginx.service /lib/systemd/system/nginx.service
#RUN systemctl start nginx 
COPY . .
#RUN nginx
RUN echo 'hello'

# Look here for sample dockerfiles for nginx https://hub.docker.com/_/nginx
# This starts the nginx proeces. When that process stops, the container closes. You can still connect to the container by running docker exec -it containername /bin/bash... if you kill nginx, eg, with "nginx -s stop" then, you guess it, the container stops. 
CMD ["nginx", "-g", "daemon off;"] 



