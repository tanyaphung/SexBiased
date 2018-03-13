#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load vcftools

for i in {1..38} X
do

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

# GS
vcftools --gzvcf outputs/obtain_SFS/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_putative.neutral_high.qual_alignable_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${i}_HighQualSites_processed.vcf.gz --indv GS1 --indv GS3 --indv GS4 --indv GS5 --extract-FORMAT-info GT --out outputs/obtain_SFS/GT/cutoff_${cutoff}/GS/uncleaned/chr${i}_GS

# TM
vcftools --gzvcf outputs/obtain_SFS/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_putative.neutral_high.qual_alignable_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${i}_HighQualSites_processed.vcf.gz --indv TM1 --indv TM2 --indv TM3 --indv TM4 --indv TM5 --extract-FORMAT-info GT --out outputs/obtain_SFS/GT/cutoff_${cutoff}/TM/uncleaned/chr${i}_TM

# BD
vcftools --gzvcf outputs/obtain_SFS/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_putative.neutral_high.qual_alignable_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${i}_HighQualSites_processed.vcf.gz --indv BD1 --indv BD2 --indv BD3 --indv BD4 --indv BD5 --indv BD6 --indv BD7 --indv BD8 --indv BD9 --indv BD10 --indv BD11 --indv BD12 --extract-FORMAT-info GT --out outputs/obtain_SFS/GT/cutoff_${cutoff}/BD/uncleaned/chr${i}_BD

# AW
vcftools --gzvcf outputs/obtain_SFS/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_putative.neutral_high.qual_alignable_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${i}_HighQualSites_processed.vcf.gz --indv AW12 --indv AW13 --indv AW16 --indv AW18 --indv AW19 --indv AW20 --extract-FORMAT-info GT --out outputs/obtain_SFS/GT/cutoff_${cutoff}/AW/uncleaned/chr${i}_AW

# GW
vcftools --gzvcf outputs/obtain_SFS/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_putative.neutral_high.qual_alignable_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${i}_HighQualSites_processed.vcf.gz --indv GW1 --indv GW2 --indv GW3 --indv GW4 --indv GW5 --indv GW6 --extract-FORMAT-info GT --out outputs/obtain_SFS/GT/cutoff_${cutoff}/GW/uncleaned/chr${i}_GW

done
done
