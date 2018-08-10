#!/bin/bash

apt-get update < /dev/null
apt-get -y install git \
	build-essential \
	autoconf \
    	pkg-config \
	libtool \
	libxerces-c-dev \
	python < /dev/null
	

mkdir /usr/local/sumo -p

git clone --recursive https://github.com/eclipse/sumo.git

cd sumo
make -f Makefile.cvs
./configure --prefix=/usr/local/sumo
make
make install
cd ..
rm -rf sumo

