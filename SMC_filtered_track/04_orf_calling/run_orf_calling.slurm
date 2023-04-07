#!/bin/bash

#SBATCH --job-name="run_orf_calling_on_smc_filtered_new"
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


ORF_COORD=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/SMC_FILTERED_TRACK/01_cpat/output/cpat/SMC_FILTERED.ORF_prob.tsv
ORF_FASTA=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/SMC_FILTERED_TRACK/01_cpat/output/cpat/SMC_FILTERED.ORF_seqs.fa
GENCODE=/project/sheynkman/projects/smc_proteogenomics/reference/GENCODEV38/gencode.v38.basic.annotation.gtf
SAMPLE_GTF=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/03_sqanti/results/sqanti3/SMC_corrected.gtf
PB_GENE=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/SMC_FILTERED_TRACK/03_transcriptome_summary/output/pb_gene.tsv
#CLASSIFICATION=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/03_sqanti/results/sqanti3/SMC_classification.txt
CLASSIFICATION=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/SMC_FILTERED_TRACK/04_orf_calling/SMC_classification_new.txt
SAMPLE_FASTA=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/03_sqanti/results/sqanti3/SMC_corrected.fasta
OFILE=SMC_FILTERED_best_orf.tsv

python3 /project/sheynkman/users/mayank/Projects/LRP/modules/orf_calling/src/orf_calling.py --orf_coord $ORF_COORD --orf_fasta $ORF_FASTA --gencode $GENCODE --sample_gtf $SAMPLE_GTF --pb_gene $PB_GENE --classification $CLASSIFICATION --sample_fasta $SAMPLE_FASTA --num_cores 4 --output $OFILE