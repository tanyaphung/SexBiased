#!/bin/bash

###################################################################################################
# Compute uncorrected average pairwise differences between sequences (pi)
# Multiple cutoff {0.0, 0.2, 0.4, 0.6, 0.8, 1.0}
# For the target regions, now this is the regions that are callable in both diversity and divergence and are also putatively neutral with multiple cutoff values
###################################################################################################

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38} X
do

targets=/outputs/intersect_putative.neutral_high.qual_alignable/intersect_putative.neutral_high.qual_alignable/cutoff_${cutoff}/chr${i}_cutoff_${cutoff}_putative.neutral_high.qual_alignable.bed

variants=outputs/obtain_GT_33animals/cutoff_${cutoff}/GS/cleaned/chr${i}_GS_cutoff_${cutoff}.GT.FORMAT

numAllele=8

out=outputs/compute_diversity/cutoff_${cutoff}/GS/GS_chr${i}_diversity_cutoff_${cutoff}.txt

python compute_pairwise_diversity.py --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}

done
done