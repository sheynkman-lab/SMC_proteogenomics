230104

Run the CPAT module for the SMC project.

Input files:
    1. Human_Hexamer.tsv (Hexamer score to determine relative degree of hexamer usage bias in a particular sequence. 
       Positive values indicate a coding sequence, whereas negative values indicate a noncoding sequence.
    2. Human_logitModel.RData (logistic regression model)
    3. SMC_corrected.fasta (from SQANTI3)
    
Output files:
    1. SMC_CORRECTED_CPAT.ORF_seqs.fa 
    2. SMC_CORRECTED_CPAT.ORF_prob.tsv 
    3. SMC_CORRECTED_CPAT.ORF_prob.best.tsv 
    4. SMC_CORRECTED_CPAT.no_ORF.txt 


Instructions to run the CPAT module:

Here, it's run using singularity.
    - Load module singluarity and nextflow
    - Convert the docker image to singularity image: 'singularity pull docker://gsheynkmanlab/cpat'
      This creates a '.sif' file which can be stored as user's cache or in the same directory as the slurm scripts.
    - Run the slurm script


Other ways of running the module:

Using just Docker.
    - Need a UNIX system or a virtual machine (VM) to run Docker.
    - Instructions can be found here: https://hackmd.io/@mayankmurali/LRP_pipeline
    