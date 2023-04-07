230104

Run CPAT module on the filtered PacBio transcript file (SMC_filtered_track.gtf).
The filteration was based on the following criteria:
    - Transcript present in ≥ 2 samples
    - Isoform % ≥ 1%
    
There was a confusion regarding the 'SMC_filtered_track.gtf' whether it originated from the initial LRP run on single sample 
(pacbio_analysis_one_cell) or from LRP run on all 4 samples (pacbio_analysis_full). Validation was performed to cross check the 
transcript information (in SMC_filter_file_validation directory)

Input files:
    1. Human_Hexamer.tsv (Hexamer score to determine relative degree of hexamer usage bias in a particular sequence. 
       Positive values indicate a coding sequence, whereas negative values indicate a noncoding sequence.
    2. Human_logitModel.RData (logistic regression model)
    3. SMC_filtered_track_updated.fasta 
    
The 'SMC_filtered_track_updated.fasta' was derived from 'SMC_filtered_track.gtf' and 'SMC_corrected.fasta' (SQANTI3 output) file using gffread library.

gffread -w SMC_filtered_track_updated.fasta -g SMC_corrected.fasta SMC_filtered_track.gtf
    
Output files:
    1. SMC_FILTERED_CPAT.ORF_seqs.fa 
    2. SMC_FILTERED_CPAT.ORF_prob.tsv 
    3. SMC_FILTERED_CPAT.ORF_prob.best.tsv 
    4. SMC_CFILTERED_PAT.no_ORF.txt 


Instructions to run the CPAT module:

Here, it's run using singularity.
    - Load module singluarity and nextflow
    - Convert the docker image to singularity image: 'singularity pull docker://gsheynkmanlab/cpat'
      This creates a '.sif' file which can be stored as user's cache or in the same directory as the slurm scripts.
    - Run the slurm script