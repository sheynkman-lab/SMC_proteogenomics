conda activate lrp


python3 /project/sheynkman/users/mayank/Projects/LRP/modules/orf_calling/src/orf_calling.py --orf_coord ./../04_cpat/output/cpat/SMC_CORRECTED.ORF_prob.ts
v --orf_fasta ./../04_cpat/output/cpat/SMC_CORRECTED.ORF_seqs.fa --gencode ./../../reference/GENCODEV38/gencode.v38.basic.annotation.gtf --sample_gtf ./../03_sqanti/resul
ts/sqanti3/SMC_corrected.gtf --pb_gene ./../06_transcriptome_summary/pb_gene.tsv --classification ./../03_sqanti/results/sqanti3/SMC_classification.txt --sample_fasta ./.
./03_sqanti/results/sqanti3/SMC_corrected.fasta --num_cores 4 --output SMC_CORRECTED_best_orf.tsv

