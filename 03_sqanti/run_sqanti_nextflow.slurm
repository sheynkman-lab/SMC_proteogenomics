#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH -t 10:00:00
#SBATCH -p standard
#SBATCH -A sheynkman_lab
#SBATCH -o SQANTI.output
#SBATCH -e SQANTI.error

module purge
module load singularity nextflow/20.10.0

export SINGULARITY_CACHEDIR=/scratch/$USER/singularity_cache #this could also be in home or project storage 
export NXF_SINGULARITY_CACHEDIR=$SINGULARITY_CACHEDIR


NEXTFLOW_DIR=/scratch/bj8th/Long-Read-Proteogenomics
REFERENCE_DIR=/project/sheynkman/projects/smc_proteogenomics/GENCODEV38
GENOME_FASTA=$REFERENCE_DIR/GRCh38.primary_assembly.genome.fa
GENCODE_GTF=$REFERENCE_DIR/gencode.v38.basic.annotation.gtf
NAME=SMC

RESULTS_DIR=/project/sheynkman/projects/smc_proteogenomics/full_pacbio_analysis/isoseq/results
SAMPLE_GTF=$RESULTS_DIR/isoseq3/collapse/SMC.collapsed.gff
SAMPLE_GTF=/project/sheynkman/projects/smc_proteogenomics/full_pacbio_analysis/isoseq/results/isoseq3/collapse/SMC.collapsed.gff
FL_COUNT=$RESULTS_DIR/isoseq3/collapse/SMC.mapped_fl_count.txt
OUTDIR=/project/sheynkman/projects/smc_proteogenomics/full_pacbio_analysis/sqanti/results

nextflow $NEXTFLOW_DIR/modules/sqanti3/sqanti3.nf \
--name          $NAME \
--genome_fasta  $GENOME_FASTA \
--gencode_gtf   $GENCODE_GTF \
--sample_gtf    $SAMPLE_GTF \
--fl_count      $FL_COUNT \
--outdir        $OUTDIR \
-with-singularity -without-docker

