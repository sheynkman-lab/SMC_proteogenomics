#!/bin/bash

#SBATCH --job-name="run_make_pacbio_cds_on_smc_corrected_new"
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
SAMPLE_GTF=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/03_sqanti/results/sqanti3/SMC_corrected.gtf
REFINED_DB=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/08_refine_orf_database/SMC_CORRECTED_orf_refined.tsv
ORFS=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/07_orf_calling/SMC_CORRECTED_best_orf.tsv
PB_GENE=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/06_transcriptome_summary/pb_gene.tsv

python3 /project/sheynkman/users/mayank/Projects/LRP/modules/visualization_track/src/make_pacbio_cds_gtf.py --name $NAME --sample_gtf $SAMPLE_GTF --refined_database $REFINED_DB --called_orfs $ORFS --pb_gene $PB_GENE --include_transcript yes


