#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load R

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do
for pair in GS_TM GS_BD TM_BD AW_GW GS_AW GS_GW TM_AW TM_GW BD_AW BD_GW
do
Rscript compute_qfst.R outputs/compute_q_fst/compute_fst/fst/cutoff_${cutoff}/${pair}/cutoff_${cutoff}_${pair}_autosomes_fst.txt outputs/compute_q_fst/compute_fst/fst/cutoff_${cutoff}/${pair}/cutoff_${cutoff}_${pair}_chrX_fst.txt ${pair} outputs/compute_q_fst/compute_fst/fst/cutoff_${cutoff}/cutoff_${cutoff}_qfst.txt
done