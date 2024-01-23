#!/usr/bin/env bash

METIS_SOURCE=$HOMETEL/optionals/metis-5.1.0

if [ ! -d "$METIS_SOURCE" ];
then
  METIS_ARCHIVE=/tmp/metis-5.1.0.tar.gz
  wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz -O $METIS_ARCHIVE
  tar xvf $METIS_ARCHIVE -C $HOMETEL/optionals
  rm $METIS_ARCHIVE
fi

set -x

cd $METIS_SOURCE

make config $@
make
make install

cd -
