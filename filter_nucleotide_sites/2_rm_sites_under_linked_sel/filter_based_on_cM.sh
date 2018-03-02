#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load bedtools


# Step 1. Extract out tentative neutral sites where distance to the nearest gene is greater than the threshold

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38} X
do

awk -v y="$cutoff" '$6>y{print}' outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes_fix_end_coords_cM.bed > outputs/obtain_putatively_neutral_regions/cutoff_${cutoff}/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes_fix_end_coords_cM_greater_${cutoff}.bed
done
done

# Step 2: Extract out just the coordinates and Step 3: merge the resulting bed files

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38} X
do

awk '{print$1"\t"$2"\t"$3}' outputs/obtain_putatively_neutral_regions/cutoff_${cutoff}/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes_fix_end_coords_cM_greater_${cutoff}.bed > outputs/obtain_putatively_neutral_regions/cutoff_${cutoff}/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes_fix_end_coords_cM_greater_${cutoff}_coords.bed

bedtools merge -i outputs/obtain_putatively_neutral_regions/cutoff_${cutoff}/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes_fix_end_coords_cM_greater_${cutoff}_coords.bed > outputs/obtain_putatively_neutral_regions/cutoff_${cutoff}/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes_fix_end_coords_cM_greater_${cutoff}_coords_merge.bed

done
done