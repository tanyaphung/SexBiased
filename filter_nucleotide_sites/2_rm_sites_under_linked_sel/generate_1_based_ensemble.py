import os
import sys
import argparse

def parse_args():
        """
        Parse command-line arguments
        """
        parser = argparse.ArgumentParser(description="This script generates a file that contains the START and END of each ensemble gene in 1-based. The reason for this script is that I want to concat this together with the file of the tentative neutral site in order to interpolate the genetic distance.")

        parser.add_argument(
            "--input", required=True,
            help="REQUIRED. Input file. The input file is the BED file format where the START and END coordinates represent ensemble genes.")

        parser.add_argument("--outfile", required=True, 
                        help="REQUIRED. Name of output file. The output file has 2 columns. The first column is the name of the chromosome. The second column is the START or END in 1-based.")

        args = parser.parse_args()
        return args

def main():
        args = parse_args()

        outfile = open(args.outfile, "w")

        with open(args.input, "r") as f:
                for line in f:
                        line = line.rstrip("\n")
                        line = line.split("\t")
                        toprint = [line[0], str(int(line[1])+1)]
                        print >>outfile, "\t".join(x for x in toprint)
                        toprint = [line[0], line[2]]
                        print >>outfile, "\t".join(x for x in toprint)

main()