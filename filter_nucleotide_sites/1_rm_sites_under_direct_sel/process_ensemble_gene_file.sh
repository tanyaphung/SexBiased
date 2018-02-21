#!/bin/bash

cd download/ensemble

for i in {1..38} X
do
awk '{print$1"\t"$2"\t"$3}' chr${i}/chr${i}_ensemble.bed | sort -n -k 2,2 > chr${i}/chr${i}_ensemble_clean_sort.bed