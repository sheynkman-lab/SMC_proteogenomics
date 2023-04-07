# Create a conda environment, install necessary dependencies -> pandas, gtfparse.

conda activate lrp


python3 /project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/06_transcriptome_summary/pb_gene.py --sq_out /project/sheynkman/projects/smc_p
roteogenomics/pacbio_analysis_full/03_sqanti/results/sqanti3/SMC_classification.txt --ensg_to_gene ./../05_reference_table/ensg_gene.tsv --enst_to_isoname ./../05_referen
ce_table/enst_isoname.tsv --odir ./