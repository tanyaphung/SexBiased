#!/bin/bash

###############################################################################
# Compute dog-cat divergence using multiple cutoff
# cutoff = {0.0, 0.2, 0.4, 0.6, 0.8, 1.0}
# For the target regions, now this is the regions that are callable in both diversity and divergence and are also putatively neutral with multiple cutoff values
###############################################################################

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38} X
do

BED=outputs/intersect_putative.neutral_high.qual_alignable/intersect_putative.neutral_high.qual_alignable/cutoff_${cutoff}/chr${i}_cutoff_${cutoff}_putative.neutral_high.qual_alignable.bed

summary_line=download/dog_cat_divergence/canFam3.felCat8.net.axt_rmHeader_summary_line_chr${i}

species_1=download/dog_cat_divergence/canFam3.felCat8.net.axt_rmHeader_canFam3_sequence_gaps_removed

species_2=download/dog_cat_divergence/canFam3.felCat8.net.axt_rmHeader_felCat8_sequence_gaps_removed

outfile=outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_0.0/chr${i}_dog_cat_divergence_cutoff_${cutoff}.txt

python compute_divergence.py --BED ${BED} --summary_lines ${summary_line} --species_1 ${species_1} --species_2 ${species_2} --outfile ${outfile}

done
done