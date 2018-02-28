#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load python

for i in {1..38} X
do
python convert_tentative_neutral_sites_to_BED_0_based.py --input outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_1_based.txt --outfile outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_0_based.bed

done
