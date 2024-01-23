#!/usr/bin/env bash

MED_SOURCE=$HOMETEL/optionals/med-4.1.1

if [ ! -d "$MED_SOURCE" ];
then
  MED_ARCHIVE=/tmp/med-4.1.1.tar.gz
  wget http://files.salome-platform.org/Salome/medfile/med-4.1.1.tar.gz -O $MED_ARCHIVE
  tar xvf $MED_ARCHIVE -C $HOMETEL/optionals
  rm $MED_ARCHIVE
fi

set -x

mkdir -p $DEPSDIR

cd $MED_SOURCE

CC=armclang CFLAGS=-O2 CXX=armclang++ CXXFLAGS=-O2 FC=armflang FFLAGS=-O2 PYTHON_VERSION=3 ./configure --prefix=$DEPSDIR --with-hdf5=$HDF5HOME
make
make install

cd -
