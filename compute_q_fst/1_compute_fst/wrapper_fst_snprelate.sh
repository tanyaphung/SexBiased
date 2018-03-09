#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load R

##########################################################
# Subsample so that each population has 4 individuals each
# Note: this is an example wrapper file for the GS-TM pair
##########################################################

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

pair=GS_TM
region=chrX

input1=outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed.vcf

input2=outputs/compute_q_fst/compute_fst/genofiles_subsample/cutoff_${cutoff}/${pair}/cutoff_${cutoff}_${pair}_${region}_genofile

input3=outputs/compute_q_fst/compute_fst/pop_subsample.txt

input4=GS

input5=TM

input6=${pair}

input7=${region}

input8=outputs/compute_q_fst/compute_fst/fst/cutoff_${cutoff}/${pair}/cutoff_${cutoff}_${pair}_${region}_fst.txt

Rscript fst_snprelate.R ${input1} ${input2} ${input3} ${input4} ${input5} ${input6} ${input7} ${input8}

done

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

pair=GS_TM
region=autosomes

input1=outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed.vcf

input2=outputs/compute_q_fst/compute_fst/genofiles_subsample/cutoff_${cutoff}/${pair}/cutoff_${cutoff}_${pair}_${region}_genofile

input3=outputs/compute_q_fst/compute_fst/pop_subsample.txt

input4=GS

input5=TM

input6=${pair}

input7=${region}

input8=outputs/compute_q_fst/compute_fst/fst/cutoff_${cutoff}/${pair}/cutoff_${cutoff}_${pair}_${region}_fst.txt

Rscript fst_snprelate.R ${input1} ${input2} ${input3} ${input4} ${input5} ${input6} ${input7} ${input8}

done