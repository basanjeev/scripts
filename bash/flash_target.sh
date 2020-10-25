#!/bin/bash

rm -fr prev/*
mv *.tar ./prev/.
rm index.html

serverbase="ftp://165.213.149.206/pub/slp/release/$1/"

wget ftp://165.213.149.206/pub/slp/release/$1/index.html

mvfile=`cat index.html | grep "\.movinand.bin.tar" | cut -d'"' -f2`
ubfile=`cat index.html | grep "\.ubi.img.tar" | cut -d'"' -f2`
kernel=`cat index.html | grep "evt0.tar" | cut -d'"' -f2`
modem=`cat index.html | grep "modem.tar" | cut -d'"' -f2`

echo "mv=$mvfile"
echo "ub=$ubfile"
echo $kernel
echo $modem

read a

wget $serverbase/$mvfile
wget $serverbase/$ubfile
wget $kernel
wget $modem

sudo ./x1dn *.tar
