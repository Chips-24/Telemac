#!/usr/bin/env bash

METIS_SOURCE=$DEPS_SOURCEDIR/metis-5.1.0

if [ ! -d "$METIS_SOURCE" ];
then
  METIS_ARCHIVE=/tmp/metis-5.1.0.tar.gz
  wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz -O $METIS_ARCHIVE
  tar xvf $METIS_ARCHIVE -C $DEPS_SOURCEDIR
  rm $METIS_ARCHIVE
fi

set -x

cd $METIS_SOURCE

make config cc=gcc prefix=$DEPSDIR
make
make install

cd -
