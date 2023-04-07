230104

Run refine_orf_database module from the LRP pipeline.

Input files:
    1. SMC_CORRECTED_best_orf.tsv (orf_calling) 
    2. SMC_corrected.fasta (SQANTI)


Output files:
    1. SMC_CORRECTED_orf_refined.fasta
    2. SMC_CORRECTED_orf_refined.tsv


Instructions to run this module:

    - Run slurm script: sbatch run_refine_orf_db_py.slurm
    