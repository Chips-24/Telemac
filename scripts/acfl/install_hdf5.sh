#!/usr/bin/env bash

HDF5_SOURCE=$HOMETEL/optionals/hdf5-1.10.2

if [ ! -d "$HDF5_SOURCE" ];
then
  HDF5_ARCHIVE=/tmp/hdf5-1.10.2.tar.gz
  wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.2/src/hdf5-1.10.2.tar.gz -O $HDF5_ARCHIVE
  tar xvf $HDF5_ARCHIVE -C $HOMETEL/optionals
  rm $HDF5_ARCHIVE
fi

set -x

mkdir -p $DEPSDIR

cd $HDF5_SOURCE

CC=armclang CFLAGS="-fPIC -Wno-error=implicit-function-declaration -Wno-error=incompatible-function-pointer-types" CXX=armclang++ FC=armflang ./configure --prefix=$DEPSDIR
make
make install

cd -
