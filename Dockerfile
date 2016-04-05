# ---- Atigeobase-Dockerfile ------------------------------


# ---- Version control ------------------------------------

FROM ubuntu:14.04.2

ENV OPENSSL_VERSION openssl-1.0.2g
ENV OPENSSL_DOWNLOAD_LINK https://www.openssl.org/source/$OPENSSL_VERSION.tar.gz


# ---- apt-get --------------------------------------------

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget \
	build-essential \
	curl \
	net-tools \
	vim


# ---- Set the locale -------------------------------------

RUN locale-gen en_US.UTF-8 && \
	update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  


# ---- Update OpenSSL -------------------------------------

RUN wget $OPENSSL_DOWNLOAD_LINK -P /tmp/
RUN tar xzf /tmp/$OPENSSL_VERSION.tar.gz -C /tmp/
RUN cd /tmp/$OPENSSL_VERSION && \
	./config --prefix=/usr/ && \
	make && \
	make install
	
RUN rm -Rf /tmp/*
