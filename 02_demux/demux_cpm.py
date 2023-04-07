import pandas as pd
import argparse
import os 

def add_cpm_by_file(demuxed_reads):
    file_total = demuxed_reads.groupby('file')['fl_count'].sum().reset_index(name='total_fl_count_in_file')
    demuxed_reads = pd.merge(demuxed_reads, file_total, on='file')
    demuxed_reads['cpm'] = demuxed_reads['fl_count'] / demuxed_reads['total_fl_count_in_file'] * 1000000
    demuxed_reads.drop(columns = ['total_fl_count_in_file'], inplace=True)
    return demuxed_reads

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-ifile', '--demuxed_reads', action='store', dest='demuxed_reads')
    parser.add_argument('--name', action='store', dest='name')
    parser.add_argument('-odir', '--output_directory', action='store', dest='odir')
    args = parser.parse_args()

    demuxed_reads = pd.read_table(args.demuxed_reads)
    demuxed_reads = add_cpm_by_file(demuxed_reads)
    demuxed_reads.to_csv(os.path.join(args.odir, f'{args.name}.demuxed_reads.CPM.tsv'), sep='\t', index=False)

if __name__ == '__main__':
    main()