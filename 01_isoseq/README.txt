221220

Running Iso-Seq3 piecemeal.

Input files:  
	smc_barcodes.fasta
	GRCh38.primary_assembly.genome.fa
	4x  ST94B_cell…hifi_reads.ccs.bam 
Output files:
	SMC.collapsed.abundance.txt
	SMC.collapsed.fasta
	SMC.collapsed.gff
	SMC.collapsed.group.txt
	SMC.collapsed.read_stat.txt
	
	collapsed.pb_acc_only.fasta


Then, cupcake was run on the Iso-Seq output to create the FL count matrix.

Input files:
	Unknown - but probably the barcoded read counts
Output files:
	SMC.mapped_fl_count.txt