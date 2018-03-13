#!/bin/bash

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for breed in GS TM BD AW GW
do

for i in {1..38} X
do

python clean_genotype_files.py --GT_file outputs/obtain_SFS/GT/cutoff_${cutoff}/${breed}/uncleaned/chr${i}_${breed}.GT.FORMAT --outfile outputs/obtain_SFS/GT/cutoff_${cutoff}/${breed}/cleaned/chr${i}_${breed}.GT.FORMAT
done
done
done
