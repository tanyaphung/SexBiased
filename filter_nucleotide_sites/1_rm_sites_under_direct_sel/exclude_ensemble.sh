#!/bin/bash

cd download/ensemble

for i in {1..38} X
do
# Find intervals that do not overlap with the gene by using bedtools complement

. /u/local/Modules/default/init/modules.sh
module load bedtools

bedtools complement -i chr${i}/chr${i}_ensemble_clean_sort.bed -g download/chrLength/chr${i}.g > chr${i}/chr${i}_outside_ensemble.bed
done
