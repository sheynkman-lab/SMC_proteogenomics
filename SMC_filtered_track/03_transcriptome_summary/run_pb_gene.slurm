#!/bin/bash

#SBATCH --job-name="run_transcript_summary_on_smc_filtered"
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

SQ_OUT=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/03_sqanti/results/sqanti3/SMC_classification.txt
ENSG_GENE=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/SMC_FILTERED_TRACK/02_reference_table/ensg_gene.tsv
ENST_ISONAME=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/SMC_FILTERED_TRACK/02_reference_table/enst_isoname.tsv
ODIR=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/SMC_FILTERED_TRACK/03_transcriptome_summary/output

python3 /project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/06_transcriptome_summary/pb_gene.py --sq_out $SQ_OUT --ensg_to_gene $ENSG_GENE --enst_to_isoname $ENST_ISONAME --odir $ODIR