#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y make \
                        build-essential \
                        libssl-dev zlib1g-dev \
                        libbz2-dev \
                        libreadline-dev \
                        libsqlite3-dev \
                        wget \
                        curl \
                        llvm \
                        libncurses5-dev \
                        libncursesw5-dev \
                        xz-utils \
                        tk-dev \
                        liblzma-dev


line=$(curl -s https://www.python.org/ftp/python/ | grep '.*\(3.[0-9][.][0-9]\)')
version=$(expr "$line" : '.*\(3.[0-9][.][0-9]\)')
echo $version

wget https://www.python.org/ftp/python/$version/Python-$version.tgz

tar xvf Python-$version.tgz
cd Python-$version

./configure --enable-optimizations --with-ensurepip=install
make -j 8
sudo make altinstall

cd ..
sudo rm -rf Python-$version*