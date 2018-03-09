#!/bin/bash

# This is an example for GS_TM

. /u/local/Modules/default/init/modules.sh
module load R

for i in {1..1000}
do

for cutoff in 0.4 0.6 0.8 1.0
do

pair=GS_TM
region=chrX

input1=outputs/compute_q_fst/construct_ci/bootstrap_vcfs_sorted/cutoff_${cutoff}/${region}/cutoff_${cutoff}_bootstrap_${task_id}_sorted.vcf

input2=outputs/compute_q_fst/construct_ci/bootstrap_genofiles/cutoff_${cutoff}/${pair}/${region}/cutoff_${cutoff}_${pair}_${region}_bootstrap_${task_id}_genofile

input3=outputs/compute_q_fst/compute_fst/pop_subsample.txt

input4=GS

input5=TM

input6=${pair}

input7=${region}

input8=outputs/compute_q_fst/construct_ci/bootstrap_fst/cutoff_${cutoff}/${pair}/${region}/cutoff_${cutoff}_${pair}_${region}_bootstrap_${i}_fst.txt

Rscript SexBiased/compute_q_fst/1_compute_fst/fst_snprelate.R ${input1} ${input2} ${input3} ${input4} ${input5} ${input6} ${input7} ${input8}

done

for cutoff in 0.4 0.6 0.8 1.0
do

pair=GS_TM
region=autosomes

input1=outputs/compute_q_fst/construct_ci/bootstrap_vcfs_sorted/cutoff_${cutoff}/${region}/cutoff_${cutoff}_bootstrap_${task_id}_sorted.vcf

input2=outputs/compute_q_fst/construct_ci/bootstrap_genofiles/cutoff_${cutoff}/${pair}/${region}/cutoff_${cutoff}_${pair}_${region}_bootstrap_${task_id}_genofile

input3=outputs/compute_q_fst/compute_fst/pop_subsample.txt

input4=GS

input5=TM

input6=${pair}

input7=${region}

input8=outputs/compute_q_fst/construct_ci/bootstrap_fst/cutoff_${cutoff}/${pair}/${region}/cutoff_${cutoff}_${pair}_${region}_bootstrap_${i}_fst.txt

Rscript SexBiased/compute_q_fst/1_compute_fst/fst_snprelate.R ${input1} ${input2} ${input3} ${input4} ${input5} ${input6} ${input7} ${input8}

done

done
