#!/usr/bin/env bash

AED2_SOURCE=$DEPS_SOURCEDIR/aed2_1.2

if [ ! -d "$AED2_SOURCE" ];
then
  AED2_ARCHIVE=/tmp/aed2_1.2.tgz
  wget http://www.opentelemac.org/downloads/Installation%20files/Manual%20installation%20-%20Sources/aed2_1.2.tgz -O $AED2_ARCHIVE
  tar xvf $AED2_ARCHIVE -C $DEPS_SOURCEDIR
  rm $AED2_ARCHIVE
fi

set -x

cd $AED2_SOURCE

cp $HOMETEL/optionals/MakefileAED2 $AED2_SOURCE/Makefile
make shared
make
cp *.mod include/* $AED2HOME/include
cp libaed2.so libaed2.a $AED2HOME/lib

cd -
