#!/usr/bin/env bash

#Goal: To compute the 95% CI for qfst for when fst is computed from weir and cockerham implemented in SNPRelate
#In this step, I removed the header

for cutoff in 0.4 0.6 0.8 1.0
do

grep -v "#" outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed.vcf > outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed_rm_header.vcf

grep "#" outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed.vcf > outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed_header.vcf

grep -v "#" outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chrX_HighQualSites_processed.vcf > outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chrX_HighQualSites_processed_rm_header.vcf

grep "#" outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chrX_HighQualSites_processed.vcf > outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chrX_HighQualSites_processed_header.vcf

done