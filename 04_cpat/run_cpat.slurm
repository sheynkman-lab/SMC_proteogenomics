#!/bin/bash

#SBATCH --job-name="run_cpat_on_smc_corrected"
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
module load singularity nextflow/20.10.0

export SINGULARITY_CACHEDIR=/scratch/$USER/singularity_cache 
export NXF_SINGULARITY_CACHEDIR=$SINGULARITY_CACHEDIR

NAME=SMC_CORRECTED
INPUT_FASTA=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/03_sqanti/results/sqanti3/SMC_corrected.fasta 
INPUT_HEXAMER=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/04_cpat/Human_Hexamer.tsv 
INPUT_MODEL=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/04_cpat/Human_logitModel.RData 
MIN_ORF=50
CPAT_NXF_DIR=/project/sheynkman/users/mayank/Projects/LRP/modules/cpat/cpat.nf
NXF_CONF_DIR=/project/sheynkman/users/mayank/Projects/LRP/modules/cpat/nextflow.config
OUTDIR=/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/04_cpat/output/

nextflow run $CPAT_NXF_DIR --config $NXF_CONF_DIR \
--name $NAME \
--hexamer $INPUT_HEXAMER \
--logit_model $INPUT_MODEL \
--sample_fasta $INPUT_FASTA \
--min_orf $MIN_ORF \
--outdir $OUTDIR \
-with-singularity -without-docker
