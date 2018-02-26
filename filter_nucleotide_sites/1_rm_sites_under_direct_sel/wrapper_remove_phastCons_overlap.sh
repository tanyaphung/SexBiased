#!/bin/bash

for i in {1..38} X
do

python remove_phastCons_overlap.py download/phastConsEl/canFam_phastConsEl_chr${i}.bed download/ensemble/chr${i}/chr${i}_outside_ensemble.bed > download/ensemble/chr${i}/chr${i}_outside_ensemble_rm_phatConsEl.bed

done