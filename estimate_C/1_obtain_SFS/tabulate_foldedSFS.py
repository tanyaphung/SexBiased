import os
import sys
import argparse

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script tabulates the count for each bin of the SFS across all chromosomes.")

	parser.add_argument(
            "--directory", required=True,
            help="REQUIRED. Input the directory where there should be X files where each file is the count for each bin of the SFS for each of the autosomes")

	parser.add_argument(
            "--numInd", required=True,
            help="REQUIRED. Input the number of individuals.")

	parser.add_argument(
			"--outfile", required=True,
			help="REQUIRED. Name of the output file")

	args = parser.parse_args()
	return args

def main():
	# parsing command-line arguments
	args = parse_args()
	outfile = open(args.outfile, "w")
	
	autosome_eta = {}
	for i in range(1, int(args.numInd)+1):
		autosome_eta[i] = 0

	for file in os.listdir(args.directory):
		with open(os.path.join(args.directory, file), "rU") as f:
			for line in f:
				line = line.strip("\n")
				line = line.split(",")
				autosome_eta[int(line[0])] += float(line[1])

	for k, v in autosome_eta.iteritems():
		toprint = [str(k), str(v)]
		print >>outfile, ",".join(x for x in toprint)
main()
