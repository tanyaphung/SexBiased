import os
import sys
import argparse

def parse_args():
        """
        Parse command-line arguments
        """
        parser = argparse.ArgumentParser(description="This script converts the output from the script generate_tentative_neutral_sites.py to the BED file (0-based).")

        parser.add_argument(
            "--input", required=True,
            help="REQUIRED. Input file. The input file is the output from the script generate_tentative_neutral_sites.py")

        parser.add_argument("--outfile", required=True, 
                        help="REQUIRED. Name of output file. This is the BED file BUT is 1-based.")

        args = parser.parse_args()
        return args

def main():
        args = parse_args()

        outfile = open(args.outfile, "w")

        with open(args.input, "r") as f:
                for line in f:
                        line = line.rstrip("\n")
                        line = line.split("\t")
                        toprint = [line[0], str(int(line[1]) - 1), line[1]]
                        print >>outfile, "\t".join(x for x in toprint)

main()
