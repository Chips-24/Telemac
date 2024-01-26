#!/usr/bin/bash
#SBATCH --job-name=maqao-
#SBATCH --output=maqao-%j.out
#SBATCH --error=maqao-%j.err
#SBATCH --time=2:00:00
#SBATCH --ntasks=64
#SBATCH --partition=basic-slurm
#SBATCH --exclusive
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=64

module use /tools/acfl/modulefiles
module use /tools/Libs/modulefiles
module load acfl/23.10
module load armpl/23.10.0 openmpi/acfl/4.1.6 cmake/23.28.1
source $HOME/Telemac/configs/pysource.acflMAQAO.sh
compile_telemac.py

OMP_NUM_THREADS=1 NB_PPN=64 <command> --nctile=64 --ncnode=1

