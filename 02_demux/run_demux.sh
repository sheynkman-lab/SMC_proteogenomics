ISOSEQ_NEXTFLOW_IDIR=/Users/bj8th/Documents/Sheynkman-Lab/GitHub/IsoSeq-Nextflow/modules/demux
ISOSEQ_RESULTS_DIR=/Volumes/sheynkman/projects/smc_proteogenomics/full_pacbio_analysis/isoseq/results
DEMUX_RESULTS_DIR=/Volumes/sheynkman/projects/smc_proteogenomics/full_pacbio_analysis/demux/results
NAME=SMC

# python $ISOSEQ_NEXTFLOW_IDIR/demux.py \
# -idir $ISOSEQ_RESULTS_DIR \
# -odir $DEMUX_RESULTS_DIR \
# --name $NAME

python $ISOSEQ_NEXTFLOW_IDIR/demux_cpm.py \
-ifile $DEMUX_RESULTS_DIR/$NAME.demuxed_reads_by_barcode_and_file.tsv \
-odir $DEMUX_RESULTS_DIR \
--name $NAME