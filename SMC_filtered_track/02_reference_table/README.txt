230104

Run reference_table module from LRP pipeline.

Input files:
    1. gencode.v38.pc_transcripts.fa
    2. gencode.v38.basic.annotation.gtf

Output files:
    1. ensg_gene.tsv (imp)
    2. enst_isonome.tsv (imp)
    3. gene_ensp.tsv
    4. gene_isoname.tsv
    5. gene_lens.tsv
    6. isoname_lens.tsv
    7. protein_coding_genes.txt

Instructions to run this module:

    - Run slurm script: sbatch run_ref_table_py.slurm 
    