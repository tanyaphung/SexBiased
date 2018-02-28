import os
import sys
import argparse

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script finds the minimum genetic distance (in cM) between the tentative neutral region and its closest gene.")

	parser.add_argument(
            "--genetic_map", required=True,
            help="REQUIRED. Input genetic map file.")
	parser.add_argument(
    		"--tentative_neutral", required=True,
            help="REQUIRED. Input tentative neutral regions. This is the file after using bedtools to find the closest genes.")
	parser.add_argument("--outfile", required=True, 
			help="REQUIRED. Name of output file.")

	args = parser.parse_args()
	return args

def compute_gen_dist(pos1, pos2, pos_cM):

	gen_dist_cM = float((pos_cM[pos2]-pos_cM[pos1]))
	return abs(gen_dist_cM)

def main():
	args = parse_args()
	outfile = open(args.outfile, "w")

	pos_cM = {}
	with open(args.genetic_map, "r") as f:
		for line in f:
			line = line.rstrip("\n")
			line = line.split("\t")
			pos_cM[float(line[0])] = float(line[1])

	with open(args.tentative_neutral, "r") as f:
		for line in f:
			line = line.rstrip("\n")
			line = line.split("\t")
			if float(line[1]) in pos_cM and float(line[4]) in pos_cM and float(line[5]) in pos_cM:
				gen_dist_1 = compute_gen_dist(float(line[1]), float(line[4]), pos_cM)
				gen_dist_2 = compute_gen_dist(float(line[1]), float(line[5]), pos_cM)
				min_gen_dist = min(gen_dist_1, gen_dist_2)

				toprint = [str(line[0]), str(line[1]), str(line[2]), str(line[4]), str(line[5]), str(min_gen_dist)]
				print >>outfile, "\t".join(x for x in toprint)
main()
