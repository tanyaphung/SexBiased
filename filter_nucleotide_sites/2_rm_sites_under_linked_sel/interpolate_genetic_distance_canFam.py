import os
import sys
import argparse
from bisect import bisect

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script takes in the genetic map and obtains the genetic distance for a position if that position is not in the genetic map by interpolation. This script is intended to obtain the genetic distance in canFam using the LD-based map from Auton et al. (2013). Note: use the LD-based map here because it has information on the X chromosome whereas the pedigree-based map does not have genetic map on the X chromosome.")
	parser.add_argument(
			"--genetic_map", required=True,
			help="REQUIRED. Genetic map. This is the LD-based map for canFam3 obtained from Auton et al. 2013. There are 4 columns. The header of the columns is (1) CHR, (2) POS, (3) cM/Mb, (4) cM defined as the distance between the current SNP and the start SNP.")
	parser.add_argument(
			"--pos", required=True,
			help="REQUIRED. Positions where we want to know the genetic distance of. Each line is CHR POS.")
	parser.add_argument(
			"--outfile", required=True,
			help="REQUIRED. Name of the output file. The output file has 3 columns: CHR, POS, cM. POS should be the same as the input file.")

	args = parser.parse_args()
	return args

def interpolate(known_cM_positions, unknown_cM_positions, known_cM, outfile):
	"""
	This function takes in:
	1. a list of positions where cM is known (known_cM_positions)
	2. a list of positions where cM is not known (unknown_cM_positions)
	3. a list of cM (known_cM)(same index as known_cM_positions)
	"""

	# for each position where cM is now known, find the index where it will be inserted
	for unknown_cM_position in unknown_cM_positions:
		if unknown_cM_position > known_cM_positions[0] and unknown_cM_position < known_cM_positions[-1]:
			index_at_insert = bisect(known_cM_positions, unknown_cM_position)
			cM_before = known_cM[index_at_insert-1]
			cM_after = known_cM[index_at_insert]

			# compute genetic distance per base pair between the 2 known positions
			cM_bp = (known_cM[index_at_insert] - known_cM[index_at_insert - 1])/(known_cM_positions[index_at_insert] - known_cM_positions[index_at_insert - 1])

			cM_interpolate = known_cM[index_at_insert - 1] + cM_bp * (unknown_cM_position - known_cM_positions[index_at_insert - 1])

			toprint = [str(unknown_cM_position), str(cM_interpolate)]
			print >>outfile, "\t".join(x for x in toprint)
		if unknown_cM_position < known_cM_positions[0]:
			toprint = [str(unknown_cM_position), str(0)]
			print >>outfile, "\t".join(x for x in toprint)

		if unknown_cM_position > known_cM_positions[-1]:
			toprint = [str(unknown_cM_position), str(known_cM[-1])]
			print >>outfile, "\t".join(x for x in toprint)

def main():
	args = parse_args()

	known_cM_positions = []
	known_cM = []
	unknown_cM_positions = []

	with open(args.genetic_map, "r") as f:
		for line in f:
			if not line.startswith("POS"):
				line = line.rstrip("\n")
				line = line.split("\t")
				known_cM_positions.append(int(line[1]))
				known_cM.append(float(line[3]))

	with open(args.pos, "r") as f:
		for line in f:
			line = line.rstrip("\n")
			line = line.split("\t")
			unknown_cM_positions.append(int(line[1]))

	outfile = open(args.outfile, "w")

	interpolate(known_cM_positions, unknown_cM_positions, known_cM, outfile)
	
main()