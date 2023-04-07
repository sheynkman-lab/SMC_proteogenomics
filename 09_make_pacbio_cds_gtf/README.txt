230104

Run make_pacbio_cds_gtf module from the LRP pipeline.

Input files:
    1. SMC_corrected.gtf (SQANTI)
    2. SMC_CORRECTED_orf_refined.tsv (refine_orf_database)
    3. SMC_CORRECTED_best_orf.tsv (orf_calling)
    4. pb_gene.tsv (transcriptome_summary)


Output files:
    1. SMC_CORRECTED_with_cds.gtf


Instructions to run this module:

    - Run slurm script: sbatch run_make_pb_cds.slurm
    