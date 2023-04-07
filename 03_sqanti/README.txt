221220

SQANTI3 run using the LRP pipeline

Input files:
    1. GRCh38.primary_assembly.genome.fa
    2. gencode.v38.basic.annotation.gtf
    3. SMC.collapsed.gff (IsoSeq3)
    4. SMC.mapped_fl_count.txt (IsoSeq3)
    
Output files:
    1. SMC.params.txt
    2. SMC_classification.txt (imp)
    3. SMC_corrected.faa
    4. SMC_corrected.fasta (imp)
    5. SMC_corrected.gtf (imp)
    6. SMC_juctions.txt
    7. SMC_sqanti_report.pdf
    

Instructions to run the SQANTI3 module of nextflow pipeline:
    - Load module singluarity and nextflow
    - Convert the docker image to singularity image: 'singularity pull docker://gsheynkmanlab/sqanti3'
      This creates a '.sif' file which can be stored as user's cache or in the same directory as the slurm scripts.
    - Run the slurm script. 


On the 'SMC_classification.txt' output file, Ben ran a version of 'sqanti_fl.py' to sum up the full-length (FL) counts 
from all 12 samples into the FL column. This column (FL) will be later used to derive the CPM values in the 'orf_calling' module.

Run this python script:

    python3 sqanti_fl.py
   
