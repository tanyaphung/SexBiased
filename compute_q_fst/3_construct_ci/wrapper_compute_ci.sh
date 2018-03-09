#!/usr/bin/env bash

for cutoff in 0.4 0.6 0.8 1.0
do

for pair in GS_TM GS_BD TM_BD AW_GW GS_AW GS_GW TM_AW TM_GW BD_AW BD_GW
do

python compute_ci.py --autosomes_bt_fst outputs/compute_q_fst/construct_ci/bootstrap_fst/cutoff_${cutoff}/${pair}/autosomes/cutoff_${cutoff}_${pair}_autosomes_bootstrap_all_fst.txt --chrX_bt_fst outputs/compute_q_fst/construct_ci/bootstrap_fst/cutoff_${cutoff}/${pair}/autosomes/cutoff_${cutoff}_${pair}_autosomes_bootstrap_all_fst.txt --outfile outputs/compute_q_fst/construct_ci/bootstrap_fst/cutoff_${cutoff}/${pair}/cutoff_${cutoff}_${pair}_bootstrap_ci.txt

done
done
