FROM nginx:1.17.10


#RUN apt-get update -y \
# && apt-get install -y --no-install-recommends wget=1.20.1-1.1 gcc=4:8.3.0-1 make=4.2.1-1.2 libc6-dev=2.28-10\
# && apt-get clean \
# && rm -rf /var/lib/apt/lists/*
#WORKDIR /
#RUN wget http://ftp.gnu.org/gnu/libtasn1/libtasn1-4.16.0.tar.gz
#RUN tar -zxvf libtasn1-4.16.0.tar.gz 
#WORKDIR /libtasn1-4.16.0
#RUN  ./configure  && make && make install
#RUN wget http://ftp.cn.debian.org/debian/pool/main/libt/libtasn1-6/libtasn1-6_4.16.0-2_amd64.deb
RUN apt-get purge -y  --allow-remove-essential libtasn1-6
#RUN dpkg -i libtasn1-6_4.16.0-2_amd64.deb

COPY src/* /usr/share/nginx/html/


