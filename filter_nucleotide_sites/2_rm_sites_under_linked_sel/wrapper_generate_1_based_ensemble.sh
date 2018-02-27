#!/bin/bash

for i in {1..38} X
do
python generate_1_based_ensemble.py --input download/ensemble/chr${i}/chr${i}_ensemble_clean_sort.bed --outfile outputs/obtain_putatively_neutral_regions/chr${i}/chr${i}_ensemble_clean_sort_1_based.txt
done
