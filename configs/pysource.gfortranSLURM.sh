
# This file is a Linux environment file template
# Sourcing it will position all the environment variables required
# to compile and run TELEMAC
# You only need to replace <your-systel-file> and <your-config>
# to reflect your own configuration
#
# Path to TELEMAC root directory
###export HOMETEL=$HOME/Telemac
export HOMETEL=$(dirname $(cd $(dirname $BASH_SOURCE) && pwd))
# Configuration file
export SYSTELCFG=$HOMETEL/configs/systel.gnuSLURM.cfg
# Name of the configuration to use
export USETELCFG=gfortranSLURM
# Path to this file
###export SOURCEFILE=$HOMETEL/configs/pysource.gfortranHPC.sh
export SOURCEFILE=$(readlink -f $BASH_SOURCE[0])
# Add TELEMAC Python scripts to PATH
export PATH=$HOMETEL/scripts/python3:.:$PATH
# Add TELEMAC libraries to LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOMETEL/builds/$USETELCFG/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOMETEL/builds/$USETELCFG/wrap_api/lib:$LD_LIBRARY_PATH
# Add TELEMAC Python scripts and extension modules to PYTHONPATH
export PYTHONPATH=$HOMETEL/scripts/python3:$PYTHONPATH
export PYTHONPATH=$HOMETEL/builds/$USETELCFG/wrap_api/lib:$PYTHONPATH
# Force Python to flush its output
export PYTHONUNBUFFERED='true'
export DEPSDIR=$HOMETEL/deps/gnu
## For METIS
export METISHOME=$DEPSDIR
export LD_LIBRARY_PATH=$METISHOME/lib:$LD_LIBRARY_PATH
### HDF5 -------------------------------------------------------------
export HDF5HOME=$DEPSDIR
export LD_LIBRARY_PATH=$HDF5HOME/lib:$LD_LIBRARY_PATH
### MED -------------------------------------------------------------
export MEDHOME=$DEPSDIR
export LD_LIBRARY_PATH=$MEDHOME/lib:$LD_LIBRARY_PATH
###export PATH=$MEDHOME/bin:$PATH
# Path to AED2 installation directory
export AED2HOME=$DEPSDIR
export LD_LIBRARY_PATH=$AED2HOME/lib:$LD_LIBRARY_PATH

