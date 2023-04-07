## Code to validate the pacbio accessions in the smc_filtered_track.gtf 
## with SQANTI output smc_corrected.gtf (4 SMC cells)

#%%
from gtfparse import read_gtf

#  Find rows which are different between two gtf files.
def gtf_difference(df1: pd.DataFrame, df2: pd.DataFrame, which=None):

    comparison_df = df.merge(
        df_2,
        indicator=True,
        how='outer'
    )
    if which is None:
        diff_df = comparison_df[comparison_df['_merge'] != 'both']
    else:
        diff_df = comparison_df[comparison_df['_merge'] == which]

    diff_df.to_csv('diff_validation_master_only.csv')

if __name__ == "__main__":
    
    #Read master and filtered files as dataframe
    df = read_gtf("SMC/SMC_filtered_track_updated.gtf")
    df_2 = read_gtf("SMC/SMC_corrected.gtf")

    # which = 'both' -> present in both master and filtered file
    # which = 'left_only' -> present in only the master file
    # which = 'right_only' -> present in only the filter file 
    gtf_difference(df, df_2, 'right_only')







