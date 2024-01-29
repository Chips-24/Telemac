# HACKATHON 2024

## Downloading and loading the modules:
```bash
git clone https://github.com/Chips-24/Telemac.git
cd Telemac

module list
module avail
module use /tools/acfl/modulefiles/
module use /tools/Libs/modulefiles/
```

## For ACFL :
```bash
module load cmake/23.28.1 openmpi/acfl/4.1.6 acfl/23.10 armpl/21.0.0 

# Execution of environment scripts and installation of libraries:
source configs/pysource.acflHPC.sh # ou pysource.acflSLURM.sh pour soumettre les jobs à Slurm
config.py
source scripts/acfl/setup.sh
scripts/acfl/install_hdf5.sh
scripts/acfl/install_med.sh
scripts/acfl/install_metis.sh
compile_telemac.py --clean
config.py

# Example:
validate_telemac.py examples/telemac2d/gouttedo/vnv_gouttedo.py
```

## ForGNU :
```bash
module load cmake/23.28.1 openmpi/gnu/4.1.6 acfl/23.10 gnu/12.2.0 armpl/21.0.0

# Execution of environment scripts and installation of libraries:
source configs/pysource.gfortranHPC.sh # ou pysource.gfortranSLURM.sh pour soumettre les jobs à Slurm
config.py
source scripts/gnu/setup.sh
scripts/gnu/install_hdf5.sh
scripts/gnu/install_med.sh
scripts/gnu/install_metis.sh
compile_telemac.py --clean
config.py

# Example:
validate_telemac.py examples/telemac2d/gouttedo/vnv_gouttedo.py
```

## Validation tests (to be downloaded by the user):
- examples/gaia/turbidity-t3d/vnv_turbidity-t3d.py  
- examples/telemac2d/gouttedo/vnv_gouttedo.py  
- examples/telemac2d/malpasset/vnv_malpasset.py  
- examples/telemac2d/malpasset/vnv_malpasset_fine.py  
- examples/telemac3d/bump_static/vnv_bump_static.py  
- examples/telemac3d/malpasset/vnv_malpasset.py  
