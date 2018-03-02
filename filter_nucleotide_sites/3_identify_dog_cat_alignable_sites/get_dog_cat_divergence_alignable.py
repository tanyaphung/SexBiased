import argparse


def parse_args():
    """
    Parse command-line arguments
    :return:
    """

    parser = argparse.ArgumentParser(description='Obtain a bed file from the AXT summary line file that represents '
                                                 'the coordinates that are alignable between the two species.')

    parser.add_argument('--summary_lines', required=True,
                        help='REQUIRED. Path to the summary line file.')

    parser.add_argument('--outfile', required=True,
                        help='REQUIRED. Path to the output file.')

    args = parser.parse_args()
    return args

def main():

    # Parse command-line arguments
    args = parse_args()

    # Open the output file
    outfile = open(args.outfile, 'w')

    # Make the BED file. Note that BED file is 0-based and the end coordinate is not included.
    with open(args.summary_lines) as f:
        for line in f:
            line = line.rstrip("\n")
            line = line.split(" ")
            to_print = [line[1], str(int(line[2]) - 1), line[3]]
            print >>outfile, "\t".join(x for x in to_print)

main()

