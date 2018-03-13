import os
import sys
import argparse
import csv
from collections import Counter

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script generates the count for a folded SFS from VCF")

	parser.add_argument(
            "--variants", required=True,
            help="REQUIRED. VCF file. Because of VCF format, it is 1-based. Also note that you should pass in the variants post all the filtering. In other words, this script will not do any filtering.")
	parser.add_argument(
			"--numAllele", required=True,
			help="REQUIRED. Indicate the number of alleles, which is equal to the number of individuals in your sample times 2.")
	parser.add_argument(
			"--outfile", required=True,
			help="REQUIRED. Name of the output file")

	args = parser.parse_args()
	return args

def generate_foldedSFS(numAlleles, variants):
	""" Following equation 1.2 from John Wakeley book."""
	"""
	This script takes in:
	(1) a number indicating the number of alleles in your sample 
	(2) a list. Each item in this list is also a list where the first item is the position of the variant in 1-based coordinate and the rest is the genotypes. The length of this list should be equal to (1 + numAlleles/2)
	"""
	altAllele = [] ## This is a list where each item is the count of the number of alternate alleles of each variant. The length of this list is equal to the number of variants you have.
	for record in variants:
		count = 0
		for genotype in record[1:]:
			if genotype == '0/1' or genotype == '1/0':
				count += 1
			if genotype == '1/1':
				count += 2
		altAllele.append(count)

	zeta = Counter(altAllele)

	eta = {} # See Wakeley book equation 1.2
	for i in range(1, (numAlleles/2)+1):
		if i != (numAlleles-i):
			frequency = float(zeta[i] + zeta[numAlleles - i])
			eta[i] = frequency
		if i == (numAlleles - i):
			frequency = float(zeta[i] + zeta[numAlleles - i])/2
			eta[i] = frequency

	return eta

def main():
	# parsing command-line arguments
	args = parse_args()

	# setting variables
	numAlleles = int(args.numAllele)
	variants = [] # this is a list. Each item in this list is a list where the first item is the genomic position (1-based).

	with open(args.variants, "r") as variant_file:
		for line in variant_file:
			line = line.rstrip("\n")
			if not line.startswith("CHROM"):
				line = line.split("\t")
				to_append = [int(line[1])]
				for i in range(2, len(line)):
					to_append.append(line[i])
				if './.' not in to_append:
					variants.append(to_append)

	results = generate_foldedSFS(numAlleles, variants) 

	with open(args.outfile, "w") as f:
		out_list = []
		for key in sorted(results):
			out_list.append([key, results[key]])
		w = csv.writer(f)
		w.writerows(out_list)
main()		
