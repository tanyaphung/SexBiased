import os
import sys
import argparse

def parse_args():
	"""
	Parse command-line arguments
	"""
	parser = argparse.ArgumentParser(description="This script computes the number of sites that are different between 2 species in each line of the BED file where the BED file could, for example, represent the putatively neutral regions. (Note that this is not the nonoverlapping window approach.")
	parser.add_argument(
    		"--BED", required=True,
            help="REQUIRED. BED file that represents the regions to compute divergence from. For example, this BED file could represent the putatively neutral regions.")
	parser.add_argument(
    		"--summary_lines", required=True,
            help="REQUIRED.")
	parser.add_argument(
    		"--species_1", required=True,
            help="REQUIRED.")
	parser.add_argument(
    		"--species_2", required=True,
            help="REQUIRED.")
	parser.add_argument(
			"--outfile", required=True,
			help="REQUIRED. Name of the output file")

	args = parser.parse_args()
	return args

def identify_callable_divergent_sites(alignable_intervals, species1_sequences, species2_sequences):
	"""
	This function takes in:
	1. alignable_intervals: a dictionary where each key is the index to look up where the sequences are and value is a tuple of (start, end). 0-based and end is NOT included.
	2. species1_sequences: a list where each item is a DNA string.
	3. species2_sequences: a list where each item is a DNA string.

	RETURN:
	1. all_callable_sites set: where each item is the coordinate (0-based)
	2. all_divergent_sites set: where each item is the coordinate (0-based)
	"""
	nucleotides = ['A', 'T', 'G', 'C']
	all_callable_sites = set()
	all_divergent_sites = set()

	for each_index, each_interval in alignable_intervals.iteritems():
		each_interval_length = each_interval[1] - each_interval[0] + 1
		for i in range(0, each_interval_length):
			if species1_sequences[each_index][i] in nucleotides and species2_sequences[each_index][i] in nucleotides:
				all_callable_sites.add(each_interval[0] + i)
				if species1_sequences[each_index][i] != species2_sequences[each_index][i]:
					all_divergent_sites.add(each_interval[0] + i)
	return all_callable_sites, all_divergent_sites

def compute_divergence_each_BED_line(start, end, all_callable_sites, all_divergent_sites):

	callable_sites = 0
	divergent_sites = 0
	for site in range(start, end):
		if site in all_callable_sites:
			callable_sites += 1
		if site in all_divergent_sites:
			divergent_sites += 1
	toreturn = [str(start), str(end), str(end-start), str(callable_sites), str(divergent_sites)]

	return toreturn

def main():

	#################### START parsing command-line arguments ####################
	args = parse_args()

	outfile = open(args.outfile, "w")
	header = ['start', 'end', 'num_sites', 'num_callable', 'num_divergence']
	print >>outfile, "\t".join(x for x in header)

	alignable_intervals = {} # key is the index to look up the sequences. Value is a tuple in the form (start, end). 0-based. End inclusive.
	with open(args.summary_lines) as summaryLinesFile:
		for line in summaryLinesFile:
			line = line.rstrip("\n")
			line = line.split(" ")
			alignable_intervals[int(line[0])] = (int(line[2]) - 1, int(line[3]) - 1)


	with open(args.species_1) as species1File:
		species1_sequences = [line.rstrip() for line in species1File] 

	with open(args.species_2) as species2File:
		species2_sequences = [line.rstrip() for line in species2File]

	#################### END parsing command-line arguments ####################

	#################### START computing ####################

	## STEP 1: identify coordinates that are callable and divergent
	all_callable_sites, all_divergent_sites = identify_callable_divergent_sites(alignable_intervals, species1_sequences, species2_sequences)

	## STEP 2:
	with open(args.BED,"r") as BEDFile:
		for line in BEDFile:
			line = line.split("\t")

			results = compute_divergence_each_BED_line(int(line[1]), int(line[2]), all_callable_sites, all_divergent_sites)
			print >>outfile, "\t".join(x for x in results)
	#################### END computing ####################

main()

