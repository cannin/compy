FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get install -y git htop links nano wget
RUN apt-get install -y libjpeg8 libjpeg-dev openssl ssl-cert build-essential

# Install newer Go
WORKDIR /
RUN wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
RUN tar -xvf go1.9.2.linux-amd64.tar.gz
RUN mv go /usr/local

ENV GOPATH /gosource
ENV GOROOT=/usr/local/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN go get github.com/barnacs/compy
WORKDIR /gosource/src/github.com/barnacs/compy/
RUN go install

RUN apt-get install -y nodejs npm nodejs-legacy
RUN npm install -g http-server

RUN apt-get install -y supervisor

WORKDIR /opt/compy
COPY docker.sh proxy.pac /opt/compy/

# Configure supervisord
COPY supervisor/*.conf /etc/supervisor/conf.d/

EXPOSE 9999 8080
CMD ["/usr/bin/supervisord"]
