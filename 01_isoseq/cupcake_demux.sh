cDNA_Cupcake_dir=/Users/bj8th/Documents/Sheynkman-Lab/GitHub/cDNA_Cupcake
NAME=SMC
RESULTS_DIR=/Volumes/sheynkman/projects/smc_proteogenomics/full_pacbio_analysis/isoseq/results


python $cDNA_Cupcake_dir/post_isoseq_cluster/demux_isoseq_with_genome.py \
--mapped_fafq $RESULTS_DIR/isoseq3/collapse/collapsed.pb_acc_only.fasta \
--read_stat $RESULTS_DIR/isoseq3/collapse/${NAME}.collapsed.read_stat.txt \
--classify_csv $RESULTS_DIR/isoseq3/refine/full.flnc.report.csv \
-o ${NAME}.mapped_fl_count.txt