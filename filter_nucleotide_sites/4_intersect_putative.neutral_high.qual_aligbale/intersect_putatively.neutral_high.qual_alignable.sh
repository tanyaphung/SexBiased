#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load bedtools

######################################
# Generate BED files to be used for all analyses by intersecting these files:
# BED files that represent regions of the genome that are outside of genes, outside of conserved regions, far away from genes as defined by multiple thresholds (no cM cutoff, >0.2 cM, >0.4 cM, >0.6 cM, >0.8 cM, and >1 cM).
# BED files that represent regions of the genome that are high in quality from whole genome sequencing
# BED files that represent regions of the genome that are alignable between dog and cat
######################################

for i in {1..38} X
do

high_quality=outputs/step10_obtain_high_qual_sites_33animals/high_qual_coords/4GS_5TM_6AW_12BD_6GW_joint_chr${i}_HighQualCoords_merge.bed

alignable=outputs/compute_dog_cat_divergence/alignable/dog_cat_divergence_alignable_chr${i}.bed

high_quality_alignable=outputs/intersect_putative.neutral_high.qual_alignable/intersect_high.qual_alignable/intersect_high.qual_alignale_chr${i}.bed

bedtools intersect -a ${high_quality} -b ${alignable} > ${high_quality_alignable}
done

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38} X
do
neutral=outputs/obtain_putatively_neutral_regions/cutoff_${cutoff}/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes_fix_end_coords_cM_greater_${cutoff}_coords_merge.bed

high_quality_alignable=outputs/intersect_putative.neutral_high.qual_alignable/intersect_high.qual_alignable/intersect_high.qual_alignale_chr${i}.bed

out=outputs/intersect_putative.neutral_high.qual_alignable/intersect_putative.neutral_high.qual_alignable/cutoff_${cutoff}/chr${i}_cutoff_${cutoff}_putative.neutral_high.qual_alignable.bed

bedtools intersect -a ${neutral} -b ${high_quality_alignable} > ${out}

done
done

######################### END analysis on date 01/23/18 #########################