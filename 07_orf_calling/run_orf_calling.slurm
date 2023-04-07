#!/bin/bash

#SBATCH --job-name="run_orf_calling_on_smc_corrected_new"
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


python3 /project/sheynkman/users/mayank/Projects/LRP/modules/orf_calling/src/orf_calling.py --orf_coord ./../04_cpat/output/cpat/SMC_CORRECTED.ORF_prob.tsv --orf_fasta ./../04_cpat/output/cpat/SMC_CORRECTED.ORF_seqs.fa --gencode ./../../reference/GENCODEV38/gencode.v38.basic.annotation.gtf --sample_gtf ./../03_sqanti/results/sqanti3/SMC_corrected.gtf --pb_gene ./../06_transcriptome_summary/pb_gene.tsv --classification SMC_classification_new.txt --sample_fasta ./../03_sqanti/results/sqanti3/SMC_corrected.fasta --num_cores 4 --output SMC_CORRECTED_best_orf.tsv