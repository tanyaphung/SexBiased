import pandas as pd
from sklearn.utils import resample
import argparse


def parse_args():
	"""
	Parse command-line arguments
	"""

	parser = argparse.ArgumentParser(description="This script generates bootstraps to compute 95% confidence interval "
												 "for diversity and divergence.")

	parser.add_argument("--empirical_data", required=True,
						help="REQUIRED. Path to the empirical data that have information for both diversity and divergence.")

	parser.add_argument("--cutoff", required=True,
						help="REQUIRED.")

	parser.add_argument("--breed", required=True,
						help="REQUIRED.")

	parser.add_argument("--region", required=True,
						help="REQUIRED. Input chrX or autosomes")

	parser.add_argument("--rep", required=True,
						help="REQUIRED.")

	parser.add_argument("--out_directory", required=True,
						help="REQUIRED. Path to the directory where outputs should be saved.")

	args = parser.parse_args()
	return args

def main():

	# Parse command-line arguments
	args = parse_args()

	# Load data
	data = pd.read_table(args.empirical_data, header=None)

	# Create a bootstrap by sampling 100% of the data. It turns out that for each bootstrap, the total number of sites
	# in each bootstrap is close enough to the empirical data. The reason is that each fragment is very small.
	sample = resample(data, n_samples=len(data), replace=True)

	# Save each bootstrap to a file
	file = args.out_directory + '/cutoff_' + args.cutoff + '/' + args.breed + '/' + args.region + '/' + args.region + '_bootstrap_' + args.rep + '.txt'
	sample.to_csv(file, encoding='utf-8', index=False, header=None, sep='\t')

main()




