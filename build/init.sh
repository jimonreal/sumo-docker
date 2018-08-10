#!/bin/bash

apt-get update < /dev/null
apt-get -y install git \
	build-essential \
	autoconf \
    pkg-config \
	libtool \
	libxerces-c-dev \
	python < /dev/null
	
git clone --recursive https://github.com/eclipse/sumo.git

cd sumo
make -f Makefile.cvs
./configure
make
make install
cd ..
rm -rf sumo
apt-get purge -y git \
    build-essential \
    autoconf \
    pkg-config \
    libtool

apt-get autoremove -y

