#! /bin/bash
. /u/local/Modules/default/init/modules.sh
module load java/1.8.0_77

GATK="GenomeAnalysisTK.jar"

REFERENCE=canFam3.fa

AllChr=( 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 )

java -cp ${GATK} org.broadinstitute.gatk.tools.CatVariants \
-R ${REFERENCE} \
$(for i in "${AllChr[@]}"; do echo "-V 6_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${i}_HighQualSites_processed.vcf.gz"; done) \
-out 6_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed.vcf.gz \
-assumeSorted
