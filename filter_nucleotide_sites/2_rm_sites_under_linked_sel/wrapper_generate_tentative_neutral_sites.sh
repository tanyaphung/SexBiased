#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load python

for i in {1..38} X
do

python generate_tentative_neutral_sites.py --input download/ensemble/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_merge.bed --outfile /outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_outside_ensemble_rm_phastConsEl_tentative_neutral_site_1_based.txt

done
