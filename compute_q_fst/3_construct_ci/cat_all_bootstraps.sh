#!/bin/bash

for cutoff in 0.4 0.6 0.8 1.0
do

for pair in GS_TM GS_BD TM_BD AW_GW GS_AW GS_GW TM_AW TM_GW BD_AW BD_GW
do

for i in {1..1000}
do

cat outputs/compute_q_fst/construct_ci/bootstrap_fst/cutoff_${cutoff}/${pair}/chrX/cutoff_${cutoff}_${pair}_chrX_bootstrap_${i}_fst.txt >> outputs/compute_q_fst/construct_ci/bootstrap_fst/cutoff_${cutoff}/${pair}/autosomes/cutoff_${cutoff}_${pair}_autosomes_bootstrap_all_fst.txt

cat outputs/compute_q_fst/construct_ci/bootstrap_fst/cutoff_${cutoff}/${pair}/autosomes/cutoff_${cutoff}_${pair}_autosomes_bootstrap_${i}_fst.txt >> outputs/compute_q_fst/construct_ci/bootstrap_fst/cutoff_${cutoff}/${pair}/autosomes/cutoff_${cutoff}_${pair}_autosomes_bootstrap_all_fst.txt

done
done
done
