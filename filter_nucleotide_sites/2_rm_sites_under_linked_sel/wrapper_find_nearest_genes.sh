#!/bin/bash


for i in {1..38} X
do
qsub -N nearest.genes.${i} find_nearest_genes.sh outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort.bed download/ensemble/chr${i}/chr${i}_ensemble_clean_sort.bed outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes.bed outputs/obtain_putatively_neutral_regions_version_3/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes_fix_end_coords.bed
done
