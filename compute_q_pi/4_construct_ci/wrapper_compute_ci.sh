#!/bin/bash

for cutoff in 1.0 0.8 0.6 0.4 0.2 0.0
do

for breed in GS TM BD AW GW
do

X_emp=outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_chrX_diversity_divergence_cutoff_${cutoff}_fmt_clean_rmPAR.txt

A_emp=outputs/compute_ci/compute_ci_diversity_divergence/merge_diversity_divergence/cutoff_${cutoff}/${breed}/${breed}_autosomes_diversity_divergence_cutoff_${cutoff}_fmt_clean.txt

directory=outputs/compute_ci/compute_ci_diversity_divergence/bootstraps

X_outfile=outputs/compute_ci/compute_ci_diversity_divergence/ci/cutoff_${cutoff}/${breed}/X_pi_ci.txt

A_outfile=outputs/compute_ci/compute_ci_diversity_divergence/ci/cutoff_${cutoff}/${breed}/A_pi_ci.txt

X_A_outfile=outputs/compute_ci/compute_ci_diversity_divergence/ci/cutoff_${cutoff}/${breed}/X_A_ratio_ci.txt

python compute_ci.py --X_emp ${X_emp} --A_emp ${A_emp} --directory ${directory} --cutoff ${cutoff} --breed ${breed} --X_outfile ${X_outfile} --A_outfile ${A_outfile} --X_A_outfile ${X_A_outfile}

done
done
