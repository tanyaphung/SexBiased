#!/bin/bash

###########################################################
# Remove PAR on X for empirical data and for each bootstrap
###########################################################

# For empirical data
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for breed in GS TM BD AW GW
do

awk '$1>6590000{print}' outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_chrX_diversity_divergence_cutoff_${cutoff}_fmt_clean.txt > outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_chrX_diversity_divergence_cutoff_${cutoff}_fmt_clean_rmPAR.txt

done
done

# For bootstraps
for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for breed in GS TM BD AW GW
do

for i in {1..1000}
do

awk '$1>6590000{print}' outputs/compute_ci/compute_ci_diversity_divergence/bootstraps/cutoff_${cutoff}/${breed}/chrX/chrX_bootstrap_${i}.txt > outputs/compute_ci/compute_ci_diversity_divergence/bootstraps/cutoff_${cutoff}/${breed}/chrX/chrX_bootstrap_${i}_rmPAR.txt

rm -f /u/nobackup/kirk/phung428/tanya_data/Sex_Biased_Demography/analyses/compute_ci/compute_ci_diversity_divergence/bootstraps/cutoff_${cutoff}/${breed}/chrX/chrX_bootstrap_${i}.txt

done
done
done