GENCODE_FASTA=/project/sheynkman/projects/smc_proteogenomics/reference/GENCODEV38/gencode.v38.pc_transcripts.fa
GENCODE_GTF=/project/sheynkman/projects/smc_proteogenomics/reference/GENCODEV38/gencode.v38.basic.annotation.gtf

PYTHON_DIR=/project/sheynkman/users/mayank/Projects/LRP/modules/generate_reference_tables/src/prepare_reference_tables.py

python $PYTHON_DIR \
--gtf $GENCODE_GTF \
--fa $GENCODE_FASTA \
--ensg_gene ensg_gene.tsv \
--enst_isoname enst_isoname.tsv \
--gene_ensp gene_ensp.tsv \
--gene_isoname gene_isoname.tsv \
--isoname_lens isoname_lens.tsv \
--gene_lens gene_lens.tsv \
--protein_coding_genes protein_coding_genes.txt