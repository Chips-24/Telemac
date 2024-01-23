# Path to TELEMAC root directory
export HOMETEL=$(dirname $(cd $(dirname $BASH_SOURCE) && pwd))
# Configuration file
export SYSTELCFG=$HOMETEL/configs/systel.acfl.cfg
# Name of the configuration to use
export USETELCFG=acfl
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
