import os
import sys
import argparse

def parse_args():
        """
        Parse command-line arguments
        """
        parser = argparse.ArgumentParser(description="This script generates tentative neutral sites.")

        parser.add_argument(
            "--input", required=True,
            help="REQUIRED. Input file. The input file is the BED file format where the START and END coordinates represent tentative neutral regions. Because of BED format, this is 0-based.")

        parser.add_argument("--outfile", required=True, 
                        help="REQUIRED. Name of output file. The output file has 2 columns. The first column is the name of the chromosome. The second column is the position of the tentative neutral site in 1-based.")

        args = parser.parse_args()
        return args

def main():
        args = parse_args()

        outfile = open(args.outfile, "w")

        with open(args.input, "r") as f:
                for line in f:
                        line = line.rstrip("\n")
                        line = line.split("\t")
                        for i in range(int(line[1]), int(line[2])):
                            toprint = [line[0], str(i + 1)]
                            print >>outfile, "\t".join(x for x in toprint)

main()