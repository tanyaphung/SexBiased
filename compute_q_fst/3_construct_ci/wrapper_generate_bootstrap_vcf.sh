#!/bin/bash

for cutoff in 0.4 0.6 0.8 1.0
do

######
# chrX
######
region=chrX
#First, generate the bootstrap VCF
python generate_bootstrap_vcf.py --VCF outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_${region}_HighQualSites_processed_rm_header.vcf --directory outputs/compute_q_fst/construct_ci/bootstrap_vcfs --cutoff ${cutoff} --region ${region}

#Second, cat the header to make a complete VCF
for i in {1..1001}
do
cat outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_${region}_HighQualSites_processed_header.vcf outputs/compute_q_fst/construct_ci/bootstrap_vcfs/cutoff_${cutoff}/${region}/cutoff_${cutoff}_bootstrap_${i}.txt > outputs/compute_q_fst/construct_ci/bootstrap_vcfs/cutoff_${cutoff}/${region}/cutoff_${cutoff}_bootstrap_${i}.vcf

rm -f outputs/compute_q_fst/construct_ci/bootstrap_vcfs/cutoff_${cutoff}/${region}/cutoff_${cutoff}_bootstrap_${i}.txt

done

###########
# autosomes
###########
region=autosomes
#First, generate the bootstrap VCF
python generate_bootstrap_vcf.py --VCF outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_${region}_HighQualSites_processed_rm_header.vcf --directory outputs/compute_q_fst/construct_ci/bootstrap_vcfs --cutoff ${cutoff} --region ${region}

#Second, cat the header to make a complete VCF
for i in {1..1001}
do
cat outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_${region}_HighQualSites_processed_header.vcf outputs/compute_q_fst/construct_ci/bootstrap_vcfs/cutoff_${cutoff}/${region}/cutoff_${cutoff}_bootstrap_${i}.txt > outputs/compute_q_fst/construct_ci/bootstrap_vcfs/cutoff_${cutoff}/${region}/cutoff_${cutoff}_bootstrap_${i}.vcf

rm -f outputs/compute_q_fst/construct_ci/bootstrap_vcfs/cutoff_${cutoff}/${region}/cutoff_${cutoff}_bootstrap_${i}.txt

done

done