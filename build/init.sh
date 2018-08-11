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
git checkout 7b378d18a18b4696bd84ea907adf10d6da8b4d97
make -f Makefile.cvs
./configure --prefix=/usr/local/sumo
make
make install
cd ..
rm -rf sumo

