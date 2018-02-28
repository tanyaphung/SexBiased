#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load python/2.7

for i in {1..38} X
do

python interpolate_genetic_distance_canFam.py --genetic_map download/canFam3.1_recombination_LDbased/mark4_cleaned_chr${i}.cf3.1.sorted.txt --pos outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_ensemble_1_based.txt --outfile outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_ensemble_1_based_cM.txt

done

