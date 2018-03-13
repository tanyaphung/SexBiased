import os
import sys
import argparse
import csv

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script takes in a GT file and do a couple of things. First, it will remove any variant where the genoptypes are all monomorphic (0/0 or 1/1). Then it will keep the variants that are biallelic.")

	parser.add_argument(
            "--GT_file", required=True,
            help="REQUIRED. The GT file obtained from VCFtools. The header should be present and should be (1) CHROM, (2) POS, (3) and more are the genotypes of each of the individual.")
	parser.add_argument("--outfile", required=True, 
	    help="REQUIRED. Name of output file.")
	
	args = parser.parse_args()
	return args

def main():
	args = parse_args()
	outfile = open(args.outfile, "w")
	with open(args.GT_file,"r") as GT_file:
		for line in GT_file:
			if not line.startswith("CHROM"):
				line = line.rstrip("\n")
				line = line.split("\t")
				each_variant_GT = []
				for each_GT in line[2:]:
					each_variant_GT.append(each_GT)
				if not all(i == '0/0' for i in each_variant_GT):
					if not all(i == '1/1' for i in each_variant_GT):
						if all(i in {'0/1', '1/0', '1/1', '0/0'} for i in each_variant_GT):
							to_print = [str(line[0]), str(line[1])]
							for i in each_variant_GT:
								to_print.append(str(i))
							print >>outfile,"\t".join(x for x in to_print)
main()
			
