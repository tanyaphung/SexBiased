#!/bin/bash

########################################################################################
# Merge diversity output files and divergence output files in order to obtain bootstraps
########################################################################################

################################################
# Step 1: Remove header from the divergence file
################################################

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38} X
do

grep -v start outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_${cutoff}/chr${i}_dog_cat_divergence_cutoff_${cutoff}.txt > outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_${cutoff}/chr${i}_dog_cat_divergence_cutoff_${cutoff}_clean.txt

done
done

#########################################################################
# Step 2: sort the diversity output files and the divergence output files
#########################################################################

# Step 2A: sort the diversity output file

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for breed in GS TM BD AW GW
do

for i in {1..38} X
do

sort -n -k 1,1 outputs/compute_diversity/cutoff_${cutoff}/${breed}/${breed}_chr${i}_diversity_cutoff_${cutoff}.txt > outputs/compute_diversity/cutoff_${cutoff}/${breed}/${breed}_chr${i}_diversity_cutoff_${cutoff}_sort.txt

done
done
done

# Step 2B: sort the divergence output file
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for i in {1..38} X
do

sort -n -k 1,1 outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_${cutoff}/chr${i}_dog_cat_divergence_cutoff_${cutoff}_clean.txt > outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_${cutoff}/chr${i}_dog_cat_divergence_cutoff_${cutoff}_clean_sort.txt

done
done

#########################################################################################################
# Step 3: For each cutoff, for each population, merge diversity output files with divergence output files
#########################################################################################################

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for breed in GS TM BD AW GW
do

for i in {1..38} X
do

# Merge diversity and divergence
paste -d "\t" outputs/compute_diversity/cutoff_${cutoff}/${breed}/${breed}_chr${i}_diversity_cutoff_${cutoff}_sort.txt outputs/compute_dog_cat_divergence/dog_cat_divergence/cutoff_${cutoff}/chr${i}_dog_cat_divergence_cutoff_${cutoff}_clean_sort.txt > outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_chr${i}_diversity_divergence_cutoff_${cutoff}.txt

done
done
done

##################################
# Step 4: Remove redundant columns
##################################

# Remove redundant columns
# After the merging, the columns are:
# 1-4: from the diversity output file. 5-9: from the divergence output file.
# 1: start
# 2: end
# 3: num_sites
# 4: pi
# 5: start
# 6: end
# 7: num_sites
# 8: num_callable (the reason why num_callable is not the same as num_sites is because of removing non-capital letters when couting num_callable)
# 9: num_divergence
# We want to keep 1, 2, 3, 4, 8, and 9

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for breed in GS TM BD AW GW
do

for i in {1..38} X
do

awk '{print$1"\t"$2"\t"$3"\t"$4"\t"$8"\t"$9}' outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_chr${i}_diversity_divergence_cutoff_${cutoff}.txt > outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_chr${i}_diversity_divergence_cutoff_${cutoff}_fmt.txt

done
done
done

##########################################
# Step 5: Concatenate all of the autosomes
##########################################

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for breed in GS TM BD AW GW
do

for i in {1..38}
do

cat outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_chr${i}_diversity_divergence_cutoff_${cutoff}_fmt.txt >> outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_autosomes_diversity_divergence_cutoff_${cutoff}_fmt.txt

done
done
done

#########################################################
# Step 6: Remove the carriage return from the output file
#########################################################

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for breed in GS TM BD AW GW
do

sed 's/\r//' outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_autosomes_diversity_divergence_cutoff_${cutoff}_fmt.txt > outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_autosomes_diversity_divergence_cutoff_${cutoff}_fmt_clean.txt

sed 's/\r//' outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_chrX_diversity_divergence_cutoff_${cutoff}_fmt.txt > outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_chrX_diversity_divergence_cutoff_${cutoff}_fmt_clean.txt

done
done

