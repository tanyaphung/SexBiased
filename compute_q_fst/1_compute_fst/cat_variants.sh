#! /bin/bash

#######################################################################
# This script concatenates the variants from 38 chromosomes into 1 file
#######################################################################

. /u/local/Modules/default/init/modules.sh
module load java/1.8.0_77

for cutoff in 0.4 0.6 0.8 1.0

GATK="GenomeAnalysisTK.jar" #Give the full path to GATK here

REFERENCE=download/refs/canFam3.fa
 
AllChr=( 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 )

java -cp ${GATK} org.broadinstitute.gatk.tools.CatVariants \
-R ${REFERENCE} \
$(for i in "${AllChr[@]}"; do echo "-V outputs/step11_filter_high_qual_variants_33animals_trimAltAllele/cutoff_${cutoff}/chr${i}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${i}_HighQualSites_processed.vcf.gz"; done) \
-out outputs/compute_q_fst/compute_fst/vcfs/cutoff_${cutoff}/cutoff_${cutoff}_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed.vcf.gz \
-assumeSorted

done