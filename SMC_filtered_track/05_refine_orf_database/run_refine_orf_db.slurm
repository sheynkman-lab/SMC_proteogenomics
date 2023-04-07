#!/bin/bash

#SBATCH --job-name="run_refine_orf_db_on_smc_filtered_new"
#SBATCH --ntasks-per-node=32
#SBATCH --cpus-per-task=1 #number of cores to use
#SBATCH --time=1-12:00:00 #amount of time for the whole job
#SBATCH --mem=500GB
#SBATCH --partition=standard #the queue/partition to run on
#SBATCH --account=sheynkman_lab
#SBATCH --output=%x-%j.log
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ncp5qm@virginia.edu
#%Module
module purge

# Activate anaconda environment
module --ignore-cache load "python/miniconda"
source activate lrp

NAME=SMC_FILTERED
BEST_ORFS=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/SMC_FILTERED_TRACK/04_orf_calling/SMC_FILTERED_best_orf.tsv
SAMPLE_FASTA=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/03_sqanti/results/sqanti3/SMC_corrected.fasta

python3 /project/sheynkman/users/mayank/Projects/LRP/modules/refine_orf_database/src/refine_orf_database.py --name $NAME --orfs $BEST_ORFS --pb_fasta $SAMPLE_FASTA --coding_score_cutoff 0

