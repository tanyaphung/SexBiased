#!/bin/bash
#$ -cwd
#$ -V
#$ -l highp,h_data=8G,time=5:00:00
#$ -N sel.pi.div.neutral
#$ -M phung428
#$ -m ea
#$ -t 1-38:1


. /u/local/Modules/default/init/modules.sh
module load java/1.8.0_77

GATK="GenomeAnalysisTK.jar" #NOTE: Input the path to GATK 
REFERENCE=download/refs/canFam3.fa

MEM=4G
vcfDir=outputs/step11_filter_high_qual_variants_33animals_trimAltAllele
outDir=outputs/obtain_SFS/vcfs

###############
# For autosomes
###############

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

for Chrom in {1..38}
do

java -Xmx$MEM -jar ${GATK} \
        -R ${REFERENCE} \
        -T SelectVariants \
        -V ${vcfDir}/chr${Chrom}/6_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${Chrom}_HighQualSites_processed.vcf.gz \
        -L outputs/intersect_putative.neutral_high.qual_alignable/intersect_putative.neutral_high.qual_alignable/cutoff_${cutoff}/chr${Chrom}_cutoff_${cutoff}_putative.neutral_high.qual_alignable.bed \
        -o ${outDir}/cutoff_${cutoff}/cutoff_${cutoff}_putative.neutral_high.qual_alignable_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${Chrom}_HighQualSites_processed.vcf.gz

done
done

###############
# For chrX
###############

for cutoff in 0.0 0.2 0.4 0.6 0.8 1.0
do

Chrom=X

java -Xmx$MEM -jar ${GATK} \
        -R ${REFERENCE} \
        -T SelectVariants \
        -V ${vcfDir}/chr${Chrom}/6_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${Chrom}_HighQualSites_processed.vcf.gz \
        -L outputs/intersect_putative.neutral_high.qual_alignable/intersect_putative.neutral_high.qual_alignable/cutoff_0.0/chrX_cutoff_0.0_putative.neutral_high.qual_alignable_rmPAR.bed \
        -o ${outDir}/cutoff_${cutoff}/cutoff_${cutoff}_putative.neutral_high.qual_alignable_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chr${Chrom}_HighQualSites_processed.vcf.gz

done