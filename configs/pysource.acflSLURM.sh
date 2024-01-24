# Path to TELEMAC root directory
export HOMETEL=$(dirname $(cd $(dirname $BASH_SOURCE) && pwd))
# Configuration file
export SYSTELCFG=$HOMETEL/configs/systel.acflSLURM.cfg
# Name of the configuration to use
export USETELCFG=acflSLURM
# Path to this file
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
# Path to dependencies directory
export DEPSDIR=$HOMETEL/deps/acfl
# Path to the METIS installation directory
export METISHOME=$DEPSDIR
export LD_LIBRARY_PATH=$METISHOME/lib:$LD_LIBRARY_PATH
# Path to hdf5 installation directory
export HDF5HOME=$DEPSDIR
export LD_LIBRARY_PATH=$HDF5HOME/lib:$LD_LIBRARY_PATH
# Path to MED installation directory
export MEDHOME=$DEPSDIR
export LD_LIBRARY_PATH=$MEDHOME/lib:$LD_LIBRARY_PATH
# Path to AED2 installation directory
export AED2HOME=$DEPSDIR
export LD_LIBRARY_PATH=$AED2HOME/lib:$LD_LIBRARY_PATH
