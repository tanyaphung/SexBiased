import pandas as pd
from sklearn.utils import resample
import numpy as np
import argparse


def parse_args():
	"""
	Parse command-line arguments
	"""

	parser = argparse.ArgumentParser(description="This script computes the 95% confidence interval for qfst where fst "
												 "is obtained from weir and cockerham formulas as implemented in SNPRelate.")

	parser.add_argument("--autosomes_bt_fst", required=True,
						help="REQUIRED.")

	parser.add_argument("--chrX_bt_fst", required=True,
						help="REQUIRED.")

	parser.add_argument("--outfile", required=True,
					help="REQUIRED. Path to the output file.")

	args = parser.parse_args()
	return args

def main():

	args = parse_args()

	# Load data
	autosomes_bt_fst = pd.read_table(args.autosomes_bt_fst, header=None)
	chrX_bt_fst = pd.read_table(args.chrX_bt_fst, header=None)

	# Compute qfst for bootstrapped data
	qfst_bt = np.log(1 - 2*autosomes_bt_fst.iloc[:,2]) / np.log(1 - 2*chrX_bt_fst.iloc[:,2])

	# Compute the 95% confidence interval
	alpha = 0.95
	p = ((1.0 - alpha) / 2.0) * 100
	lower = max(0.0, np.nanpercentile(qfst_bt, p))
	p = (alpha + ((1.0 - alpha) / 2.0)) * 100
	upper = min(1.0, np.nanpercentile(qfst_bt, p))

	# Set up the output file
	outfile = open(args.outfile, 'w')
	header = ['lower', 'upper']
	outfile.write('\t'.join(header) + '\n')

	to_print = [str(lower), str(upper)]
	outfile.write('\t'.join(to_print) + '\n')

main()




