import os
import sys

# A quick script to remove sites that overlap with phastCons

phastCons_set = set()
# The first argument is canFam_phastConsEl_chr${i}.bed 
with open(sys.argv[1], "r") as f:
	for line in f:
		line = line.rstrip("\n")
		line = line.split("\t")
		for i in range(int(line[1]), int(line[2])):
			phastCons_set.add(i)

# The second argument is chr${i}_outside_ensemble.bed
with open(sys.argv[2], "r") as f:
	for line in f:
		line = line.rstrip("\n")
		line = line.split("\t")
		for i in range(int(line[1]), int(line[2])):
			if i not in phastCons_set:
				toprint = [line[0], str(i), str(i+1)]
				print "\t".join(x for x in toprint)
