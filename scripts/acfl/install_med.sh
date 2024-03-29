#!/usr/bin/env bash

MED_SOURCE=$DEPS_SOURCEDIR/med-4.1.1

if [ ! -d "$MED_SOURCE" ];
then
  MED_ARCHIVE=/tmp/med-4.1.1.tar.gz
  wget http://files.salome-platform.org/Salome/medfile/med-4.1.1.tar.gz -O $MED_ARCHIVE
  tar xvf $MED_ARCHIVE -C $DEPS_SOURCEDIR
  rm $MED_ARCHIVE
fi

set -x

cd $MED_SOURCE

CC=armclang CFLAGS="-O2 -fPIC" CXX=armclang++ CXXFLAGS="-O2 -fPIC" FC=armflang FFLAGS="-O2 -fPIC" ./configure --prefix=$DEPSDIR --with-hdf5=$HDF5HOME --disable-python
make
make install

cd -
