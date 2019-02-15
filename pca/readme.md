#### subset for dogs only

```
bcftools view -s GS1,GS3,GS4,GS5,TM1,TM2,TM3,TM4,TM5,BD1,BD2,BD3,BD4,BD5,BD6,BD7,BD8,BD9,BD10,BD11,BD12 6_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed.vcf.gz > 6_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_autosomes_HighQualSites_processed_dogs.vcf.gz
bcftools view -s GS1,GS3,GS4,GS5,TM1,TM2,TM3,TM4,TM5,BD1,BD2,BD3,BD4,BD5,BD6,BD7,BD8,BD9,BD10,BD11,BD12 6_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chrX_HighQualSites_processed.vcf.gz > 6_SV_rmClusterSNP_BiSNP_SV_HardFilter_SV_4GS_5TM_6AW_12BD_6GW_joint_chrX_HighQualSites_processed_dogs.vcf.gz
```

