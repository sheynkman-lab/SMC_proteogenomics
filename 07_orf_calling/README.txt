230104

Run orf_calling module from the LRP pipeline.

Input files:
    1. SMC_CPAT.ORF_seqs.fa (CPAT)
    2. SMC_CPAT.ORF_prob.tsv (CPAT)
    3. gencode.v38.basic.annotation.gtf
    4. SMC_filtered_track_updated.gtf
    5. SMC_filtered_track_updated.fasta
    6. SMC_classification.txt (SQANTI)
    7. pb_gene.tsv


Output files:
    1. SMC_CORRECTED_best_orf.tsv

Instructions to run this module:

    - Run bash script: bash run_orf_calling_py.sh
    