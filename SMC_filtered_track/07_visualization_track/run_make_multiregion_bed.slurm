#!/bin/bash

#SBATCH --job-name="run_viz_track_multiregion_bed_on_smc_filtered_new"
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

NAME=SMC_CORRECTED
#CDS_GTF=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/09_make_pacbio_cds_gtf/SMC_CORRECTED_with_cds.gtf

SAMPLE_GTF=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/SMC_FILTERED_TRACK/06_make_pacbio_cds_gtf/SMC_FILTERED_with_cds.gtf
REFERENCE_GTF=/project/sheynkman/projects/smc_proteogenomics/reference/GENCODEV38/gencode.v38.basic.annotation.gtf


python3 /project/sheynkman/users/mayank/Projects/LRP/modules/visualization_track/src/make_region_bed_for_ucsc.py --name $NAME --sample_gtf $SAMPLE_GTF --reference_gtf $REFERENCE_GTF

