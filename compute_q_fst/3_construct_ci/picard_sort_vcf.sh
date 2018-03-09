#!/bin/bash

for cutoff in 0.4 0.6 0.8 1.0
do

PICARD=picard.jar #Input path to picard here

for i in {1..1000}
do

# chrX
X_inVCF=outputs/compute_q_fst/construct_ci/bootstrap_vcfs/cutoff_${cutoff}/chrX/cutoff_${cutoff}_bootstrap_${i}.vcf

X_outVCF=outputs/compute_q_fst/construct_ci/bootstrap_vcfs_sorted/cutoff_${cutoff}/chrX/cutoff_${cutoff}_bootstrap_${i}_sorted.vcf

java -Xmx16G -jar ${PICARD} SortVcf \
I=${X_inVCF} \
O=${X_outVCF}

# autosomes
A_inVCF=outputs/compute_q_fst/construct_ci/bootstrap_vcfs/cutoff_${cutoff}/autosomes/cutoff_${cutoff}_bootstrap_${i}.vcf

A_outVCF=outputs/compute_q_fst/construct_ci/bootstrap_vcfs_sorted/cutoff_${cutoff}/autosomes/cutoff_${cutoff}_bootstrap_${i}_sorted.vcf

java -Xmx16G -jar ${PICARD} SortVcf \
I=${A_inVCF} \
O=${A_outVCF}

done

done