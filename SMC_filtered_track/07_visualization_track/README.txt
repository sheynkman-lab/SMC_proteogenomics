230104

Run visualization_track module from the LRP pipeline.

Input files:
    1. SMC_with_cds.gtf -> SMC_CORRECTED.bed12 (Convert GTF to BED12)


Output files:
    1. SMC_CORRECTED_shaded_cpm.bed12 


Instructions to run this module:

    - Run slurm script: sbatch run_viz_track.slurm
                        sbatch run_make_region_bed_for_ucsc.slurm
    

Note: Here SMC_CORRECTED pertains to the SMC_FILTERED files.

