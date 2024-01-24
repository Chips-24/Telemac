#!/usr/bin/env bash

HDF5_SOURCE=$DEPS_SOURCEDIR/hdf5-1.10.3

if [ ! -d "$HDF5_SOURCE" ];
then
  HDF5_ARCHIVE=/tmp/hdf5-1.10.3.tar.gz
  wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.3/src/hdf5-1.10.3.tar.gz -O $HDF5_ARCHIVE
  tar xvf $HDF5_ARCHIVE -C $DEPS_SOURCEDIR
  rm $HDF5_ARCHIVE
fi

set -x

cd $HDF5_SOURCE

CC=gcc CFLAGS="-fPIC" LDFLAGS="-fPIC" CXX=g++ FC=gfortran ./configure --prefix=$DEPSDIR
make
make install

cd -
