#!/bin/bash

#SBATCH --job-name="run_ref_table_generation_on_smc_corrected"
#SBATCH --ntasks-per-node=32
#SBATCH --cpus-per-task=1 #number of cores to use
#SBATCH --time=1-12:00:00 #amount of time for the whole job
#SBATCH --mem=500GB
#SBATCH --partition=standard #the queue/partition to run on
#SBATCH --account=sheynkman_lab
#SBATCH --output=%x-%j.log
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ncp5qm@virginia.edu

module purge
module load singularity 
module load nextflow/20.10.0

export SINGULARITY_CACHEDIR=/scratch/$USER/singularity_cache 
export NXF_SINGULARITY_CACHEDIR=$SINGULARITY_CACHEDIR

singularity pull docker://gsheynkmanlab/generate-reference-tables

GENCODE_FASTA=/project/sheynkman/projects/smc_proteogenomics/reference/GENCODEV38/gencode.v38.pc_transcripts.fa
GENCODE_GTF=/project/sheynkman/projects/smc_proteogenomics/reference/GENCODEV38/gencode.v38.basic.annotation.gtf

PYTHON_DIR=/project/sheynkman/users/mayank/Projects/LRP/modules/generate_reference_tables/src/prepare_reference_tables.py
NXF_DIR=/project/sheynkman/users/mayank/Projects/LRP/modules/generate_reference_tables/ref_table_generation.nf
NXF_CONF_DIR=/project/sheynkman/users/mayank/Projects/LRP/modules/generate_reference_tables/nextflow.config

nextflow run $NXF_DIR --config $NXF_CONF_DIR \
--gencode_gtf $GENCODE_GTF \
--gencode_fasta $GENCODE_FASTA \
-with-singularity -without-docker

# python3 $PYTHON_DIR \
# --gtf $GENCODE_GTF \
# --fa $GENCODE_FASTA \
# --ensg_gene ensg_gene.tsv \
# --enst_isoname enst_isoname.tsv \
# --gene_ensp gene_ensp.tsv \
# --gene_isoname gene_isoname.tsv \
# --isoname_lens isoname_lens.tsv \
# --gene_lens gene_lens.tsv \
# --protein_coding_genes protein_coding_genes.txt