#!/bin/bash

cutoff=0.0
breed=GS

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for breed in GS TM BD AW GW
do

for rep in {1..1000}
do

python generate_bootstraps.py --empirical_data outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_chrX_diversity_divergence_cutoff_${cutoff}_fmt_clean.txt --cutoff ${cutoff} --breed ${breed} --region chrX --rep ${rep} --out_directory outputs/compute_ci/compute_ci_diversity_divergence/bootstraps

python generate_bootstraps.py --empirical_data outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_autosomes_diversity_divergence_cutoff_${cutoff}_fmt_clean.txt --cutoff ${cutoff} --breed ${breed} --region autosomes --rep ${rep} --out_directory outputs/compute_ci/compute_ci_diversity_divergence/bootstraps

done
done
done