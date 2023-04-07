# Code to convert the sQTL excel file from (Civelek lab) into BED format
import re
import pandas as pd

df_file1 = pd.read_excel(f'sQTL of interest colocalized with CAD GWAS.xlsx')

num='0,0,255'

bed_lines = []
for _, row in df_file1.iterrows():
    match = re.match(r"(\d+):(\d+):(\d+):(.*)_([+-])", row['Cluster and ENSEMBL Gene ID'])
    chromosome, start, end, name, strand = match.groups()
    bed_lines.append(chromosome + "\t" + start + "\t" + end + "\t" + name + "\t" + "0" + "\t" + strand + "\t" + start + "\t" + end + "\t" + num + "\n")
bed_lines.sort(key=lambda x: (x.split()[0], int(x.split()[1]), int(x.split()[2])))
with open("Colocalized_Leafcutter_Junction_Clusters.bed", "a") as myfile:
    for line in bed_lines:
        myfile.write(line)