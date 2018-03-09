import pandas as pd
from sklearn.utils import resample
import argparse


def parse_args():
    """
    Parse command-line arguments
    """

    parser = argparse.ArgumentParser(description="This script generates bootstrapped VCF files.")

    parser.add_argument("--VCF", required=True,
                        help="REQUIRED. Path to the VCF file. Note that this VCF file should have header removed (removed #).")

    parser.add_argument("--directory", required=True,
                        help="REQUIRED. Path to the directory to save the bootstrap VCF files.")

    parser.add_argument("--cutoff", required=True,
                        help="REQUIRED.")

    parser.add_argument("--region", required=True,
                        help="REQUIRED. Indicate chrX or autosomes.")


    args = parser.parse_args()
    return args

def main():
    args = parse_args()

    # Load data
    data = pd.read_table(args.VCF, header=None)

    for i in range(1, 1001):
        # Resample with replacement
        sample = resample(data, n_samples=len(data), replace=True)

        # Save each bootstrap to an outfile
        file = args.directory + '/cutoff_' + args.cutoff + '/' + args.region + '/cutoff_' + args.cutoff + '_bootstrap_' + str(i) + '.txt'
        sample.to_csv(file, encoding='utf-8', index=False, header=None, sep='\t')

main()