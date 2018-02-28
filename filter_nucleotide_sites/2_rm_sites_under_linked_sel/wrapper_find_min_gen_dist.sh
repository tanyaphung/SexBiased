#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load python/2.7

for i in {1..38} X
do

genetic_map=outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_ensemble_0_based_cM.txt

tentative_neutral=outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes_fix_end_coords.bed

outfile=outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based_sort_nearest_genes_fix_end_coords_cM.bed

python find_min_gen_dist.py --genetic_map $1 --tentative_neutral $2 --outfile $3

done
