#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH -t 10:00:00
#SBATCH -p standard
#SBATCH -A sheynkman_lab
#SBATCH -o ISOSEQ.output
#SBATCH -e ISOSEQ.error

module purge
module load singularity nextflow/20.10.0

export SINGULARITY_CACHEDIR=/scratch/$USER/singularity_cache  
export NXF_SINGULARITY_CACHEDIR=$SINGULARITY_CACHEDIR

ODIR=/project/sheynkman/projects/smc_proteogenomics/isoseq/results
CCS_READS=/project/sheynkman/projects/smc_proteogenomics/PacBio_Data/all_reads
BARCODES=/project/sheynkman/projects/smc_proteogenomics/full_pacbio_analysis/isoseq/smc_barcodes.fasta
GENOME_FASTA=/project/sheynkman/projects/smc_proteogenomics/GENCODEV38/GRCh38.primary_assembly.genome.fa
NAME=SMC

NEXTFLOW_LOCATION=https://github.com/sheynkman-lab/IsoSeq-Nextflow


nextflow run $NEXTFLOW_LOCATION \
-r v1.0.0 \
--ccs_reads $CCS_READS \
--barcodes $BARCODES \
--genome_fasta $GENOME_FASTA \
--name $NAME \
-with-singularity \
-without-docker \
--outdir $ODIR

