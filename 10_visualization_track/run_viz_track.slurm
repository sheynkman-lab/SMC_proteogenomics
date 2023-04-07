#!/bin/bash

#SBATCH --job-name="run_viz_track_on_smc_corrected"
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

#gtfToGenePred $CDS_GTF ${NAME}.genePred
#genePredToBed ${NAME}.genePred ${NAME}.bed12

# Converted using  Convert GTF to BED12 (Galaxy Version 357) 
BED12=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/10_visualization_track/SMC_CORRECTED_new.bed12

python3 /project/sheynkman/users/mayank/Projects/LRP/modules/visualization_track/src/track_add_rgb_colors_to_bed.py --name $NAME --bed_file $BED12


    


