import pandas as pd
import numpy as np
import argparse


def parse_args():
    """
    Parse command-line arguments
    """

    parser = argparse.ArgumentParser(description="This script computes the 95% confidence interval.")

    parser.add_argument("--X_emp", required=True,
                        help="REQUIRED. Path to empirical diversity and divergence data on the X.")

    parser.add_argument("--A_emp", required=True,
                        help="REQUIRED. Path to empirical diversity and divergence data on the A.")

    parser.add_argument("--directory", required=True,
                        help="REQUIRED. Path to the directory where the bootstraps are stored.")

    parser.add_argument("--cutoff", required=True,
                        help="REQUIRED.")

    parser.add_argument("--breed", required=True,
                        help="REQUIRED.")

    parser.add_argument("--X_outfile", required=True,
                        help="REQUIRED. Path to the output file for the X.")

    parser.add_argument("--A_outfile", required=True,
                        help="REQUIRED. Path to the output file for the A.")

    parser.add_argument("--X_A_outfile", required=True,
                        help="REQUIRED. Path to the output file for X/A ratio.")

    args = parser.parse_args()
    return args

def main():

    args = parse_args()

    # Load empirical data
    X_emp = pd.read_table(args.X_emp, header=None)
    A_emp = pd.read_table(args.A_emp, header=None)


    # Compute uncorrected and corrected pi for X
    X_emp_sum = X_emp.sum(axis=0)
    X_emp_pi_uncorrected = X_emp_sum[3] / X_emp_sum[2]
    X_emp_div = X_emp_sum[5] / X_emp_sum[4]
    X_emp_pi_corrected = X_emp_pi_uncorrected / X_emp_div

    # Compute uncorrected and corrected pi for A
    A_emp_sum = A_emp.sum(axis=0)
    A_emp_pi_uncorrected = A_emp_sum[3] / A_emp_sum[2]
    A_emp_div = A_emp_sum[5] / A_emp_sum[4]
    A_emp_pi_corrected = A_emp_pi_uncorrected / A_emp_div

    # Compute uncorrected and corrected X/A ratio
    X_A_ratio_uncorrected = X_emp_pi_uncorrected / A_emp_pi_uncorrected
    X_A_ratio_corrected = X_emp_pi_corrected / A_emp_pi_corrected

    # Compute uncorrected and corrected pi for all bootstraps on the X.
    pi_X_all_bts_uncorrected = []
    pi_X_all_bts_corrected = []

    for i in range(1, 1001):
        file = args.directory + '/cutoff_' + args.cutoff \
               + '/' + args.breed + '/chrX/chrX_bootstrap_' + str(i) + '_rmPAR.txt'

        # Load each bootstrap replicate into a pandas dataframe
        bootstrap = pd.read_table(file, header=None)

        # Compute uncorrected and corrected pi for each bootstrap on the X.
        bootstrap_sum = bootstrap.sum(axis=0)
        bootstrap_pi_uncorrected = bootstrap_sum[3] / bootstrap_sum[2]
        bootstrap_div = bootstrap_sum[5] / bootstrap_sum[4]
        bootstrap_pi_corrected = bootstrap_pi_uncorrected / bootstrap_div

        pi_X_all_bts_uncorrected.append(bootstrap_pi_uncorrected)
        pi_X_all_bts_corrected.append(bootstrap_pi_corrected)

    # Compute uncorrected and corrected pi for all bootstraps on the A.
    pi_A_all_bts_uncorrected = []
    pi_A_all_bts_corrected = []

    for i in range(1, 1001):
        file = args.directory + '/cutoff_' + args.cutoff \
               + '/' + args.breed + '/autosomes/autosomes_bootstrap_' + str(i) + '.txt'

        # Load each bootstrap replicate into a pandas dataframe
        bootstrap = pd.read_table(file, header=None)

        # Compute uncorrected and corrected pi for each bootstrap on the A.
        bootstrap_sum = bootstrap.sum(axis=0)
        bootstrap_pi_uncorrected = bootstrap_sum[3] / bootstrap_sum[2]
        bootstrap_div = bootstrap_sum[5] / bootstrap_sum[4]
        bootstrap_pi_corrected = bootstrap_pi_uncorrected / bootstrap_div

        pi_A_all_bts_uncorrected.append(bootstrap_pi_uncorrected)
        pi_A_all_bts_corrected.append(bootstrap_pi_corrected)


    # Compute uncorrected and corrected X/A ratio for all bootstraps
    X_A_ratio_bts_uncorrected = []
    X_A_ratio_bts_corrected = []
    for i in range(0, 1000):
        X_A_ratio_bts_uncorrected.append(pi_X_all_bts_uncorrected[i] / pi_A_all_bts_uncorrected[i])
        X_A_ratio_bts_corrected.append(pi_X_all_bts_corrected[i] / pi_A_all_bts_corrected[i])

    # Compute the 95% confidence interval
    alpha = 0.95

    p = ((1.0 - alpha) / 2.0) * 100
    X_pi_uncorrected_lower = max(0.0, np.percentile(pi_X_all_bts_uncorrected, p))
    X_pi_corrected_lower = max(0.0, np.percentile(pi_X_all_bts_corrected, p))

    A_pi_uncorrected_lower = max(0.0, np.percentile(pi_A_all_bts_uncorrected, p))
    A_pi_corrected_lower = max(0.0, np.percentile(pi_A_all_bts_corrected, p))

    X_A_ratio_uncorrected_lower = max(0.0, np.percentile(X_A_ratio_bts_uncorrected, p))
    X_A_ratio_corrected_lower = max(0.0, np.percentile(X_A_ratio_bts_corrected, p))

    p = (alpha + ((1.0 - alpha) / 2.0)) * 100
    X_pi_uncorrected_upper = max(0.0, np.percentile(pi_X_all_bts_uncorrected, p))
    X_pi_corrected_upper = max(0.0, np.percentile(pi_X_all_bts_corrected, p))

    A_pi_uncorrected_upper = max(0.0, np.percentile(pi_A_all_bts_uncorrected, p))
    A_pi_corrected_upper = max(0.0, np.percentile(pi_A_all_bts_corrected, p))

    X_A_ratio_uncorrected_upper = max(0.0, np.percentile(X_A_ratio_bts_uncorrected, p))
    X_A_ratio_corrected_upper = max(0.0, np.percentile(X_A_ratio_bts_corrected, p))

    # Set up the output file
    header = ['pi_uncorrected', 'lower', 'upper', 'pi_corrected', 'lower', 'upper']
    X_outfile = open(args.X_outfile, 'w')
    X_outfile.write('\t'.join(header) + '\n')
    to_print = [str(X_emp_pi_uncorrected), str(X_pi_uncorrected_lower), str(X_pi_uncorrected_upper), str(X_emp_pi_corrected), str(X_pi_corrected_lower), str(X_pi_corrected_upper)]
    X_outfile.write('\t'.join(to_print) + '\n')

    A_outfile = open(args.A_outfile, 'w')
    A_outfile.write('\t'.join(header) + '\n')
    to_print = [str(A_emp_pi_uncorrected), str(A_pi_uncorrected_lower), str(A_pi_uncorrected_upper), str(A_emp_pi_corrected), str(A_pi_corrected_lower), str(A_pi_corrected_upper)]
    A_outfile.write('\t'.join(to_print) + '\n')

    X_A_outfile = open(args.X_A_outfile, 'w')
    X_A_outfile.write('\t'.join(header) + '\n')
    to_print = [str(X_A_ratio_uncorrected), str(X_A_ratio_uncorrected_lower), str(X_A_ratio_uncorrected_upper),
                str(X_A_ratio_corrected), str(X_A_ratio_corrected_lower), str(X_A_ratio_corrected_upper)]
    X_A_outfile.write('\t'.join(to_print) + '\n')

main()
