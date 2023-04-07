230104

Run visualization_track module from the LRP pipeline.

Input files:
    1. SMC_with_cds.gtf -> SMC_CORRECTED.bed12 (Convert GTF to BED12)


Output files:
    1. SMC_CORRECTED_shaded_cpm.bed12 


Instructions to run this module:

    - Run slurm script: sbatch run_viz_track.slurm

Run slurm script run_make_multiregion_bed.slurm to make multiregion BED file for UCSC Genome Browser.
    