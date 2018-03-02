#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load python

for i in {1..38} X
do

python get_dog_cat_divergence_alignable.py --summary_line download/canFam3.felCat8.net.axt_rmHeader_summary_line_chr${i} --outfile outputs/compute_dog_cat_divergence/alignable/dog_cat_divergence_alignable_chr${i}.bed

done