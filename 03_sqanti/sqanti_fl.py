#%%
import pandas as pd

sqanti = pd.read_table('/project/sheynkman/projects/smc_proteogenomics/pacbio_analysis_full/03_sqanti/results/sqanti3/SMC_classification.txt')

fl_columns = [col for col in sqanti.columns if col.startswith('FL.')]

sqanti['FL'] = sqanti[fl_columns].sum(axis=1)

sqanti.to_csv('SMC_classification.txt', sep='\t', index=False)

# %%